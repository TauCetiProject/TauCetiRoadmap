import Mathlib
import TauCeti.Geometry.Manifold.Morse.Basic
import TauCeti.Geometry.Manifold.Morse.Index
import TauCeti.Analysis.Calculus.Morse.NormalForm
import TauCeti.Geometry.Manifold.VectorBundle.Riemannian.Riesz

/-!
# Morse functions, sublevel topology and Morse–Bott attachments: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`,
together with the few definitions those statements need: the critical set and its
extended counts, the sublevel inclusion, the finite-critical-set witness, the Betti
numbers of singular homology with field coefficients and the Riemannian gradient.

Stated here: the normalized Morse chart and compact finiteness (M1); the regular-level
atlas, the critical-free band deformations and the CW model of a proper bounded-below
Morse function, one cell of dimension λ per critical point of index λ (M2); the strong
Morse inequalities with field coefficients, the degenerate critical-level deformation,
the critical categorical cover and the finite minimum of critical counts (M4); the
two-Euclidean-open cover, the two-open-cell recognition of the sphere and the degenerate
two-critical-point sphere theorem (M4.1); the convergence of a compact-trapped
negative-gradient trajectory of a Morse function to a critical point and its exponential
decay for the Riemannian distance (M6), with the gradient DifferentialGeometry Layer 12.2's:
the pinned `Riemannian.Tensor.rieszDual` of the manifold derivative, for Mathlib's
`RiemannianBundle` inner product on the tangent spaces.

Not stated: the handle-attachment homeomorphism across a critical level (M2), whose
statement quantifies over chart-dependent attaching maps of the handles
`Σ_p D^{λ_p} × D^{m−λ_p}` along their attaching faces, a long encoding this file does not
make; its cumulative form is the CW model `exists_cwComplex_homotopyEquiv`. Not statable at
the pins, and therefore not stated: the
Lusternik–Schnirelmann inequality in its categorical form (M4), which lacks
AlgebraicTopology's `lsCategoryCount` and is represented by the explicit critical
categorical cover; Morse approximation in the strong smooth topology (M3), which lacks
that topology on `C^∞⟮I, M; ℝ⟯`; and the Morse–Bott negative-disc-bundle attachment and
inequalities (M5), which lack the Morse–Bott predicate on normal bundles. Counts have
extended natural values before finiteness is proved.
-/

noncomputable section

namespace TauCetiRoadmap.MorseTheory
open scoped Manifold ContDiff
open Set

universe u

variable {E H : Type*} {M : Type u} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  [TopologicalSpace M] [T2Space M] [SecondCountableTopology M] [ChartedSpace H M]
  [IsManifold I ∞ M]

/-! ## M1: critical Hessians, indices and usable normal forms -/

/-- The critical set uses the native manifold derivative. -/
def criticalPoints (f : M → ℝ) : Set M :=
  {x | mvfderiv I f x = 0}

/-- The extended count of critical points of index `j`; an infinite set counts `⊤`. -/
def criticalCount (f : M → ℝ) (j : ℕ) : ℕ∞ :=
  {x | x ∈ criticalPoints (I := I) f ∧ TauCeti.manifoldMorseIndex I f x = j}.encard

/-- Extended count; infinite critical loci retain value infinity. -/
def totalCriticalCount (f : M → ℝ) : ℕ∞ :=
  (criticalPoints (I := I) f).encard

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

/-- A Morse function has finitely many critical points in every compact subset. -/
theorem finite_criticalPoints_inter (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    {K : Set M} (hK : IsCompact K) :
    (criticalPoints (I := I) f ∩ K).Finite := by
  sorry

/-- A proper Morse exhaustion has finite critical sets below each level when bounded below. -/
theorem finite_criticalPoints_sublevel (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hlower : ∃ a : ℝ, ∀ x, a ≤ f x) (b : ℝ) :
    (criticalPoints (I := I) f ∩ {x | f x ≤ b}).Finite := by
  sorry

/-! ## M2: compact-band deformation, handles and cells -/

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

/-- Compact-band no-critical deformation on actual sublevel topological spaces. -/
theorem exists_sublevelHomotopyEquiv (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ e : ContinuousMap.HomotopyEquiv {x : M | f x ≤ a} {x : M | f x ≤ b},
      ∀ x : {x : M | f x ≤ a}, (e x : M) = x := by
  sorry

/-- The inclusion of a lower sublevel into a higher one. -/
def sublevelInclusion (f : M → ℝ) (a b : ℝ) (hab : a ≤ b) :
    ContinuousMap {x : M | f x ≤ a} {x : M | f x ≤ b} :=
  ⟨fun x ↦ ⟨x.val, le_trans x.property hab⟩,
    continuous_subtype_val.subtype_mk _⟩

/-- The actual deformation homotopy is fixed on the entire lower sublevel. -/
theorem exists_sublevelDeformation
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b : ℝ) (hab : a < b) (hcompact : IsCompact (f ⁻¹' Icc a b))
    (hnocrit : ∀ x, a ≤ f x → f x ≤ b → x ∉ criticalPoints (I := I) f) :
    ∃ r : ContinuousMap {x : M | f x ≤ b} {x : M | f x ≤ a},
      (∀ x, r (sublevelInclusion f a b hab.le x) = x) ∧
      Nonempty (ContinuousMap.HomotopyRel
        ((sublevelInclusion f a b hab.le).comp r) (ContinuousMap.id _)
        {x : {x : M | f x ≤ b} | f x ≤ a}) := by
  sorry

/-- The CW model of a proper bounded-below Morse function (Milnor, *Morse Theory*,
Theorem 3.5): `M` is homotopy equivalent to a Hausdorff CW complex with exactly one cell of
dimension `λ` for each critical point of index `λ`, the cell counts compared as
extended natural numbers so that infinitely many critical points of one index give
infinitely many cells of that dimension. -/
theorem exists_cwComplex_homotopyEquiv (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (hp : IsProperMap f) (hlower : ∃ a : ℝ, ∀ x, a ≤ f x) :
    ∃ (X : Type u) (_ : TopologicalSpace X) (_ : T2Space X) (C : Set X)
      (cw : Topology.CWComplex C),
      Nonempty (ContinuousMap.HomotopyEquiv M C) ∧
        ∀ n : ℕ, ENat.card (cw.cell n) = criticalCount (I := I) f n := by
  sorry

/-! ## M4: strong inequalities and topology tests -/

/-- The `j`-th Betti number with coefficients in the field `k`: the dimension of the
`j`-th singular homology of `X`, computed by Mathlib's singular homology functor. -/
def bettiNumber (k : Type u) [Field k] (X : Type u) [TopologicalSpace X] (j : ℕ) : ℕ :=
  Module.finrank k
    (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} k) j).obj
      (ModuleCat.of k k)).obj (TopCat.of X))

/-- The strong Morse inequalities with coefficients in a field `k` (Milnor, *Morse
Theory*, §5): for a Morse function on a compact manifold there is a polynomial `Q` with
natural coefficients such that `Σ c_j t^j = Σ b_j t^j + (1 + t) Q(t)`, where `c_j` is the
number of critical points of index `j` and `b_j` the `j`-th Betti number. The identity is
stated coefficientwise in `ℕ∞`; its left side being finite is part of the claim. -/
theorem morse_inequalities [CompactSpace M] (f : M → ℝ) (hf : TauCeti.IsMorse I f)
    (k : Type u) [Field k] :
    ∃ Q : Polynomial ℕ, ∀ j : ℕ,
      criticalCount (I := I) f j =
        ((bettiNumber k M j + ((1 + Polynomial.X) * Q).coeff j : ℕ) : ℕ∞) := by
  sorry

/-- Boundaryless chart transport of the native normed-space Fermat theorem. -/
theorem isLocalMin_mem_criticalPoints (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f) {x : M} (hx : IsLocalMin f x) :
    x ∈ criticalPoints (I := I) f := by
  sorry

/-- A smooth function on a nonempty compact manifold has a critical point. -/
theorem criticalPoints_nonempty_of_compact [CompactSpace M] [Nonempty M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) :
    (criticalPoints (I := I) f).Nonempty := by
  sorry

/-- This deformation uses a critical-value isolation band and no Morse hypothesis. -/
theorem exists_degenerateCriticalLevelDeformation [CompactSpace M]
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
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
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (a b δ : ℝ) (hab : a < b) (hδ : 0 < δ)
    (hnocrit : ∀ x, a - δ ≤ f x → f x ≤ b + δ →
      x ∉ criticalPoints (I := I) f) :
    ∃ Φ : C(unitInterval × M, M),
      (∀ x, Φ (0, x) = x) ∧
      (∀ t x, f (Φ (t, x)) ≤ f x) ∧
      (∀ x, f x ≤ b → f (Φ (1, x)) < a) := by
  sorry

/-- The categorical cover of a compact manifold by as many contractible-in-`M` open sets as
a smooth function with finitely many critical points has critical points; the README
compares it with AlgebraicTopology's Lusternik–Schnirelmann category. -/
theorem exists_criticalCategoricalCover [CompactSpace M]
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

/-- A Morse function with finite critical set, the witness needed before the finite
minimum of critical counts is defined. -/
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
theorem nonempty_morseFiniteWitness [CompactSpace M] :
    Nonempty (MorseFiniteWitness (I := I) (M := M)) := by
  sorry

/-- The minimum over all smooth functions with finitely many critical points of the number
of critical points, defined once a witness shows that there is such a function. -/
noncomputable def minimumCriticalCount (w : MorseFiniteWitness (I := I) (M := M)) : ℕ := by
  classical
  refine Nat.find (p := fun n ↦ n ∈ finiteSmoothCriticalCounts (I := I) (M := M)) ?_
  obtain ⟨n, hn⟩ := w.finite.exists_encard_eq_coe
  exact ⟨n, w.function, w.morse.contMDiff, hn⟩

/-- The finite minimum also minimizes the extended counts of all smooth functions. -/
theorem minimumCriticalCount_eq_extended_sInf
    (w : MorseFiniteWitness (I := I) (M := M)) :
    (minimumCriticalCount w : ℕ∞) =
      sInf {m : ℕ∞ | ∃ f : M → ℝ,
        ContMDiff I 𝓘(ℝ) ∞ f ∧ totalCriticalCount (I := I) f = m} := by
  sorry

/-! ## M4.1: the all-smooth two-critical-point bridge

No `IsMorse` or nondegeneracy assumption is added to these targets. The second theorem is
the two-open-cell recognition of the sphere, from Brown's generalized Schoenflies theorem
(Brown 1960, Theorem 5) as owned in README M4.1. -/

/-- Two actual Euclidean open sets obtained by a uniform compact-flow estimate. -/
theorem exists_twoEuclideanOpenCover_of_two_criticalPoints
    [CompactSpace M] [ConnectedSpace M]
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

/-- Degenerate Reeb–Milnor/Rosen: exactly two critical POINTS, no Hessian hypothesis. -/
theorem nonempty_homeomorph_sphere_of_two_criticalPoints
    [CompactSpace M] [ConnectedSpace M]
    (hdim : 0 < Module.finrank ℝ E) (f : M → ℝ)
    (hf : ContMDiff I 𝓘(ℝ) ∞ f)
    (hcrit : totalCriticalCount (I := I) f = 2) :
    Nonempty (M ≃ₜ Metric.sphere
      (0 : EuclideanSpace ℝ (Fin (Module.finrank ℝ E + 1))) 1) := by
  obtain ⟨U, V, hcover, hU, hV⟩ :=
    exists_twoEuclideanOpenCover_of_two_criticalPoints (I := I) hdim f hf hcrit
  exact nonempty_homeomorph_sphere_of_two_euclidean_opens
    (Module.finrank ℝ E) hdim U V hcover hU hV

/-! ## M6: gradient convergence and exponential decay -/

section Gradient

open scoped Bundle

/-- The gradient of `f` for a Riemannian metric on the tangent bundle, DifferentialGeometry
Layer 12.2's definition restated so that the M6 headlines are statable: the pinned
fibrewise Riesz dual `Riemannian.Tensor.rieszDual` of the differential `df_x` for the inner
product on `TangentSpace I x`, so that `⟪mgradient f x, v⟫ = df_x v`. -/
def mgradient [Bundle.RiemannianBundle (fun (x : M) ↦ TangentSpace I x)]
    (f : M → ℝ) (x : M) : TangentSpace I x :=
  Riemannian.Tensor.rieszDual (I := I) x (mfderiv I 𝓘(ℝ) f x)

/-- M6: a forward negative-gradient trajectory of a Morse function for a smooth metric,
trapped in a compact set `K`, converges to a critical point in `K`: the ω-limit set is
nonempty, connected and consists of critical points, which are isolated. -/
theorem tendsto_of_isMIntegralCurveOn_neg_mgradient
    [Bundle.RiemannianBundle (fun (x : M) ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun (x : M) ↦ TangentSpace I x)]
    (f : M → ℝ) (hf : TauCeti.IsMorse I f) (γ : ℝ → M)
    (hγ : IsMIntegralCurveOn γ (fun x ↦ -mgradient (I := I) f x) (Set.Ici 0))
    {K : Set M} (hK : IsCompact K) (hmaps : Set.MapsTo γ (Set.Ici 0) K) :
    ∃ p ∈ K, p ∈ criticalPoints (I := I) f ∧ Filter.Tendsto γ Filter.atTop (nhds p) := by
  sorry

/-- M6: a forward negative-gradient trajectory of a Morse function for a smooth metric
that converges to `p` does so exponentially for the Riemannian distance: the limit is a
nondegenerate critical point, and the trajectory lies in its stable manifold. The manifold
`N` carries the extended distance of its Riemannian metric (`IsRiemannianManifold`), which
replaces the standing topology; the finite entry time is absorbed into `C`. -/
theorem exists_edist_le_exp_of_tendsto_neg_mgradient
    {N : Type u} [EMetricSpace N] [SecondCountableTopology N] [ChartedSpace H N]
    [IsManifold I ∞ N]
    [Bundle.RiemannianBundle (fun (x : N) ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun (x : N) ↦ TangentSpace I x)]
    [IsRiemannianManifold I N]
    (f : N → ℝ) (hf : TauCeti.IsMorse I f) (γ : ℝ → N)
    (hγ : IsMIntegralCurveOn γ (fun x ↦ -mgradient (I := I) f x) (Set.Ici 0))
    {p : N} (hp : Filter.Tendsto γ Filter.atTop (nhds p)) :
    ∃ C c : ℝ, 0 < c ∧ ∀ t : ℝ, 0 ≤ t →
      edist (γ t) p ≤ ENNReal.ofReal (C * Real.exp (-c * t)) := by
  sorry

end Gradient

end TauCetiRoadmap.MorseTheory
