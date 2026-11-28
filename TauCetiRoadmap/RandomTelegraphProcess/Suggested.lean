import Mathlib
import TauCeti.Probability.Renewal.Count

/-!
# The random telegraph process: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

Holding times are a sequence `T : ℕ → Ω → ℝ≥0` of independent random variables with Mathlib's
exponential laws `ProbabilityTheory.expMeasure`, and the number of switches up to time `t` is
Tau Ceti's renewal count `TauCeti.Probability.renewalCountNat T t`. Time is real; a time `t` is
passed to the count as `t.toNNReal`, and every theorem is about times `t ≥ 0`. The two-state
process starts in state `0` and switches state at every renewal; its transition matrices are
`NormedSpace.exp (t • twoStateGenerator a b)`, with rows indexing the starting state, as in the
roadmap ContinuousTimeMarkovChains. The telegraph process has speed `c`, an initial sign
`σ ω ∈ {1, -1}` independent of the holding times, velocity `c σ (-1)^(N_t)` and position the
integral of the velocity over `[0, t]`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology TauCeti.Probability
open scoped NNReal

namespace TauCetiRoadmap.RandomTelegraphProcess

/-! ## Layer 1: The two-state generator -/

/-- 1.1 The generator of the chain on `Fin 2` that jumps from `0` to `1` at rate `a` and from
`1` to `0` at rate `b`. -/
def twoStateGenerator (a b : ℝ) : Matrix (Fin 2) (Fin 2) ℝ :=
  !![-a, a; b, -b]

/-- 1.1 For all real `a`, `b` with `a + b ≠ 0` and every real `t`,
`exp (t Q) = 1 + ((1 - e^(-(a + b) t)) / (a + b)) Q`. -/
theorem exp_smul_twoStateGenerator (a b t : ℝ) (hab : a + b ≠ 0) :
    NormedSpace.exp (t • twoStateGenerator a b) =
      1 + ((1 - Real.exp (-((a + b) * t))) / (a + b)) • twoStateGenerator a b := by
  sorry

/-! ## Layer 2: The two-state process and the telegraph process -/

section Processes

variable {Ω : Type*}

/-- 2.1 The two-state process started in `0`: the parity of the number of renewals of the
holding times `T` up to time `t`. -/
def twoStateProcess (T : ℕ → Ω → ℝ≥0) (t : ℝ) (ω : Ω) : Fin 2 :=
  ⟨renewalCountNat T t.toNNReal ω % 2, Nat.mod_lt _ two_pos⟩

/-- 2.2 The velocity of the telegraph process with speed `c`, initial sign `σ` and holding
times `T`: `c σ (-1)^(N_t)`. -/
def telegraphVelocity (c : ℝ) (σ : Ω → ℝ) (T : ℕ → Ω → ℝ≥0) (t : ℝ) (ω : Ω) : ℝ :=
  c * σ ω * (-1) ^ renewalCountNat T t.toNNReal ω

/-- 2.2 The position of the telegraph process: the integral of the velocity over `[0, t]`. -/
def telegraphPosition (c : ℝ) (σ : Ω → ℝ) (T : ℕ → Ω → ℝ≥0) (t : ℝ) (ω : Ω) : ℝ :=
  ∫ s in (0 : ℝ)..t, telegraphVelocity c σ T s ω

variable [MeasurableSpace Ω] {P : Measure Ω}

/-- 2.1 **Finite-dimensional laws of the two-state process.** If the holding times are
independent, exponential of rate `a` at even and of rate `b` at odd indices, then for times
`0 ≤ t₀ ≤ t₁ ≤ ⋯ ≤ tₙ` and states `i₀, …, iₙ` the probability that the process is in `i_k` at
time `t_k` for every `k` is `exp(t₀ Q)_{0 i₀} ∏_k exp((t_(k+1) - t_k) Q)_{i_k i_(k+1)}` with
`Q = twoStateGenerator a b`. -/
theorem measureReal_twoStateProcess_eq {T : ℕ → Ω → ℝ≥0} {a b : ℝ≥0}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure (if Even n then (a : ℝ) else b)) P)
    (n : ℕ) (t : Fin (n + 1) → ℝ) (ht₀ : 0 ≤ t 0) (ht : Monotone t) (i : Fin (n + 1) → Fin 2) :
    P.real {ω | ∀ k, twoStateProcess T (t k) ω = i k} =
      NormedSpace.exp (t 0 • twoStateGenerator a b) 0 (i 0) *
        ∏ k : Fin n, NormedSpace.exp ((t k.succ - t k.castSucc) • twoStateGenerator a b)
          (i k.castSucc) (i k.succ) := by
  sorry

/-- 2.2 **Mean and second moment of the position.** For independent exponential holding times
of rate `a` and an initial sign `σ = ±1` independent of them, at every time `t ≥ 0`
`E X_t = c E[σ] (1 - e^(-2at)) / (2a)` and `E X_t² = (c² / a) (t - (1 - e^(-2at)) / (2a))`. -/
theorem integral_telegraphPosition {T : ℕ → Ω → ℝ≥0} {a : ℝ≥0} {σ : Ω → ℝ}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure a) P)
    (hσm : Measurable σ) (hσ : ∀ ω, σ ω = 1 ∨ σ ω = -1)
    (hσT : IndepFun σ (fun ω n ↦ T n ω) P) (c t : ℝ) (ht : 0 ≤ t) :
    ∫ ω, telegraphPosition c σ T t ω ∂P =
        c * (∫ ω, σ ω ∂P) * (1 - Real.exp (-(2 * a * t))) / (2 * a) ∧
      ∫ ω, telegraphPosition c σ T t ω ^ 2 ∂P =
        c ^ 2 / a * (t - (1 - Real.exp (-(2 * a * t))) / (2 * a)) := by
  sorry

/-- 2.3 **The law of the position.** Under the hypotheses of 2.2 and `c ≠ 0`, at every time
`t ≥ 0` the law of `X_t` is the sum of an atom of mass `P(σ = 1) e^(-at)` at `ct`, an atom of
mass `P(σ = -1) e^(-at)` at `-ct`, and a measure absolutely continuous with respect to Lebesgue
measure that is carried by the open interval `(-|c| t, |c| t)`. -/
theorem map_telegraphPosition_eq {T : ℕ → Ω → ℝ≥0} {a : ℝ≥0} {σ : Ω → ℝ}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure a) P)
    (hσm : Measurable σ) (hσ : ∀ ω, σ ω = 1 ∨ σ ω = -1)
    (hσT : IndepFun σ (fun ω n ↦ T n ω) P) {c : ℝ} (hc : c ≠ 0) (t : ℝ) (ht : 0 ≤ t) :
    ∃ ν : Measure ℝ, ν ≪ volume ∧ ν (Set.Ioo (-(|c| * t)) (|c| * t))ᶜ = 0 ∧
      P.map (telegraphPosition c σ T t) =
        ENNReal.ofReal (P.real {ω | σ ω = 1} * Real.exp (-(a * t))) • Measure.dirac (c * t) +
          ENNReal.ofReal (P.real {ω | σ ω = -1} * Real.exp (-(a * t))) •
            Measure.dirac (-(c * t)) + ν := by
  sorry

/-! ## Layer 3: Kac's equations -/

/-- 3.1 **The first-switch equation.** For independent exponential holding times of rate `a`,
the initial sign `1`, a bounded measurable `f`, real `c`, `x` and a time `t ≥ 0`,
`E f(x + X^c_t) = e^(-at) f(x + ct) + ∫₀ᵗ a e^(-as) E f(x + cs + X^(-c)_(t-s)) ds`, where `X^c`
is the position with speed `c`. -/
theorem integral_comp_telegraphPosition_eq {T : ℕ → Ω → ℝ≥0} {a : ℝ≥0}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure a) P)
    {f : ℝ → ℝ} (hf : Measurable f) (hfb : ∃ M, ∀ y, |f y| ≤ M) (c x t : ℝ) (ht : 0 ≤ t) :
    ∫ ω, f (x + telegraphPosition c (fun _ ↦ 1) T t ω) ∂P =
      Real.exp (-(a * t)) * f (x + c * t) +
        ∫ s in (0 : ℝ)..t, a * Real.exp (-(a * s)) *
          ∫ ω, f (x + c * s + telegraphPosition (-c) (fun _ ↦ 1) T (t - s) ω) ∂P := by
  sorry

/-- 3.2 **Kac's first-order system.** For independent exponential holding times of rate `a`,
the initial sign `1` and a continuously differentiable `f`, the function
`u_c(t, x) = E f(x + X^c_t)` has, at every time `t ≥ 0` (from the right at `0`), the time
derivative `c E f'(x + X^c_t) + a (u_(-c)(t, x) - u_c(t, x))`. -/
theorem hasDerivWithinAt_integral_comp_telegraphPosition {T : ℕ → Ω → ℝ≥0} {a : ℝ≥0}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure a) P)
    {f : ℝ → ℝ} (hf : ContDiff ℝ 1 f) (c x t : ℝ) (ht : 0 ≤ t) :
    HasDerivWithinAt (fun s ↦ ∫ ω, f (x + telegraphPosition c (fun _ ↦ 1) T s ω) ∂P)
      (c * (∫ ω, deriv f (x + telegraphPosition c (fun _ ↦ 1) T t ω) ∂P) +
        a * ((∫ ω, f (x + telegraphPosition (-c) (fun _ ↦ 1) T t ω) ∂P) -
          ∫ ω, f (x + telegraphPosition c (fun _ ↦ 1) T t ω) ∂P))
      (Set.Ici 0) t := by
  sorry

/-- 3.3 **Kac's theorem: the telegraph equation.** For independent exponential holding times of
rate `a`, an initial sign `σ = ±1` independent of them and a twice continuously differentiable
`f`, the function `u(t, x) = E f(x + X_t)` has time derivative
`v(t, x) = E[V_t f'(x + X_t)]`, and `v` has time derivative `c² E f''(x + X_t) - 2a v(t, x)`,
at every time `t ≥ 0` (from the right at `0`); and `∂²_x u(t, x) = E f''(x + X_t)`. So
`u_tt + 2a u_t = c² u_xx`. -/
theorem hasDerivWithinAt_telegraph_equation {T : ℕ → Ω → ℝ≥0} {a : ℝ≥0} {σ : Ω → ℝ}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure a) P)
    (hσm : Measurable σ) (hσ : ∀ ω, σ ω = 1 ∨ σ ω = -1)
    (hσT : IndepFun σ (fun ω n ↦ T n ω) P)
    {f : ℝ → ℝ} (hf : ContDiff ℝ 2 f) (c x t : ℝ) (ht : 0 ≤ t) :
    HasDerivWithinAt (fun s ↦ ∫ ω, f (x + telegraphPosition c σ T s ω) ∂P)
        (∫ ω, telegraphVelocity c σ T t ω * deriv f (x + telegraphPosition c σ T t ω) ∂P)
        (Set.Ici 0) t ∧
      HasDerivWithinAt
        (fun s ↦ ∫ ω, telegraphVelocity c σ T s ω * deriv f (x + telegraphPosition c σ T s ω) ∂P)
        (c ^ 2 * (∫ ω, deriv (deriv f) (x + telegraphPosition c σ T t ω) ∂P) -
          2 * a * ∫ ω, telegraphVelocity c σ T t ω * deriv f (x + telegraphPosition c σ T t ω) ∂P)
        (Set.Ici 0) t ∧
      HasDerivAt (deriv fun y ↦ ∫ ω, f (y + telegraphPosition c σ T t ω) ∂P)
        (∫ ω, deriv (deriv f) (x + telegraphPosition c σ T t ω) ∂P) x := by
  sorry

/-- 3.4 **The characteristic function of the position.** Under the hypotheses of 2.2, for
every time `t ≥ 0`, every real `ξ` and every complex `r` with `r² = a² - c² ξ²`,
`E e^(iξX_t) = e^(-at) (cosh (rt) + (a + i c ξ E[σ]) S)`, where `S = sinh (rt) / r` if `r ≠ 0`
and `S = t` if `r = 0`. -/
theorem charFun_map_telegraphPosition {T : ℕ → Ω → ℝ≥0} {a : ℝ≥0} {σ : Ω → ℝ}
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hlaw : ∀ n, HasLaw (fun ω ↦ (T n ω : ℝ)) (expMeasure a) P)
    (hσm : Measurable σ) (hσ : ∀ ω, σ ω = 1 ∨ σ ω = -1)
    (hσT : IndepFun σ (fun ω n ↦ T n ω) P) (c t : ℝ) (ht : 0 ≤ t) (ξ : ℝ) (r : ℂ)
    (hr : r ^ 2 = (a : ℂ) ^ 2 - (c : ℂ) ^ 2 * (ξ : ℂ) ^ 2) :
    charFun (P.map (telegraphPosition c σ T t)) ξ =
      Complex.exp (-((a : ℂ) * t)) * (Complex.cosh (r * t) +
        ((a : ℂ) + Complex.I * c * ξ * ((∫ ω, σ ω ∂P : ℝ) : ℂ)) *
          (if r = 0 then (t : ℂ) else Complex.sinh (r * t) / r)) := by
  sorry

/-- 3.5 **The diffusive limit.** Let the switching rates `a_m` tend to infinity and the speeds
`c_m` satisfy `c_m² / a_m → s`. For each `m` let the holding times `T m` be independent and
exponential of rate `a_m` and let the initial sign `σ m = ±1` be independent of them. Then at
every time `t ≥ 0` the position `X^(m)_t` converges in distribution to the centred Gaussian law
of variance `s t`. -/
theorem tendstoInDistribution_telegraphPosition [IsProbabilityMeasure P]
    {T : ℕ → ℕ → Ω → ℝ≥0} {a : ℕ → ℝ≥0} {σ : ℕ → Ω → ℝ} {c : ℕ → ℝ} {s : ℝ≥0}
    (hT : ∀ m n, Measurable (T m n)) (hindep : ∀ m, iIndepFun (T m) P)
    (hlaw : ∀ m n, HasLaw (fun ω ↦ (T m n ω : ℝ)) (expMeasure (a m)) P)
    (hσm : ∀ m, Measurable (σ m)) (hσ : ∀ m ω, σ m ω = 1 ∨ σ m ω = -1)
    (hσT : ∀ m, IndepFun (σ m) (fun ω n ↦ T m n ω) P)
    (ha : Tendsto (fun m ↦ (a m : ℝ)) atTop atTop)
    (hca : Tendsto (fun m ↦ c m ^ 2 / a m) atTop (𝓝 (s : ℝ)))
    {Ω' : Type*} [MeasurableSpace Ω'] {P' : Measure Ω'} [IsProbabilityMeasure P']
    {Z : Ω' → ℝ} (t : ℝ≥0) (hZ : HasLaw Z (gaussianReal 0 (s * t)) P') :
    TendstoInDistribution (fun m ↦ telegraphPosition (c m) (σ m) (T m) t) atTop Z
      (fun _ ↦ P) P' := by
  sorry

end Processes

end TauCetiRoadmap.RandomTelegraphProcess
