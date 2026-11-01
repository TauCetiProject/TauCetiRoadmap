/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Basic

/-!
# Compact quantum metric spaces: target signatures

**This file is not the roadmap.** The roadmap is `README.md`; this file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`,
together with the few definitions needed to state them. It is the acceptance test of the
finished roadmap, not an API catalogue: API lists and Checks live in the README.

Stated here: state existence, norm detection by states and compactness of the state space
(Layer 0); the Lip-norm criterion, finiteness and weak-star metrization of the state metric
(Layer 1); full-state recovery for lower semicontinuous seminorms (Layer 2); the closed
Lip-norm theorem for compact metric spaces and the identification of the classical state
metric with the `1`-Wasserstein distance (Layer 3); the closed Lip-norm theorem for ergodic
actions of compact groups and the faithful finite-dimensional unitary representation of a
compact Lie group (Layer 4); equality of the two quantum Gromov–Hausdorff infima, the
triangle inequality, zero-distance rigidity, and completeness and the quantum compactness
theorem in sequential form, on sequences of presentations in one universe (Layer 5).

Not statable at the pins: the metric space of isometry classes of complete closed presentations
(§5.5), a construction whose completeness is stated here on sequences instead; the
identification `Φ_θ` (§6.1), which needs the rotation crossed product
`A_θ`, provided by neither pinned library; and the continuity of the quantum tori
`Θ ↦ (A_Θ, L_Θ)` in quantum Gromov–Hausdorff distance (§6.5), which needs the twisted regular
algebra `A_Θ` (§6.0) and its Lip-norm `L_Θ` as an `ExtendedLipschitzSeminorm` on the
self-adjoint part, whose density and kernel fields are Layer 4 and Layer 6 theorems.
-/

noncomputable section
open Set
open scoped ENNReal NNReal Topology BoundedContinuousFunction

namespace TauCetiRoadmap.CompactQuantumMetricSpaces
universe u v w

/-! ## Layer 0: Order units, states and affine representation -/

section OrderUnit
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E]

/-- Compatibility of an existing norm and order with a nonzero order unit: `‖e‖ = 1` and
`‖a‖ ≤ r ↔ −r e ≤ a ≤ r e` for `r ≥ 0`. §0.1 also constructs this norm from the Archimedean
order-unit axioms; the iff excludes a non-Archimedean cone. -/
structure IsOrderUnitNorm (e : E) : Prop where
  norm_e : ‖e‖ = 1
  norm_le_iff : ∀ (a : E) (r : ℝ), 0 ≤ r →
    (‖a‖ ≤ r ↔ -r • e ≤ a ∧ a ≤ r • e)

/-- The state space: the monotone functionals normalized at `e`, as a subset of the native
weak dual with its inherited weak-star topology. -/
def stateSpace (e : E) : Set (WeakDual ℝ E) :=
  {φ | Monotone φ ∧ φ e = 1}

/-- State existence (§0.2): Hahn–Banach extension of `r e ↦ r` and positivity from the norm. -/
theorem stateSpace_nonempty (e : E) (he : IsOrderUnitNorm e) :
    (stateSpace e).Nonempty := by
  sorry

/-- Norm detection by states (§0.3): `‖a‖ = sup_φ |φ(a)|`; no completeness or separability. -/
theorem norm_eq_iSup_states (e : E) (he : IsOrderUnitNorm e) (a : E) :
    ‖a‖₊ = ⨆ φ : stateSpace e, ‖φ.1 a‖₊ := by
  sorry

/-- Compactness of the state space (§0.3): Banach–Alaoglu plus closed positivity and
normalization. -/
theorem isCompact_stateSpace (e : E) (he : IsOrderUnitNorm e) :
    IsCompact (stateSpace e) := by
  sorry

/-! ## Layer 1: Lipschitz seminorms and the compactness criterion -/

/-- A dense-domain extended seminorm with scalar kernel `ℝ e` (§1.1). Neither the Lip-norm
condition nor lower semicontinuity is part of these data. -/
structure ExtendedLipschitzSeminorm (e : E) where
  toFun : E → ℝ≥0∞
  map_zero : toFun 0 = 0
  map_add_le : ∀ a b : E, toFun (a + b) ≤ toFun a + toFun b
  map_smul : ∀ (r : ℝ) (a : E), toFun (r • a) = ENNReal.ofReal |r| * toFun a
  dense_finite : Dense {a : E | toFun a < ∞}
  kernel_iff : ∀ a : E, toFun a = 0 ↔ ∃ r : ℝ, a = r • e

instance (e : E) : CoeFun (ExtendedLipschitzSeminorm e) (fun _ => E → ℝ≥0∞) :=
  ⟨ExtendedLipschitzSeminorm.toFun⟩

variable {e : E}

/-- The state distance `ρ_L(φ, ψ) = sup {|φ(a) − ψ(a)| : L(a) ≤ 1}` (§1.2), taken in `ℝ≥0∞`. -/
def stateEDist (L : ExtendedLipschitzSeminorm e) (φ ψ : WeakDual ℝ E) : ℝ≥0∞ :=
  ⨆ (a : E) (_ : L a ≤ 1), ENNReal.ofReal |φ a - ψ a|

/-- The centered ball `B_φ = {a : L(a) ≤ 1, φ(a) = 0}` (§1.3), in the norm topology of `E`. -/
def centeredUnitBall (L : ExtendedLipschitzSeminorm e) (φ : stateSpace e) : Set E :=
  {a | L a ≤ 1 ∧ φ.1 a = 0}

/-- The scalar line `ℝ e`, with Mathlib's native quotient norm on `E ⧸ ℝ e`. -/
def scalarLine (e : E) : Submodule ℝ E := Submodule.span ℝ {e}

/-- The Lip-norm condition (§1.4 (b)): the image of the unit ball in `E ⧸ ℝ e` is norm totally
bounded. -/
def IsLipNorm (L : ExtendedLipschitzSeminorm e) : Prop :=
  TotallyBounded ((Submodule.Quotient.mk (p := scalarLine e)) '' {a : E | L a ≤ 1})

/-- A closed Lip-norm (§2.1): a Lip-norm whose sublevel sets are norm closed in `E`. -/
def IsClosedLipNorm (L : ExtendedLipschitzSeminorm e) : Prop :=
  IsLipNorm L ∧ ∀ t : ℝ≥0∞, IsClosed {a : E | L a ≤ t}

omit [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E] in
theorem stateEDist_self (L : ExtendedLipschitzSeminorm e) (φ : WeakDual ℝ E) :
    stateEDist L φ φ = 0 := by
  simp [stateEDist]

omit [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E] in
theorem stateEDist_comm (L : ExtendedLipschitzSeminorm e) (φ ψ : WeakDual ℝ E) :
    stateEDist L φ ψ = stateEDist L ψ φ := by
  simp only [stateEDist, abs_sub_comm]

/-- The triangle inequality of the state distance (§1.2). -/
theorem stateEDist_triangle (L : ExtendedLipschitzSeminorm e)
    (φ ψ χ : WeakDual ℝ E) :
    stateEDist L φ χ ≤ stateEDist L φ ψ + stateEDist L ψ χ := by
  sorry

/-- Zero separation of the state distance (§1.2), from density of the finite domain. -/
theorem stateEDist_eq_zero_iff (L : ExtendedLipschitzSeminorm e)
    (φ ψ : stateSpace e) : stateEDist L φ.1 ψ.1 = 0 ↔ φ = ψ := by
  sorry

/-- The Lip-norm criterion, (b) ⟺ (c) of §1.4: the quotient unit ball is totally bounded
exactly when one, hence every, centered ball is (Rieffel, *Metrics on states from actions of
compact groups*, Theorems 1.8 and 1.9). -/
theorem isLipNorm_iff_centered (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (φ : stateSpace e) :
    IsLipNorm L ↔ TotallyBounded (centeredUnitBall L φ) := by
  sorry

/-- Finiteness of the state distance under the Lip-norm condition (§1.5). -/
theorem stateEDist_ne_top (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (hL : IsLipNorm L) (φ ψ : stateSpace e) :
    stateEDist L φ.1 ψ.1 ≠ ∞ := by
  sorry

/-- The Lip-norm criterion, (b) ⟹ (a) of §1.4 with its converse: under the total-boundedness
condition the state distance metrizes the weak-star topology, for every filter (Rieffel,
*Metrics on states from actions of compact groups*, Theorem 1.8). -/
theorem tendsto_stateEDist_iff (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (hL : IsLipNorm L)
    {ι : Type v} (l : Filter ι) (φ : ι → stateSpace e) (ψ : stateSpace e) :
    Filter.Tendsto (fun i => stateEDist L (φ i).1 ψ.1) l (𝓝 0) ↔
      Filter.Tendsto φ l (𝓝 ψ) := by
  sorry

/-! ## Layer 2: Closed Lip-norms, recovery, maps and quotients -/

/-- Full-state recovery (§2.2): a seminorm with norm-closed sublevel sets is recovered from
its state distance, `L(a) = sup_{φ, ψ} |φ(a) − ψ(a)| / ρ_L(φ, ψ)`, with `0 / 0 = 0` and
`x / ∞ = 0` in `ℝ≥0∞` (Rieffel, *Metrics on state spaces*, Theorem 4.1). No total
boundedness is assumed. -/
theorem closedLipNorm_recovery (L : ExtendedLipschitzSeminorm e)
    (he : IsOrderUnitNorm e) (hL : ∀ t : ℝ≥0∞, IsClosed {a : E | L a ≤ t}) (a : E) :
    L a = ⨆ (φ : stateSpace e) (ψ : stateSpace e),
      ENNReal.ofReal |φ.1 a - ψ.1 a| / stateEDist L φ.1 ψ.1 := by
  sorry

/-- The extended metric on the state space (§1.2). Its topology is compared with weak-star by
`tendsto_stateEDist_iff`; no global instance overwrites the inherited topology. -/
@[instance_reducible]
def stateEMetricSpace (L : ExtendedLipschitzSeminorm e) : EMetricSpace (stateSpace e) where
  edist φ ψ := stateEDist L φ.1 ψ.1
  edist_self φ := stateEDist_self L φ.1
  edist_comm φ ψ := stateEDist_comm L φ.1 ψ.1
  edist_triangle φ ψ χ := stateEDist_triangle L φ.1 ψ.1 χ.1
  eq_of_edist_eq_zero := fun h => (stateEDist_eq_zero_iff L _ _).mp h

end OrderUnit

/-! ## Layer 3: Classical metrics, probabilities and commutators -/

section Classical
variable {X : Type u} [MetricSpace X]

/-- The extended classical Lipschitz constant `L_d(f) = sup_{x ≠ y} |f(x) − f(y)| / d(x, y)`
(§3.1) on all continuous real functions; the empty supremum is `0`. -/
def classicalLip (f : C(X, ℝ)) : ℝ≥0∞ :=
  ⨆ (x : X) (y : X) (_ : x ≠ y), ENNReal.ofReal |f x - f y| / edist x y

/-- The closed Lip-norm theorem for a nonempty compact metric space (§3.2): `L_d` on `C(X, ℝ)`
has dense finite domain, scalar kernel, is a Lip-norm and has closed sublevel sets. -/
theorem exists_closedLipNorm_classicalLip [CompactSpace X] [Nonempty X] :
    ∃ L : ExtendedLipschitzSeminorm (1 : C(X, ℝ)),
      (∀ f : C(X, ℝ), L f = classicalLip f) ∧ IsClosedLipNorm L := by
  sorry

variable [CompactSpace X] [MeasurableSpace X] [BorelSpace X]

open MeasureTheory in
/-- Integration against a probability measure on a compact metric space, as a state of
`C(X, ℝ)` (§3.3): the functional `f ↦ ∫ f dμ` is the composite of the native
`ContinuousMap.toLp` and `L1.integralCLM`, it is monotone, and it sends `1` to `1`. -/
def integrationState (μ : Measure X) [IsProbabilityMeasure μ] :
    stateSpace (1 : C(X, ℝ)) :=
  ⟨((L1.integralCLM (α := X) (μ := μ) (E := ℝ)).comp
      (ContinuousMap.toLp (E := ℝ) 1 μ ℝ) : WeakDual ℝ C(X, ℝ)), by
    intro f g hfg
    show L1.integralCLM (ContinuousMap.toLp (E := ℝ) 1 μ ℝ f) ≤
      L1.integralCLM (ContinuousMap.toLp (E := ℝ) 1 μ ℝ g)
    rw [← L1.integral_eq, ← L1.integral_eq, L1.integral_eq_integral, L1.integral_eq_integral,
      integral_congr_ae (ContinuousMap.coeFn_toLp μ f),
      integral_congr_ae (ContinuousMap.coeFn_toLp μ g)]
    exact integral_mono
      ((map_continuous f).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      ((map_continuous g).integrable_of_hasCompactSupport (HasCompactSupport.of_compactSpace _))
      (fun x => hfg x), by
    show L1.integralCLM (ContinuousMap.toLp (E := ℝ) 1 μ ℝ (1 : C(X, ℝ))) = 1
    rw [← L1.integral_eq, L1.integral_eq_integral,
      integral_congr_ae (ContinuousMap.coeFn_toLp μ (1 : C(X, ℝ)))]
    simp⟩

open MeasureTheory in
/-- The classical state metric is the `1`-Wasserstein distance (§3.3): for the extended
seminorm `L_d` on `C(X, ℝ)` of a compact metric space, the state distance of the integration
states of two probability measures is `W₁(μ, ν)` (Kantorovich–Rubinstein duality, pinned as
`TauCeti.wassersteinEDist_one_eq_iSup_of_compactSpace`). -/
theorem stateEDist_integrationState (L : ExtendedLipschitzSeminorm (1 : C(X, ℝ)))
    (hL : ∀ f : C(X, ℝ), L f = classicalLip f)
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    stateEDist L (integrationState μ).1 (integrationState ν).1 =
      TauCeti.wassersteinEDist 1 μ ν := by
  sorry

end Classical

/-! ## Layer 4: Leibniz C*-metrics from compact actions -/

section Actions
variable {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
variable {A : Type u} [CStarAlgebra A]

/-- The action seminorm `L_α(a) = sup_{g ≠ 1} ‖α_g(a) − a‖ / ℓ(g)` (§4.1) for a native
`GroupNorm` `ℓ`; continuity of `ℓ` is a hypothesis of the theorems, not of the definition. -/
def actionLip (ℓ : GroupNorm G) (α : G →* (A ≃⋆ₐ[ℂ] A)) (a : A) : ℝ≥0∞ :=
  ⨆ (g : G) (_ : g ≠ 1), ENNReal.ofReal ‖α g a - a‖ / ENNReal.ofReal (ℓ g)

/-- The closed Lip-norm theorem for ergodic actions (§4.3): for a compact Hausdorff group with
a continuous length function acting ergodically and point-norm continuously on a unital
C*-algebra, the restriction of `L_α` to the self-adjoint part is a closed Lip-norm (Rieffel,
*Metrics on states from actions of compact groups*, Proposition 2.2 and Theorem 2.3; Rieffel,
*Gromov–Hausdorff distance for quantum metric spaces*, Proposition 8.1). -/
theorem exists_closedLipNorm_actionLip [CompactSpace G] [T2Space G]
    (ℓ : GroupNorm G) (hℓ : Continuous ℓ) (α : G →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a : A, Continuous fun g : G => α g a)
    (herg : ∀ a : A, (∀ g : G, α g a = a) → ∃ c : ℂ, a = c • (1 : A)) :
    ∃ L : ExtendedLipschitzSeminorm (1 : selfAdjoint A),
      (∀ a : selfAdjoint A, L a = actionLip ℓ α a) ∧ IsClosedLipNorm L := by
  sorry

/-- Every compact Lie group admits a faithful finite-dimensional unitary representation
(§4.4): the route is point separation by matrix coefficients, the closed-subgroup theorem
and finiteness of a discrete compact kernel. -/
theorem exists_faithful_unitary_representation
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
    {K : Type*} [TopologicalSpace K] [ChartedSpace H K] [Group K]
    [LieGroup I ((⊤ : ℕ∞) : WithTop ℕ∞) K]
    [CompactSpace K] [T2Space K] :
    ∃ (n : ℕ) (π : K →* Matrix.unitaryGroup (Fin n) ℂ),
      Continuous π ∧ Function.Injective π := by
  sorry

end Actions

/-! ## Layer 5: Order-unit quantum Gromov–Hausdorff distance -/

section Bridges
variable {E : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [PartialOrder E] [IsOrderedAddMonoid E] [PosSMulMono ℝ E]
variable {F : Type v} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [PartialOrder F] [IsOrderedAddMonoid F] [PosSMulMono ℝ F]
variable {H : Type w} [NormedAddCommGroup H] [NormedSpace ℝ H]
  [PartialOrder H] [IsOrderedAddMonoid H] [PosSMulMono ℝ H]
variable {e : E} {f : F} {h : H}

/-- A quotient-admissible Lip-norm on `E ⊕ F` (§5.1): a Lip-norm whose two coordinate quotient
seminorms are exactly `L_E` and `L_F`. Its finite domain may couple the coordinates. -/
structure QuotientAdmissibleLipNorm (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) where
  seminorm : ExtendedLipschitzSeminorm (e, f)
  lipNorm : IsLipNorm seminorm
  left_quotient : ∀ a : E, (⨅ b : F, seminorm (a,b)) = LE a
  right_quotient : ∀ b : F, (⨅ a : E, seminorm (a,b)) = LF b

/-- An admissible Lip-norm (§5.1): quotient-admissible with the full product finite domain
`dom M = dom L_E × dom L_F`, which maximum gluing needs. A bridge `N` in Rieffel's sense
produces one as `max(L_E, L_F, N)` (§5.2). -/
structure AdmissibleLipNorm (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) extends QuotientAdmissibleLipNorm LE LF where
  finite_domain : ∀ (a : E) (b : F),
    seminorm (a,b) < ∞ ↔ LE a < ∞ ∧ LF b < ∞

/-- The coordinate pullback of a state of `E` to `E × F` (§5.1). -/
def leftState (φ : stateSpace e) : stateSpace (e, f) := by
  let φ' : WeakDual ℝ (E × F) :=
    (φ.1 : E →L[ℝ] ℝ).comp (ContinuousLinearMap.fst ℝ E F)
  exact ⟨φ', fun x y h => φ.2.1 h.1, φ.2.2⟩

/-- The coordinate pullback of a state of `F` to `E × F` (§5.1). -/
def rightState (ψ : stateSpace f) : stateSpace (e, f) := by
  let ψ' : WeakDual ℝ (E × F) :=
    (ψ.1 : F →L[ℝ] ℝ).comp (ContinuousLinearMap.snd ℝ E F)
  exact ⟨ψ', fun x y h => ψ.2.1 h.2, ψ.2.2⟩

/-- The Hausdorff distance of the two embedded state spaces for the state metric of a
quotient-admissible Lip-norm (§5.1), using the native `hausdorffEDist`. -/
def quotientAdmissibleEDist {LE : ExtendedLipschitzSeminorm e}
    {LF : ExtendedLipschitzSeminorm f} (M : QuotientAdmissibleLipNorm LE LF) : ℝ≥0∞ :=
  letI := stateEMetricSpace M.seminorm
  Metric.hausdorffEDist (Set.range (leftState (f := f)))
    (Set.range (rightState (e := e)))

/-- The same Hausdorff distance for an admissible Lip-norm (§5.1). -/
def admissibleEDist {LE : ExtendedLipschitzSeminorm e} {LF : ExtendedLipschitzSeminorm f}
    (M : AdmissibleLipNorm LE LF) : ℝ≥0∞ :=
  quotientAdmissibleEDist M.toQuotientAdmissibleLipNorm

/-- The quantum Gromov–Hausdorff distance `dist_q(E, F)` (§5.1): the infimum of the
state-space Hausdorff distances over admissible Lip-norms (Rieffel, *Gromov–Hausdorff distance
for quantum metric spaces*, Definition 4.2). -/
def quantumGHEDist (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) : ℝ≥0∞ :=
  ⨅ M : AdmissibleLipNorm LE LF, admissibleEDist M

/-- The infimum over the broader quotient-admissible class (§5.1). -/
def quotientQuantumGHEDist (LE : ExtendedLipschitzSeminorm e)
    (LF : ExtendedLipschitzSeminorm f) : ℝ≥0∞ :=
  ⨅ M : QuotientAdmissibleLipNorm LE LF, quotientAdmissibleEDist M

/-- The two infima agree (§5.1): the infimal-convolution regularization of a
quotient-admissible Lip-norm is an admissible Lip-norm with state metric within `2ε`. -/
theorem quantumGHEDist_eq_quotientQuantumGHEDist
    (LE : ExtendedLipschitzSeminorm e) (LF : ExtendedLipschitzSeminorm f)
    (he : IsOrderUnitNorm e) (hf : IsOrderUnitNorm f)
    (hLE : IsLipNorm LE) (hLF : IsLipNorm LF) :
    quantumGHEDist LE LF = quotientQuantumGHEDist LE LF := by
  sorry

/-- The triangle inequality for `dist_q` (§5.3), by maximum gluing of two admissible Lip-norms
and the endpoint quotient (Rieffel, *Gromov–Hausdorff distance for quantum metric spaces*,
Theorem 4.3). -/
theorem quantumGHEDist_triangle
    (LE : ExtendedLipschitzSeminorm e) (LF : ExtendedLipschitzSeminorm f)
    (LH : ExtendedLipschitzSeminorm h)
    (he : IsOrderUnitNorm e) (hf : IsOrderUnitNorm f) (hh : IsOrderUnitNorm h)
    (hLE : IsLipNorm LE) (hLF : IsLipNorm LF) (hLH : IsLipNorm LH) :
    quantumGHEDist LE LH ≤ quantumGHEDist LE LF + quantumGHEDist LF LH := by
  sorry

/-- Zero-distance rigidity for complete closed presentations (§5.4): `dist_q(E, F) = 0` exactly
when a unital surjective order isometry carries `L_E` to `L_F` (Rieffel, *Gromov–Hausdorff
distance for quantum metric spaces*, Theorem 7.8). -/
theorem quantumGHEDist_eq_zero_iff [CompleteSpace E] [CompleteSpace F]
    (LE : ExtendedLipschitzSeminorm e) (LF : ExtendedLipschitzSeminorm f)
    (he : IsOrderUnitNorm e) (hf : IsOrderUnitNorm f)
    (hLE : IsClosedLipNorm LE) (hLF : IsClosedLipNorm LF) :
    quantumGHEDist LE LF = 0 ↔
      ∃ T : E ≃ₗᵢ[ℝ] F, T e = f ∧ (∀ a b : E, a ≤ b ↔ T a ≤ T b) ∧
        ∀ a : E, LF (T a) = LE a := by
  sorry

end Bridges

section Sequences

/-- Completeness of quantum Gromov–Hausdorff space (§5.5), in Cauchy-sequence form: a sequence
of complete closed presentations in one universe that is Cauchy for `dist_q` has a complete
closed presentation in the same universe as a `dist_q`-limit (Rieffel, *Gromov–Hausdorff
distance for quantum metric spaces*, Theorem 12.11; the limit is an affine quotient of a
subspace of the product of the terms, Corollary 12.10). -/
theorem exists_limit_of_cauchySeq_quantumGHEDist
    {E : ℕ → Type u} [∀ n, NormedAddCommGroup (E n)] [∀ n, NormedSpace ℝ (E n)]
    [∀ n, PartialOrder (E n)] [∀ n, IsOrderedAddMonoid (E n)] [∀ n, PosSMulMono ℝ (E n)]
    [∀ n, CompleteSpace (E n)] (e : ∀ n, E n) (L : ∀ n, ExtendedLipschitzSeminorm (e n))
    (he : ∀ n, IsOrderUnitNorm (e n)) (hL : ∀ n, IsClosedLipNorm (L n))
    (hc : ∀ ε : ℝ≥0∞, 0 < ε → ∃ N : ℕ, ∀ m n, N ≤ m → N ≤ n →
      quantumGHEDist (L m) (L n) < ε) :
    ∃ (F : Type u) (_ : NormedAddCommGroup F) (_ : NormedSpace ℝ F) (_ : PartialOrder F)
      (_ : IsOrderedAddMonoid F) (_ : PosSMulMono ℝ F) (_ : CompleteSpace F) (f : F)
      (LF : ExtendedLipschitzSeminorm f), IsOrderUnitNorm f ∧ IsClosedLipNorm LF ∧
        Filter.Tendsto (fun n => quantumGHEDist (L n) LF) Filter.atTop (𝓝 0) := by
  sorry

/-- The quantum Gromov compactness theorem (§5.6), in sequential form: a sequence of compact
quantum metric spaces is totally bounded for `dist_q` (for every `ε > 0` finitely many terms
are within `ε` of every term) exactly when the state diameters have one finite bound and, for
every `ε > 0`, the state spaces have `ε`-nets of one bounded cardinality `G(ε)`, that is
`Scv ≤ G` (Rieffel, *Gromov–Hausdorff distance for quantum metric spaces*, Theorem 13.5; the
`Fin` form of its sufficiency follows from `Fin ≤ Scv`). -/
theorem totallyBounded_quantumGHEDist_iff
    {E : ℕ → Type u} [∀ n, NormedAddCommGroup (E n)] [∀ n, NormedSpace ℝ (E n)]
    [∀ n, PartialOrder (E n)] [∀ n, IsOrderedAddMonoid (E n)] [∀ n, PosSMulMono ℝ (E n)]
    (e : ∀ n, E n) (L : ∀ n, ExtendedLipschitzSeminorm (e n))
    (he : ∀ n, IsOrderUnitNorm (e n)) (hL : ∀ n, IsLipNorm (L n)) :
    (∀ ε : ℝ≥0∞, 0 < ε → ∃ t : Finset ℕ, ∀ n, ∃ m ∈ t, quantumGHEDist (L n) (L m) < ε) ↔
      (∃ D : ℝ≥0, ∀ n, ∀ φ ψ : stateSpace (e n), stateEDist (L n) φ.1 ψ.1 ≤ (D : ℝ≥0∞)) ∧
      ∃ G : ℝ≥0∞ → ℕ, ∀ n, ∀ ε : ℝ≥0∞, 0 < ε →
        ∃ s : Finset (stateSpace (e n)), s.card ≤ G ε ∧
          ∀ φ : stateSpace (e n), ∃ ψ ∈ s, stateEDist (L n) φ.1 ψ.1 ≤ ε := by
  sorry

end Sequences

end TauCetiRoadmap.CompactQuantumMetricSpaces
