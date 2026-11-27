module

public import Mathlib
public import TauCeti.Analysis.Convex.FiniteMean
public import TauCeti.Probability.Moments.SampleMean

/-!
# Monte Carlo, multilevel Monte Carlo and time stepping for SDEs: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the headlines of
`README.md` that carry a Lean name, each with every conclusion the README attaches to it, together
with the definitions their statements need. The README's other headlines are targets of the same
standing, stated in prose.

Conventions (README, Conventions). Probability spaces carry `[IsProbabilityMeasure P]`. The sample
mean of a finite sample is Tau Ceti's `TauCeti.finiteMean`; the sample variance has divisor `R - 1`.
Time is `ℝ≥0` with the Lebesgue time measure `timeMeasure t` on `(0, t]`. Brownian motions, their
Itô integrals and the solutions of stochastic differential equations are given data: a solution is
described by hypotheses (adaptedness, progressive measurability, almost surely continuous paths, a
predictable representative of each diffusion integrand, an Itô integral of it in the sense of
`IsItoIntegral`, and the integral identity), never constructed here. Coefficients are continuous, so
the drift integral of a continuous path is a genuine Lebesgue integral and not the junk value of a
nonintegrable function. Time-dependent coefficients are functions `ℝ → ℝ → ℝ` evaluated at `(t :
ℝ)`, so that time derivatives are ordinary derivatives.

Local copies. `nnvolume`, `timeMeasure`, `ElementaryIntegrand` (with `toProcess` and
`integral`), `IsItoIntegral`, `IsFilteredBrownian` and `IsBrownianVector` are verbatim copies of
the definitions of the same short names in the StochasticCalculus roadmap's `Suggested.lean`
(Conventions, §§1.3, 3.2 and 6.4); each docstring names its section.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology TauCeti
open scoped NNReal ENNReal ProbabilityTheory

namespace TauCetiRoadmap.MonteCarloMultilevelAndSDESchemes

variable {Ω : Type*} [mΩ : MeasurableSpace Ω]

/-! ## Local copies of StochasticCalculus vocabulary -/

section LocalCopies

/-- Local copy of StochasticCalculus (Conventions): Lebesgue measure on nonnegative time, using
the comap normalization. -/
def nnvolume : Measure ℝ≥0 := Measure.comap ((↑) : ℝ≥0 → ℝ) volume

/-- Local copy of StochasticCalculus (Conventions): Lebesgue time measure on a finite
positive-time interval. -/
def timeMeasure (T : ℝ≥0) : Measure ℝ≥0 := nnvolume.restrict (Set.Ioc 0 T)

/-- Local copy of StochasticCalculus §1.3: Brownian relative to a specified filtration, not
merely Brownian marginal laws. -/
def IsFilteredBrownian (F : Filtration ℝ≥0 mΩ)
    (P : Measure Ω) (B : ℝ≥0 → Ω → ℝ) : Prop :=
  IsBrownianReal B P ∧ StronglyAdapted F B ∧
    ∀ s t, s ≤ t → Indep (MeasurableSpace.comap (fun ω => B t ω - B s ω)
      (borel ℝ)) (F s) P

/-- Local copy of StochasticCalculus §3.2: an elementary predictable integrand: on each interval
`(s i, s (i+1)]`, `i < n`, it is a bounded `F (s i)`-measurable random height `ξ i`. -/
structure ElementaryIntegrand (F : Filtration ℝ≥0 mΩ) where
  /-- The number of steps. -/
  n : ℕ
  /-- The nondecreasing grid of step times. -/
  s : ℕ → ℝ≥0
  mono : Monotone s
  /-- The random height on `(s i, s (i+1)]`. -/
  ξ : ℕ → Ω → ℝ
  measurable : ∀ i, StronglyMeasurable[F (s i)] (ξ i)
  bounded : ∀ i, ∃ C : ℝ, ∀ ω, |ξ i ω| ≤ C

namespace ElementaryIntegrand

variable {F : Filtration ℝ≥0 mΩ}

/-- Local copy of StochasticCalculus §3.2: the process `t ↦ Σ_{i<n} ξ i · 1_(s i, s (i+1)](t)`. -/
def toProcess (K : ElementaryIntegrand F) : ℝ≥0 → Ω → ℝ :=
  fun t ω => ∑ i ∈ Finset.range K.n, (Set.Ioc (K.s i) (K.s (i + 1))).indicator (fun _ => K.ξ i ω) t

/-- Local copy of StochasticCalculus §3.2: the elementary stochastic integral
`t ↦ Σ_{i<n} ξ i (B (t ∧ s (i+1)) − B (t ∧ s i))`. -/
def integral (K : ElementaryIntegrand F) (B : ℝ≥0 → Ω → ℝ) : ℝ≥0 → Ω → ℝ :=
  fun t ω => ∑ i ∈ Finset.range K.n, K.ξ i ω * (B (min t (K.s (i + 1))) ω - B (min t (K.s i)) ω)

end ElementaryIntegrand

/-- Local copy of StochasticCalculus §3.2: `I` is an Itô integral of `H` against `B`: its paths
are almost surely continuous and, for every time `t`, some elementary integrands approximate `H`
on `(0, t]` in the sense that `∫_(0,t] |Kₙ − H|² ds → 0` in probability, while their elementary
integrals at `t` converge in probability to `I t`. The integrand is strongly predictable. -/
def IsItoIntegral (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (B H I : ℝ≥0 → Ω → ℝ) : Prop :=
  IsStronglyPredictable F H ∧
  (∀ᵐ ω ∂P, Continuous fun t => I t ω) ∧
    ∀ t, ∃ K : ℕ → ElementaryIntegrand F,
      (∀ ε : ℝ≥0∞, 0 < ε → Filter.Tendsto (fun n => P {ω | ε ≤
        ∫⁻ s, ‖(K n).toProcess s ω - H s ω‖ₑ ^ 2 ∂timeMeasure t}) Filter.atTop (nhds 0)) ∧
      TendstoInMeasure P (fun n => (K n).integral B t) Filter.atTop (I t)

/-- Local copy of StochasticCalculus §6.4: a `d`-dimensional standard Brownian motion given by
its coordinates in the standard basis: each coordinate is a native scalar Brownian motion and the
coordinate paths are independent as path-valued random variables. -/
def IsBrownianVector {d : ℕ} (P : Measure Ω) (B : Fin d → ℝ≥0 → Ω → ℝ) : Prop :=
  (∀ i, IsBrownianReal (B i) P) ∧ iIndepFun (fun i ω => (fun t => B i t ω : ℝ≥0 → ℝ)) P

end LocalCopies

/-! ## Layer 1: crude Monte Carlo -/

section CrudeMonteCarlo

/-- **1.1** The sample variance `(R - 1)⁻¹ ∑ (x r - x̄)²` of a finite sample, with the sample
mean `x̄ = TauCeti.finiteMean ℝ x`. It is `0` for `R ≤ 1`. -/
def sampleVariance {R : ℕ} (x : Fin R → ℝ) : ℝ :=
  ((R : ℝ) - 1)⁻¹ * ∑ r, (x r - finiteMean ℝ x) ^ 2

/-- **1.1** Unbiasedness of the sample variance: for `R ≥ 2` pairwise independent
square-integrable samples with a common mean and a common variance `v`, `E s_R² = v`. -/
theorem integral_sampleVariance (P : Measure Ω) [IsProbabilityMeasure P] {R : ℕ} (hR : 2 ≤ R)
    (Z : Fin R → Ω → ℝ) (hZ : ∀ r, MemLp (Z r) 2 P)
    (hind : Pairwise fun r s => Z r ⟂ᵢ[P] Z s) {c v : ℝ}
    (hmean : ∀ r, P[Z r] = c) (hvar : ∀ r, Var[Z r; P] = v) :
    ∫ ω, sampleVariance (fun r => Z r ω) ∂P = v := by
  sorry

/-- **1.2** Strong consistency of the sample variance for a pairwise independent identically
distributed square-integrable sequence. -/
theorem tendsto_sampleVariance_ae (P : Measure Ω) [IsProbabilityMeasure P] (Z : ℕ → Ω → ℝ)
    (hZ : MemLp (Z 0) 2 P) (hind : Pairwise fun i j => Z i ⟂ᵢ[P] Z j)
    (hident : ∀ i, IdentDistrib (Z i) (Z 0) P P) :
    ∀ᵐ ω ∂P, Tendsto (fun R : ℕ => sampleVariance (fun r : Fin R => Z r ω)) atTop
      (𝓝 Var[Z 0; P]) := by
  sorry

/-- **1.3** The studentized mean `√R (ẑ_R - z) / s_R` of an i.i.d. square-integrable sequence
with positive variance converges in law to the standard normal law. -/
theorem tendstoInDistribution_studentizedMean (P : Measure Ω) [IsProbabilityMeasure P]
    {Ω' : Type*} [MeasurableSpace Ω'] (P' : Measure Ω') [IsProbabilityMeasure P']
    (Y : Ω' → ℝ) (hY : HasLaw Y (gaussianReal 0 1) P') (Z : ℕ → Ω → ℝ)
    (hZ : MemLp (Z 0) 2 P) (hind : iIndepFun Z P)
    (hident : ∀ i, IdentDistrib (Z i) (Z 0) P P) (hσ : 0 < Var[Z 0; P]) :
    TendstoInDistribution
      (fun (R : ℕ) ω => Real.sqrt R * (finiteMean ℝ (fun r : Fin R => Z r ω) - P[Z 0]) /
        Real.sqrt (sampleVariance (fun r : Fin R => Z r ω)))
      atTop Y (fun _ => P) P' := by
  sorry

/-- **1.3** Asymptotic coverage of the studentized interval: for positive variance and every
real `q`, `P(|ẑ_R - z| ≤ q s_R / √R)` tends to the standard normal mass of `[-q, q]`. -/
theorem tendsto_measure_studentizedInterval (P : Measure Ω) [IsProbabilityMeasure P]
    (Z : ℕ → Ω → ℝ) (hZ : MemLp (Z 0) 2 P) (hind : iIndepFun Z P)
    (hident : ∀ i, IdentDistrib (Z i) (Z 0) P P) (hσ : 0 < Var[Z 0; P]) (q : ℝ) :
    Tendsto (fun R : ℕ => P {ω | |finiteMean ℝ (fun r : Fin R => Z r ω) - P[Z 0]| ≤
        q * Real.sqrt (sampleVariance (fun r : Fin R => Z r ω) / R)})
      atTop (𝓝 (gaussianReal 0 1 (Set.Icc (-q) q))) := by
  sorry

end CrudeMonteCarlo

/-! ## Layer 2: multilevel Monte Carlo -/

section Multilevel

/-- **2.1** The multilevel estimator `∑_{l ≤ L} (N l)⁻¹ ∑_{n < N l} D l n`, where `D l n` is the
`n`-th sample of the level-`l` correction. -/
def multilevelEstimator (D : ℕ → ℕ → Ω → ℝ) (N : ℕ → ℕ) (L : ℕ) (ω : Ω) : ℝ :=
  ∑ l ∈ Finset.range (L + 1), (N l : ℝ)⁻¹ * ∑ n ∈ Finset.range (N l), D l n ω

/-- **2.1** Mean and mean square error of the multilevel estimator. If the level-`l` samples have
mean `m l - m (l - 1)` (with `m (-1) = 0`) and variance `V l`, and all samples are pairwise
independent, then the estimator has mean `m L` and, for every `z`, mean square error about `z`
equal to `(m L - z)² + ∑ V l / N l`. -/
theorem multilevelEstimator_mean_and_meanSquareError (P : Measure Ω) [IsProbabilityMeasure P]
    (D : ℕ → ℕ → Ω → ℝ) (hD : ∀ l n, MemLp (D l n) 2 P)
    (hind : Pairwise fun p q : ℕ × ℕ => D p.1 p.2 ⟂ᵢ[P] D q.1 q.2) (m V : ℕ → ℝ)
    (hmean : ∀ l n, P[D l n] = m l - if l = 0 then 0 else m (l - 1))
    (hvar : ∀ l n, Var[D l n; P] = V l) (L : ℕ) (N : ℕ → ℕ) (hN : ∀ l ≤ L, 0 < N l)
    (z : ℝ) :
    P[multilevelEstimator D N L] = m L ∧
      ∫ ω, (multilevelEstimator D N L ω - z) ^ 2 ∂P =
        (m L - z) ^ 2 + ∑ l ∈ Finset.range (L + 1), V l / N l := by
  sorry

/-- **2.2** Optimal sample sizes. Every positive real allocation with `∑ V l / N l ≤ ε²` costs at
least `ε⁻² (∑ √(V l C l))²`, and the allocation `N l = ε⁻² √(V l / C l) ∑ √(V k C k)` has
variance exactly `ε²` and attains this cost. -/
theorem multilevel_cost_ge_and_optimal (L : ℕ) (V C : ℕ → ℝ) (hV : ∀ l ≤ L, 0 < V l)
    (hC : ∀ l ≤ L, 0 < C l) {ε : ℝ} (hε : 0 < ε) :
    (∀ N : ℕ → ℝ, (∀ l ≤ L, 0 < N l) →
        ∑ l ∈ Finset.range (L + 1), V l / N l ≤ ε ^ 2 →
        (ε ^ 2)⁻¹ * (∑ l ∈ Finset.range (L + 1), Real.sqrt (V l * C l)) ^ 2 ≤
          ∑ l ∈ Finset.range (L + 1), N l * C l) ∧
      let S := ∑ k ∈ Finset.range (L + 1), Real.sqrt (V k * C k)
      let N : ℕ → ℝ := fun l => (ε ^ 2)⁻¹ * Real.sqrt (V l / C l) * S
      ∑ l ∈ Finset.range (L + 1), V l / N l = ε ^ 2 ∧
        ∑ l ∈ Finset.range (L + 1), N l * C l = (ε ^ 2)⁻¹ * S ^ 2 := by
  sorry

/-- **2.3** The multilevel complexity theorem in deterministic form (Giles, Theorem 2.1). Under
geometric bounds on the bias, the level variances and the level costs, with
`α ≥ min β γ / 2`, there is `c₄` such that for every `ε < e⁻¹` some `L` and integer sample sizes
`N l ≥ 1` give squared bias plus variance below `ε²` at a cost within the three regimes. -/
theorem exists_multilevel_sampleBudget (bias V C : ℕ → ℝ) {α β γ c₁ c₂ c₃ : ℝ}
    (hβ : 0 < β) (hγ : 0 < γ) (hαβγ : min β γ / 2 ≤ α)
    (hbias : ∀ l : ℕ, |bias l| ≤ c₁ * (2 : ℝ) ^ (-α * l))
    (hV : ∀ l : ℕ, V l ≤ c₂ * (2 : ℝ) ^ (-β * l)) (hC : ∀ l : ℕ, C l ≤ c₃ * (2 : ℝ) ^ (γ * l)) :
    ∃ c₄ > 0, ∀ ε : ℝ, 0 < ε → ε < Real.exp (-1) →
      ∃ (L : ℕ) (N : ℕ → ℕ), (∀ l ≤ L, 1 ≤ N l) ∧
        bias L ^ 2 + ∑ l ∈ Finset.range (L + 1), V l / N l < ε ^ 2 ∧
        ∑ l ∈ Finset.range (L + 1), (N l : ℝ) * C l ≤
          c₄ * (if γ < β then ε ^ (-2 : ℝ) else if β = γ then ε ^ (-2 : ℝ) * Real.log ε ^ 2
            else ε ^ (-2 - (γ - β) / α)) := by
  sorry

/-- **2.3** The multilevel complexity theorem for estimators (Giles, Theorem 2.1): the
allocation of `exists_multilevel_sampleBudget` applied to the multilevel estimator of
`multilevelEstimator_mean_and_meanSquareError`, with `bias l = m l - z`. -/
theorem exists_multilevelEstimator (P : Measure Ω) [IsProbabilityMeasure P]
    (D : ℕ → ℕ → Ω → ℝ) (hD : ∀ l n, MemLp (D l n) 2 P)
    (hind : Pairwise fun p q : ℕ × ℕ => D p.1 p.2 ⟂ᵢ[P] D q.1 q.2) (m V C : ℕ → ℝ) (z : ℝ)
    (hmean : ∀ l n, P[D l n] = m l - if l = 0 then 0 else m (l - 1))
    (hvar : ∀ l n, Var[D l n; P] = V l) {α β γ c₁ c₂ c₃ : ℝ}
    (hβ : 0 < β) (hγ : 0 < γ) (hαβγ : min β γ / 2 ≤ α)
    (hbias : ∀ l : ℕ, |m l - z| ≤ c₁ * (2 : ℝ) ^ (-α * l))
    (hV : ∀ l : ℕ, V l ≤ c₂ * (2 : ℝ) ^ (-β * l)) (hC : ∀ l : ℕ, C l ≤ c₃ * (2 : ℝ) ^ (γ * l)) :
    ∃ c₄ > 0, ∀ ε : ℝ, 0 < ε → ε < Real.exp (-1) →
      ∃ (L : ℕ) (N : ℕ → ℕ), (∀ l ≤ L, 1 ≤ N l) ∧
        ∫ ω, (multilevelEstimator D N L ω - z) ^ 2 ∂P < ε ^ 2 ∧
        ∑ l ∈ Finset.range (L + 1), (N l : ℝ) * C l ≤
          c₄ * (if γ < β then ε ^ (-2 : ℝ) else if β = γ then ε ^ (-2 : ℝ) * Real.log ε ^ 2
            else ε ^ (-2 - (γ - β) / α)) := by
  sorry

/-- **2.4** Bias and coupled second moments of a Lipschitz functional. If `φ` is `K`-Lipschitz
and the level outputs `Sl l` approximate `S` with `E ‖S - Sl l‖² ≤ c h l`, then the bias of
`φ (Sl l)` is at most `K √(c h l)` and `E (φ (Sl l) - φ (Sl k))² ≤ K² (√(c h l) + √(c h k))²`. -/
theorem lipschitz_level_bias_and_variance {E : Type*} [NormedAddCommGroup E]
    (P : Measure Ω) [IsProbabilityMeasure P] (φ : E → ℝ) {K : ℝ≥0} (hφ : LipschitzWith K φ)
    (S : Ω → E) (Sl : ℕ → Ω → E) (hS : AEStronglyMeasurable S P)
    (hSl : ∀ l, AEStronglyMeasurable (Sl l) P) (h : ℕ → ℝ) (c : ℝ)
    (herr : ∀ l, ∫⁻ ω, ‖S ω - Sl l ω‖ₑ ^ 2 ∂P ≤ ENNReal.ofReal (c * h l)) :
    (∀ l, |∫ ω, (φ (Sl l ω) - φ (S ω)) ∂P| ≤ K * Real.sqrt (c * h l)) ∧
      ∀ l k, ∫ ω, (φ (Sl l ω) - φ (Sl k ω)) ^ 2 ∂P ≤
        (K : ℝ) ^ 2 * (Real.sqrt (c * h l) + Real.sqrt (c * h k)) ^ 2 := by
  sorry

/-- **2.4** Multilevel complexity at mean-square strong order one-half: if
`E ‖S - Sl l‖² ≤ c 2⁻ˡ` and the level costs are at most `c₃ 2ˡ`, then for the Lipschitz
functional `φ` the parameters `α = 1/2`, `β = γ = 1` hold and the cost is `O(ε⁻² (log ε)²)`. -/
theorem exists_multilevel_sampleBudget_of_meanSquare_halving {E : Type*} [NormedAddCommGroup E]
    (P : Measure Ω) [IsProbabilityMeasure P] (φ : E → ℝ) {K : ℝ≥0} (hφ : LipschitzWith K φ)
    (S : Ω → E) (Sl : ℕ → Ω → E) (hS : AEStronglyMeasurable S P)
    (hSl : ∀ l, AEStronglyMeasurable (Sl l) P)
    (c c₃ : ℝ) (herr : ∀ l : ℕ, ∫⁻ ω, ‖S ω - Sl l ω‖ₑ ^ 2 ∂P ≤
      ENNReal.ofReal (c * (2 : ℝ) ^ (-(l : ℝ))))
    (C : ℕ → ℝ) (hC : ∀ l : ℕ, C l ≤ c₃ * (2 : ℝ) ^ (l : ℝ)) :
    let V : ℕ → ℝ := fun l =>
      Var[fun ω => φ (Sl l ω) - (if l = 0 then 0 else φ (Sl (l - 1) ω)); P]
    ∃ c₄ > 0, ∀ ε : ℝ, 0 < ε → ε < Real.exp (-1) →
      ∃ (L : ℕ) (N : ℕ → ℕ), (∀ l ≤ L, 1 ≤ N l) ∧
        (∫ ω, (φ (Sl L ω) - φ (S ω)) ∂P) ^ 2 + ∑ l ∈ Finset.range (L + 1), V l / N l < ε ^ 2 ∧
        ∑ l ∈ Finset.range (L + 1), (N l : ℝ) * C l ≤ c₄ * (ε ^ (-2 : ℝ) * Real.log ε ^ 2) := by
  sorry

end Multilevel

/-! ## Layer 3: multiple Itô integrals and the Itô–Taylor expansion -/

section ItoTaylor

variable {m : ℕ}

/-- **3.1** Multiple Itô integrals against `W : Fin m → ℝ≥0 → Ω → ℝ`, indexed by multi-indices
`α : List (Fin (m + 1))`, where the component `0` is integration in time and `j.succ` is
integration against `W j`. `IsMultipleItoIntegral F P W g α J` says that `J` is (a version of)
`I_α[g]_{0,·}`: for the empty multi-index `J = g`; for `α ++ [0]`, `J t = ∫_(0,t] K ds` with `K`
the integral of `α`; for `α ++ [j.succ]`, `J` is an Itô integral against `W j` of a predictable
representative of `K`. Equalities hold for all times outside one null set. -/
inductive IsMultipleItoIntegral (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    (W : Fin m → ℝ≥0 → Ω → ℝ) (g : ℝ≥0 → Ω → ℝ) :
    List (Fin (m + 1)) → (ℝ≥0 → Ω → ℝ) → Prop
  | nil (J : ℝ≥0 → Ω → ℝ) (hJ : ∀ᵐ ω ∂P, ∀ t, J t ω = g t ω) :
      IsMultipleItoIntegral F P W g [] J
  | time (α : List (Fin (m + 1))) (K J : ℝ≥0 → Ω → ℝ) (hK : IsMultipleItoIntegral F P W g α K)
      (hint : ∀ᵐ ω ∂P, ∀ T, Integrable (fun s => K s ω) (timeMeasure T))
      (hJ : ∀ᵐ ω ∂P, ∀ t, J t ω = ∫ s, K s ω ∂timeMeasure t) :
      IsMultipleItoIntegral F P W g (α ++ [0]) J
  | noise (α : List (Fin (m + 1))) (j : Fin m) (K H J : ℝ≥0 → Ω → ℝ)
      (hK : IsMultipleItoIntegral F P W g α K)
      (hH : ∀ T, Function.uncurry K =ᵐ[(timeMeasure T).prod P] Function.uncurry H)
      (hJ : IsItoIntegral F P (W j) H J) :
      IsMultipleItoIntegral F P W g (α ++ [j.succ]) J

/-- **3.1** Existence of multiple Itô integrals of a strongly progressive integrand with almost
surely continuous paths, against coordinates that are Brownian relative to `F`; the integral can
be chosen strongly progressive with almost surely continuous paths. -/
theorem exists_isMultipleItoIntegral (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (W : Fin m → ℝ≥0 → Ω → ℝ) (hW : ∀ j, IsFilteredBrownian F P (W j))
    (g : ℝ≥0 → Ω → ℝ) (hg : IsStronglyProgressive F g)
    (hgc : ∀ᵐ ω ∂P, Continuous fun t => g t ω) (α : List (Fin (m + 1))) :
    ∃ J, IsMultipleItoIntegral F P W g α J ∧ IsStronglyProgressive F J ∧
      ∀ᵐ ω ∂P, Continuous fun t => J t ω := by
  sorry

/-- **3.1** Uniqueness of multiple Itô integrals up to indistinguishability. -/
theorem isMultipleItoIntegral_unique (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (W : Fin m → ℝ≥0 → Ω → ℝ) (hW : ∀ j, IsFilteredBrownian F P (W j))
    (g : ℝ≥0 → Ω → ℝ) (α : List (Fin (m + 1))) (J J' : ℝ≥0 → Ω → ℝ)
    (hJ : IsMultipleItoIntegral F P W g α J) (hJ' : IsMultipleItoIntegral F P W g α J') :
    ∀ᵐ ω ∂P, ∀ t, J t ω = J' t ω := by
  sorry

/-- **3.1** A multiple Itô integral of a bounded strongly progressive integrand with at least one
stochastic integration has mean zero at every time (Kloeden–Platen, Lemma 5.7.1). -/
theorem integral_isMultipleItoIntegral_eq_zero (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (W : Fin m → ℝ≥0 → Ω → ℝ) (hW : ∀ j, IsFilteredBrownian F P (W j))
    (g : ℝ≥0 → Ω → ℝ) (hg : IsStronglyProgressive F g) {C : ℝ} (hgC : ∀ t ω, |g t ω| ≤ C)
    (α : List (Fin (m + 1))) (hα : ∃ j ∈ α, j ≠ 0) (J : ℝ≥0 → Ω → ℝ)
    (hJ : IsMultipleItoIntegral F P W g α J) (t : ℝ≥0) :
    ∫ ω, J t ω ∂P = 0 := by
  sorry

/-- **3.1** The repeated index: `I_{(j,j)}[1]_{0,t} = ((W j t)² - t) / 2`. -/
theorem isMultipleItoIntegral_repeated (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (W : Fin m → ℝ≥0 → Ω → ℝ) (j : Fin m)
    (hW : IsFilteredBrownian F P (W j)) (J : ℝ≥0 → Ω → ℝ)
    (hJ : IsMultipleItoIntegral F P W (fun _ _ => 1) [j.succ, j.succ] J) :
    ∀ᵐ ω ∂P, ∀ t, J t ω = ((W j t ω) ^ 2 - t) / 2 := by
  sorry

/-- **3.2** The generator `L⁰ g = ∂ₜ g + a ∂ₓ g + ½ (∑ⱼ bⱼ²) ∂ₓ² g` of a scalar equation driven
by `m` Brownian motions. -/
def generatorOp (a : ℝ → ℝ → ℝ) (b : Fin m → ℝ → ℝ → ℝ) (g : ℝ → ℝ → ℝ) : ℝ → ℝ → ℝ :=
  fun t x => deriv (fun s => g s x) t + a t x * deriv (g t) x +
    (1 / 2 : ℝ) * (∑ j, b j t x ^ 2) * iteratedDeriv 2 (g t) x

/-- **3.2** The operator `Lʲ g = bⱼ ∂ₓ g`. -/
def diffusionOp (bj : ℝ → ℝ → ℝ) (g : ℝ → ℝ → ℝ) : ℝ → ℝ → ℝ :=
  fun t x => bj t x * deriv (g t) x

/-- **3.2** `L^k` for a multi-index component `k : Fin (m + 1)`: `L⁰` for `k = 0` and `Lʲ` for
`k = j.succ`. -/
def itoOperator (a : ℝ → ℝ → ℝ) (b : Fin m → ℝ → ℝ → ℝ) (k : Fin (m + 1))
    (g : ℝ → ℝ → ℝ) : ℝ → ℝ → ℝ :=
  Fin.cases (generatorOp a b g) (fun j => diffusionOp (b j) g) k

/-- **3.2** The Itô coefficient functions: `f_v = f` and `f_{(k) * α} = L^k f_α`. -/
def itoCoefficient (a : ℝ → ℝ → ℝ) (b : Fin m → ℝ → ℝ → ℝ) (f : ℝ → ℝ → ℝ) :
    List (Fin (m + 1)) → ℝ → ℝ → ℝ
  | [] => f
  | k :: α => itoOperator a b k (itoCoefficient a b f α)

/-- **3.2** A hierarchical set: nonempty and closed under deleting the first component (bounded
length is automatic for a finite set). -/
def IsHierarchicalSet (A : Finset (List (Fin (m + 1)))) : Prop :=
  A.Nonempty ∧ ∀ α ∈ A, α ≠ [] → α.tail ∈ A

/-- **3.2** The remainder set `B(A) = {α ∉ A | -α ∈ A}`, where `-α` deletes the first component. -/
def remainderSet (A : Finset (List (Fin (m + 1)))) : Finset (List (Fin (m + 1))) :=
  ((A ×ˢ (Finset.univ : Finset (Fin (m + 1)))).image fun p => p.2 :: p.1).filter (· ∉ A)

/-- **3.3** The Itô–Taylor expansion (Kloeden–Platen, Theorem 5.5.1) at `ρ = 0`, for a scalar
Itô process `X t = X 0 + ∫ a(s, X s) ds + ∑ⱼ ∫ bⱼ(s, X s) dWʲ` with continuous coefficients,
a hierarchical set `A` whose coefficient functions are `C²`, and given multiple Itô integrals. -/
theorem itoTaylor_expansion (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) [IsProbabilityMeasure P]
    (W : Fin m → ℝ≥0 → Ω → ℝ) (hW : ∀ j, IsFilteredBrownian F P (W j))
    (hWv : IsBrownianVector P W) (a : ℝ → ℝ → ℝ) (b : Fin m → ℝ → ℝ → ℝ)
    (ha : Continuous (Function.uncurry a)) (hb : ∀ j, Continuous (Function.uncurry (b j)))
    (X : ℝ≥0 → Ω → ℝ) (hXa : StronglyAdapted F X) (hXp : IsStronglyProgressive F X)
    (hXc : ∀ᵐ ω ∂P, Continuous fun t => X t ω)
    (H I : Fin m → ℝ≥0 → Ω → ℝ)
    (hH : ∀ j T, Function.uncurry (fun (t : ℝ≥0) ω => b j t (X t ω))
      =ᵐ[(timeMeasure T).prod P] Function.uncurry (H j))
    (hI : ∀ j, IsItoIntegral F P (W j) (H j) (I j))
    (hX : ∀ᵐ ω ∂P, ∀ t, X t ω = X 0 ω + (∫ s, a s (X s ω) ∂timeMeasure t) + ∑ j, I j t ω)
    (f : ℝ → ℝ → ℝ) (A : Finset (List (Fin (m + 1)))) (hA : IsHierarchicalSet A)
    (hf : ∀ α ∈ A, ContDiff ℝ 2 (Function.uncurry (itoCoefficient a b f α)))
    (J : List (Fin (m + 1)) → ℝ≥0 → Ω → ℝ)
    (hJA : ∀ α ∈ A, IsMultipleItoIntegral F P W
      (fun _ ω => itoCoefficient a b f α 0 (X 0 ω)) α (J α))
    (hJB : ∀ α ∈ remainderSet A, IsMultipleItoIntegral F P W
      (fun t ω => itoCoefficient a b f α t (X t ω)) α (J α)) :
    ∀ᵐ ω ∂P, ∀ t : ℝ≥0, f t (X t ω) = ∑ α ∈ A, J α t ω + ∑ α ∈ remainderSet A, J α t ω := by
  sorry

/-- **3.3** The Milstein hierarchical set `{v} ∪ {(k)} ∪ {(j₁, j₂) | j₁, j₂ ≥ 1}`. -/
def milsteinSet (m : ℕ) : Finset (List (Fin (m + 1))) :=
  {[]} ∪ (Finset.univ.image fun k : Fin (m + 1) => [k]) ∪
    (Finset.univ.image fun p : Fin m × Fin m => [p.1.succ, p.2.succ])

/-- **3.3** The Milstein truncation of the Itô–Taylor expansion of `X` itself: the Euler–Maruyama
terms, the double integrals `I_{(j₁,j₂)}` with coefficients `bʲ¹ ∂ₓ bʲ²`, and the remainder over
`B(milsteinSet m)`. -/
theorem itoTaylor_milstein (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) [IsProbabilityMeasure P]
    (W : Fin m → ℝ≥0 → Ω → ℝ) (hW : ∀ j, IsFilteredBrownian F P (W j))
    (hWv : IsBrownianVector P W) (a : ℝ → ℝ → ℝ) (b : Fin m → ℝ → ℝ → ℝ)
    (ha : ContDiff ℝ 2 (Function.uncurry a)) (hb : ∀ j, ContDiff ℝ 2 (Function.uncurry (b j)))
    (hbb : ∀ j₁ j₂, ContDiff ℝ 2 (Function.uncurry fun t x => b j₁ t x * deriv (b j₂ t) x))
    (X : ℝ≥0 → Ω → ℝ) (hXa : StronglyAdapted F X) (hXp : IsStronglyProgressive F X)
    (hXc : ∀ᵐ ω ∂P, Continuous fun t => X t ω)
    (H I : Fin m → ℝ≥0 → Ω → ℝ)
    (hH : ∀ j T, Function.uncurry (fun (t : ℝ≥0) ω => b j t (X t ω))
      =ᵐ[(timeMeasure T).prod P] Function.uncurry (H j))
    (hI : ∀ j, IsItoIntegral F P (W j) (H j) (I j))
    (hX : ∀ᵐ ω ∂P, ∀ t, X t ω = X 0 ω + (∫ s, a s (X s ω) ∂timeMeasure t) + ∑ j, I j t ω)
    (J : List (Fin (m + 1)) → ℝ≥0 → Ω → ℝ)
    (hJ2 : ∀ j₁ j₂ : Fin m, IsMultipleItoIntegral F P W (fun _ _ => 1) [j₁.succ, j₂.succ]
      (J [j₁.succ, j₂.succ]))
    (hJB : ∀ α ∈ remainderSet (milsteinSet m), IsMultipleItoIntegral F P W
      (fun t ω => itoCoefficient a b (fun _ x => x) α t (X t ω)) α (J α)) :
    ∀ᵐ ω ∂P, ∀ t : ℝ≥0, X t ω = X 0 ω + a 0 (X 0 ω) * t + ∑ j, b j 0 (X 0 ω) * W j t ω +
      ∑ j₁, ∑ j₂, b j₁ 0 (X 0 ω) * deriv (b j₂ 0) (X 0 ω) * J [j₁.succ, j₂.succ] t ω +
      ∑ α ∈ remainderSet (milsteinSet m), J α t ω := by
  sorry

end ItoTaylor

/-! ## Layer 4: the Milstein scheme -/

section Milstein

/-- **4.1** The scalar Milstein scheme with step `h` for `dX = f(X) dt + g(X) dB`, `X 0 = x₀`:
`u (n+1) = u n + f(u n) h + g(u n) ΔBₙ + ½ g'(u n) g(u n) (ΔBₙ² - h)`. -/
def milsteinScheme (f g : ℝ → ℝ) (h : ℝ≥0) (B : ℝ≥0 → Ω → ℝ) (x₀ : ℝ) : ℕ → Ω → ℝ
  | 0 => fun _ => x₀
  | n + 1 => fun ω =>
      let u := milsteinScheme f g h B x₀ n ω
      let dB := B ((n + 1 : ℕ) * h) ω - B (n * h) ω
      u + f u * h + g u * dB + deriv g u * g u / 2 * (dB ^ 2 - h)

/-- **4.1** The local mean-square error of one Milstein step from a deterministic point is
`O(h³)` under Lipschitz coefficients with bounded second derivatives. -/
theorem exists_itoTaylor_local_remainder_bound (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ) (hB : IsFilteredBrownian F P B) (f g : ℝ → ℝ)
    (hf : ContDiff ℝ 2 f) (hg : ContDiff ℝ 2 g) (hfL : ∃ K, LipschitzWith K f)
    (hgL : ∃ K, LipschitzWith K g)
    (hf2 : ∃ M, ∀ x, |iteratedDeriv 2 f x| ≤ M) (hg2 : ∃ M, ∀ x, |iteratedDeriv 2 g x| ≤ M)
    (x₀ : ℝ) (X : ℝ≥0 → Ω → ℝ) (hXa : StronglyAdapted F X) (hXp : IsStronglyProgressive F X)
    (hXc : ∀ᵐ ω ∂P, Continuous fun t => X t ω) (H I : ℝ≥0 → Ω → ℝ)
    (hH : ∀ T, Function.uncurry (fun (t : ℝ≥0) ω => g (X t ω))
      =ᵐ[(timeMeasure T).prod P] Function.uncurry H)
    (hI : IsItoIntegral F P B H I)
    (hX : ∀ᵐ ω ∂P, ∀ t, X t ω = x₀ + (∫ s, f (X s ω) ∂timeMeasure t) + I t ω) (T : ℝ≥0) :
    ∃ C, ∀ h : ℝ≥0, 0 < h → h ≤ T →
      ∫ ω, (X h ω - x₀ - f x₀ * h - g x₀ * B h ω - deriv g x₀ * g x₀ / 2 * (B h ω ^ 2 - h)) ^ 2
        ∂P ≤ C * (h : ℝ) ^ 3 := by
  sorry

/-- **4.2** Strong order one of the scalar Milstein scheme (Lord–Powell–Shardlow, Theorem 8.32):
under the hypotheses of `exists_itoTaylor_local_remainder_bound` and a Lipschitz `g' g`, the root
mean square error at the grid times in `[0, T]` is at most `K h`. -/
theorem exists_milstein_strong_error_bound (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ) (hB : IsFilteredBrownian F P B) (f g : ℝ → ℝ)
    (hf : ContDiff ℝ 2 f) (hg : ContDiff ℝ 2 g) (hfL : ∃ K, LipschitzWith K f)
    (hgL : ∃ K, LipschitzWith K g)
    (hf2 : ∃ M, ∀ x, |iteratedDeriv 2 f x| ≤ M) (hg2 : ∃ M, ∀ x, |iteratedDeriv 2 g x| ≤ M)
    (hgg : ∃ K, LipschitzWith K fun x => deriv g x * g x)
    (x₀ : ℝ) (X : ℝ≥0 → Ω → ℝ) (hXa : StronglyAdapted F X) (hXp : IsStronglyProgressive F X)
    (hXc : ∀ᵐ ω ∂P, Continuous fun t => X t ω) (H I : ℝ≥0 → Ω → ℝ)
    (hH : ∀ T, Function.uncurry (fun (t : ℝ≥0) ω => g (X t ω))
      =ᵐ[(timeMeasure T).prod P] Function.uncurry H)
    (hI : IsItoIntegral F P B H I)
    (hX : ∀ᵐ ω ∂P, ∀ t, X t ω = x₀ + (∫ s, f (X s ω) ∂timeMeasure t) + I t ω) (T : ℝ≥0) :
    ∃ K : ℝ, ∀ h : ℝ≥0, 0 < h → ∀ n : ℕ, (n : ℝ≥0) * h ≤ T →
      Real.sqrt (∫ ω, (X (n * h) ω - milsteinScheme f g h B x₀ n ω) ^ 2 ∂P) ≤ K * h := by
  sorry

/-- **4.3** The Clark–Cameron example (Kloeden–Platen, Example 10.3.4). With the coordinates
`W 0` and `W 1` (Kloeden–Platen's `W¹` and `W²`), let `X¹ = W 0` and `X² = ∫ X¹ d(W 1)`. The
scheme that replaces `I_{(1,2)}` on each step by half the product of the two increments has
mean-square error exactly `N h² / 4` at time `N h`, so its strong order is one half. -/
theorem clarkCameron_meanSquareError (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (W : Fin 2 → ℝ≥0 → Ω → ℝ) (hW : ∀ j, IsFilteredBrownian F P (W j))
    (hWv : IsBrownianVector P W) (H I : ℝ≥0 → Ω → ℝ)
    (hH : ∀ T, Function.uncurry (W 0) =ᵐ[(timeMeasure T).prod P] Function.uncurry H)
    (hI : IsItoIntegral F P (W 1) H I) (N : ℕ) (h : ℝ≥0) :
    ∫ ω, (I (N * h) ω - ∑ n ∈ Finset.range N,
        (W 0 (n * h) ω + (W 0 ((n + 1 : ℕ) * h) ω - W 0 (n * h) ω) / 2) *
          (W 1 ((n + 1 : ℕ) * h) ω - W 1 (n * h) ω)) ^ 2 ∂P = N * (h : ℝ) ^ 2 / 4 := by
  sorry

end Milstein

/-! ## Layer 5: mean-square stability of the stochastic θ-method -/

section Theta

/-- **5.1** The mean-square amplification factor
`R = ((1 + (1 - θ) r h)² + σ² h) / (1 - θ r h)²` of the θ-Euler–Maruyama method for
`du = r u dt + σ u dW`. It is the junk value `0` when `1 - θ r h = 0`. -/
def thetaAmplification (r σ θ h : ℝ) : ℝ :=
  ((1 + (1 - θ) * r * h) ^ 2 + σ ^ 2 * h) / (1 - θ * r * h) ^ 2

/-- **5.1** Second moments of the θ-Euler–Maruyama method: `E u_n² = Rⁿ x²`. -/
theorem integral_sq_theta_eq (F : Filtration ℝ≥0 mΩ) (P : Measure Ω) [IsProbabilityMeasure P]
    (B : ℝ≥0 → Ω → ℝ) (hB : IsFilteredBrownian F P B) (h : ℝ≥0) (r σ θ x : ℝ)
    (hden : 1 - θ * r * h ≠ 0) (U : ℕ → Ω → ℝ) (hinit : ∀ ω, U 0 ω = x)
    (hstep : ∀ n ω, (1 - θ * r * h) * U (n + 1) ω =
      (1 + (1 - θ) * r * h + σ * (B ((n + 1 : ℕ) * h) ω - B (n * h) ω)) * U n ω) (n : ℕ) :
    ∫ ω, U n ω ^ 2 ∂P = thetaAmplification r σ θ h ^ n * x ^ 2 := by
  sorry

/-- **5.2** Mean-square stability of the θ-Euler–Maruyama method: for `h > 0` and `x ≠ 0`,
`E u_n² → 0` iff `r + σ²/2 + (1 - 2θ) r² h / 2 < 0`. -/
theorem theta_meanSquare_stability (F : Filtration ℝ≥0 mΩ) (P : Measure Ω)
    [IsProbabilityMeasure P] (B : ℝ≥0 → Ω → ℝ) (hB : IsFilteredBrownian F P B) (h : ℝ≥0)
    (hh : 0 < h) (r σ θ x : ℝ) (hx : x ≠ 0) (hden : 1 - θ * r * h ≠ 0) (U : ℕ → Ω → ℝ)
    (hinit : ∀ ω, U 0 ω = x)
    (hstep : ∀ n ω, (1 - θ * r * h) * U (n + 1) ω =
      (1 + (1 - θ) * r * h + σ * (B ((n + 1 : ℕ) * h) ω - B (n * h) ω)) * U n ω) :
    Tendsto (fun n => ∫ ω, U n ω ^ 2 ∂P) atTop (𝓝 0) ↔
      r + σ ^ 2 / 2 + (1 - 2 * θ) * r ^ 2 * h / 2 < 0 := by
  sorry

/-- **5.2** The three regimes: if `r + σ²/2 < 0`, the explicit method (`θ = 0`) is mean-square
stable iff `h < -2 (r + σ²/2) / r²`, and every `θ ≥ 1/2` is stable for every `h > 0`; for
`θ = 1/2` stability is equivalent to `r + σ²/2 < 0`, the stability condition of the equation. -/
theorem thetaAmplification_lt_one_cases (r σ : ℝ) {h : ℝ} (hh : 0 < h) :
    (r + σ ^ 2 / 2 < 0 →
        (thetaAmplification r σ 0 h < 1 ↔ h < -2 * (r + σ ^ 2 / 2) / r ^ 2) ∧
        ∀ θ : ℝ, 1 / 2 ≤ θ → thetaAmplification r σ θ h < 1) ∧
      (1 - r * h / 2 ≠ 0 → (thetaAmplification r σ (1 / 2) h < 1 ↔ r + σ ^ 2 / 2 < 0)) := by
  sorry

end Theta

/-! ## Upstream declarations named in the README -/

#check @TauCeti.finiteMean
#check @TauCeti.integral_finiteMean_sub_sq
#check @ProbabilityTheory.strong_law_ae
#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
#check @MeasureTheory.TendstoInDistribution.prodMk_of_tendstoInMeasure_const
#check @MeasureTheory.TendstoInDistribution.continuous_comp
#check @MeasureTheory.tendstoInDistribution_of_tendstoInMeasure_sub
#check @ProbabilityTheory.IndepFun.variance_sum
#check @ProbabilityTheory.gaussianReal
#check @ProbabilityTheory.IsBrownianReal

end TauCetiRoadmap.MonteCarloMultilevelAndSDESchemes
