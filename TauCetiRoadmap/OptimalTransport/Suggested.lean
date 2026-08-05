import Mathlib

/-!
# Optimal transport and Wasserstein geometry: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The first compiled targets cover the common spine (Layers 0--3), the Monge problem
(Layer 4), the map-facing form of Brenier (Layer 5), the ambient Fréchet-barycenter
definitions (Layer 12), and a finite Sinkhorn theorem (Layer 13). The roadmap requires much
more: general and Borel-cost duality,
Monge--Ampère/Ma--Trudinger--Wang (MTW) regularity, Riemannian and nonsmooth McCann theory,
dynamic plans and Benamou--Brenier, metric and Wasserstein gradient flows/Jordan--
Kinderlehrer--Otto (JKO), population barycenters, measurable iterative proportional
fitting (IPFP) and Schrödinger bridges, curvature-dimension (CD) and Riemannian
curvature-dimension (RCD) theory, and measured-kernel Gromov--Wasserstein.

As those prerequisites become expressible, add their representative signatures here.
Use Mathlib's `ProbabilityMeasure`, `ProbabilityTheory.HasLaw`,
`InformationTheory.klDiv`, `MemLp`, `eLpNorm`, and extended exponent `p : ℝ≥0∞`;
do not create private synonyms. The eventual implementation belongs in coordinated
Mathlib/Tau Ceti namespaces, after reconciling the Vlasov and Econlib prior work described
in `README.md`.
-/

noncomputable section

open scoped BigOperators ENNReal NNReal
open MeasureTheory Topology

namespace TauCetiRoadmap.OptimalTransport

universe u v w

variable {X : Type u} {Y : Type v} {Z : Type w}

/-! ## Layer 0: transport plans, maps, and gluing -/

namespace Measure

/-- A measure on `X × Y` whose first and second marginals are `μ` and `ν`. -/
structure IsCoupling [MeasurableSpace X] [MeasurableSpace Y]
    (π : Measure (X × Y)) (μ : Measure X) (ν : Measure Y) : Prop where
  fst_eq : π.fst = μ
  snd_eq : π.snd = ν

end Measure

/-- Probability measures on `X × Y` whose marginals are `μ` and `ν`. -/
abbrev Coupling [MeasurableSpace X] [MeasurableSpace Y]
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :=
  {π : ProbabilityMeasure (X × Y) //
    Measure.IsCoupling π.toMeasure μ.toMeasure ν.toMeasure}

/-- Finite measures of equal mass admit a coupling, including when both have zero mass. -/
theorem exists_coupling_of_isFiniteMeasure [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (hmass : μ Set.univ = ν Set.univ) :
    ∃ π : Measure (X × Y), Measure.IsCoupling π μ ν := by
  sorry

/-- The type of probability couplings of any two probability measures is nonempty. -/
theorem coupling_nonempty [MeasurableSpace X] [MeasurableSpace Y]
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :
    Nonempty (Coupling μ ν) := by
  sorry

/-- If `Z` is standard Borel, couplings of `(μ,ν)` and `(ν,ρ)` are the two pair
marginals of a probability measure on `X × (Y × Z)`. -/
theorem exists_gluing [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]
    [StandardBorelSpace Z]
    {μ : ProbabilityMeasure X} {ν : ProbabilityMeasure Y} {ρ : ProbabilityMeasure Z}
    (πXY : Coupling μ ν) (πYZ : Coupling ν ρ) :
    ∃ γ : ProbabilityMeasure (X × (Y × Z)),
      Measure.map (fun z => (z.1, z.2.1)) γ.toMeasure = πXY.1.toMeasure ∧
      Measure.map (fun z => (z.2.1, z.2.2)) γ.toMeasure = πYZ.1.toMeasure := by
  sorry

/-! ## Layer 1: transport cost and primal attainment -/

/-- The infimum of `∫⁻ c dπ` over raw-measure couplings of `μ` and `ν`. -/
def transportCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) : ℝ≥0∞ :=
  ⨅ π : Measure (X × Y), ⨅ _hπ : Measure.IsCoupling π μ ν, ∫⁻ z, c z ∂π

/-- A probability coupling whose `c`-cost equals the Kantorovich value. -/
def IsOptimalCoupling [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y)
    (π : Coupling μ ν) : Prop :=
  (∫⁻ z, c z ∂π.1.toMeasure) = transportCost c μ.toMeasure ν.toMeasure

/-- A lower-semicontinuous nonnegative extended cost on two Polish spaces admits an
optimal probability coupling. -/
theorem exists_isOptimalCoupling
    [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    [PseudoMetricSpace Y] [MeasurableSpace Y] [BorelSpace Y] [PolishSpace Y]
    (c : X × Y → ℝ≥0∞) (hc : LowerSemicontinuous c)
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :
    ∃ π : Coupling μ ν, IsOptimalCoupling c μ ν π := by
  sorry

/-! ## Layer 2: Kantorovich duality and optimality certificates -/

/-- Kantorovich dual feasibility with convention `φ x + ψ y ≤ c (x,y)`. -/
def DualFeasible (c : X × Y → ℝ) (φ : X → ℝ) (ψ : Y → ℝ) : Prop :=
  ∀ x y, φ x + ψ y ≤ c (x, y)

/-- A set is `c`-cyclically monotone when every finite reassignment of its second
coordinates has at least the original total cost. -/
def IsCCyclicallyMonotone (c : X × Y → ℝ) (Γ : Set (X × Y)) : Prop :=
  ∀ (n : ℕ) (z : Fin n → X × Y) (σ : Equiv.Perm (Fin n)),
    (∀ i, z i ∈ Γ) →
      (∑ i, c (z i)) ≤ ∑ i, c ((z i).1, (z (σ i)).2)

/-- The contact set of a dual-feasible pair is `c`-cyclically monotone. -/
theorem DualFeasible.isCCyclicallyMonotone_contact
    {c : X × Y → ℝ} {φ : X → ℝ} {ψ : Y → ℝ} (h : DualFeasible c φ ψ) :
    IsCCyclicallyMonotone c {z | φ z.1 + ψ z.2 = c z} := by
  sorry

/-! ## Layer 3: Wasserstein distance and finite-distance components -/

/-- A probability measure has finite `p`-moment if its real-valued distance from some
basepoint belongs to `Lᵖ`. -/
def HasFiniteMoment [MeasurableSpace X] [PseudoMetricSpace X]
    (p : ℝ≥0∞) (μ : ProbabilityMeasure X) : Prop :=
  ∃ x₀ : X, MemLp (fun x => dist x x₀) p μ.toMeasure

/-- Probability measures on a pseudometric space with finite `p`-moment. -/
def WassersteinSpace (p : ℝ≥0∞) (X : Type u)
    [MeasurableSpace X] [PseudoMetricSpace X] :=
  {μ : ProbabilityMeasure X // HasFiniteMoment p μ}

/-- The infimum, over couplings of `μ` and `ν`, of the `Lᵖ` norm of the ground extended
distance. -/
def wassersteinEDist [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (μ ν : ProbabilityMeasure X) : ℝ≥0∞ :=
  ⨅ π : Coupling μ ν,
    eLpNorm (fun z : X × X => edist z.1 z.2) p π.1.toMeasure

/-- Probability measures at finite `p`-Wasserstein extended distance from `μ₀`. -/
def WassersteinComponent [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (μ₀ : ProbabilityMeasure X) :=
  {μ : ProbabilityMeasure X // wassersteinEDist p μ₀ μ ≠ ∞}

/-- On a standard Borel extended pseudometric space with measurable ground distance,
`wassersteinEDist p` satisfies the triangle inequality when `1 ≤ p`. -/
theorem wassersteinEDist_triangle
    [PseudoEMetricSpace X] [MeasurableSpace X] [StandardBorelSpace X]
    (hedist : Measurable fun z : X × X => edist z.1 z.2)
    (p : ℝ≥0∞) (hp : 1 ≤ p) (μ ν ρ : ProbabilityMeasure X) :
    wassersteinEDist p μ ρ ≤ wassersteinEDist p μ ν + wassersteinEDist p ν ρ := by
  sorry

/-- At exponent `∞`, Wasserstein extended distance is the infimum of the coupling-wise
essential suprema of the ground distance. -/
theorem wassersteinEDist_top [MeasurableSpace X] [PseudoEMetricSpace X]
    (μ ν : ProbabilityMeasure X) :
    wassersteinEDist ∞ μ ν =
      ⨅ π : Coupling μ ν,
        eLpNormEssSup (fun z : X × X => edist z.1 z.2) π.1.toMeasure := by
  sorry

/-! ## Layer 4: the Monge problem and abstract transport maps -/

/-- The extended cost of a deterministic map under the source measure `μ`. -/
def transportMapCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (T : X → Y) : ℝ≥0∞ :=
  ∫⁻ x, c (x, T x) ∂μ

/-- The infimum of deterministic transport cost over maps with target law `ν` under `μ`. -/
def mongeCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) : ℝ≥0∞ :=
  ⨅ T : X → Y, ⨅ _hT : ProbabilityTheory.HasLaw T ν μ, transportMapCost c μ T

/-- A map with target law `ν` under `μ` whose cost equals the Monge value. -/
def IsMongeMinimizer [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) (T : X → Y) : Prop :=
  ProbabilityTheory.HasLaw T ν μ ∧ transportMapCost c μ T = mongeCost c μ ν

/-- A map with target law `ν` under `μ` whose cost equals the Kantorovich value. -/
def IsKantorovichOptimalTransportMap [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) (T : X → Y) : Prop :=
  ProbabilityTheory.HasLaw T ν μ ∧ transportMapCost c μ T = transportCost c μ ν

/-! ## Layer 5: Brenier's theorem -/

/-- For finite-second-moment Euclidean laws with absolutely continuous source, there is
an almost-everywhere unique map attaining the quadratic Kantorovich value. -/
theorem exists_isKantorovichOptimalTransportMap_quadratic_of_ac {n : ℕ}
    (μ ν : WassersteinSpace 2 (EuclideanSpace ℝ (Fin n)))
    (hμ : μ.1.toMeasure ≪ volume) :
    ∃ T : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n),
      IsKantorovichOptimalTransportMap
        (fun z => edist z.1 z.2 ^ (2 : ℕ)) μ.1.toMeasure ν.1.toMeasure T ∧
      ∀ S, IsKantorovichOptimalTransportMap
          (fun z => edist z.1 z.2 ^ (2 : ℕ)) μ.1.toMeasure ν.1.toMeasure S →
        S =ᵐ[μ.1.toMeasure] T := by
  sorry

/-! ## Layer 12: Fréchet and Wasserstein barycenters -/

/-- The `Lᵖ(P)` norm of the extended distance from `x`. -/
def frechetRadius [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (P : ProbabilityMeasure X) (x : X) : ℝ≥0∞ :=
  eLpNorm (fun y => edist x y) p P.toMeasure

/-- A finite-radius minimizer of the Fréchet radius for an exponent `1 ≤ p < ∞`. -/
def IsFrechetBarycenter [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (P : ProbabilityMeasure X) (x : X) : Prop :=
  1 ≤ p ∧ p ≠ ∞ ∧ (∃ y, frechetRadius p P y ≠ ∞) ∧
    IsMinOn (frechetRadius p P) Set.univ x

/-- A finite-radius minimizer of the essential-supremum Fréchet radius. -/
def IsChebyshevCenter [MeasurableSpace X] [PseudoEMetricSpace X]
    (P : ProbabilityMeasure X) (x : X) : Prop :=
  (∃ y, frechetRadius ∞ P y ≠ ∞) ∧ IsMinOn (frechetRadius ∞ P) Set.univ x

/-! ## Layer 13: entropic transport and finite Sinkhorn scaling -/

/-- A strictly positive rectangular matrix and strictly positive marginals of equal mass
admit strictly positive diagonal scaling factors with those row and column sums. -/
theorem exists_sinkhorn_scaling {n m : ℕ} [NeZero n] [NeZero m]
    (K : Matrix (Fin n) (Fin m) ℝ) (a : Fin n → ℝ) (b : Fin m → ℝ)
    (hK : ∀ i j, 0 < K i j) (ha : ∀ i, 0 < a i) (hb : ∀ j, 0 < b j)
    (hmass : ∑ i, a i = ∑ j, b j) :
    ∃ (u : Fin n → ℝ) (v : Fin m → ℝ),
      (∀ i, 0 < u i) ∧ (∀ j, 0 < v j) ∧
      (∀ i, ∑ j, u i * K i j * v j = a i) ∧
      (∀ j, ∑ i, u i * K i j * v j = b j) := by
  sorry

end TauCetiRoadmap.OptimalTransport
