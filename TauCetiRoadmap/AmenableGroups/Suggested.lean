import Mathlib

/-!
# Amenable groups: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a milestone nor the roadmap.

These prototypes pin the uniform-continuity and translation conventions, the primary
definition, and selected discrete characterizations. They reuse bounded continuous functions,
linear maps, filters, and `Equidecomp`. The Haar `L∞` comparison, the compactness machinery,
the closure theorems and the Tarski prerequisites are specified in the README only.
-/

noncomputable section

open Filter
open scoped Topology Pointwise symmDiff ENNReal BoundedContinuousFunction

namespace TauCetiRoadmap.AmenableGroups

section Topological

variable (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The convention is uniform continuity under small *left* multiplication.
The formula, rather than the label "left" or "right" uniformly continuous, is authoritative. -/
def ucb : Submodule ℝ (G →ᵇ ℝ) where
  carrier := {f | ∀ ε : ℝ, 0 < ε → ∀ᶠ u in 𝓝 (1 : G), ∀ x, |f (u * x) - f x| < ε}
  zero_mem' := by
    simp
  add_mem' := by
    sorry
  smul_mem' := by
    sorry

/-- The norm and vector-space structure are inherited from bounded continuous functions. -/
abbrev UCB := ↥(ucb G)

/-- Identify the formula with Mathlib's right uniformity, without assuming a SIN group. -/
theorem mem_ucb_iff_uniformContinuous (f : G →ᵇ ℝ) : f ∈ ucb G ↔
    (letI : UniformSpace G := IsTopologicalGroup.rightUniformSpace G
     UniformContinuous f) := by
  sorry

/-- UCB is closed for the sup norm, so it is a Banach space. -/
theorem isClosed_ucb : IsClosed (ucb G : Set (G →ᵇ ℝ)) := by
  sorry

instance : CompleteSpace (UCB G) := by
  sorry

/-- Constants belong to UCB. -/
def const (c : ℝ) : UCB G :=
  ⟨BoundedContinuousFunction.const G c, by simp [ucb]⟩

omit [IsTopologicalGroup G] in
@[simp] theorem const_apply (c : ℝ) (x : G) : (const G c).val x = c := rfl

/-- Translation is precomposition by `x ↦ g⁻¹ * x`, with the inverse fixed here. -/
def translate (g : G) (f : UCB G) : UCB G :=
  ⟨f.val.compContinuous ⟨fun x => g⁻¹ * x, continuous_const.mul continuous_id⟩, by
    sorry⟩

@[simp] theorem translate_apply (g : G) (f : UCB G) (x : G) :
    (translate G g f).val x = f.val (g⁻¹ * x) := rfl

@[simp] theorem translate_one (f : UCB G) : translate G 1 f = f := by
  sorry

theorem translate_mul (g h : G) (f : UCB G) :
    translate G (g * h) f = translate G g (translate G h f) := by
  sorry

/-- Translation preserves the inherited sup norm. -/
theorem norm_translate (g : G) (f : UCB G) : ‖translate G g f‖ = ‖f‖ := by
  sorry

/-- The orbit map of each UCB function is continuous in sup norm. -/
theorem continuous_translate (f : UCB G) : Continuous (fun g => translate G g f) := by
  sorry

/-- Continuity is a consequence of positivity and normalization, not an additional axiom. -/
structure Mean where
  toLinearMap : UCB G →ₗ[ℝ] ℝ
  positive : ∀ f : UCB G, (∀ x, 0 ≤ f.val x) → 0 ≤ toLinearMap f
  normalized : toLinearMap (const G 1) = 1

variable {G}

theorem Mean.map_const (m : Mean G) (c : ℝ) : m.toLinearMap (const G c) = c := by
  sorry

theorem Mean.mono (m : Mean G) {f h : UCB G} (hfh : ∀ x, f.val x ≤ h.val x) :
    m.toLinearMap f ≤ m.toLinearMap h := by
  sorry

theorem Mean.abs_le_norm (m : Mean G) (f : UCB G) : |m.toLinearMap f| ≤ ‖f‖ := by
  sorry

theorem Mean.continuous (m : Mean G) : Continuous m.toLinearMap := by
  sorry

/-- The automatic continuous-linear-map upgrade has exactly the given linear map. -/
def Mean.toContinuousLinearMap (m : Mean G) : UCB G →L[ℝ] ℝ :=
  ⟨m.toLinearMap, m.continuous⟩

@[simp] theorem Mean.toContinuousLinearMap_apply (m : Mean G) (f : UCB G) :
    m.toContinuousLinearMap f = m.toLinearMap f := rfl

/-- Left invariance uses the action fixed by `translate_apply`. -/
def Mean.IsLeftInvariant (m : Mean G) : Prop :=
  ∀ (g : G) (f : UCB G), m.toLinearMap (translate G g f) = m.toLinearMap f

variable (G)

/-- Primary amenability: no local compactness, separation, or countability assumption. -/
def Amenable : Prop := ∃ m : Mean G, m.IsLeftInvariant

variable {H : Type*} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]

/-- Transport along a group isomorphism which is a homeomorphism. -/
theorem amenable_iff_of_mulEquiv (e : G ≃* H) (he : Continuous e)
    (he' : Continuous e.symm) : Amenable G ↔ Amenable H := by
  sorry

/-- On a discrete group every bounded continuous function belongs to UCB;
continuity of an arbitrary bounded function is automatic. -/
theorem ucb_eq_top [DiscreteTopology G] : ucb G = ⊤ := by
  sorry

end Topological

section Equidecomposition

variable (G : Type*) {X : Type*} [Group G] [MulAction G X]

/-- Equidecomposability uses Mathlib's finite-piece `Equidecomp`, not a new primitive. -/
def Equidecomposable (A B : Set X) : Prop :=
  ∃ e : Equidecomp X G, e.source = A ∧ e.target = B

/-- A nonempty set splits into two disjoint parts, each equidecomposable with the whole.
The pieces and their translates need not be measurable. -/
def Paradoxical (S : Set X) : Prop :=
  S.Nonempty ∧ ∃ A B : Set X, Disjoint A B ∧ A ∪ B = S ∧
    Equidecomposable G A S ∧ Equidecomposable G B S

/-- The easy obstruction only needs an additive content on all subsets and invariance.
`ℝ≥0∞` matches the values produced by `IsFoelner.amenable`; normalization
and additivity force every value to be finite and at most one. -/
theorem not_paradoxical_univ_of_invariantContent
    (m : MeasureTheory.AddContent ℝ≥0∞ (Set.univ : Set (Set X)))
    (hone : m Set.univ = 1) (hinv : ∀ (g : G) (A : Set X), m (g • A) = m A) :
    ¬ Paradoxical G (Set.univ : Set X) := by
  sorry

/-- The explicit reduced-word decomposition gives the early negative example. -/
theorem freeGroup_two_paradoxical :
    Paradoxical (FreeGroup (Fin 2)) (Set.univ : Set (FreeGroup (Fin 2))) := by
  sorry

end Equidecomposition

section Foelner

variable (G : Type*) [Group G]

/-- The group has Følner sets: Mathlib's counting-measure Følner filter is nontrivial.
The local measurable space makes every subset measurable, so this depends only on the group. -/
abbrev HasFoelnerSets : Prop :=
  letI : MeasurableSpace G := ⊤
  NeBot (maxFoelner G (MeasureTheory.Measure.count : MeasureTheory.Measure G))

open scoped Classical

/-- Specialize Mathlib's Følner filter to counting measure on all subsets.
This finite-test characterization needs neither a topology nor countability. -/
theorem hasFoelnerSets_iff : HasFoelnerSets G ↔
    ∀ K : Finset G, ∀ ε : ℝ, 0 < ε → ∃ F : Finset G, F.Nonempty ∧
      ∀ g ∈ K, (((g • F) ∆ F).card : ℝ) < ε * (F.card : ℝ) := by
  sorry

end Foelner

section Discrete

variable (G : Type*) [Group G] [TopologicalSpace G] [DiscreteTopology G]

/-- This is a characterization of the primary definition. It requires finite additivity
on every subset, not a countably additive `MeasureTheory.Measure`. -/
theorem amenable_iff_exists_invariantContent :
    Amenable G ↔ ∃ m : MeasureTheory.AddContent ℝ≥0∞ (Set.univ : Set (Set G)),
      m Set.univ = 1 ∧ ∀ (g : G) (A : Set G), m (g • A) = m A := by
  sorry

/-- Discrete amenability is equivalent to having Følner sets, using Mathlib's filter. -/
theorem amenable_iff_hasFoelnerSets : Amenable G ↔ HasFoelnerSets G := by
  sorry

/-- Unfold the abbreviation to expose the counting-measure filter directly. -/
theorem amenable_iff_maxFoelner_neBot : Amenable G ↔
    (letI : MeasurableSpace G := ⊤
     NeBot (maxFoelner G (MeasureTheory.Measure.count : MeasureTheory.Measure G))) := by
  exact amenable_iff_hasFoelnerSets G

open scoped Classical

/-- The classical finite-set formulation follows from the counting-measure specialization,
with no countability assumption. -/
theorem amenable_iff_exists_finset : Amenable G ↔
    ∀ K : Finset G, ∀ ε : ℝ, 0 < ε → ∃ F : Finset G, F.Nonempty ∧
      ∀ g ∈ K, (((g • F) ∆ F).card : ℝ) < ε * (F.card : ℝ) := by
  exact (amenable_iff_hasFoelnerSets G).trans (hasFoelnerSets_iff G)

/-- Countability is needed only to replace a general filter by a sequence. -/
theorem amenable_iff_exists_foelnerSequence [Countable G] : Amenable G ↔
    ∃ F : ℕ → Finset G, (∀ n, (F n).Nonempty) ∧
      ∀ g : G, Tendsto (fun n => ((((g • F n) ∆ F n).card : ℝ) / ((F n).card : ℝ)))
        atTop (𝓝 0) := by
  sorry

/-- Tarski's alternative for the left regular action (README, Layer 8). It concerns the whole
group; it does not assert that every nonempty subset is non-paradoxical. -/
theorem amenable_iff_not_paradoxical :
    Amenable G ↔ ¬ Paradoxical G (Set.univ : Set G) := by
  sorry

end Discrete

end TauCetiRoadmap.AmenableGroups
