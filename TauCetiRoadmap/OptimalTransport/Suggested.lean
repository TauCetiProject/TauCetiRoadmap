import Mathlib

/-!
# Optimal transport and Wasserstein geometry: target signatures

**`README.md` is the definitive roadmap and this file is not exhaustive.**  The narrative
document fixes the generality contract, conventions, dependency layers, theorem regimes,
counterexamples, and completion criteria.  The declarations below suggest Lean forms for
particular early definitions and representative summits so contributors and reviewers can
converge on an API.  Proving every statement here completes neither a layer nor the roadmap.

The first compiled targets cover the common spine (Layers 0--3), the map-facing form of
Brenier (Layer 5), a finite Sinkhorn theorem (Layer 13), and the ambient Fréchet-barycenter
definition (Layer 12).  The roadmap requires much more: general and Borel-cost duality,
Monge--Ampère/MTW regularity, Riemannian and nonsmooth McCann theory, dynamic plans and
Benamou--Brenier, metric and Wasserstein gradient flows/JKO, population barycenters,
measurable IPFP and Schrödinger bridges, `CD/RCD`, and measured-kernel
Gromov--Wasserstein.

As those prerequisites become expressible, add their representative signatures here.
Use Mathlib's `ProbabilityMeasure`, `InformationTheory.klDiv`, `MemLp`, `eLpNorm`, and
extended exponent `p : ℝ≥0∞`; do not create private synonyms.  The eventual implementation
belongs in coordinated Mathlib/Tau Ceti namespaces, after reconciling the Vlasov and
Econlib prior work described in `README.md`.
-/

noncomputable section

open scoped BigOperators ENNReal NNReal
open MeasureTheory Topology

namespace TauCetiRoadmap.OptimalTransport

universe u v w

variable {X : Type u} {Y : Type v} {Z : Type w}

namespace Measure

/-- **Layer 0.** A plan-first, raw-measure coupling relation.  The final declaration should
live in Mathlib/Tau Ceti's measure namespace and retain this argument order so facts about a
plan support dot notation. -/
structure IsCoupling [MeasurableSpace X] [MeasurableSpace Y]
    (π : Measure (X × Y)) (μ : Measure X) (ν : Measure Y) : Prop where
  fst_eq : π.fst = μ
  snd_eq : π.snd = ν

/-- **Layer 0.** A transport map is a.e.-measurable and has the requested pushforward. -/
def IsTransportMap [MeasurableSpace X] [MeasurableSpace Y]
    (T : X → Y) (μ : Measure X) (ν : Measure Y) : Prop :=
  AEMeasurable T μ ∧ Measure.map T μ = ν

end Measure

/-- **Layer 0.** Bundled probability couplings inherit all topology from
`ProbabilityMeasure`; `Measure.IsCoupling` remains the algebraic root relation. -/
abbrev Coupling [MeasurableSpace X] [MeasurableSpace Y]
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :=
  {π : ProbabilityMeasure (X × Y) //
    Measure.IsCoupling π.toMeasure μ.toMeasure ν.toMeasure}

/-- **Layer 1.** The primary Kantorovich value is rooted on raw measures, has an extended
nonnegative cost, and keeps `∞` for an empty feasible set or an infinite optimum. -/
def transportCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) : ℝ≥0∞ :=
  ⨅ π : Measure (X × Y), ⨅ _hπ : Measure.IsCoupling π μ ν, ∫⁻ z, c z ∂π

/-- **Layer 1.** Optimality is equality with the extended primal value. -/
def IsOptimalCoupling [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y)
    (π : Coupling μ ν) : Prop :=
  (∫⁻ z, c z ∂π.1.toMeasure) = transportCost c μ.toMeasure ν.toMeasure

/-- **Layer 4.** Cost of a deterministic candidate. -/
def transportMapCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (T : X → Y) : ℝ≥0∞ :=
  ∫⁻ x, c (x, T x) ∂μ.toMeasure

/-- **Layer 4.** The Monge value minimizes only over feasible maps and therefore remains
distinct from the Kantorovich relaxation. -/
def mongeCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) : ℝ≥0∞ :=
  ⨅ T : X → Y, ⨅ _hT : Measure.IsTransportMap T μ.toMeasure ν.toMeasure,
    transportMapCost c μ T

/-- **Layer 4.** A feasible minimizer of the Monge problem, whether or not relaxation has
the same value. -/
def IsMongeMinimizer [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y)
    (T : X → Y) : Prop :=
  Measure.IsTransportMap T μ.toMeasure ν.toMeasure ∧
    transportMapCost c μ T = mongeCost c μ ν

/-- **Layer 4.** Equality of the Monge value with its Kantorovich relaxation. -/
def HasNoMongeRelaxationGap [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) : Prop :=
  mongeCost c μ ν = transportCost c μ.toMeasure ν.toMeasure

/-- **Layer 4.** A feasible map that attains the Kantorovich relaxation.  This is stronger
than `IsMongeMinimizer` until the no-relaxation-gap theorem is available. -/
def IsKantorovichOptimalTransportMap [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y)
    (T : X → Y) : Prop :=
  Measure.IsTransportMap T μ.toMeasure ν.toMeasure ∧
    transportMapCost c μ T = transportCost c μ.toMeasure ν.toMeasure

/-- **Layer 2.** Pin the finite-real dual sign and argument convention independently of
later integrability/topological hypotheses.  The extended-cost branch and `c`-transform
wait for an honest extended-real API that prevents undefined `∞-∞`. -/
def DualFeasible (c : X × Y → ℝ) (φ : X → ℝ) (ψ : Y → ℝ) : Prop :=
  ∀ x y, φ x + ψ y ≤ c (x, y)

/-- **Layer 2.** Finite `c`-cyclical monotonicity uses arbitrary finite permutations.
Later prove equivalence with the cyclic-permutation presentation. -/
def IsCCyclicallyMonotone (c : X × Y → ℝ) (Γ : Set (X × Y)) : Prop :=
  ∀ (n : ℕ) (z : Fin n → X × Y) (σ : Equiv.Perm (Fin n)),
    (∀ i, z i ∈ Γ) →
      (∑ i, c (z i)) ≤ ∑ i, c ((z i).1, (z (σ i)).2)

/-- **Layer 3.** On an ordinary (finite-valued) pseudometric space, moment finiteness uses
Mathlib's extended exponent and `MemLp`; the roadmap requires proof that the choice of
basepoint is immaterial when `1 ≤ p`. -/
def HasFiniteMoment [MeasurableSpace X] [PseudoMetricSpace X]
    (p : ℝ≥0∞) (μ : ProbabilityMeasure X) : Prop :=
  ∃ x₀ : X, MemLp (fun x => edist x x₀) p μ.toMeasure

/-- **Layer 3.** The ordinary pseudometric-space finite-moment wrapper.  On an extended
metric space use a component anchored at a reference law instead. -/
def WassersteinSpace (p : ℝ≥0∞) (X : Type u)
    [MeasurableSpace X] [PseudoMetricSpace X] :=
  {μ : ProbabilityMeasure X // HasFiniteMoment p μ}

/-- **Layer 3.** One definition covers finite exponents and `p = ∞` by using `eLpNorm`.
For finite `p`, prove the integral/root formula; at `∞`, prove the essential-supremum form. -/
def wassersteinEDist [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (μ ν : ProbabilityMeasure X) : ℝ≥0∞ :=
  ⨅ π : Coupling μ ν,
    eLpNorm (fun z : X × X => edist z.1 z.2) p π.1.toMeasure

/-- **Layer 3.** An anchored finite-distance component for an extended metric base. -/
def WassersteinComponent [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (μ₀ : ProbabilityMeasure X) :=
  {μ : ProbabilityMeasure X // wassersteinEDist p μ₀ μ ≠ ∞}

/-- **Layer 0 target: nonemptiness.**  For finite equal-mass measures the analogous
construction uses a normalized product (and handles zero mass separately). -/
theorem coupling_nonempty [MeasurableSpace X] [MeasurableSpace Y]
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :
    Nonempty (Coupling μ ν) := by
  sorry

/-- **Layer 0 target: gluing.**  The two requested pair marginals share `ν`. -/
theorem exists_gluing [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]
    [StandardBorelSpace X] [StandardBorelSpace Y] [StandardBorelSpace Z]
    {μ : ProbabilityMeasure X} {ν : ProbabilityMeasure Y} {ρ : ProbabilityMeasure Z}
    (πXY : Coupling μ ν) (πYZ : Coupling ν ρ) :
    ∃ γ : ProbabilityMeasure (X × (Y × Z)),
      Measure.map (fun z => (z.1, z.2.1)) γ.toMeasure = πXY.1.toMeasure ∧
      Measure.map (fun z => (z.2.1, z.2.2)) γ.toMeasure = πYZ.1.toMeasure := by
  sorry

/-- **Layer 1 target: primal attainment** for a lower-semicontinuous extended cost on
Polish spaces.  Finite value is a separate conclusion, not an existence hypothesis. -/
theorem exists_isOptimalCoupling
    [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    [PseudoMetricSpace Y] [MeasurableSpace Y] [BorelSpace Y] [PolishSpace Y]
    (c : X × Y → ℝ≥0∞) (hc : LowerSemicontinuous c)
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :
    ∃ π : Coupling μ ν, IsOptimalCoupling c μ ν π := by
  sorry

/-- **Layer 2 target:** a dual contact set is `c`-cyclically monotone. -/
theorem DualFeasible.contact_isCCyclicallyMonotone
    {c : X × Y → ℝ} {φ : X → ℝ} {ψ : Y → ℝ} (h : DualFeasible c φ ψ) :
    IsCCyclicallyMonotone c {z | φ z.1 + ψ z.2 = c z} := by
  sorry

/-- **Layer 3 target:** the triangle inequality is proved from Layer 0 gluing and
Mathlib's `eLpNorm` Minkowski inequality. -/
theorem wassersteinEDist_triangle
    [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    (p : ℝ≥0∞) (hp : 1 ≤ p) (μ ν ρ : ProbabilityMeasure X) :
    wassersteinEDist p μ ρ ≤ wassersteinEDist p μ ν + wassersteinEDist p ν ρ := by
  sorry

/-- **Layer 3 target:** `p = ∞` is definitionally on Mathlib's `eLpNorm` scale and is
proved equal to the explicit coupling-wise essential-supremum formula. -/
theorem wassersteinEDist_top [MeasurableSpace X] [PseudoEMetricSpace X]
    (μ ν : ProbabilityMeasure X) :
    wassersteinEDist ∞ μ ν =
      ⨅ π : Coupling μ ν,
        eLpNormEssSup (fun z : X × X => edist z.1 z.2) π.1.toMeasure := by
  sorry

/-- **Layer 5 target, map-facing Brenier corollary.**  The potential must eventually be a
proper l.s.c. extended-valued convex function; that signature waits for Layer 5's honest
extended convex/subgradient API.  `README.md` additionally requires uniqueness of the
optimal plan, the potential/contact theorem, conjugate inverse, and polar factorization. -/
theorem exists_brenierMap {n : ℕ}
    (μ ν : WassersteinSpace 2 (EuclideanSpace ℝ (Fin n)))
    (hμ : μ.1.toMeasure ≪ volume) :
    ∃ T : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n),
      IsKantorovichOptimalTransportMap
        (fun z => edist z.1 z.2 ^ (2 : ℕ)) μ.1 ν.1 T ∧
      ∀ S, IsKantorovichOptimalTransportMap
          (fun z => edist z.1 z.2 ^ (2 : ℕ)) μ.1 ν.1 S →
        S =ᵐ[μ.1.toMeasure] T := by
  sorry

/-- **Layer 12.**  General metric Fréchet minimizers precede Wasserstein barycenters.  The
`eLpNorm` radius has the same minimizers as the usual `p`th-power functional for
`0 < p < ∞`, and also gives the Chebyshev-center endpoint at `p = ∞`. -/
def frechetRadius [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (P : ProbabilityMeasure X) (x : X) : ℝ≥0∞ :=
  eLpNorm (fun y => edist x y) p P.toMeasure

/-- **Layer 12.** Membership in the finite-exponent metric Fréchet-barycenter set.  The
side conditions keep Mathlib's degenerate `L⁰` convention out of the barycenter API. -/
def IsFrechetBarycenter [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (P : ProbabilityMeasure X) (x : X) : Prop :=
  1 ≤ p ∧ p ≠ ∞ ∧ ∀ y, frechetRadius p P x ≤ frechetRadius p P y

/-- **Layer 12.** The `p=∞` endpoint is named separately as the Chebyshev-center problem. -/
def IsChebyshevCenter [MeasurableSpace X] [PseudoEMetricSpace X]
    (P : ProbabilityMeasure X) (x : X) : Prop :=
  ∀ y, frechetRadius ∞ P x ≤ frechetRadius ∞ P y

/-- **Layer 13 target: finite positive-kernel Sinkhorn scaling.**  The roadmap also
requires support-feasible nonnegative kernels, uniqueness modulo scalar, convergence,
and agreement with measurable IPFP. -/
theorem sinkhorn_scaling_exists {n m : ℕ} [NeZero n] [NeZero m]
    (K : Matrix (Fin n) (Fin m) ℝ) (a : Fin n → ℝ) (b : Fin m → ℝ)
    (hK : ∀ i j, 0 < K i j) (ha : ∀ i, 0 < a i) (hb : ∀ j, 0 < b j)
    (hmass : ∑ i, a i = ∑ j, b j) :
    ∃ (u : Fin n → ℝ) (v : Fin m → ℝ),
      (∀ i, 0 < u i) ∧ (∀ j, 0 < v j) ∧
      (∀ i, ∑ j, u i * K i j * v j = a i) ∧
      (∀ j, ∑ i, u i * K i j * v j = b j) := by
  sorry

end TauCetiRoadmap.OptimalTransport
