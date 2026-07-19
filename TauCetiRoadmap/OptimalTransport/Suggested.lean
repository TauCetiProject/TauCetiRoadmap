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

/-- **Layer 0.** A plan-first, raw-measure coupling relation. The final declaration should
live in Mathlib/Tau Ceti's measure namespace and retain this argument order so facts about a
plan support dot notation. -/
structure IsCoupling [MeasurableSpace X] [MeasurableSpace Y]
    (π : Measure (X × Y)) (μ : Measure X) (ν : Measure Y) : Prop where
  fst_eq : π.fst = μ
  snd_eq : π.snd = ν

end Measure

/-- **Layer 0.** Bundled probability couplings inherit all topology from
`ProbabilityMeasure`; `Measure.IsCoupling` remains the algebraic root relation. -/
abbrev Coupling [MeasurableSpace X] [MeasurableSpace Y]
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :=
  {π : ProbabilityMeasure (X × Y) //
    Measure.IsCoupling π.toMeasure μ.toMeasure ν.toMeasure}

/-- **Layer 0 target: raw nonemptiness.** Finite measures with equal mass have a coupling,
including the zero-mass case. -/
theorem exists_coupling_of_isFiniteMeasure [MeasurableSpace X] [MeasurableSpace Y]
    (μ : Measure X) (ν : Measure Y) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (hmass : μ Set.univ = ν Set.univ) :
    ∃ π : Measure (X × Y), Measure.IsCoupling π μ ν := by
  sorry

/-- **Layer 0 target: probability nonemptiness.** This is the bundled product-coupling
corollary of the raw equal-mass theorem. -/
theorem coupling_nonempty [MeasurableSpace X] [MeasurableSpace Y]
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :
    Nonempty (Coupling μ ν) := by
  sorry

/-- **Layer 0 target: one-sided gluing.** The two requested pair marginals share `ν`.
Only the carrier being disintegrated out of `πYZ` must be standard Borel; no topological
hypothesis belongs on `X` or `Y`. The symmetric theorem disintegrates `πXY` instead. -/
theorem exists_gluing [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]
    [StandardBorelSpace Z]
    {μ : ProbabilityMeasure X} {ν : ProbabilityMeasure Y} {ρ : ProbabilityMeasure Z}
    (πXY : Coupling μ ν) (πYZ : Coupling ν ρ) :
    ∃ γ : ProbabilityMeasure (X × (Y × Z)),
      Measure.map (fun z => (z.1, z.2.1)) γ.toMeasure = πXY.1.toMeasure ∧
      Measure.map (fun z => (z.2.1, z.2.2)) γ.toMeasure = πYZ.1.toMeasure := by
  sorry

/-! ## Layer 1: transport cost and primal attainment -/

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

/-- **Layer 1 target: primal attainment** for a lower-semicontinuous extended cost on
Polish spaces. Finite value is a separate conclusion, not an existence hypothesis. -/
theorem exists_isOptimalCoupling
    [PseudoMetricSpace X] [MeasurableSpace X] [BorelSpace X] [PolishSpace X]
    [PseudoMetricSpace Y] [MeasurableSpace Y] [BorelSpace Y] [PolishSpace Y]
    (c : X × Y → ℝ≥0∞) (hc : LowerSemicontinuous c)
    (μ : ProbabilityMeasure X) (ν : ProbabilityMeasure Y) :
    ∃ π : Coupling μ ν, IsOptimalCoupling c μ ν π := by
  sorry

/-! ## Layer 2: Kantorovich duality and optimality certificates -/

/-- **Layer 2.** Pin the finite-real dual sign and argument convention independently of
later integrability/topological hypotheses. The extended-cost branch and `c`-transform
wait for an honest extended-real API that prevents undefined `∞-∞`. -/
def DualFeasible (c : X × Y → ℝ) (φ : X → ℝ) (ψ : Y → ℝ) : Prop :=
  ∀ x y, φ x + ψ y ≤ c (x, y)

/-- **Layer 2.** Finite `c`-cyclical monotonicity uses arbitrary finite permutations.
Later prove equivalence with the cyclic-permutation presentation. -/
def IsCCyclicallyMonotone (c : X × Y → ℝ) (Γ : Set (X × Y)) : Prop :=
  ∀ (n : ℕ) (z : Fin n → X × Y) (σ : Equiv.Perm (Fin n)),
    (∀ i, z i ∈ Γ) →
      (∑ i, c (z i)) ≤ ∑ i, c ((z i).1, (z (σ i)).2)

/-- **Layer 2 target:** a dual contact set is `c`-cyclically monotone. -/
theorem DualFeasible.contact_isCCyclicallyMonotone
    {c : X × Y → ℝ} {φ : X → ℝ} {ψ : Y → ℝ} (h : DualFeasible c φ ψ) :
    IsCCyclicallyMonotone c {z | φ z.1 + ψ z.2 = c z} := by
  sorry

/-! ## Layer 3: Wasserstein distance and finite-distance components -/

/-- **Layer 3.** On an ordinary (finite-valued) pseudometric space, moment finiteness uses
Mathlib's extended exponent and `MemLp` applied to the real-valued distance; the roadmap
requires proof that the choice of basepoint is immaterial when `1 ≤ p` only under
explicit a.e.-measurability of all distance sections. -/
def HasFiniteMoment [MeasurableSpace X] [PseudoMetricSpace X]
    (p : ℝ≥0∞) (μ : ProbabilityMeasure X) : Prop :=
  ∃ x₀ : X, MemLp (fun x => dist x x₀) p μ.toMeasure

/-- **Layer 3.** The ordinary pseudometric-space finite-moment wrapper. On an extended
metric space use a component anchored at a reference law instead. Its measurable space is
Mathlib's inherited `Subtype.instMeasurableSpace`; do not add a duplicate instance. -/
def WassersteinSpace (p : ℝ≥0∞) (X : Type u)
    [MeasurableSpace X] [PseudoMetricSpace X] :=
  {μ : ProbabilityMeasure X // HasFiniteMoment p μ}

/-- **Layer 3.** One definition covers finite exponents and `p = ∞` by using `eLpNorm`.
For finite `p`, prove the integral/root formula; at `∞`, prove the essential-supremum form. -/
def wassersteinEDist [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (μ ν : ProbabilityMeasure X) : ℝ≥0∞ :=
  ⨅ π : Coupling μ ν,
    eLpNorm (fun z : X × X => edist z.1 z.2) p π.1.toMeasure

/-- **Layer 3.** An anchored finite-distance component for an extended metric base. It too
uses Mathlib's inherited subtype measurable structure. -/
def WassersteinComponent [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (μ₀ : ProbabilityMeasure X) :=
  {μ : ProbabilityMeasure X // wassersteinEDist p μ₀ μ ≠ ∞}

/-- **Layer 3 target:** the extended-metric triangle inequality is proved from Layer 0
standard-Borel gluing, measurable `edist`, and Mathlib's `eLpNorm` Minkowski inequality.
Completeness and finite-valuedness of the ground distance are not needed. -/
theorem wassersteinEDist_triangle
    [PseudoEMetricSpace X] [MeasurableSpace X] [StandardBorelSpace X]
    (hedist : Measurable fun z : X × X => edist z.1 z.2)
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

/-! ## Layer 4: the Monge problem and abstract transport maps -/

/-- **Layer 4.** Cost of a deterministic candidate, rooted on an arbitrary source measure. -/
def transportMapCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (T : X → Y) : ℝ≥0∞ :=
  ∫⁻ x, c (x, T x) ∂μ

/-- **Layer 4.** The Monge value minimizes only over maps with
`ProbabilityTheory.HasLaw T ν μ` and therefore remains distinct from the Kantorovich
relaxation. The definition applies to arbitrary measures; equal mass follows from feasibility. -/
def mongeCost [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) : ℝ≥0∞ :=
  ⨅ T : X → Y, ⨅ _hT : ProbabilityTheory.HasLaw T ν μ, transportMapCost c μ T

/-- **Layer 4.** A feasible minimizer of the Monge problem, whether or not relaxation has
the same value. -/
def IsMongeMinimizer [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) (T : X → Y) : Prop :=
  ProbabilityTheory.HasLaw T ν μ ∧ transportMapCost c μ T = mongeCost c μ ν

/-- **Layer 4.** A feasible map that attains the Kantorovich relaxation. This is stronger
than `IsMongeMinimizer` until equality of the Monge and Kantorovich values is proved. -/
def IsKantorovichOptimalTransportMap [MeasurableSpace X] [MeasurableSpace Y]
    (c : X × Y → ℝ≥0∞) (μ : Measure X) (ν : Measure Y) (T : X → Y) : Prop :=
  ProbabilityTheory.HasLaw T ν μ ∧ transportMapCost c μ T = transportCost c μ ν

/-! ## Layer 5: Brenier's theorem -/

/-- **Layer 5 target, map-facing Brenier corollary.** The full potential is a proper l.s.c.
extended-valued convex function; that signature waits for Layer 5's honest
extended convex/subgradient API. `README.md` additionally requires uniqueness of the
optimal plan, the potential/contact theorem, conjugate inverse, and polar factorization. -/
theorem exists_brenierMap {n : ℕ}
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

/-- **Layer 12.** General metric Fréchet minimizers precede Wasserstein barycenters. The
`eLpNorm` radius has the same minimizers as the usual `p`th-power functional for
`0 < p < ∞`, and also gives the Chebyshev-center endpoint at `p = ∞`.  Downstream
identities take `AEMeasurable (fun y ↦ edist x y) P.toMeasure` explicitly;
`OpensMeasurableSpace X` is a standard sufficient corollary, not a definitional gate. -/
def frechetRadius [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (P : ProbabilityMeasure X) (x : X) : ℝ≥0∞ :=
  eLpNorm (fun y => edist x y) p P.toMeasure

/-- **Layer 12.** Membership in the finite-exponent metric Fréchet-barycenter set. The
side conditions keep Mathlib's degenerate `L⁰` convention out of the barycenter API, while
the explicit finite-radius gate rules out the vacuous all-`∞` case and `IsMinOn` supplies
the standard minimizer vocabulary. -/
def IsFrechetBarycenter [MeasurableSpace X] [PseudoEMetricSpace X]
    (p : ℝ≥0∞) (P : ProbabilityMeasure X) (x : X) : Prop :=
  1 ≤ p ∧ p ≠ ∞ ∧ (∃ y, frechetRadius p P y ≠ ∞) ∧
    IsMinOn (frechetRadius p P) Set.univ x

/-- **Layer 12.** The `p=∞` endpoint is named separately as the Chebyshev-center problem. -/
def IsChebyshevCenter [MeasurableSpace X] [PseudoEMetricSpace X]
    (P : ProbabilityMeasure X) (x : X) : Prop :=
  (∃ y, frechetRadius ∞ P y ≠ ∞) ∧ IsMinOn (frechetRadius ∞ P) Set.univ x

/-! ## Layer 13: entropic transport and finite Sinkhorn scaling -/

/-- **Layer 13 target: finite positive-kernel Sinkhorn scaling.** The roadmap also
requires support-feasible nonnegative kernels, uniqueness modulo scalar, convergence,
and agreement with measurable IPFP. -/
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
