import Mathlib
import TauCeti.Geometry.Neuromanifold.Activation
import TauCeti.Geometry.Neuromanifold.Dense

/-!
# Echo states and random features: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need, all with real bodies: the reservoir equation and the echo state property,
the echo state network map and the linear reservoir (built from Tau Ceti's dense layer and
hyperbolic tangent layer), iterated function systems and their attractors (copied verbatim from
FractalGeometry 1.1), and the random-feature approximant with its target. Every headline theorem
of the README's summary is statable at the pins and is stated here.

An input history is a sequence `z : ℕ → U` read backwards in time: `z 0` is the current input and
`z k` the input `k` steps earlier. A state sequence `x : ℕ → X` solves the reservoir equation of
`F : X → U → X` when `x k = F (x (k + 1)) (z k)` for every `k`. Sequence spaces carry the product
topology. The independent draws of the random-feature layer form the product law
`Measure.pi fun _ : Fin K => p`; no sampling procedure is specified.
-/

noncomputable section

open MeasureTheory Set
open scoped NNReal

namespace TauCetiRoadmap.EchoStatesAndRandomFeatures

/-! ## Layer 1: echo states and fading memory -/

section Echo

variable {X U : Type*}

/-- 1.1 The state sequence `x` solves the reservoir equation of `F` for the input history `z`:
`x k = F (x (k + 1)) (z k)` for every `k`, where `z 0` is the current input. -/
def IsSolution (F : X → U → X) (z : ℕ → U) (x : ℕ → X) : Prop :=
  ∀ k, x k = F (x (k + 1)) (z k)

/-- 1.1 The echo state property of `F` relative to the set `A` of admissible states: every input
history has exactly one solution of the reservoir equation with all its states in `A`. -/
def HasEchoStates (F : X → U → X) (A : Set X) : Prop :=
  ∀ z : ℕ → U, ∃! x : ℕ → X, (∀ k, x k ∈ A) ∧ IsSolution F z x

variable [MetricSpace X]

/-- 1.1 Existence of solutions: if `A` is a nonempty compact set that `F` maps into itself and
every `F (·) u` is continuous on `A`, then every input history has a solution with states in
`A` (Grigoryeva–Ortega 2018, Theorem 3.1(i), there for compact convex sets of `ℝ^N`). -/
theorem exists_isSolution_of_isCompact (F : X → U → X) {A : Set X} (hA : IsCompact A)
    (hA₀ : A.Nonempty) (hFA : ∀ x ∈ A, ∀ u, F x u ∈ A)
    (hF : ∀ u, ContinuousOn (fun x => F x u) A) (z : ℕ → U) :
    ∃ x : ℕ → X, (∀ k, x k ∈ A) ∧ IsSolution F z x := by
  sorry

/-- 1.2 Echo states and fading memory for contractions: if `A` is nonempty, compact and mapped
into itself, every `F (·) u` is `r`-Lipschitz on `A` with `r < 1`, and `F` is jointly continuous
on `A × U`, then `F` has the echo state property on `A`, the solutions are given by a continuous
echo function `E` through `x k = E (z (· + k))`, and two histories that agree on their last `n`
inputs have echoes within `r ^ n · diam A` (Grigoryeva–Ortega 2018, Theorem 3.1(ii); Jaeger
2001, Proposition 3(a)). -/
theorem hasEchoStates_of_lipschitzOnWith [TopologicalSpace U] (F : X → U → X) {A : Set X}
    (hA : IsCompact A) (hA₀ : A.Nonempty) (hFA : ∀ x ∈ A, ∀ u, F x u ∈ A) {r : ℝ≥0}
    (hr : r < 1) (hF : ∀ u, LipschitzOnWith r (fun x => F x u) A)
    (hc : ContinuousOn (Function.uncurry F) (A ×ˢ univ)) :
    HasEchoStates F A ∧ ∃ E : (ℕ → U) → X, Continuous E ∧
      (∀ z x, (∀ k, x k ∈ A) → IsSolution F z x → ∀ k, x k = E fun j => z (j + k)) ∧
      ∀ (n : ℕ) (z z' : ℕ → U), (∀ k < n, z k = z' k) →
        dist (E z) (E z') ≤ r ^ n * Metric.diam A := by
  sorry

/-- 1.3 Internal approximation: if `F₁ (·) u` is `r`-Lipschitz on the bounded set `A` with
`r < 1` and `F₁`, `F₂` differ by at most `δ` on `A`, then any two solutions with states in `A`
for the same input history stay within `δ / (1 − r)` (Grigoryeva–Ortega 2018,
Theorem 3.1(iii)). -/
theorem dist_le_of_lipschitzOnWith (F₁ F₂ : X → U → X) {A : Set X}
    (hA : Bornology.IsBounded A) {r : ℝ≥0} (hr : r < 1)
    (hF₁ : ∀ u, LipschitzOnWith r (fun x => F₁ x u) A) {δ : ℝ}
    (hδ : ∀ x ∈ A, ∀ u, dist (F₁ x u) (F₂ x u) ≤ δ) {z : ℕ → U} {x₁ x₂ : ℕ → X}
    (h₁ : ∀ k, x₁ k ∈ A) (h₂ : ∀ k, x₂ k ∈ A) (hs₁ : IsSolution F₁ z x₁)
    (hs₂ : IsSolution F₂ z x₂) (k : ℕ) :
    dist (x₁ k) (x₂ k) ≤ δ / (1 - r) := by
  sorry

end Echo

/-! ## Layer 2: echo state networks and linear reservoirs -/

section Reservoirs

open TauCeti.Neuromanifold Matrix

variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- 2.1 The echo state network map `x, u ↦ tanh (A x + C u + ζ)`: Tau Ceti's dense layer with
weight `A` and bias `C u + ζ`, followed by Tau Ceti's hyperbolic tangent layer. -/
def esnMap (A : Matrix ι ι ℝ) (C : Matrix ι κ ℝ) (ζ : ι → ℝ) :
    (ι → ℝ) → (κ → ℝ) → ι → ℝ :=
  fun x u => tanhActivation () (dense (A, C *ᵥ u + ζ) x)

open scoped Matrix.Norms.L2Operator in
/-- 2.1 If the largest singular value of `A` (its operator norm for the Euclidean norms) is less
than one, the echo state network has the echo state property for every input history in `ℝ^κ`,
with all states admissible, and its solutions are given by a continuous echo function (Jaeger
2001, Proposition 3(a); Grigoryeva–Ortega 2018, Corollary 3.2(ii)). -/
theorem hasEchoStates_esnMap [DecidableEq ι] (A : Matrix ι ι ℝ) (C : Matrix ι κ ℝ)
    (ζ : ι → ℝ) (hA : ‖A‖ < 1) :
    HasEchoStates (esnMap A C ζ) univ ∧ ∃ E : (ℕ → κ → ℝ) → ι → ℝ, Continuous E ∧
      ∀ z x, IsSolution (esnMap A C ζ) z x → ∀ k, x k = E fun j => z (j + k) := by
  sorry

/-- 2.2 The linear reservoir map `x, u ↦ A x + C u`: Tau Ceti's dense layer with weight `A` and
bias `C u`. -/
def linearReservoir (A : Matrix ι ι ℝ) (C : Matrix ι κ ℝ) : (ι → ℝ) → (κ → ℝ) → ι → ℝ :=
  fun x u => dense (A, C *ᵥ u) x

/-- 2.2 If the spectral radius of `A` is less than one, then for a bounded input history the
series `∑ j, A ^ j C z (k + j)` converge and form a bounded solution of the linear reservoir
(the unique one, by 2.3). -/
theorem isSolution_linearReservoir_tsum [DecidableEq ι] (A : Matrix ι ι ℝ) (C : Matrix ι κ ℝ)
    (hA : spectralRadius ℂ (A.map ((↑) : ℝ → ℂ)) < 1) {z : ℕ → κ → ℝ}
    (hz : Bornology.IsBounded (range z)) :
    (∀ k, Summable fun j => (A ^ j * C) *ᵥ z (k + j)) ∧
      Bornology.IsBounded (range fun k => ∑' j, (A ^ j * C) *ᵥ z (k + j)) ∧
      IsSolution (linearReservoir A C) z fun k => ∑' j, (A ^ j * C) *ᵥ z (k + j) := by
  sorry

/-- 2.3 A linear reservoir has exactly one bounded solution for every bounded input history if
and only if the spectral radius of `A`, computed over `ℂ`, is less than one. -/
theorem hasEchoStates_linearReservoir_iff (A : Matrix ι ι ℝ) (C : Matrix ι κ ℝ) :
    (∀ z : ℕ → κ → ℝ, Bornology.IsBounded (range z) →
      ∃! x : ℕ → ι → ℝ, Bornology.IsBounded (range x) ∧ IsSolution (linearReservoir A C) z x) ↔
      spectralRadius ℂ (A.map ((↑) : ℝ → ℂ)) < 1 := by
  sorry

end Reservoirs

/-! ## Layer 3: finite input alphabets and iterated function systems -/

/-- 3.1 (copied verbatim from FractalGeometry 1.1) An iterated function system on a metric space
`X` indexed by `ι`: a family of maps `toFun i : X → X` together with a Lipschitz bound
`ratio i ∈ (0, 1)` for each of them. -/
structure IFS (ι : Type*) (X : Type*) [MetricSpace X] where
  /-- The maps of the system. -/
  toFun : ι → X → X
  /-- The prescribed contraction ratios. -/
  ratio : ι → ℝ≥0
  /-- Every ratio is positive. -/
  ratio_pos : ∀ i, 0 < ratio i
  /-- Every ratio is less than one. -/
  ratio_lt_one : ∀ i, ratio i < 1
  /-- Each map is Lipschitz with its prescribed ratio. -/
  lipschitz : ∀ i, LipschitzWith (ratio i) (toFun i)

namespace IFS

variable {ι : Type*} {X : Type*} [MetricSpace X]

/-- 3.1 (copied verbatim from FractalGeometry 1.1) An iterated function system is used as the
family of its maps. -/
instance : CoeFun (IFS ι X) fun _ => ι → X → X := ⟨IFS.toFun⟩

/-- 3.1 (copied verbatim from FractalGeometry 1.1) An attractor of `F` is a nonempty compact set
`K` with `⋃ i, F i '' K = K`. -/
def IsAttractor (F : IFS ι X) (K : Set X) : Prop :=
  IsCompact K ∧ K.Nonempty ∧ ⋃ i, F i '' K = K

end IFS

section Alphabet

variable {X U : Type*} [MetricSpace X] [Finite U] [TopologicalSpace U] [DiscreteTopology U]

/-- 3.1 For a finite input alphabet `U` and a reservoir whose maps `Φ u` form an iterated
function system, the bounded solutions of the reservoir equation are exactly the shifts of a
continuous coding map `π`: a bounded `x` solves the equation for `z` if and only if
`x k = π (z (· + k))` for every `k`. Such a `π` is supplied by FractalGeometry 1.4
(`IFS.existsUnique_codingMap`, `IFS.range_codingMap`) when `X` is complete and nonempty. -/
theorem isSolution_iff_eq_codingMap (Φ : IFS U X) {π : (ℕ → U) → X} (hπ : Continuous π)
    (hπΦ : ∀ ω, π ω = Φ (ω 0) (π fun n => ω (n + 1))) (z : ℕ → U) {x : ℕ → X}
    (hx : Bornology.IsBounded (range x)) :
    IsSolution (fun y u => Φ u y) z x ↔ ∀ k, x k = π fun n => z (n + k) := by
  sorry

/-- 3.2 For a finite input alphabet, the states that bounded solutions of the reservoir equation
reach form the attractor of the iterated function system. -/
theorem setOf_isSolution_eq_of_isAttractor (Φ : IFS U X) {K : Set X} (hK : Φ.IsAttractor K) :
    {y | ∃ (z : ℕ → U) (x : ℕ → X), Bornology.IsBounded (range x) ∧
      IsSolution (fun y u => Φ u y) z x ∧ x 0 = y} = K := by
  sorry

end Alphabet

/-! ## Layer 4: random features -/

section RandomFeatures

variable {Ω Y : Type*} [MeasurableSpace Ω] [MeasurableSpace Y]

/-- 4.1 The target function `y ↦ ∫ β w · φ y w ∂p(w)` of the random-feature model with feature
map `φ`, sampling law `p` and coefficient function `β`. -/
def rksTarget (p : Measure Ω) (β : Ω → ℝ) (φ : Y → Ω → ℝ) (y : Y) : ℝ :=
  ∫ w, β w * φ y w ∂p

/-- 4.1 The random-feature approximant `y ↦ K⁻¹ ∑ k, β (w k) · φ y (w k)` with features
`w : Fin K → Ω`. -/
def rksApprox {K : ℕ} (β : Ω → ℝ) (φ : Y → Ω → ℝ) (w : Fin K → Ω) (y : Y) : ℝ :=
  (K : ℝ)⁻¹ * ∑ k, β (w k) * φ y (w k)

/-- 4.1 For `K ≥ 1` features drawn independently from the probability law `p`, `|β| ≤ C` and
`|φ| ≤ 1`, the mean squared `L²(μ)` error of the approximant is the variance term divided by
`K`, hence at most `C² μ(Y) / K`, for every finite measure `μ` (Rahimi–Recht 2008, Lemma 1 and
the variance identity in the proof of Lemma 4). -/
theorem integral_integral_rksApprox_sub_sq (p : Measure Ω) [IsProbabilityMeasure p]
    (μ : Measure Y) [IsFiniteMeasure μ] {β : Ω → ℝ} {φ : Y → Ω → ℝ} (hβ : Measurable β)
    (hφ : Measurable (Function.uncurry φ)) {C : ℝ} (hβC : ∀ w, |β w| ≤ C)
    (hφ₁ : ∀ y w, |φ y w| ≤ 1) {K : ℕ} (hK : 0 < K) :
    ∫ w, ∫ y, (rksApprox β φ w y - rksTarget p β φ y) ^ 2 ∂μ ∂(Measure.pi fun _ : Fin K => p) =
        ((∫ y, ∫ w, (β w * φ y w) ^ 2 ∂p ∂μ) - ∫ y, rksTarget p β φ y ^ 2 ∂μ) / K ∧
      ∫ w, ∫ y, (rksApprox β φ w y - rksTarget p β φ y) ^ 2 ∂μ ∂(Measure.pi fun _ : Fin K => p)
        ≤ C ^ 2 * μ.real univ / K := by
  sorry

/-- 4.2 For a probability measure `μ`, `K ≥ 1` independent features and `δ > 0`, the
`L²(μ)` error of the random-feature approximant is at most `C / √K · (1 + √(2 log (1/δ)))`
with probability at least `1 − δ` (Rahimi–Recht 2008, Lemma 1 with Lemma 4). -/
theorem measure_sqrt_integral_rksApprox_sub_sq_le (p : Measure Ω) [IsProbabilityMeasure p]
    (μ : Measure Y) [IsProbabilityMeasure μ] {β : Ω → ℝ} {φ : Y → Ω → ℝ} (hβ : Measurable β)
    (hφ : Measurable (Function.uncurry φ)) {C : ℝ} (hβC : ∀ w, |β w| ≤ C)
    (hφ₁ : ∀ y w, |φ y w| ≤ 1) {K : ℕ} (hK : 0 < K) {δ : ℝ} (hδ : 0 < δ) :
    1 - ENNReal.ofReal δ ≤ Measure.pi (fun _ : Fin K => p)
      {w | √(∫ y, (rksApprox β φ w y - rksTarget p β φ y) ^ 2 ∂μ) ≤
        C / √K * (1 + √(2 * Real.log δ⁻¹))} := by
  sorry

end RandomFeatures

end TauCetiRoadmap.EchoStatesAndRandomFeatures
