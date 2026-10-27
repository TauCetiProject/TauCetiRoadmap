import Mathlib
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Analysis.Calculus.Morse.NormalForm

/-!
These are suggested forms, not an exhaustive checklist. The README is the
specification. Use native Tau Ceti critical-point, Morse and index predicates;
these interfaces add normalized manifold charts, finite critical-set/count
and compact-band deformation statements. M2's scalar-level block states the
regular-level atlas with its inclusion/tangent-kernel laws; M4's
LS block states categorical covers and critical-count bounds for arbitrary
smooth functions. Counts have extended natural values before finiteness is proved.
-/

noncomputable section

namespace TauCetiRoadmap.MorseTheory
open scoped Manifold ContDiff
open Set

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- M2: a regular scalar level carries a smooth atlas modelled on `Fin (dim E - 1) → ℝ`
for which the inclusion is a smooth embedding with tangent range `ker df`. The README
specifies the explicit section-zero atlas realising it. -/
theorem exists_scalarRegularLevelData (f : M → ℝ) (c : ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hregular : ∀ x, f x = c → Function.Surjective (mfderiv I 𝓘(ℝ) f x)) :
    ∃ cs : ChartedSpace (Fin (Module.finrank ℝ E - 1) → ℝ) {x : M // f x = c},
      letI := cs
      IsManifold 𝓘(ℝ, Fin (Module.finrank ℝ E - 1) → ℝ) ∞ {x : M // f x = c} ∧
        Manifold.IsSmoothEmbedding
          𝓘(ℝ, Fin (Module.finrank ℝ E - 1) → ℝ) I ∞
          (Subtype.val : {x : M // f x = c} → M) ∧
        ∀ z : {x : M // f x = c},
          (mfderiv 𝓘(ℝ, Fin (Module.finrank ℝ E - 1) → ℝ) I Subtype.val z).range =
            (mfderiv I 𝓘(ℝ) f z.1).ker := by
  sorry

/-- The critical set uses the native manifold derivative. -/
def criticalPoints (f : M → ℝ) : Set M :=
  {x | mvfderiv I f x = 0}

def criticalCount (f : M → ℝ) (j : ℕ) : ℕ∞ :=
  {x | x ∈ criticalPoints (I := I) f ∧ TauCeti.manifoldMorseIndex I f x = j}.encard

theorem finite_criticalPoints_inter (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    {K : Set M} (hK : IsCompact K) :
    (criticalPoints (I := I) f ∩ K).Finite := by
  sorry

theorem criticalCount_ne_top [CompactSpace M] (f : M → ℝ)
    (hf : TauCeti.IsMorse I f) (j : ℕ) :
    criticalCount (I := I) f j ≠ ⊤ := by
  sorry

/-- The normalized chart uses the native Morse index and has an actual smooth inverse. -/
theorem exists_normalized_morseChart (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) (x : M)
    (hx : TauCeti.IsManifoldNondegenerateCriticalPoint I f x) :
    ∃ ψ : PartialDiffeomorph I
        𝓘(ℝ, EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) M
        (EuclideanSpace ℝ (Fin (Module.finrank ℝ E))) ∞,
      x ∈ ψ.source ∧ ψ x = 0 ∧
      ∀ y ∈ ψ.source,
        f y = f x + ∑ i : Fin (Module.finrank ℝ E),
          (if i.val < TauCeti.manifoldMorseIndex I f x then -1 else 1) * (ψ y i) ^ 2 := by
  sorry

/-- A proper Morse exhaustion has finite critical sets below each level when bounded below. -/
theorem finite_criticalPoints_sublevel (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hlower : ∃ a : ℝ, ∀ x, a ≤ f x) (b : ℝ) :
    (criticalPoints (I := I) f ∩ {x | f x ≤ b}).Finite := by
  sorry

/-- Compact-band no-critical deformation on actual sublevel topological spaces. -/
theorem exists_sublevelHomotopyEquiv (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ e : ContinuousMap.HomotopyEquiv {x : M | f x ≤ a} {x : M | f x ≤ b},
      ∀ x : {x : M | f x ≤ a}, (e x : M) = x := by
  sorry

def sublevelInclusion (f : M → ℝ) (a b : ℝ) (hab : a ≤ b) :
    ContinuousMap {x : M | f x ≤ a} {x : M | f x ≤ b} :=
  ⟨fun x ↦ ⟨x.val, le_trans x.property hab⟩,
    continuous_subtype_val.subtype_mk _⟩

/-- The actual deformation homotopy is fixed on the entire lower sublevel. -/
theorem exists_sublevelDeformation [SecondCountableTopology M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ r : ContinuousMap {x : M | f x ≤ b} {x : M | f x ≤ a},
      (∀ x, r (sublevelInclusion f a b hab.le x) = x) ∧
      Nonempty (ContinuousMap.HomotopyRel
        ((sublevelInclusion f a b hab.le).comp r) (ContinuousMap.id _)
        {x : {x : M | f x ≤ b} | f x ≤ a}) := by
  sorry

/-! Arbitrary smooth functions: explicit finite cover output keeps this file
independent of another roadmap's Suggested module. The README specifies
the comparison of these finite covers with the canonical LS number. -/

/-- Extended count; infinite critical loci retain value infinity. -/
def totalCriticalCount (f : M → ℝ) : ℕ∞ :=
  (criticalPoints (I := I) f).encard

/-- The scalar-vector derivative wrapper has the native mfderiv zero locus. -/
theorem criticalPoints_eq_setOf_mfderiv_eq_zero (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    criticalPoints (I := I) f = {x | mfderiv I 𝓘(ℝ) f x = 0} := by
  sorry

/-- Boundaryless chart transport of the native normed-space Fermat theorem. -/
theorem isLocalMin_mem_criticalPoints (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) {x : M} (hx : IsLocalMin f x) :
    x ∈ criticalPoints (I := I) f := by
  sorry

theorem criticalPoints_nonempty_of_compact [CompactSpace M] [Nonempty M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    (criticalPoints (I := I) f).Nonempty := by
  sorry

/-- This deformation uses a critical-value isolation band and no Morse hypothesis. -/
theorem exists_degenerateCriticalLevelDeformation [CompactSpace M]
    [SecondCountableTopology M] (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (c δ : ℝ) (hδ : 0 < δ)
    (hfinite : (criticalPoints (I := I) f ∩ {x | f x = c}).Finite)
    (hisolated : ∀ x ∈ criticalPoints (I := I) f,
      |f x - c| ≤ δ → f x = c)
    (U : TopologicalSpace.Opens M)
    (hU : criticalPoints (I := I) f ∩ {x | f x = c} ⊆ U) :
    ∃ ε : ℝ, 0 < ε ∧ ε < δ ∧ ∃ Φ : C(unitInterval × M, M),
      (∀ x, Φ (0, x) = x) ∧
      (∀ t x, f (Φ (t, x)) ≤ f x) ∧
      (∀ x, f x ≤ c + ε → f (Φ (1, x)) < c - ε ∨ Φ (1, x) ∈ U) := by
  sorry

/-- Ambient/open-sublevel cutoff version needed in the categorical argument. -/
theorem exists_noCriticalOpenSublevelDeformation [CompactSpace M]
    [SecondCountableTopology M] (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b δ : ℝ) (hab : a < b) (hδ : 0 < δ)
    (hnocrit : ∀ x, a - δ ≤ f x → f x ≤ b + δ →
      x ∉ criticalPoints (I := I) f) :
    ∃ Φ : C(unitInterval × M, M),
      (∀ x, Φ (0, x) = x) ∧
      (∀ t x, f (Φ (t, x)) ≤ f x) ∧
      (∀ x, f x ≤ b → f (Φ (1, x)) < a) := by
  sorry

/-- Actual finite categorical cover, not a Prop asserting its future availability. -/
theorem exists_criticalCategoricalCover [CompactSpace M] [SecondCountableTopology M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hfinite : (criticalPoints (I := I) f).Finite) :
    ∃ U : Fin hfinite.toFinset.card → TopologicalSpace.Opens M,
      (∀ i, (⟨Subtype.val, continuous_subtype_val⟩ :
        C({x : M // x ∈ U i}, M)).Nullhomotopic) ∧
      (∀ x : M, ∃ i, x ∈ U i) := by
  sorry

/-- All finite smooth critical counts; membership itself implies finiteness. -/
def finiteSmoothCriticalCounts : Set ℕ :=
  {n | ∃ f : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ f ∧
    totalCriticalCount (I := I) f = (n : ℕ∞)}

/-- Concrete witness required before defining the source's finite minimum. -/
structure MorseFiniteWitness where
  function : M → ℝ
  morse : TauCeti.IsMorse I function
  finite : (criticalPoints (I := I) function).Finite

/-- M1 supplies manifold finiteness from its normed-space/chart input. -/
noncomputable def morseFiniteWitnessOfMorse [CompactSpace M]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) :
    MorseFiniteWitness (I := I) (M := M) where
  function := f
  morse := hf
  finite := by
    simpa using finite_criticalPoints_inter (I := I) f hf (K := Set.univ) isCompact_univ

/-- Constructed from M3 Morse approximation and M1 finiteness, including the empty manifold. -/
theorem nonempty_morseFiniteWitness [CompactSpace M] [SecondCountableTopology M] :
    Nonempty (MorseFiniteWitness (I := I) (M := M)) := by
  sorry

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [IsManifold I ∞ M] in
theorem finiteSmoothCriticalCounts_nonempty (w : MorseFiniteWitness (I := I) (M := M)) :
    (finiteSmoothCriticalCounts (I := I) (M := M)).Nonempty := by
  obtain ⟨n, hn⟩ := w.finite.exists_encard_eq_coe
  exact ⟨n, w.function, w.morse.contMDiff, hn⟩

/-- Minimize over all finite smooth critical counts, not only Morse functions. -/
noncomputable def minimumCriticalCount (w : MorseFiniteWitness (I := I) (M := M)) : ℕ := by
  classical
  exact Nat.find (finiteSmoothCriticalCounts_nonempty w)

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [IsManifold I ∞ M] in
theorem minimumCriticalCount_attained (w : MorseFiniteWitness (I := I) (M := M)) :
    ∃ f : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ f ∧
      totalCriticalCount (I := I) f = (minimumCriticalCount w : ℕ∞) := by
  classical
  exact Nat.find_spec (finiteSmoothCriticalCounts_nonempty w)

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [IsManifold I ∞ M] in
theorem minimumCriticalCount_independent
    (w w' : MorseFiniteWitness (I := I) (M := M)) :
    minimumCriticalCount w = minimumCriticalCount w' := by
  rfl

/-- The finite minimum also minimizes the extended counts of all smooth functions. -/
theorem minimumCriticalCount_eq_extended_sInf
    (w : MorseFiniteWitness (I := I) (M := M)) :
    (minimumCriticalCount w : ℕ∞) =
      sInf {m : ℕ∞ | ∃ f : M → ℝ,
        ContMDiff I 𝓘(ℝ) ∞ f ∧ totalCriticalCount (I := I) f = m} := by
  sorry


/-! M4.1: the all-smooth two-critical-point bridge. No `IsMorse` or
nondegeneracy assumption is added to these targets. The second theorem is
the two-open-cell recognition of the sphere, from Brown's generalized
Schoenflies theorem (Brown 1960, Theorem 5) as owned in README M4.1. -/

/-- Two actual Euclidean open sets obtained by a uniform compact-flow estimate. -/
theorem exists_twoEuclideanOpenCover_of_two_criticalPoints
    [CompactSpace M] [ConnectedSpace M] [SecondCountableTopology M]
    (hdim : 0 < Module.finrank ℝ E) (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : totalCriticalCount (I := I) f = 2) :
    ∃ U V : TopologicalSpace.Opens M,
      (∀ x : M, x ∈ U ∨ x ∈ V) ∧
      Nonempty ({x : M // x ∈ U} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) ∧
      Nonempty ({x : M // x ∈ V} ≃ₜ (Fin (Module.finrank ℝ E) → ℝ)) := by
  sorry

/-- The genuine two-open-cell topological construction, with m=1 included. -/
theorem nonempty_homeomorph_sphere_of_two_euclidean_opens
    {X : Type*} [TopologicalSpace X] [T2Space X] [CompactSpace X]
    (m : ℕ) (hm : 0 < m) (U V : TopologicalSpace.Opens X)
    (hcover : ∀ x : X, x ∈ U ∨ x ∈ V)
    (hU : Nonempty ({x : X // x ∈ U} ≃ₜ (Fin m → ℝ)))
    (hV : Nonempty ({x : X // x ∈ V} ≃ₜ (Fin m → ℝ))) :
    Nonempty (X ≃ₜ Metric.sphere (0 : EuclideanSpace ℝ (Fin (m + 1))) 1) := by
  sorry

/-- Degenerate Reeb--Milnor/Rosen: exactly two critical POINTS, no Hessian hypothesis. -/
theorem nonempty_homeomorph_sphere_of_two_criticalPoints
    [CompactSpace M] [ConnectedSpace M] [SecondCountableTopology M]
    (hdim : 0 < Module.finrank ℝ E) (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : totalCriticalCount (I := I) f = 2) :
    Nonempty (M ≃ₜ Metric.sphere
      (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E + 1))) 1) := by
  obtain ⟨U, V, hcover, hU, hV⟩ :=
    exists_twoEuclideanOpenCover_of_two_criticalPoints (I := I) hdim f hf hcrit
  exact nonempty_homeomorph_sphere_of_two_euclidean_opens
    (Module.finrank ℝ E) hdim U V hcover hU hV

end TauCetiRoadmap.MorseTheory
