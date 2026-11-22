import Mathlib

/-!
# Sequential analysis: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's routes and Checks are not restated.

Layers 1 and 2 concern a random walk `Sₙ = X 0 + ⋯ + X (n - 1)` with independent, identically
distributed real increments. Stopping times take values in `WithTop ℕ`, the value `⊤` meaning
that the walk never stops; `∫⁻ ω, ENat.toENNReal (τ ω) ∂P` is the expected stopping time in
`[0, ∞]`, and `stoppedValue` reads a process at the stopping time (with a junk value on `τ = ⊤`;
every statement has `τ < ⊤` almost surely or integrates over `τ ≠ ⊤` only). Layer 3 works on
the space `ℕ → 𝓧` of observation sequences with the product laws
`Measure.infinitePi fun _ ↦ P` and `Measure.infinitePi fun _ ↦ Q` and the filtration
`obsFiltration 𝓧` of the first `n` observations; the sequential probability ratio test stops
when the walk of log-likelihood ratios `llr Q P` leaves an interval `(a, b)`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set InformationTheory Finset
open scoped ENNReal NNReal

namespace TauCetiRoadmap.SequentialAnalysis

/-! ## Layer 1: Wald's identities -/

section Layer1

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- **1.1** Wald's equation. Let the increments `X i` be adapted to a filtration `ℱ` in the sense
that `X i` is `ℱ (i + 1)`-measurable and independent of `ℱ i`, identically distributed and
integrable. For every stopping time `τ` of finite mean, the walk at `τ` is integrable and
`E[S_τ] = E[τ] · E[X 0]` (Durrett, Theorem 2.6.2; Ferguson, §3.3, Theorem 4; here for a general
filtration). -/
theorem wald_equation [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (ℱ : Filtration ℕ ‹MeasurableSpace Ω›) (hadapt : ∀ i, StronglyMeasurable[ℱ (i + 1)] (X i))
    (hind : ∀ i, Indep (MeasurableSpace.comap (X i) inferInstance) (ℱ i) P)
    (hid : ∀ i, IdentDistrib (X i) (X 0) P P) (hint : Integrable (X 0) P)
    {τ : Ω → WithTop ℕ} (hτ : IsStoppingTime ℱ τ)
    (hτint : ∫⁻ ω, ENat.toENNReal (τ ω) ∂P ≠ ∞) :
    Integrable (stoppedValue (fun n ω ↦ ∑ i ∈ range n, X i ω) τ) P ∧
      ∫ ω, stoppedValue (fun n ω ↦ ∑ i ∈ range n, X i ω) τ ω ∂P =
        (∫⁻ ω, ENat.toENNReal (τ ω) ∂P).toReal * ∫ ω, X 0 ω ∂P := by
  sorry

/-- **1.2** Wald's second identity, in centred form. Under the hypotheses of 1.1 with square
integrable increments of mean `μ`, the centred walk `S_τ - μ τ` at a stopping time of finite mean
is square integrable and `E[(S_τ - μ τ)²] = E[τ] · Var(X 0)` (Durrett, Exercise 4.8.4, for mean
zero; proved here). -/
theorem wald_second_identity [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (ℱ : Filtration ℕ ‹MeasurableSpace Ω›) (hadapt : ∀ i, StronglyMeasurable[ℱ (i + 1)] (X i))
    (hind : ∀ i, Indep (MeasurableSpace.comap (X i) inferInstance) (ℱ i) P)
    (hid : ∀ i, IdentDistrib (X i) (X 0) P P) (hL2 : MemLp (X 0) 2 P)
    {τ : Ω → WithTop ℕ} (hτ : IsStoppingTime ℱ τ)
    (hτint : ∫⁻ ω, ENat.toENNReal (τ ω) ∂P ≠ ∞) :
    Integrable (fun ω ↦ stoppedValue
        (fun n ω ↦ ∑ i ∈ range n, X i ω - n * ∫ ω', X 0 ω' ∂P) τ ω ^ 2) P ∧
      ∫ ω, stoppedValue (fun n ω ↦ ∑ i ∈ range n, X i ω - n * ∫ ω', X 0 ω' ∂P) τ ω ^ 2 ∂P =
        (∫⁻ ω, ENat.toENNReal (τ ω) ∂P).toReal * variance (X 0) P := by
  sorry

end Layer1

/-! ## Layer 2: exit times of an interval -/

section Layer2

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- **2.1** The exit time of the walk `Sₙ = X 0 + ⋯ + X (n - 1)` from the open interval
`(a, b)`: the first `n ≥ 0` with `Sₙ ≤ a` or `Sₙ ≥ b`, and `⊤` if there is none. It is `0` when
`0 ∉ (a, b)`, in particular when `b ≤ a`. -/
def exitTime (X : ℕ → Ω → ℝ) (a b : ℝ) : Ω → WithTop ℕ :=
  hittingAfter (fun n ω ↦ ∑ i ∈ range n, X i ω) (Ioo a b)ᶜ 0

/-- **2.1** Exponential tail of exit times. For measurable, independent, identically distributed
increments that are not almost surely `0` and every interval `(a, b)`, there are `C` and
`0 ≤ ρ < 1` with `P(τ > n) ≤ C ρⁿ` for every `n`, where `τ` is the exit time; in particular the
walk leaves the interval almost surely and `τ` has moments of every order (proved here). -/
theorem exists_measureReal_lt_exitTime_le [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hX : ∀ i, Measurable (X i)) (hindep : iIndepFun X P) (hid : ∀ i, IdentDistrib (X i) (X 0) P P)
    (hnd : ¬ X 0 =ᵐ[P] 0) (a b : ℝ) :
    ∃ C ρ : ℝ, 0 ≤ ρ ∧ ρ < 1 ∧
      ∀ n : ℕ, P.real {ω | (n : WithTop ℕ) < exitTime X a b ω} ≤ C * ρ ^ n := by
  sorry

/-- **2.2** The exponential identity for exit times. For measurable, independent, identically
distributed increments that are not almost surely `0`, every interval `(a, b)` and every real `θ`
with `E[exp (θ X 0)] < ∞`, writing `φ(θ) = E[exp (θ X 0)]` and `τ` for the exit time,
`E[exp (θ S_τ) / φ(θ)^τ ; τ < ∞] = 1` (Durrett, Exercise 4.8.8, for `φ(θ) = 1`; proved here for
every `θ`). -/
theorem wald_exponential_identity [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hX : ∀ i, Measurable (X i)) (hindep : iIndepFun X P) (hid : ∀ i, IdentDistrib (X i) (X 0) P P)
    (hnd : ¬ X 0 =ᵐ[P] 0) {θ : ℝ} (hθ : Integrable (fun ω ↦ Real.exp (θ * X 0 ω)) P) (a b : ℝ) :
    ∫ ω in {ω | exitTime X a b ω ≠ ⊤},
        stoppedValue (fun n ω ↦ Real.exp (θ * ∑ i ∈ range n, X i ω) / mgf (X 0) P θ ^ n)
          (exitTime X a b) ω ∂P = 1 := by
  sorry

end Layer2

/-! ## Layer 3: the sequential probability ratio test -/

section CopiedKlBin

/-- **3.4** The binary Kullback–Leibler divergence (copied verbatim from
MathematicalStatisticsNonparametric 1.3). -/
def klBin (a b : ℝ) : ℝ :=
  a * Real.log (a / b) + (1 - a) * Real.log ((1 - a) / (1 - b))

end CopiedKlBin

section Layer3

variable {𝓧 : Type*} [MeasurableSpace 𝓧]

/-- **3.1** The filtration of the first `n` observations on `ℕ → 𝓧`: at time `n` it is generated
by the coordinates `ω 0, …, ω (n - 1)`; at time `0` it is trivial. -/
def obsFiltration (𝓧 : Type*) [MeasurableSpace 𝓧] :
    Filtration ℕ (MeasurableSpace.pi : MeasurableSpace (ℕ → 𝓧)) where
  seq n := ⨆ (i : ℕ) (_ : i < n), MeasurableSpace.comap (fun ω : ℕ → 𝓧 ↦ ω i) ‹_›
  mono' _ _ hnm := biSup_mono fun _ hi ↦ lt_of_lt_of_le hi hnm
  le' _ := iSup₂_le fun i _ ↦ (measurable_pi_apply i).comap_le

/-- **3.1** The likelihood ratio identity at a stopping time. If `Q ≪ P` and `f = dQ/dP`, then
for every stopping time `τ` of the observation filtration and every event `E` of the σ-algebra at
`τ`, `Q^∞(E ∩ {τ < ∞}) = ∫_{E ∩ {τ < ∞}} f(ω 0) ⋯ f(ω (τ - 1)) dP^∞` (Polyanskiy–Wu, (16.13)
and (16.14), p. 323; here with the density instead of the log-likelihood ratio and only
`Q ≪ P`). -/
theorem infinitePi_inter_ne_top_eq_setLIntegral (P Q : Measure 𝓧) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hQP : Q ≪ P) {τ : (ℕ → 𝓧) → WithTop ℕ}
    (hτ : IsStoppingTime (obsFiltration 𝓧) τ) {E : Set (ℕ → 𝓧)}
    (hE : MeasurableSet[hτ.measurableSpace] E) :
    Measure.infinitePi (fun _ ↦ Q) (E ∩ {ω | τ ω ≠ ⊤}) =
      ∫⁻ ω in E ∩ {ω | τ ω ≠ ⊤},
        stoppedValue (fun n ω ↦ ∏ i ∈ range n, Q.rnDeriv P (ω i)) τ ω
          ∂(Measure.infinitePi fun _ ↦ P) := by
  sorry

/-- **3.2** The stopping time of the sequential probability ratio test with log-thresholds
`a < b`: the exit time from `(a, b)` of the walk `log (dQ/dP)(ω 0) + ⋯ + log (dQ/dP)(ω (n - 1))`. -/
def sprtTime (P Q : Measure 𝓧) (a b : ℝ) : (ℕ → 𝓧) → WithTop ℕ :=
  exitTime (fun i ω ↦ llr Q P (ω i)) a b

/-- **3.2** The test stops and rejects the null hypothesis `P`: the walk of log-likelihood ratios
reaches `[b, ∞)`. -/
def sprtReject (P Q : Measure 𝓧) (a b : ℝ) : Set (ℕ → 𝓧) :=
  {ω | sprtTime P Q a b ω ≠ ⊤ ∧
    b ≤ stoppedValue (fun n ω ↦ ∑ i ∈ range n, llr Q P (ω i)) (sprtTime P Q a b) ω}

/-- **3.2** The test stops and accepts the null hypothesis `P`: the walk of log-likelihood ratios
reaches `(-∞, a]`. -/
def sprtAccept (P Q : Measure 𝓧) (a b : ℝ) : Set (ℕ → 𝓧) :=
  {ω | sprtTime P Q a b ω ≠ ⊤ ∧
    stoppedValue (fun n ω ↦ ∑ i ∈ range n, llr Q P (ω i)) (sprtTime P Q a b) ω ≤ a}

/-- **3.2** Termination of the sequential probability ratio test. If `Q ≪ P` and `P ≠ Q`, then
for all `a`, `b` the stopping time has an exponential tail under both laws: there are `C` and
`0 ≤ ρ < 1` with `P^∞(τ > n) ≤ C ρⁿ` and `Q^∞(τ > n) ≤ C ρⁿ` for every `n` (proved here). -/
theorem exists_measureReal_lt_sprtTime_le (P Q : Measure 𝓧) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hQP : Q ≪ P) (hne : P ≠ Q) (a b : ℝ) :
    ∃ C ρ : ℝ, 0 ≤ ρ ∧ ρ < 1 ∧ ∀ n : ℕ,
      (Measure.infinitePi fun _ ↦ P).real {ω | (n : WithTop ℕ) < sprtTime P Q a b ω} ≤
          C * ρ ^ n ∧
        (Measure.infinitePi fun _ ↦ Q).real {ω | (n : WithTop ℕ) < sprtTime P Q a b ω} ≤
          C * ρ ^ n := by
  sorry

/-- **3.3** The threshold inequalities of the sequential probability ratio test. For mutually
absolutely continuous `P`, `Q` and `a < b`, with `α = P^∞(reject)` and `β = Q^∞(accept)`,
`exp b · α ≤ 1 - β` and `β ≤ exp a · (1 - α)`; in particular `α ≤ exp (-b)` and `β ≤ exp a`
(Polyanskiy–Wu, proof of Theorem 16.4, p. 323, for the bounds `exp (-b)` and `exp a`; proved
here). -/
theorem exp_mul_measureReal_sprtReject_le (P Q : Measure 𝓧) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hPQ : P ≪ Q) (hQP : Q ≪ P) {a b : ℝ} (hab : a < b) :
    Real.exp b * (Measure.infinitePi fun _ ↦ P).real (sprtReject P Q a b) ≤
        1 - (Measure.infinitePi fun _ ↦ Q).real (sprtAccept P Q a b) ∧
      (Measure.infinitePi fun _ ↦ Q).real (sprtAccept P Q a b) ≤
        Real.exp a * (1 - (Measure.infinitePi fun _ ↦ P).real (sprtReject P Q a b)) := by
  sorry

/-- **3.4** The lower bound on the expected sample size. For all probability measures `P`, `Q`,
every stopping time `τ` of the observation filtration and every event `E` of the σ-algebra at
`τ`, `klBin (P^∞ E) (Q^∞ E) ≤ E_P[τ] · D(P ‖ Q)` in `[0, ∞]` (Polyanskiy–Wu, converse part of the
proof of Theorem 16.4, p. 323, under a bounded log-likelihood ratio; proved here in general). -/
theorem ofReal_klBin_le_lintegral_mul_klDiv (P Q : Measure 𝓧) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {τ : (ℕ → 𝓧) → WithTop ℕ} (hτ : IsStoppingTime (obsFiltration 𝓧) τ)
    {E : Set (ℕ → 𝓧)} (hE : MeasurableSet[hτ.measurableSpace] E) :
    ENNReal.ofReal (klBin ((Measure.infinitePi fun _ ↦ P).real E)
        ((Measure.infinitePi fun _ ↦ Q).real E)) ≤
      (∫⁻ ω, ENat.toENNReal (τ ω) ∂(Measure.infinitePi fun _ ↦ P)) * klDiv P Q := by
  sorry

/-- **3.5** The expected sample size of the sequential probability ratio test under a bounded
log-likelihood ratio. For mutually absolutely continuous `P`, `Q` with `|log (dQ/dP)| ≤ c`
`P`-almost everywhere and all `a`, `b`, `E_P[τ] · D(P ‖ Q) ≤ c - a` and
`E_Q[τ] · D(Q ‖ P) ≤ c + b` in `[0, ∞]` (Polyanskiy–Wu, achievability part of the proof of
Theorem 16.4, p. 323). -/
theorem lintegral_sprtTime_mul_klDiv_le (P Q : Measure 𝓧) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hPQ : P ≪ Q) (hQP : Q ≪ P) {c : ℝ}
    (hc : ∀ᵐ x ∂P, |llr Q P x| ≤ c) (a b : ℝ) :
    (∫⁻ ω, ENat.toENNReal (sprtTime P Q a b ω) ∂(Measure.infinitePi fun _ ↦ P)) * klDiv P Q ≤
        ENNReal.ofReal (c - a) ∧
      (∫⁻ ω, ENat.toENNReal (sprtTime P Q a b ω) ∂(Measure.infinitePi fun _ ↦ Q)) * klDiv Q P ≤
        ENNReal.ofReal (c + b) := by
  sorry

end Layer3

end TauCetiRoadmap.SequentialAnalysis
