module

import Mathlib
import TauCeti.Analysis.Fredholm.LevelSet.GlobalParametric

/-!
# Differential geometry, Part II — relative de Rham theory, fundamental classes and relative transversality: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the few definitions
their statements need.

Stated here: exactness of continuous planar `1`-forms with local potentials on simply connected
domains (Layer 1), inward domination of a manifold with corners by its interior (Layer 2), and
the Haar-null and relative-perturbation theorems of finite-parameter relative transversality in
flat coordinates (Layer 5).

Not statable at the pins:

* the transfer of smooth-chain equivalences and the relative smooth chain comparison (§§2.3–2.4)
  need DifferentialGeometry 8.3's smooth singular chain complex, which is not in Tau Ceti;
* the relative de Rham complex and the relative de Rham isomorphism (§§3.1–3.3) need the manifold
  de Rham complex and `deRhamHom` of DifferentialGeometry 6.1 and 8.4;
* the fundamental-class integration comparison (§4.1) needs integration of top forms
  (DifferentialGeometry 5.2), the de Rham homomorphism and AlgebraicTopology 6.3's fundamental
  classes;
* the smooth-boundary compatibility formula (§4.2) needs, in addition, the relative de Rham class
  of §3.3 and Stokes' theorem (DifferentialGeometry 5.3).
-/

open Set MeasureTheory
open scoped ContDiff Topology Manifold

namespace TauCetiRoadmap.DeRhamCohomologyAndDuality

/-! ## Layer 1: continuous planar forms with local potentials -/

section ContinuousPaths

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **§1.1.** A continuous real `1`-form on an open `Ω ⊆ ℂ`, given as its covector field
`φ : C(Ω, ℂ →L[ℝ] F)`, has local potentials: every point has a disc in `Ω` on which some ambient
`C¹` function differentiates to `φ`. -/
def HasLocalPotentials (Ω : Set ℂ) (φ : C(Ω, ℂ →L[ℝ] F)) : Prop :=
  ∀ z : Ω, ∃ r > 0, ∃ hD : Metric.ball (z : ℂ) r ⊆ Ω, ∃ g : ℂ → F,
    ContDiffOn ℝ 1 g (Metric.ball (z : ℂ) r) ∧
      ∀ w (hw : w ∈ Metric.ball (z : ℂ) r), HasFDerivAt g (φ ⟨w, hD hw⟩) w

/-- **§1.3, exactness on simply connected domains.** A continuous `1`-form with local
potentials on a simply connected open subset of `ℂ` has a global `C¹` potential; the proof goes
through the continuous path integral of §1.2 and its homotopy invariance. No completeness of `F`
is needed: the path integral is a finite sum of potential differences. -/
theorem exists_hasFDerivAt_of_simplyConnected {Ω : Set ℂ} (hΩ : IsOpen Ω)
    [SimplyConnectedSpace Ω] {φ : C(Ω, ℂ →L[ℝ] F)} (hφ : HasLocalPotentials Ω φ) :
    ∃ g : ℂ → F, ContDiffOn ℝ 1 g Ω ∧ ∀ w : Ω, HasFDerivAt g (φ w) w :=
  sorry

end ContinuousPaths

/-! ## Layer 2: smooth chains over manifolds with boundary and corners -/

section InwardDomination

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]

/-- **§2.2, inward domination.** A Hausdorff σ-compact smooth manifold over any
finite-dimensional real model with corners is smoothly deformed into its interior: there are a
smooth `r : M → M` with values in `I.interior M` and a smooth homotopy `Φ : ℝ × M → M` with
`Φ(0, ·) = r`, `Φ(1, ·) = id`, every `Φ(t, ·)` preserving the interior. It is built from the
forward semiflow `ψ` of a strictly inward vector field, `Φ(t, x) = ψ((1 − t)², x)`. -/
theorem exists_smooth_inward_deformation (I : ModelWithCorners ℝ E H) [FiniteDimensional ℝ E]
    [IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] :
    ∃ (r : M → M) (Φ : ℝ × M → M), ContMDiff I I ∞ r ∧
      ContMDiff (𝓘(ℝ, ℝ).prod I) I ∞ Φ ∧ (∀ x, r x ∈ I.interior M) ∧
      (∀ x, Φ (0, x) = r x) ∧ (∀ x, Φ (1, x) = x) ∧
      ∀ t x, x ∈ I.interior M → Φ (t, x) ∈ I.interior M :=
  sorry

end InwardDomination

/-! ## Layer 5: finite-parameter relative transversality -/

section FiniteParameterTransversality

variable {E V W P : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W] [NormedAddCommGroup P] [NormedSpace ℝ P]

/-- **§5.1.** The incidence equation `F(x, p) − j(y)` of a parametrized family against a map
`j`, with the source coordinates before the parameter, as in `TauCeti.IsRegularParameter`. -/
def incidenceEquation (F : E × P → V) (j : W → V) : (E × W) × P → V :=
  fun z ↦ F (z.1.1, z.2) - j z.1.2

/-- **§5.1.** The slice at `p` is transverse to `j`: at every equality `F(x, p) = j(y)` the map
`(u, v) ↦ d_x F(x, p) u − dj(y) v` is onto. -/
def IsRegularIncidenceParameter (F : E × P → V) (j : W → V) (p : P) : Prop :=
  TauCeti.IsRegularParameter (incidenceEquation F j) 0 p

/-- **§5.3.** The relative translation family `f(x) + β(x) p`, which fixes `f` on the zero set
of the cutoff `β`. -/
def relativeTranslate (f : E → V) (β : E → ℝ) (p : V) (x : E) : V :=
  f x + β x • p

/-- **§5.2, generic parameters.** For smooth maps between finite-dimensional spaces, under
universal transversality the parameters whose slice is not transverse form a Haar-null set
(outer measure). -/
theorem addHaar_setOf_not_isRegularIncidenceParameter [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ V] [FiniteDimensional ℝ W] [FiniteDimensional ℝ P]
    [MeasurableSpace P] [BorelSpace P]
    (μ : Measure P) [μ.IsAddHaarMeasure] {F : E × P → V} {j : W → V}
    (hF : ContDiff ℝ ∞ F) (hj : ContDiff ℝ ∞ j)
    (htotal : ∀ z, incidenceEquation F j z = 0 →
      Function.Surjective (fderiv ℝ (incidenceEquation F j) z)) :
    μ {p | ¬ IsRegularIncidenceParameter F j p} = 0 :=
  sorry

/-- **§5.3, small relative perturbations.** If `f` is already transverse to `j` on the zero set
`C` of a nonnegative smooth cutoff `β`, arbitrarily small parameters make the relative
translate transverse to `j` while fixing `f` on `C`. -/
theorem exists_isRegularIncidenceParameter_relativeTranslate [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ V] [FiniteDimensional ℝ W] (f : E → V) (β : E → ℝ)
    (j : W → V) (C : Set E) (hf : ContDiff ℝ ∞ f) (hβ : ContDiff ℝ ∞ β) (hj : ContDiff ℝ ∞ j)
    (hnonneg : ∀ x, 0 ≤ β x) (hzero : ∀ x, β x = 0 ↔ x ∈ C)
    (hgood : ∀ x ∈ C, ∀ y, f x = j y →
      Function.Surjective ((fderiv ℝ f x).coprod (-fderiv ℝ j y)))
    {r : ℝ} (hr : 0 < r) :
    ∃ p : V, ‖p‖ < r ∧
      IsRegularIncidenceParameter (fun z : E × V ↦ relativeTranslate f β z.2 z.1) j p ∧
      EqOn (relativeTranslate f β p) f C :=
  sorry

end FiniteParameterTransversality

end TauCetiRoadmap.DeRhamCohomologyAndDuality
