import Mathlib
import TauCeti.Analysis.Fredholm.LevelSet.GlobalParametric

/-!
# De Rham cohomology, the de Rham theorem, Poincaré duality and degree: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Only the headline statements that can be written against the pinned Mathlib and Tau Ceti are
stated. De Rham cohomology, the Mayer–Vietoris sequences, the de Rham homomorphism, the Poincaré
pairing and the mapping degree are built on the manifold differential forms, exterior derivative,
orientations and integration of the DifferentialGeometry roadmap (its layers 0–2 and 5), which are
not yet in Tau Ceti; those targets are specified in `README.md` and marked there as having no Lean
statement here. What remains statable is the flat relative Poincaré lemma (DR.1.2), exactness of
continuous planar 1-forms with local potentials on simply connected domains (DR.1.3), the
Mayer–Vietoris induction principle (DR.3.9), regular values and Sard's theorem (DR.5.1–DR.5.2),
finite-parameter relative transversality in flat coordinates (DR.5.3), finite fibres over regular
values (DR.5.4) and the hairy ball theorem (DR.6).
-/

open Set MeasureTheory
open scoped ContDiff Topology Manifold InnerProductSpace

namespace TauCetiRoadmap.DeRhamCohomologyAndDuality

/-! ## Layer 1: the de Rham complex and cohomology -/

section PoincareLemma

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **DR.1.2, the relative flat Poincaré lemma.** On a star-convex set with unique
differentiability (a boundary-chart image is star-convex but not open), a closed `C^n` form,
`n ≥ 1`, with values in a complete space has a `C^n` primitive. ⚠ Completeness of `F` is
necessary: a smooth `c₀₀`-valued `1`-form on `ℝ` has no local primitive. -/
theorem exists_extDerivWithin_eq_of_starConvex [CompleteSpace F] {s : Set E} {x₀ : E}
    (hs : StarConvex ℝ x₀ s) (hs' : UniqueDiffOn ℝ s) {n : WithTop ℕ∞} (hn : 1 ≤ n) {k : ℕ}
    {φ : E → E [⋀^Fin (k + 1)]→L[ℝ] F} (hφ : ContDiffOn ℝ n φ s)
    (hclosed : EqOn (extDerivWithin φ s) 0 s) :
    ∃ η : E → E [⋀^Fin k]→L[ℝ] F, ContDiffOn ℝ n η s ∧ EqOn (extDerivWithin η s) φ s :=
  sorry

end PoincareLemma

section ContinuousPaths

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **DR.1.3.** A continuous real `1`-form on an open `Ω ⊆ ℂ`, given as its covector field
`φ : C(Ω, ℂ →L[ℝ] F)`, has local potentials: every point has a disc in `Ω` on which some ambient
`C¹` function differentiates to `φ`. -/
def HasLocalPotentials (Ω : Set ℂ) (φ : C(Ω, ℂ →L[ℝ] F)) : Prop :=
  ∀ z : Ω, ∃ r > 0, ∃ hD : Metric.ball (z : ℂ) r ⊆ Ω, ∃ g : ℂ → F,
    ContDiffOn ℝ 1 g (Metric.ball (z : ℂ) r) ∧
      ∀ w (hw : w ∈ Metric.ball (z : ℂ) r), HasFDerivAt g (φ ⟨w, hD hw⟩) w

/-- **DR.1.3, exactness on simply connected domains.** A continuous `1`-form with local
potentials on a simply connected open subset of `ℂ` has a global `C¹` potential; the proof
goes through the continuous path integral and its homotopy invariance. -/
theorem exists_hasFDerivAt_of_simplyConnected {Ω : Set ℂ} (hΩ : IsOpen Ω)
    [SimplyConnectedSpace Ω] {φ : C(Ω, ℂ →L[ℝ] F)} (hφ : HasLocalPotentials Ω φ) :
    ∃ g : ℂ → F, ContDiffOn ℝ 1 g Ω ∧ ∀ w : Ω, HasFDerivAt g (φ w) w :=
  sorry

end ContinuousPaths

/-! ## Layer 3: the de Rham theorem -/

section MayerVietorisPrinciple

/-- **DR.3.9, the Mayer–Vietoris induction principle**, consumed by the de Rham theorem (DR.3.9)
and Poincaré duality (DR.4.3): a property of opens that holds on a basis stable under binary
intersection, passes to `U ⊔ V` from `U`, `V` and `U ⊓ V`, and passes to countable disjoint
unions, holds on every open. ⚠ The countable disjoint unions are needed: cohomology does not
commute with increasing unions. -/
theorem mayerVietoris_induction {X : Type*} [TopologicalSpace X] [T2Space X]
    [LocallyCompactSpace X] [SecondCountableTopology X] (P : TopologicalSpace.Opens X → Prop)
    (B : Set (TopologicalSpace.Opens X)) (hB : TopologicalSpace.Opens.IsBasis B)
    (hB_inf : ∀ U ∈ B, ∀ V ∈ B, U ⊓ V ∈ B) (hbot : P ⊥) (hbase : ∀ U ∈ B, P U)
    (hsup : ∀ U V, P U → P V → P (U ⊓ V) → P (U ⊔ V))
    (hdisjoint : ∀ s : ℕ → TopologicalSpace.Opens X, Pairwise (fun i j ↦ Disjoint (s i) (s j)) →
      (∀ n, P (s n)) → P (⨆ n, s n)) :
    ∀ U, P U :=
  sorry

end MayerVietorisPrinciple

/-! ## Layer 5: the Brouwer mapping degree -/

section RegularValues

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} {M : Type*} [TopologicalSpace M] [ChartedSpace H M]
  {E' H' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {J : ModelWithCorners ℝ E' H'} {N : Type*} [TopologicalSpace N] [ChartedSpace H' N]

variable (I J) in
/-- **DR.5.1.** A regular point: the manifold derivative is surjective. -/
def IsRegularPoint (f : M → N) (x : M) : Prop := Function.Surjective (mfderiv I J f x)

variable (I J) in
/-- **DR.5.1.** A regular value: every point of the fibre is regular (vacuous off the image). -/
def IsRegularValue (f : M → N) (y : N) : Prop := ∀ x, f x = y → IsRegularPoint I J f x

/-- **DR.5.2, Sard's theorem on manifolds**: the regular values of a smooth map from a
boundaryless Hausdorff σ-compact finite-dimensional manifold are dense, in all dimensions. -/
theorem dense_isRegularValue [FiniteDimensional ℝ E] [FiniteDimensional ℝ E']
    [IsManifold I ∞ M] [IsManifold J ∞ N] [T2Space M] [SigmaCompactSpace M]
    [BoundarylessManifold I M] {f : M → N} (hf : ContMDiff I J ∞ f) :
    Dense {y | IsRegularValue I J f y} :=
  sorry

/-- **DR.5.4, finite fibres.** Over a regular value of a `C¹` map between manifolds of equal
finite dimension, the fibre of a compact source is finite. -/
theorem finite_preimage_of_isRegularValue [FiniteDimensional ℝ E] [FiniteDimensional ℝ E']
    [CompactSpace M] [T2Space M] [T2Space N] [IsManifold I 1 M] [IsManifold J 1 N]
    (hdim : Module.finrank ℝ E = Module.finrank ℝ E') {f : M → N} (hf : ContMDiff I J 1 f)
    {y : N} (hy : IsRegularValue I J f y) : (f ⁻¹' {y}).Finite :=
  sorry

end RegularValues

section SharpSard

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]

/-- **DR.5.2, the sharp Morse–Sard theorem** on an open set: for a `C^k` map with
`k > max(dim E − dim F, 0)`, the critical values are Haar-null [Hirsch, Ch. 3, Thm. 1.3]. -/
theorem addHaar_image_criticalPoints_eq_zero_of_contDiffOn (μ : Measure F)
    [μ.IsAddHaarMeasure] {U : Set E} (hU : IsOpen U) {k : ℕ}
    (hk : Module.finrank ℝ E - Module.finrank ℝ F < k) {f : E → F}
    (hf : ContDiffOn ℝ k f U) :
    μ (f '' {x ∈ U | ¬ Function.Surjective (fderiv ℝ f x)}) = 0 :=
  sorry

end SharpSard

section FiniteParameterTransversality

variable {E V W P : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup W] [NormedSpace ℝ W] [NormedAddCommGroup P] [NormedSpace ℝ P]

/-- **DR.5.3.** The incidence equation `F(x, p) − j(y)` of a parametrized family against a map
`j`, with the source coordinates before the parameter, as in `TauCeti.IsRegularParameter`. -/
def incidenceEquation (F : E × P → V) (j : W → V) : (E × W) × P → V :=
  fun z ↦ F (z.1.1, z.2) - j z.1.2

/-- **DR.5.3.** The slice at `p` is transverse to `j`: at every equality `F(x, p) = j(y)` the map
`(u, v) ↦ d_x F(x, p) u − dj(y) v` is onto. -/
def IsRegularIncidenceParameter (F : E × P → V) (j : W → V) (p : P) : Prop :=
  TauCeti.IsRegularParameter (incidenceEquation F j) 0 p

/-- **DR.5.3.** The relative translation family `f(x) + β(x) p`, which fixes the zero set of the
cutoff `β`. -/
def relativeTranslate (f : E → V) (β : E → ℝ) (p : V) (x : E) : V :=
  f x + β x • p

variable [FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [FiniteDimensional ℝ W]
  [FiniteDimensional ℝ P]

/-- **DR.5.3, the null refinement**, in flat coordinates: under universal transversality the
parameters whose slice is not transverse form a Haar-null set (outer measure). -/
theorem addHaar_setOf_not_isRegularIncidenceParameter [MeasurableSpace P] [BorelSpace P]
    (μ : Measure P) [μ.IsAddHaarMeasure] {F : E × P → V} {j : W → V}
    (hF : ContDiff ℝ ∞ F) (hj : ContDiff ℝ ∞ j)
    (htotal : ∀ z, incidenceEquation F j z = 0 →
      Function.Surjective (fderiv ℝ (incidenceEquation F j) z)) :
    μ {p | ¬ IsRegularIncidenceParameter F j p} = 0 :=
  sorry

/-- **DR.5.3, avoidance**: if `dim E + dim W < dim V`, a transverse slice meets `j` nowhere. -/
theorem isRegularIncidenceParameter_avoids_of_finrank_lt (F : E × P → V) (j : W → V) (p : P)
    (hdim : Module.finrank ℝ E + Module.finrank ℝ W < Module.finrank ℝ V)
    (hp : IsRegularIncidenceParameter F j p) :
    ∀ x y, F (x, p) ≠ j y :=
  sorry

/-- **DR.5.3, small relative perturbations**: if `f` is already transverse to `j` on the zero set
`C` of a nonnegative smooth cutoff `β`, arbitrarily small parameters make the relative translate
transverse to `j` while fixing `f` on `C`. -/
theorem exists_isRegularIncidenceParameter_relativeTranslate (f : E → V) (β : E → ℝ)
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

/-! ## Layer 6: the hairy ball theorem -/

section HairyBall

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  {n : ℕ} [Fact (Module.finrank ℝ E = n + 1)]

/-- **DR.6.1, the hairy ball theorem**: on an even-dimensional sphere (`finrank ℝ E = n + 1`,
`n` even) every continuous tangent vector field vanishes somewhere. Tangency is
`⟪w x, x⟫_ℝ = 0`. -/
theorem exists_eq_zero_of_inner_eq_zero (hn : Even n) {w : Metric.sphere (0 : E) 1 → E}
    (hw : Continuous w) (ht : ∀ x : Metric.sphere (0 : E) 1, ⟪w x, (x : E)⟫_ℝ = 0) :
    ∃ x, w x = 0 :=
  sorry

/-- **DR.6.2, the section form**: every continuous section of the tangent bundle of an
even-dimensional sphere vanishes somewhere. -/
theorem exists_eq_zero_of_continuous_section (hn : Even n)
    {v : (x : Metric.sphere (0 : E) 1) → TangentSpace (𝓡 n) x}
    (hv : Continuous (fun x ↦ (⟨x, v x⟩ : TangentBundle (𝓡 n) (Metric.sphere (0 : E) 1)))) :
    ∃ x, v x = 0 :=
  sorry

/-- **DR.6.2, the dichotomy**: `Sⁿ` carries a nowhere-vanishing continuous tangent field exactly
when `n` is odd. -/
theorem exists_nonvanishing_tangent_field_iff :
    (∃ w : Metric.sphere (0 : E) 1 → E, Continuous w ∧
      (∀ x : Metric.sphere (0 : E) 1, ⟪w x, (x : E)⟫_ℝ = 0) ∧ ∀ x, w x ≠ 0) ↔ Odd n :=
  sorry

end HairyBall

end TauCetiRoadmap.DeRhamCohomologyAndDuality
