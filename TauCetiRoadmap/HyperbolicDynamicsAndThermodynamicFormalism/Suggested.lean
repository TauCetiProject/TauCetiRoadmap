module

import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
# Hyperbolic dynamics and thermodynamic formalism: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions their statements need.

`countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate` and
`measureEntropy` restate the measure entropy of GeometryOfNumbersAndQuadraticArithmetic §4.2;
`invariantProbabilities`, `flowInvariantProbabilities`, `pressureNetSum`, `topologicalPressure`,
`flowTopologicalPressure`, `IsEquilibriumState`, `IsFlowEquilibriumState`, `IsGibbsMeasure`,
`HasBowenProperty`, `IsExpansiveFlow` and `HasFlowBowenProperty` restate the notions of
ClassicalErgodicTheory (Conventions, §§5.1, 5.4–5.5, 8.1, 8.4–8.5) and `toralEndomorphism` its
§0.3, only so that the headlines below are statable; those roadmaps own them.

Headline theorems of the README that are not stated here, with what each lacks at the pins:

* the local stable and unstable manifold theorems for hyperbolic sets of diffeomorphisms and flows
  (README §§8.2–8.3): their plaques are `C^r` embeddings of balls of the varying subspaces `E^s_x`
  depending continuously on `x` in the `C¹` topology, a statement about maps with varying domains;
  the pins supply the weak Whitney topology only for maps with a fixed source (Tau Ceti's
  `ContMDiffMap.weakWhitneyTopology`), and the charts adapted to the splitting that would fix the
  source are built by the theorem itself (README Layer 8); their consequence, the local product
  structure of locally maximal hyperbolic sets (README §§8.4–8.5), is stated;
* the Anosov property of the geodesic flow of a compact manifold of negative sectional curvature
  (README §9.3), Anosov's theorem, proved there by an analysis of stable Jacobi fields: the
  geodesic flow of the unit tangent sphere bundle as a `Flow ℝ` on Tau Ceti's
  sphere-bundle manifold is not available (Tau Ceti has the maximal geodesic flow on its open
  domain in the tangent bundle and the sphere bundle as an embedded manifold, into which Mathlib's
  `ContMDiff.iff_comp_isImmersion` corestricts smooth maps; the restricted flow as a `Flow ℝ` is a
  construction of README §9.3, assembled from Tau Ceti's completeness of geodesics on a compact
  manifold and their constant speed, and packaging it needs the flow law and joint continuity on
  the sphere bundle proved, so it is not a simple definition).

The other Anosov statements of README Layer 9, for hyperbolic toral automorphisms (§9.1) and for
suspensions and time changes of Anosov diffeomorphisms (§9.2), are examples that check the
definitions of README Layer 7 on explicit systems, not headline theorems, and are not stated;
§9.1 would also need as data the diffeomorphism of `UnitAddTorus (Fin n)` induced by an integer
matrix, a construction of that section. The ergodic conclusion of §9.1 that the roadmap is built
to reach, that Haar measure is the unique measure of maximal entropy, is stated
(`isEquilibriumState_toralEndomorphism_zero_iff`).
-/

noncomputable section

open MeasureTheory Filter Set Topology Bundle Manifold
open scoped ENNReal NNReal Uniformity ContDiff InnerProductSpace

namespace TauCetiRoadmap.HyperbolicDynamicsAndThermodynamicFormalism

/-! ## Supplied notions, restated -/

section PartitionEntropy

variable {X : Type*} [MeasurableSpace X]

/-- The entropy `∑ -pᵢ log pᵢ ∈ [0, ∞]` of a countable label, `pᵢ = μ (a ⁻¹' {i})`
(GeometryOfNumbersAndQuadraticArithmetic §4.2). -/
def countablePartitionEntropy (μ : Measure X) {ι : Type*} [Countable ι] (a : X → ι) : ℝ≥0∞ :=
  ∑' i, ENNReal.ofReal (Real.negMulLog (μ.real (a ⁻¹' {i})))

/-- The length-`n` itinerary `(a x, a (T x), …, a (T^[n-1] x))` of a label
(GeometryOfNumbersAndQuadraticArithmetic §4.2). -/
def iteratedPartitionLabel {ι : Type*} (T : X → X) (a : X → ι) (n : ℕ) : X → (Fin n → ι) :=
  fun x k => a (T^[k] x)

/-- The entropy rate `inf_(n ≥ 1) H(aⁿ) / n` of a countable label
(GeometryOfNumbersAndQuadraticArithmetic §4.2). -/
def partitionEntropyRate (μ : Measure X) (T : X → X) {ι : Type*} [Countable ι] (a : X → ι) :
    ℝ≥0∞ :=
  ⨅ (n : ℕ) (_ : 0 < n), countablePartitionEntropy μ (iteratedPartitionLabel T a n) / n

/-- The Kolmogorov–Sinai entropy `h_μ(T) ∈ [0, ∞]`, the supremum of the entropy rates of measurable
`ℕ`-valued labels of finite entropy (GeometryOfNumbersAndQuadraticArithmetic §4.2). -/
def measureEntropy (μ : Measure X) (T : X → X) : ℝ≥0∞ :=
  ⨆ (a : X → ℕ) (_ : Measurable a) (_ : countablePartitionEntropy μ a < ⊤),
    partitionEntropyRate μ T a

end PartitionEntropy

section Pressure

variable {X : Type*} [MeasurableSpace X]

/-- The Borel probabilities invariant under `T`, `M(T)` (ClassicalErgodicTheory §5.1). -/
def invariantProbabilities (T : X → X) : Set (ProbabilityMeasure X) :=
  {ν | MeasurePreserving T (ν : Measure X) (ν : Measure X)}

/-- The probabilities invariant under every time map of a real flow, `M(g)`
(ClassicalErgodicTheory §5.1). -/
def flowInvariantProbabilities [TopologicalSpace X] (ϕ : Flow ℝ X) : Set (ProbabilityMeasure X) :=
  ⋂ t : ℝ, invariantProbabilities (ϕ t)

variable [UniformSpace X]

/-- The largest weighted sum `∑_(x ∈ s) exp (S_n φ x)` over `(n, U)`-separated sets
(ClassicalErgodicTheory §5.4). -/
def pressureNetSum (T : X → X) (φ : X → ℝ) (U : SetRel X X) (n : ℕ) : ℝ≥0∞ :=
  ⨆ (s : Finset X) (_ : Dynamics.IsDynNetIn T univ U n s),
    ∑ x ∈ s, ENNReal.ofReal (Real.exp (birkhoffSum T φ n x))

/-- The topological pressure `P_T(φ) ∈ EReal` by separated sets, the supremum over entourages of the
exponential growth rate of `pressureNetSum` (ClassicalErgodicTheory §5.4). -/
def topologicalPressure (T : X → X) (φ : X → ℝ) : EReal :=
  ⨆ U ∈ 𝓤 X, ExpGrowth.expGrowthSup fun n : ℕ => pressureNetSum T φ U n

/-- The topological pressure `P_g(F)` of a continuous flow, the pressure of its time-one map for the
averaged potential `F₁ x = ∫_0^1 F (g^s x) ds` (ClassicalErgodicTheory §5.5). -/
def flowTopologicalPressure (ϕ : Flow ℝ X) (F : C(X, ℝ)) : EReal :=
  topologicalPressure (ϕ 1) (fun x => ∫ s in (0 : ℝ)..1, F (ϕ s x))

/-- `ν` is an equilibrium state of `φ` for `T`: an invariant probability with
`h_ν(T) + ∫ φ dν = P_T(φ)` in `EReal` (ClassicalErgodicTheory §8.1). -/
def IsEquilibriumState (T : X → X) (φ : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ invariantProbabilities T ∧
    (measureEntropy (ν : Measure X) T : EReal) + ((∫ x, φ x ∂(ν : Measure X) : ℝ) : EReal) =
      topologicalPressure T φ

/-- `ν` is an equilibrium state of `F` for a continuous flow `g`: a flow-invariant probability with
`h_ν(g¹) + ∫ F dν = P_g(F)` in `EReal` (ClassicalErgodicTheory §8.1). -/
def IsFlowEquilibriumState (ϕ : Flow ℝ X) (F : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ν ∈ flowInvariantProbabilities ϕ ∧
    (measureEntropy (ν : Measure X) (ϕ 1) : EReal) + ((∫ x, F x ∂(ν : Measure X) : ℝ) : EReal) =
      flowTopologicalPressure ϕ F

end Pressure

section MetricNotions

variable {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]

/-- `ν` is a Gibbs measure for `φ`: for every sufficiently small `ε > 0` there is `K ≥ 1` with
`K⁻¹ ≤ ν (B_n(x, ε)) exp (n P − S_n φ x) ≤ K` for all `x` and `n ≥ 1`, `P` the real pressure
(ClassicalErgodicTheory §8.4). -/
def IsGibbsMeasure (T : X → X) (φ : C(X, ℝ)) (ν : ProbabilityMeasure X) : Prop :=
  ∃ ε₀ > 0, ∀ ε ∈ Ioc 0 ε₀, ∃ K ≥ (1 : ℝ), ∀ (x : X) (n : ℕ), 0 < n →
    K⁻¹ ≤ (ν : Measure X).real {y | ∀ k < n, dist (T^[k] x) (T^[k] y) < ε} *
        Real.exp (n * (topologicalPressure T φ).toReal - birkhoffSum T φ n x) ∧
      (ν : Measure X).real {y | ∀ k < n, dist (T^[k] x) (T^[k] y) < ε} *
        Real.exp (n * (topologicalPressure T φ).toReal - birkhoffSum T φ n x) ≤ K

/-- The Bowen property of a potential: bounded variation of Birkhoff sums on closed Bowen balls of
some fixed radius (ClassicalErgodicTheory §8.4). -/
def HasBowenProperty (T : X → X) (φ : X → ℝ) : Prop :=
  ∃ ε > 0, ∃ K : ℝ, ∀ (n : ℕ) (x y : X), (∀ k < n, dist (T^[k] x) (T^[k] y) ≤ ε) →
    |birkhoffSum T φ n x - birkhoffSum T φ n y| ≤ K

/-- Bowen–Walters expansivity of a continuous flow (ClassicalErgodicTheory §8.5). -/
def IsExpansiveFlow (ϕ : Flow ℝ X) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ (x y : X) (s : ℝ → ℝ), Continuous s → s 0 = 0 →
    (∀ t, dist (ϕ t x) (ϕ (s t) y) < δ) → ∃ u : ℝ, |u| < ε ∧ y = ϕ u x

/-- The Bowen property of a potential for a flow: bounded variation of the orbit integrals over
`[0, t]`, `t ≥ 0`, on closed flow Bowen balls of some fixed radius (ClassicalErgodicTheory §8.5). -/
def HasFlowBowenProperty (ϕ : Flow ℝ X) (F : X → ℝ) : Prop :=
  ∃ ε > 0, ∃ K : ℝ, ∀ (t : ℝ) (x y : X), 0 ≤ t →
    (∀ s ∈ Icc 0 t, dist (ϕ s x) (ϕ s y) ≤ ε) →
      |(∫ s in (0 : ℝ)..t, F (ϕ s x)) - ∫ s in (0 : ℝ)..t, F (ϕ s y)| ≤ K

end MetricNotions

/-! ## Layer 2: Mixing and weak specification -/

section WeakSpecification

variable {X : Type*} [PseudoMetricSpace X]

/-- Weak specification of a homeomorphism (README §2.2): for every `δ > 0` there is a bound `τ` on
the gluing times such that every finite list of orbit segments `(x j, n j)` is `δ`-shadowed by one
orbit, the `j`-th segment being followed from time `∑_(l < j) (n l + g l)` with gluing times
`g l ≤ τ`. -/
def HasWeakSpecification (T : X ≃ₜ X) : Prop :=
  ∀ δ > 0, ∃ τ : ℕ, ∀ (k : ℕ) (x : Fin k → X) (n : Fin k → ℕ), ∃ (y : X) (g : Fin k → ℕ),
    (∀ j, g j ≤ τ) ∧ ∀ j : Fin k, ∀ i < n j,
      dist (T^[(∑ l ∈ Finset.Iio j, (n l + g l)) + i] y) (T^[i] (x j)) < δ

/-- Weak specification of a continuous flow (README §2.2): real segment lengths and real gluing times
in `[0, τ]`. -/
def HasFlowWeakSpecification (ϕ : Flow ℝ X) : Prop :=
  ∀ δ > 0, ∃ τ : ℝ, ∀ (k : ℕ) (x : Fin k → X) (n : Fin k → ℝ), (∀ j, 0 ≤ n j) →
    ∃ (y : X) (g : Fin k → ℝ), (∀ j, g j ∈ Icc 0 τ) ∧ ∀ j : Fin k, ∀ s ∈ Icc 0 (n j),
      dist (ϕ ((∑ l ∈ Finset.Iio j, (n l + g l)) + s) y) (ϕ s (x j)) < δ

end WeakSpecification

/-! ## Layer 3: Measure entropy of expansive flows -/

/-- Upper semicontinuity of entropy for expansive flows (README §3.1): for a Bowen–Walters
expansive flow of a compact metric space, `ν ↦ h_ν(g¹)` is upper semicontinuous on the
probabilities invariant under the time-one map. -/
theorem upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow {X : Type*} [MetricSpace X]
    [CompactSpace X] [MeasurableSpace X] [BorelSpace X] (ϕ : Flow ℝ X) (hϕ : IsExpansiveFlow ϕ) :
    UpperSemicontinuousOn (fun ν : ProbabilityMeasure X => measureEntropy (ν : Measure X) (ϕ 1))
      (invariantProbabilities (ϕ 1)) := by
  sorry

/-! ## Layer 5: Bowen's uniqueness criterion under weak specification -/

section LowerGibbs

variable {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]

/-- The lower Gibbs property of a flow-invariant probability at scale `ε` (README §5.1): a constant
`K ≥ 1` with `ν (B_t(x, ε)) exp (t P_g(F) − ∫_0^t F (g^s x) ds) ≥ K⁻¹` for all `x` and `t ≥ 0`. -/
def HasLowerGibbsProperty (ϕ : Flow ℝ X) (F : C(X, ℝ)) (ν : ProbabilityMeasure X) (ε : ℝ) :
    Prop :=
  ν ∈ flowInvariantProbabilities ϕ ∧ ∃ K ≥ (1 : ℝ), ∀ (x : X) (t : ℝ), 0 ≤ t →
    K⁻¹ ≤ (ν : Measure X).real {y | ∀ s ∈ Icc 0 t, dist (ϕ s x) (ϕ s y) < ε} *
      Real.exp (t * (flowTopologicalPressure ϕ F).toReal - ∫ s in (0 : ℝ)..t, F (ϕ s x))

end LowerGibbs

section Criterion

variable {X : Type*} [MetricSpace X] [CompactSpace X] [Nonempty X] [MeasurableSpace X]
  [BorelSpace X]

/-- Bowen's theorem under weak specification (README §5.2; Climenhaga–Thompson, Theorem 5.5): for
an expansive homeomorphism of a nonempty compact metric space with weak specification, a
continuous potential with the Bowen property has exactly one equilibrium state, which is ergodic,
positive on nonempty open sets and a Gibbs measure. -/
theorem existsUnique_isEquilibriumState_of_hasWeakSpecification (T : X ≃ₜ X)
    (hexp : ∃ δ > 0, ∀ x y : X, x ≠ y → ∃ n : ℤ, δ < dist ((T ^ n) x) ((T ^ n) y))
    (hspec : HasWeakSpecification T) (φ : C(X, ℝ)) (hφ : HasBowenProperty T φ) :
    ∃ ν : ProbabilityMeasure X, (∀ ν', IsEquilibriumState T φ ν' ↔ ν' = ν) ∧
      Ergodic T (ν : Measure X) ∧ (∀ U : Set X, IsOpen U → U.Nonempty → 0 < ν U) ∧
      IsGibbsMeasure T φ ν := by
  sorry

/-- Bowen's criterion for flows under weak specification (README §5.3; Climenhaga–Thompson,
Theorem A): for a Bowen–Walters expansive flow of a nonempty compact metric space with weak
specification, a continuous potential with the flow Bowen property has exactly one equilibrium
state, which is flow-ergodic, positive on nonempty open sets and lower Gibbs at every scale. -/
theorem existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification (ϕ : Flow ℝ X)
    (hexp : IsExpansiveFlow ϕ) (hspec : HasFlowWeakSpecification ϕ) (F : C(X, ℝ))
    (hF : HasFlowBowenProperty ϕ F) :
    ∃ ν : ProbabilityMeasure X, (∀ ν', IsFlowEquilibriumState ϕ F ν' ↔ ν' = ν) ∧
      @ErgodicVAdd ℝ X ϕ.toAddAction.toVAdd _ (ν : Measure X) ∧
      (∀ U : Set X, IsOpen U → U.Nonempty → 0 < ν U) ∧
      ∀ ε > 0, HasLowerGibbsProperty ϕ F ν ε := by
  sorry

end Criterion

/-! ## Layer 6: Abstract hyperbolic dynamics -/

section AbstractHyperbolic

variable {X : Type*} [PseudoMetricSpace X]

/-- Hyperbolic local product structure of a homeomorphism (README §6.1): (A2) for every `δ > 0` an
`e > 0` such that the local stable set `W^s_δ(x)` and the local unstable set `W^u_δ(z)` meet
whenever `d(x, z) < e`, and (A3) constants `δ* > 0`, `c ≥ 1` and `0 < ρ < 1` with
`d(fⁿx, fⁿy) ≤ c ρⁿ d(x, y)` on `W^s_δ*(x)` and `d(f⁻ⁿx, f⁻ⁿy) ≤ c ρⁿ d(x, y)` on `W^u_δ*(x)`. -/
def HasHyperbolicLocalProductStructure (f : X ≃ₜ X) : Prop :=
  (∀ δ > 0, ∃ e > 0, ∀ x z : X, dist x z < e → ∃ y : X,
      (∀ n : ℕ, dist (f^[n] x) (f^[n] y) ≤ δ) ∧ ∀ n : ℕ, dist (f.symm^[n] z) (f.symm^[n] y) ≤ δ) ∧
    ∃ δ > 0, ∃ c ≥ (1 : ℝ), ∃ ρ ∈ Ioo (0 : ℝ) 1, ∀ x y : X,
      ((∀ n : ℕ, dist (f^[n] x) (f^[n] y) ≤ δ) →
        ∀ n : ℕ, dist (f^[n] x) (f^[n] y) ≤ c * ρ ^ n * dist x y) ∧
      ((∀ n : ℕ, dist (f.symm^[n] x) (f.symm^[n] y) ≤ δ) →
        ∀ n : ℕ, dist (f.symm^[n] x) (f.symm^[n] y) ≤ c * ρ ^ n * dist x y)

/-- Hyperbolic local product structure of a continuous flow (README §6.5): no fixed points; (F2) a
`δ₀ > 0` such that for every `δ ∈ (0, δ₀]` there is `e > 0` for which `d(x, z) < e` gives a unique
time shift `v ∈ [-δ, δ]` with the local strong stable set `W^s_δ(g^v x)` meeting the local strong
unstable set `W^u_δ(z)`; and (F3) uniform exponential contraction on the strong sets of radius
`δ*`, forward on `W^s` and backward on `W^u`. -/
def HasFlowHyperbolicLocalProductStructure (ϕ : Flow ℝ X) : Prop :=
  (∀ x : X, ∃ t : ℝ, ϕ t x ≠ x) ∧
    (∃ δ₀ > 0, ∀ δ ∈ Ioc 0 δ₀, ∃ e > 0, ∀ x z : X, dist x z < e →
      ∃! v : ℝ, v ∈ Icc (-δ) δ ∧ ∃ y : X,
        ((∀ t ≥ (0 : ℝ), dist (ϕ t (ϕ v x)) (ϕ t y) ≤ δ) ∧
          Tendsto (fun t => dist (ϕ t (ϕ v x)) (ϕ t y)) atTop (𝓝 0)) ∧
        ((∀ t ≥ (0 : ℝ), dist (ϕ (-t) z) (ϕ (-t) y) ≤ δ) ∧
          Tendsto (fun t => dist (ϕ (-t) z) (ϕ (-t) y)) atTop (𝓝 0))) ∧
    ∃ δ > 0, ∃ c ≥ (1 : ℝ), ∃ κ > (0 : ℝ), ∀ x y : X,
      ((∀ t ≥ (0 : ℝ), dist (ϕ t x) (ϕ t y) ≤ δ) →
        Tendsto (fun t => dist (ϕ t x) (ϕ t y)) atTop (𝓝 0) →
        ∀ t ≥ (0 : ℝ), dist (ϕ t x) (ϕ t y) ≤ c * Real.exp (-(κ * t)) * dist x y) ∧
      ((∀ t ≥ (0 : ℝ), dist (ϕ (-t) x) (ϕ (-t) y) ≤ δ) →
        Tendsto (fun t => dist (ϕ (-t) x) (ϕ (-t) y)) atTop (𝓝 0) →
        ∀ t ≥ (0 : ℝ), dist (ϕ (-t) x) (ϕ (-t) y) ≤ c * Real.exp (-(κ * t)) * dist x y)

end AbstractHyperbolic

section AbstractUniqueness

variable {X : Type*} [MetricSpace X] [CompactSpace X] [Nonempty X] [MeasurableSpace X]
  [BorelSpace X]

/-- Unique equilibrium states for transitive homeomorphisms with hyperbolic local product
structure (README §6.8(a)): for a homeomorphism of a nonempty compact metric space with hyperbolic
local product structure that is transitive in forward time, a Hölder potential has exactly one
equilibrium state, which is ergodic, positive on nonempty open sets and a Gibbs measure; and the
topological entropy is positive unless the space is finite. -/
theorem existsUnique_isEquilibriumState_of_hasHyperbolicLocalProductStructure (f : X ≃ₜ X)
    (hf : HasHyperbolicLocalProductStructure f)
    (htrans : ∀ U V : Set X, IsOpen U → IsOpen V → U.Nonempty → V.Nonempty →
      ∃ n : ℕ, (f^[n] '' U ∩ V).Nonempty)
    (φ : C(X, ℝ)) {C r : ℝ≥0} (hr : 0 < r) (hφ : HolderWith C r φ) :
    (∃ ν : ProbabilityMeasure X, (∀ ν', IsEquilibriumState f φ ν' ↔ ν' = ν) ∧
      Ergodic f (ν : Measure X) ∧ (∀ U : Set X, IsOpen U → U.Nonempty → 0 < ν U) ∧
      IsGibbsMeasure f φ ν) ∧
    (Finite X ∨ 0 < Dynamics.coverEntropy f univ) := by
  sorry

/-- Unique equilibrium states for transitive flows with hyperbolic local product structure
(README §6.8(b)): for a continuous flow of a nonempty compact metric space with hyperbolic local
product structure that is transitive in forward time, a Hölder potential has exactly one
equilibrium state, which is flow-ergodic, positive on nonempty open sets and lower Gibbs at every
scale. -/
theorem existsUnique_isFlowEquilibriumState_of_hasFlowHyperbolicLocalProductStructure
    (ϕ : Flow ℝ X) (hϕ : HasFlowHyperbolicLocalProductStructure ϕ)
    (htrans : ∀ U V : Set X, IsOpen U → IsOpen V → U.Nonempty → V.Nonempty →
      ∃ t ≥ (0 : ℝ), (ϕ t '' U ∩ V).Nonempty)
    (F : C(X, ℝ)) {C r : ℝ≥0} (hr : 0 < r) (hF : HolderWith C r F) :
    ∃ ν : ProbabilityMeasure X, (∀ ν', IsFlowEquilibriumState ϕ F ν' ↔ ν' = ν) ∧
      @ErgodicVAdd ℝ X ϕ.toAddAction.toVAdd _ (ν : Measure X) ∧
      (∀ U : Set X, IsOpen U → U.Nonempty → 0 < ν U) ∧
      ∀ ε > 0, HasLowerGibbsProperty ϕ F ν ε := by
  sorry

end AbstractUniqueness

/-! ## Layer 7: Hyperbolic sets and their linear theory -/

section HyperbolicSets

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

/-- A hyperbolic set of a `C¹` diffeomorphism for the norms of a Riemannian metric (README §7.1): a
compact set with `f(Λ) = Λ`, constants `C > 0` and `0 < ρ < 1`, and at each `x ∈ Λ` complementary
subspaces `E^s_x`, `E^u_x` of `T_xM` carried by `Df_x` to those at `fx`, with
`|D(fⁿ)_x v| ≤ C ρⁿ |v|` on `E^s_x` and `|D(f⁻ⁿ)_x v| ≤ C ρⁿ |v|` on `E^u_x` for all `n ≥ 0`. The
splitting is not required to be continuous. -/
def IsHyperbolicSet
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (f : M ≃ₘ^1⟮I, I⟯ M) (Λ : Set M) : Prop :=
  IsCompact Λ ∧ ⇑f '' Λ = Λ ∧
    ∃ (C ρ : ℝ) (Es Eu : ∀ x : M, Submodule ℝ (TangentSpace I x)), 0 < C ∧ ρ ∈ Ioo 0 1 ∧
      ∀ x ∈ Λ, IsCompl (Es x) (Eu x) ∧
        (Es x).map (mfderiv I I f x).toLinearMap = Es (f x) ∧
          (Eu x).map (mfderiv I I f x).toLinearMap = Eu (f x) ∧
        ∀ n : ℕ, (∀ v ∈ Es x, ‖mfderiv I I (⇑f)^[n] x v‖ ≤ C * ρ ^ n * ‖v‖) ∧
          ∀ v ∈ Eu x, ‖mfderiv I I (⇑f.symm)^[n] x v‖ ≤ C * ρ ^ n * ‖v‖

/-- The generator `X(x)` of a flow on a manifold, the velocity of `t ↦ g^t x` at `t = 0`, as a
tangent vector at `x` (README Conventions). -/
def flowGenerator (ϕ : Flow ℝ M) (x : M) : TangentSpace I x :=
  mfderiv 𝓘(ℝ, ℝ) I (fun t : ℝ => ϕ t x) 0 1

/-- A hyperbolic set of a flow for the norms of a Riemannian metric (README §7.2): a compact
invariant set on which the generator does not vanish, constants `C > 0` and `κ > 0`, and at each
`x ∈ Λ` subspaces with `T_xM = E^s_x ⊕ ℝX(x) ⊕ E^u_x`, invariant under every `Dg^t`, with
`|Dg^t v| ≤ C e^(-κt) |v|` on `E^s_x` and `|Dg^(-t) v| ≤ C e^(-κt) |v|` on `E^u_x` for `t ≥ 0`. -/
def IsFlowHyperbolicSet
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (ϕ : Flow ℝ M) (Λ : Set M) : Prop :=
  IsCompact Λ ∧ IsInvariant ϕ Λ ∧ (∀ x ∈ Λ, flowGenerator I ϕ x ≠ 0) ∧
    ∃ (C κ : ℝ) (Es Eu : ∀ x : M, Submodule ℝ (TangentSpace I x)), 0 < C ∧ 0 < κ ∧
      ∀ x ∈ Λ, Disjoint (Es x) (Submodule.span ℝ {flowGenerator I ϕ x}) ∧
        IsCompl (Es x ⊔ Submodule.span ℝ {flowGenerator I ϕ x}) (Eu x) ∧
        ∀ t : ℝ, (Es x).map (mfderiv I I (ϕ t) x).toLinearMap = Es (ϕ t x) ∧
          (Eu x).map (mfderiv I I (ϕ t) x).toLinearMap = Eu (ϕ t x) ∧
          (0 ≤ t → (∀ v ∈ Es x, ‖mfderiv I I (ϕ t) x v‖ ≤ C * Real.exp (-(κ * t)) * ‖v‖) ∧
            ∀ v ∈ Eu x, ‖mfderiv I I (ϕ (-t)) x v‖ ≤ C * Real.exp (-(κ * t)) * ‖v‖)

end HyperbolicSets

/-! ## Layer 8: Invariant manifolds and local product structure -/

section HadamardPerron

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]

/-- The box `B^u(r₀) × B^s(r₀)` of the orthogonal sum `V = K ⊕ Kᗮ`, the points whose two components
have norm below `r₀` (README §8.1). -/
def hadamardPerronBox (K : Submodule ℝ V) (r₀ : ℝ) : Set V :=
  {z | ‖K.orthogonalProjectionOnto z‖ < r₀ ∧ ‖Kᗮ.orthogonalProjectionOnto z‖ < r₀}

/-- The graph `{x + φ x : x ∈ K, |x| < r₀}` in `V` of a map `φ : K → Kᗮ` over the ball of radius
`r₀` (README §8.1). -/
def hadamardPerronGraph (K : Submodule ℝ V) (r₀ : ℝ) (φ : K → Kᗮ) : Set V :=
  (fun x : K => (x : V) + (φ x : V)) '' Metric.ball 0 r₀

/-- The conclusions (i)–(iii) of the Hadamard–Perron theorem for a family `φ n` (README §8.1): each
`φ n` vanishes at `0`, is `C¹` on the ball of radius `r₀` with values in that ball of `Kᗮ` and has
derivative of norm below `γ`; (i) `f n` carries the `n`-th graph onto the `(n + 1)`-st inside the box; (ii) `f n`
expands distances on the `n`-th graph by more than `μ'`; and (iii) every point with a backward
sequence in the box shrinking faster than `C ν^(-L)`, `ρ' < ν < μ'`, lies on the graph. -/
def IsHadamardPerronFamily (K : Submodule ℝ V) (r₀ γ ρ' μ' : ℝ) (f : ℤ → V → V)
    (φ : ℤ → K → Kᗮ) : Prop :=
  (∀ n, φ n 0 = 0 ∧ ContDiffOn ℝ 1 (fun x : K => (φ n x : V)) (Metric.ball 0 r₀) ∧
      MapsTo (φ n) (Metric.ball 0 r₀) (Metric.ball 0 r₀) ∧
      ∀ x ∈ Metric.ball (0 : K) r₀, ‖fderiv ℝ (fun x : K => (φ n x : V)) x‖ < γ) ∧
    (∀ n, f n '' hadamardPerronGraph K r₀ (φ n) ∩ hadamardPerronBox K r₀ =
      hadamardPerronGraph K r₀ (φ (n + 1))) ∧
    (∀ n, ∀ y ∈ hadamardPerronGraph K r₀ (φ n), ∀ z ∈ hadamardPerronGraph K r₀ (φ n), y ≠ z →
      μ' * ‖y - z‖ < ‖f n y - f n z‖) ∧
    ∀ (n : ℤ) (z : V) (zs : ℕ → V) (C ν : ℝ), 0 < C → ρ' < ν → ν < μ' → zs 0 = z →
      (∀ L, zs L ∈ hadamardPerronBox K r₀) → (∀ L : ℕ, f (n - (L + 1)) (zs (L + 1)) = zs L) →
      (∀ L : ℕ, ‖zs L‖ < C * ν⁻¹ ^ L * ‖z‖) → z ∈ hadamardPerronGraph K r₀ (φ n)

/-- The uniform Hadamard–Perron theorem (README §8.1; Climenhaga–Pesin, Theorem 11.1): for maps
`f n = (A n + g n, B n + h n)` of the box of `V = K ⊕ Kᗮ` fixing `0`, with `|A n x| ≥ μ |x|`,
`|B n| ≤ ρ`, `max 1 ρ < μ` and nonlinear parts of `C¹` norm below `δ`, there is exactly one family
of graphs through `0` with the conclusions (i)–(iii), for `ρ' = ρ + (1 + γ⁻¹) δ` and
`μ' = (μ - (1 + γ) δ) / (1 + γ)`, which satisfy `max 1 ρ' < μ'`; and (iv) the unstable cones
`|Δy| ≤ γ |Δx|` are invariant, the `K`-component of differences being expanded by at least
`μ - (1 + γ) δ > 1`. -/
theorem exists_isHadamardPerronFamily (K : Submodule ℝ V) {μ ρ r₀ : ℝ} (hμ : max 1 ρ < μ)
    (hr₀ : 0 < r₀) :
    ∃ γ₀ > 0, ∀ γ ∈ Ioo 0 γ₀, ∃ δ₀ > 0, ∀ δ ∈ Ioo 0 δ₀,
      ∀ (f : ℤ → V → V) (A : ℤ → K →L[ℝ] K) (B : ℤ → Kᗮ →L[ℝ] Kᗮ),
      (∀ n (x : K), μ * ‖x‖ ≤ ‖A n x‖) → (∀ n, ‖B n‖ ≤ ρ) → (∀ n, f n 0 = 0) →
      (∀ n, ContDiffOn ℝ 1 (f n) (hadamardPerronBox K r₀)) →
      (∀ n, ∀ z ∈ hadamardPerronBox K r₀,
        ‖K.orthogonalProjectionOnto (f n z) - A n (K.orthogonalProjectionOnto z)‖ < δ ∧
        ‖Kᗮ.orthogonalProjectionOnto (f n z) - B n (Kᗮ.orthogonalProjectionOnto z)‖ < δ ∧
        ‖K.orthogonalProjectionOnto.comp (fderiv ℝ (f n) z) -
            (A n).comp K.orthogonalProjectionOnto‖ < δ ∧
        ‖Kᗮ.orthogonalProjectionOnto.comp (fderiv ℝ (f n) z) -
            (B n).comp Kᗮ.orthogonalProjectionOnto‖ < δ) →
      (∃ φ : ℤ → K → Kᗮ,
        IsHadamardPerronFamily K r₀ γ (ρ + (1 + γ⁻¹) * δ) ((μ - (1 + γ) * δ) / (1 + γ)) f φ ∧
        ∀ φ' : ℤ → K → Kᗮ,
          IsHadamardPerronFamily K r₀ γ (ρ + (1 + γ⁻¹) * δ) ((μ - (1 + γ) * δ) / (1 + γ)) f φ' →
          ∀ n, EqOn (φ' n) (φ n) (Metric.ball 0 r₀)) ∧
      max 1 (ρ + (1 + γ⁻¹) * δ) < (μ - (1 + γ) * δ) / (1 + γ) ∧
      ∀ n, ∀ z ∈ hadamardPerronBox K r₀, ∀ z' ∈ hadamardPerronBox K r₀,
        ‖Kᗮ.orthogonalProjectionOnto (z - z')‖ ≤ γ * ‖K.orthogonalProjectionOnto (z - z')‖ →
        ‖Kᗮ.orthogonalProjectionOnto (f n z - f n z')‖ ≤
            γ * ‖K.orthogonalProjectionOnto (f n z - f n z')‖ ∧
          (μ - (1 + γ) * δ) * ‖K.orthogonalProjectionOnto (z - z')‖ ≤
            ‖K.orthogonalProjectionOnto (f n z - f n z')‖ := by
  sorry

end HadamardPerron

section LocalMaximality

variable {X : Type*} [TopologicalSpace X]

/-- Local maximality of a set for a homeomorphism (README §8.4): an open `U ⊇ Λ`, an isolating
neighbourhood, such that every point whose whole orbit lies in `U` lies in `Λ`; for `Λ` with
`f(Λ) = Λ` this says `Λ = ⋂_(n ∈ ℤ) fⁿ(U)`. -/
def IsLocallyMaximal (f : X ≃ₜ X) (Λ : Set X) : Prop :=
  ∃ U : Set X, IsOpen U ∧ Λ ⊆ U ∧ ∀ x, (∀ n : ℕ, f^[n] x ∈ U ∧ f.symm^[n] x ∈ U) → x ∈ Λ

/-- Local maximality of a set for a flow (README §8.5): an open `U ⊇ Λ` such that every point whose
whole orbit lies in `U` lies in `Λ`. -/
def IsFlowLocallyMaximal (ϕ : Flow ℝ X) (Λ : Set X) : Prop :=
  ∃ U : Set X, IsOpen U ∧ Λ ⊆ U ∧ ∀ x, (∀ t : ℝ, ϕ t x ∈ U) → x ∈ Λ

end LocalMaximality

section LocalProduct

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless]
  [SigmaCompactSpace M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

/-- Local product structure of locally maximal hyperbolic sets of diffeomorphisms (README §8.4):
for the truncated Riemannian distance `min 1 ρ`, a `C¹` diffeomorphism restricted to a locally
maximal hyperbolic set has hyperbolic local product structure. -/
theorem hasHyperbolicLocalProductStructure_of_isLocallyMaximal
    (hd : ∀ x y : M, edist x y = min 1 (riemannianEDist I x y))
    (f : M ≃ₘ^1⟮I, I⟯ M) {Λ : Set M} (hΛ : IsHyperbolicSet I f Λ)
    (hmax : IsLocallyMaximal f.toHomeomorph Λ) (hinv : ∀ x, x ∈ Λ ↔ f x ∈ Λ) :
    HasHyperbolicLocalProductStructure
      (f.toHomeomorph.subtype (p := (· ∈ Λ)) (q := (· ∈ Λ)) hinv) := by
  sorry

/-- Local product structure of locally maximal hyperbolic sets of flows (README §8.5): for the
truncated Riemannian distance, a `C¹` flow restricted to a locally maximal hyperbolic set has
hyperbolic local product structure. -/
theorem hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal
    (hd : ∀ x y : M, edist x y = min 1 (riemannianEDist I x y))
    (ϕ : Flow ℝ M) (hϕ : ContMDiff (𝓘(ℝ, ℝ).prod I) I 1 (fun p : ℝ × M => ϕ p.1 p.2))
    {Λ : Set M} (hΛ : IsFlowHyperbolicSet I ϕ Λ) (hmax : IsFlowLocallyMaximal ϕ Λ)
    (hinv : IsInvariant ϕ Λ) :
    HasFlowHyperbolicLocalProductStructure (ϕ.restrict hinv) := by
  sorry

end LocalProduct

/-! ## Layer 10: Basic sets and the Bowen–Ruelle theorem -/

section BasicSets

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

/-- A basic set of a `C¹` diffeomorphism (README §10.1): a nonempty locally maximal hyperbolic set
on which `f` is transitive in forward time (for relatively open nonempty `U ∩ Λ`, `V ∩ Λ` some
`n ≥ 0` has `fⁿ(U ∩ Λ)` meeting `V`). -/
def IsBasicSet
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (f : M ≃ₘ^1⟮I, I⟯ M) (Λ : Set M) : Prop :=
  Λ.Nonempty ∧ IsHyperbolicSet I f Λ ∧ IsLocallyMaximal f.toHomeomorph Λ ∧
    ∀ U V : Set M, IsOpen U → IsOpen V → (U ∩ Λ).Nonempty → (V ∩ Λ).Nonempty →
      ∃ n : ℕ, ∃ x ∈ U ∩ Λ, f^[n] x ∈ V

/-- A basic set of a flow (README §10.1): a nonempty locally maximal hyperbolic set on which the
flow is transitive in forward time. -/
def IsFlowBasicSet
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (ϕ : Flow ℝ M) (Λ : Set M) : Prop :=
  Λ.Nonempty ∧ IsFlowHyperbolicSet I ϕ Λ ∧ IsFlowLocallyMaximal ϕ Λ ∧
    ∀ U V : Set M, IsOpen U → IsOpen V → (U ∩ Λ).Nonempty → (V ∩ Λ).Nonempty →
      ∃ t ≥ (0 : ℝ), ∃ x ∈ U ∩ Λ, ϕ t x ∈ V

/-- An attractor of a flow (README §10.1): a basic set with an open neighbourhood `U` such that
`g^t(U) ⊆ U` for all `t ≥ T₀` and `Λ = ⋂_(t ≥ 0) g^t(U)`. -/
def IsFlowAttractor
    [FiniteDimensional ℝ E] [IsManifold I ∞ M] [I.Boundaryless]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (ϕ : Flow ℝ M) (Λ : Set M) : Prop :=
  IsFlowBasicSet I ϕ Λ ∧ ∃ U : Set M, IsOpen U ∧ Λ ⊆ U ∧ (∃ T₀ : ℝ, ∀ t ≥ T₀, ϕ t '' U ⊆ U) ∧
    Λ = ⋂ (t : ℝ) (_ : 0 ≤ t), ϕ t '' U

end BasicSets

section BowenRuelle

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless]
  [SigmaCompactSpace M] [MeasurableSpace M] [BorelSpace M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

/-- Bowen's theorem (README §10.2): on a basic set of a `C¹` diffeomorphism of a σ-compact manifold,
not necessarily compact, with the truncated Riemannian distance, a Hölder potential has exactly one
equilibrium state; it is ergodic, positive on nonempty relatively open sets and a Gibbs measure, and
it is also the equilibrium state of every `φ + c + ψ ∘ f - ψ`. -/
theorem existsUnique_isEquilibriumState_of_isBasicSet
    (hd : ∀ x y : M, edist x y = min 1 (riemannianEDist I x y))
    (f : M ≃ₘ^1⟮I, I⟯ M) {Λ : Set M} (hΛ : IsBasicSet I f Λ) (hmaps : MapsTo f Λ Λ)
    (φ : C(Λ, ℝ)) {C r : ℝ≥0} (hr : 0 < r) (hφ : HolderWith C r φ) :
    ∃ ν : ProbabilityMeasure Λ, (∀ ν', IsEquilibriumState (hmaps.restrict f Λ Λ) φ ν' ↔ ν' = ν) ∧
      Ergodic (hmaps.restrict f Λ Λ) (ν : Measure Λ) ∧
      (∀ U : Set Λ, IsOpen U → U.Nonempty → 0 < ν U) ∧
      IsGibbsMeasure (hmaps.restrict f Λ Λ) φ ν ∧
      ∀ (c : ℝ) (ψ φ' : C(Λ, ℝ)), (∀ x, φ' x = φ x + c + ψ (hmaps.restrict f Λ Λ x) - ψ x) →
        IsEquilibriumState (hmaps.restrict f Λ Λ) φ' ν := by
  sorry

/-- The Bowen–Ruelle theorem (README §10.3): on a basic set of a `C¹` flow of a σ-compact manifold,
not necessarily compact, a Hölder potential `F` has exactly one equilibrium state `ν`; it is
flow-ergodic, positive on nonempty relatively open sets and lower Gibbs at every scale; it is the
equilibrium state of
`F + c + L_gψ` for every `ψ` differentiable along the flow with continuous derivative `L_gψ`; for
every `t > 0` it is the only `g`-invariant equilibrium state of `F_t` for the time-`t` map; and it
is the equilibrium state of `a F` for the flow rescaled by `a > 0`. -/
theorem existsUnique_isFlowEquilibriumState_of_isFlowBasicSet
    (hd : ∀ x y : M, edist x y = min 1 (riemannianEDist I x y))
    (ϕ : Flow ℝ M) (hϕ : ContMDiff (𝓘(ℝ, ℝ).prod I) I 1 (fun p : ℝ × M => ϕ p.1 p.2))
    {Λ : Set M} (hΛ : IsFlowBasicSet I ϕ Λ) (hinv : IsInvariant ϕ Λ)
    (F : C(Λ, ℝ)) {C r : ℝ≥0} (hr : 0 < r) (hF : HolderWith C r F) :
    ∃ ν : ProbabilityMeasure Λ,
      (∀ ν', IsFlowEquilibriumState (ϕ.restrict hinv) F ν' ↔ ν' = ν) ∧
      @ErgodicVAdd ℝ Λ (ϕ.restrict hinv).toAddAction.toVAdd _ (ν : Measure Λ) ∧
      (∀ U : Set Λ, IsOpen U → U.Nonempty → 0 < ν U) ∧
      (∀ ε > 0, HasLowerGibbsProperty (ϕ.restrict hinv) F ν ε) ∧
      (∀ (c : ℝ) (ψ Lψ F' : C(Λ, ℝ)),
        (∀ x, HasDerivAt (fun t => ψ (ϕ.restrict hinv t x)) (Lψ x) 0) →
        (∀ x, F' x = F x + c + Lψ x) → IsFlowEquilibriumState (ϕ.restrict hinv) F' ν) ∧
      (∀ t > (0 : ℝ), ∀ Ft : C(Λ, ℝ), (∀ x, Ft x = ∫ s in (0 : ℝ)..t, F (ϕ.restrict hinv s x)) →
        ∀ ν' ∈ flowInvariantProbabilities (ϕ.restrict hinv),
          (IsEquilibriumState (ϕ.restrict hinv t) Ft ν' ↔ ν' = ν)) ∧
      ∀ a > (0 : ℝ), ∀ ψ : Flow ℝ Λ, (∀ t x, ψ t x = ϕ.restrict hinv (a * t) x) →
        IsFlowEquilibriumState ψ (a • F) ν := by
  sorry

end BowenRuelle

section PositiveEntropy

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless]
  [SigmaCompactSpace M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

/-- Positive entropy of basic sets of flows (README §10.4): the topological entropy of a basic set
of a `C¹` flow on a σ-compact manifold is positive unless the basic set is a single periodic orbit;
its unique measure of maximal entropy, the Bowen–Margulis measure, is the case `F = 0` of the
Bowen–Ruelle theorem. -/
theorem pos_coverEntropy_of_isFlowBasicSet
    (ϕ : Flow ℝ M) (hϕ : ContMDiff (𝓘(ℝ, ℝ).prod I) I 1 (fun p : ℝ × M => ϕ p.1 p.2))
    {Λ : Set M} (hΛ : IsFlowBasicSet I ϕ Λ) (hinv : IsInvariant ϕ Λ) :
    (∃ x ∈ Λ, ∃ p > (0 : ℝ), ϕ p x = x ∧ Λ = range fun t : ℝ => ϕ t x) ∨
      0 < Dynamics.coverEntropy (ϕ.restrict hinv 1) univ := by
  sorry

/-- Positive entropy of basic sets of diffeomorphisms (README §10.4): the topological entropy of a
basic set of a `C¹` diffeomorphism of a σ-compact manifold is positive unless the basic set is
finite; its unique measure of maximal entropy, Bowen's measure, is the case `φ = 0` of Bowen's
theorem. -/
theorem pos_coverEntropy_of_isBasicSet
    (f : M ≃ₘ^1⟮I, I⟯ M) {Λ : Set M} (hΛ : IsBasicSet I f Λ) (hmaps : MapsTo f Λ Λ) :
    Λ.Finite ∨ 0 < Dynamics.coverEntropy (hmaps.restrict f Λ Λ) univ := by
  sorry

end PositiveEntropy

/-- The endomorphism of the torus `ℝ^d / ℤ^d` induced by an integer matrix,
`(A x)ᵢ = ∑ⱼ Aᵢⱼ xⱼ` (ClassicalErgodicTheory §0.3). -/
def toralEndomorphism {d : ℕ} (A : Matrix (Fin d) (Fin d) ℤ) :
    UnitAddTorus (Fin d) → UnitAddTorus (Fin d) :=
  fun x i => ∑ j, A i j • x j

/-- Bowen's measure of a hyperbolic toral automorphism is Haar measure (README §10.4): for an
integer matrix with determinant `±1` and no complex eigenvalue of modulus `1`, Haar measure is the
unique measure of maximal entropy of the induced automorphism of the torus. -/
theorem isEquilibriumState_toralEndomorphism_zero_iff {d : ℕ} (A : Matrix (Fin d) (Fin d) ℤ)
    (hdet : IsUnit A.det) (hhyp : ∀ z ∈ (A.charpoly.map (Int.castRingHom ℂ)).roots, ‖z‖ ≠ 1)
    (ν : ProbabilityMeasure (UnitAddTorus (Fin d))) :
    IsEquilibriumState (toralEndomorphism A) 0 ν ↔
      (ν : Measure (UnitAddTorus (Fin d))) = volume := by
  sorry

/-! ## Layer 11: SRB measures of `C²` flows -/

section GeometricPotential

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]

/-- The unstable subspace at `x`, spanned by the tangent vectors contracted to `0` in backward time;
on a hyperbolic set of a flow it is `E^u_x` (README §§7.4, 11.1). -/
def flowUnstableSubspace (ϕ : Flow ℝ M) (x : M) : Submodule ℝ (TangentSpace I x) :=
  Submodule.span ℝ {v | Tendsto (fun t : ℝ => ‖mfderiv I I (ϕ (-t)) x v‖) atTop (𝓝 0)}

/-- The unstable Jacobian `λ_t(x) = |det (Dg^t : E^u_x → E^u_(g^t x))|` in orthonormal bases
(README §11.1), as the square root of the ratio of the Gram determinants of the image of a basis of
`E^u_x` and of that basis. -/
def unstableJacobian (ϕ : Flow ℝ M) (t : ℝ) (x : M) : ℝ :=
  Real.sqrt ((Matrix.gram ℝ fun i =>
      mfderiv I I (ϕ t) x (Module.finBasis ℝ (flowUnstableSubspace I ϕ x) i)).det /
    (Matrix.gram ℝ fun i =>
      ((Module.finBasis ℝ (flowUnstableSubspace I ϕ x) i : flowUnstableSubspace I ϕ x) :
        TangentSpace I x)).det)

/-- The geometric potential `φᵘ(x) = -(d/dt) log λ_t(x)` at `t = 0` (README §11.1). -/
def geometricPotential (ϕ : Flow ℝ M) (x : M) : ℝ :=
  -deriv (fun t : ℝ => Real.log (unstableJacobian I ϕ t x)) 0

end GeometricPotential

section SRB

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [I.Boundaryless]
  [CompactSpace M] [MeasurableSpace M] [BorelSpace M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]

/-- The SRB theorem (README §11.6; Bowen–Ruelle, Theorem 5.1): for an attractor of a `C²` flow
with `C²` generator on a compact manifold with a smooth Riemannian metric, the geometric potential
is continuous on the attractor, its equilibrium state `μ⁺` is unique, and for volume-almost every
point of the basin the time averages of every continuous function converge to its `μ⁺`-integral. -/
theorem srb_of_isFlowAttractor
    (hd : ∀ x y : M, edist x y = min 1 (riemannianEDist I x y))
    (ϕ : Flow ℝ M) (hϕ : ContMDiff (𝓘(ℝ, ℝ).prod I) I 2 (fun p : ℝ × M => ϕ p.1 p.2))
    (hX : ContMDiff I I.tangent 2 (fun x => (⟨x, flowGenerator I ϕ x⟩ : TangentBundle I M)))
    {Λ : Set M} (hΛ : IsFlowAttractor I ϕ Λ) (hinv : IsInvariant ϕ Λ) :
    ∃ (Φ : C(Λ, ℝ)) (μ : ProbabilityMeasure Λ), (∀ x : Λ, Φ x = geometricPotential I ϕ x) ∧
      (∀ ν', IsFlowEquilibriumState (ϕ.restrict hinv) Φ ν' ↔ ν' = μ) ∧
      ∀ᵐ x ∂(TauCeti.riemannianVolume I M),
        Tendsto (fun t : ℝ => Metric.infDist (ϕ t x) Λ) atTop (𝓝 0) →
        ∀ u : C(M, ℝ), Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T, u (ϕ t x)) atTop
          (𝓝 (∫ y, u y ∂(μ : Measure Λ))) := by
  sorry

/-- The SRB measure of a transitive Anosov flow (README §11.6; Bowen–Ruelle, Remark 5.2): for a
transitive Anosov flow with `C²` generator on a nonempty compact manifold with a smooth Riemannian
metric, the equilibrium state `μ⁺` of the geometric potential is unique, volume-almost every point
is generic for it, and every flow-invariant probability absolutely continuous with respect to volume
equals it. -/
theorem srb_of_isFlowBasicSet_univ
    (hd : ∀ x y : M, edist x y = min 1 (riemannianEDist I x y))
    (ϕ : Flow ℝ M) (hϕ : ContMDiff (𝓘(ℝ, ℝ).prod I) I 2 (fun p : ℝ × M => ϕ p.1 p.2))
    (hX : ContMDiff I I.tangent 2 (fun x => (⟨x, flowGenerator I ϕ x⟩ : TangentBundle I M)))
    (hΛ : IsFlowBasicSet I ϕ univ) :
    ∃ (Φ : C(M, ℝ)) (μ : ProbabilityMeasure M), (∀ x, Φ x = geometricPotential I ϕ x) ∧
      (∀ ν', IsFlowEquilibriumState ϕ Φ ν' ↔ ν' = μ) ∧
      (∀ᵐ x ∂(TauCeti.riemannianVolume I M), ∀ u : C(M, ℝ),
        Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T, u (ϕ t x)) atTop
          (𝓝 (∫ y, u y ∂(μ : Measure M)))) ∧
      ∀ ν ∈ flowInvariantProbabilities ϕ,
        (ν : Measure M) ≪ TauCeti.riemannianVolume I M → ν = μ := by
  sorry

end SRB

end TauCetiRoadmap.HyperbolicDynamicsAndThermodynamicFormalism
