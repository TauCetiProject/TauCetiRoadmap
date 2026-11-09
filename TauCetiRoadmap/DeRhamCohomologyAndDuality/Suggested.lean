module

import Mathlib
import TauCeti.Analysis.Fredholm.LevelSet.GlobalParametric
import TauCeti.Geometry.Manifold.DifferentialForm.LocalPrimitive
import TauCeti.Geometry.Manifold.SmoothSingular.Basic
import TauCeti.AlgebraicTopology.Singular.Subdivision.Small.Chains

/-!
# Differential geometry, Part II — relative de Rham theory, fundamental classes and relative transversality: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, with the few definitions
their statements need.

Stated here: exactness of `1`-forms with local primitives on simply connected manifolds
(Layer 1), inward domination of a manifold with corners by its interior and the relative smooth
chain comparison (Layer 2), and, for finite-parameter relative transversality (Layer 5), the
Haar-null theorem for incidence parameters, the relative-perturbation theorem in flat
coordinates, and the Haar-null theorem for relative perturbations of a map from a boundaryless
manifold, transverse on the zero set of the cutoff to a map from a second boundaryless manifold
into a finite-dimensional vector space.

Not statable at the pins:

* the relative de Rham isomorphism (§3.3) needs the de Rham cochain map from smooth forms to
  smooth singular cochains (`deRhamHom`, DifferentialGeometry 8.4): Tau Ceti integrates a form over
  a single smooth simplex (`TauCeti.SmoothSimplex.integral`) but has no Stokes' theorem for smooth
  simplices, hence no cochain map. The relative complex of §3.1 itself is definable from
  `TauCeti.deRhamComplex.map`, `HomologicalComplex.extend` and `CochainComplex.mappingCocone`,
  with Tau Ceti's coordinates `CochainComplex.mappingCocone.relativeCoordinates`;
* the fundamental-class integration comparison (§4.1) needs that cochain map and the homological
  orientation of a tangent orientation (AlgebraicTopology 6.3): Tau Ceti has
  `TauCeti.HomologicalOrientation` with its fundamental classes, and from a
  `TauCeti.Manifold.Orientation` only the local orientation at a single point,
  `TauCeti.localOrientationOfManifoldOrientation`;
* the smooth-boundary compatibility formula (§4.2) needs, in addition, the relative de Rham class
  of §3.3 and the oriented relative class of a compact manifold with boundary
  (AlgebraicTopology 6.3).
-/

open Set MeasureTheory CategoryTheory
open scoped ContDiff Topology Manifold

namespace TauCetiRoadmap.DeRhamCohomologyAndDuality

/-! ## Layer 1: `1`-forms with local primitives along continuous paths -/

section LocalPrimitives

variable {E H M F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **§1.3, exactness on simply connected manifolds.** A `1`-form with local primitives on a
simply connected `C¹` manifold over any real model with corners has a global primitive. No
regularity of `φ`, completeness of `F`, finite dimensionality or Hausdorff property is assumed:
the proof lifts the identity of `M` through the covering space `TauCeti.PrimitiveSpace φ` of
local primitives (§1.2). For a closed `C^r` form with complete coefficients on a
finite-dimensional Hausdorff manifold this is
`TauCeti.exists_mextDeriv_eq_of_simplyConnectedSpace`. -/
theorem exists_isPrimitiveOn_univ_of_simplyConnectedSpace [IsManifold I 1 M]
    [SimplyConnectedSpace M] {φ : TauCeti.RoughForm I M F 1}
    (hφ : ∀ x : M, ∃ (g : M → F) (U : Set M), x ∈ U ∧ TauCeti.IsPrimitiveOn φ g U) :
    ∃ g : M → F, TauCeti.IsPrimitiveOn φ g univ :=
  sorry

end LocalPrimitives

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

section RelativeSmoothChains

variable {E H : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) (X : Type) [TopologicalSpace X] [ChartedSpace H X]

/-- **§2.4.** The pair formed by the singular simplicial set of `X` and its subcomplex of the
singular simplices with image in `W`; its relative chains are `C(X)/C(W)`. -/
noncomputable abbrev singularPairIn (W : Set X) : SSetPair :=
  ((TopCat.of X).smallSingularSubcomplex ![W]).pair

/-- **§2.4.** The pair formed by the smooth singular simplices of `X` and those with image in
`W`; its relative chains are `C^∞(X)/C^∞(W)` when `W` is open. -/
noncomputable abbrev smoothPairIn (W : Set X) : SSetPair :=
  SSetPair.of (SSet.Subcomplex.homOfLE
    (inf_le_left : TauCeti.smoothSingularSubcomplex I X ⊓
      (TopCat.of X).smallSingularSubcomplex ![W] ≤ TauCeti.smoothSingularSubcomplex I X))

/-- **§2.4.** The inclusion of the smooth pair of `(X, W)` into its singular pair. -/
noncomputable abbrev smoothPairToSingular (W : Set X) :
    smoothPairIn I X W ⟶ singularPairIn X W :=
  SSetPair.homMk (SSet.Subcomplex.homOfLE inf_le_right)
    (TauCeti.smoothSingularSubcomplex I X).ι

/-- **§2.4, the relative smooth chain comparison.** For an open `W` in a Hausdorff σ-compact
smooth manifold `X` over any finite-dimensional real model with corners, the inclusion of
relative smooth chains `C^∞(X)/C^∞(W)` into relative singular chains `C(X)/C(W)`, with real
coefficients, is a quasi-isomorphism. The proof is Tau Ceti's five-lemma comparison
`SSetPair.quasiIso_chainComplexMap`, from DifferentialGeometry 8.3's absolute comparisons for `X`
and for `W` (the absolute case is Lee, *Introduction to Smooth Manifolds*, Thm. 18.7). -/
theorem quasiIso_smoothPairToSingular [FiniteDimensional ℝ E] [IsManifold I ∞ X] [T2Space X]
    [SigmaCompactSpace X] {W : Set X} (hW : IsOpen W) :
    QuasiIso (SSetPair.chainComplexMap (smoothPairToSingular I X W) (ModuleCat.of ℝ ℝ)) :=
  sorry

end RelativeSmoothChains

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

/-- **§5.3.** The relative translation family `f(x) + β(x) p` on any domain `X`, which fixes
`f` on the zero set of the cutoff `β`. -/
def relativeTranslate {X : Type*} (f : X → V) (β : X → ℝ) (p : V) (x : X) : V :=
  f x + β x • p

/-- **§5.2, generic parameters.** For smooth maps between finite-dimensional spaces, under
universal transversality the parameters whose slice is not transverse form a Haar-null set
(outer measure). Transversality of the slice to `j` at `(x, y)` is transversality of
`(x, y) ↦ (F(x, p), j(y))` to the diagonal of `V × V`, so this is the flat case of parametric
transversality to a submanifold (Lee, *Introduction to Smooth Manifolds*, Thm. 6.35), proved by
flat Sard on the incidence manifold. -/
theorem addHaar_setOf_not_isRegularIncidenceParameter [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ V] [FiniteDimensional ℝ W] [FiniteDimensional ℝ P]
    [MeasurableSpace P] [BorelSpace P]
    (μ : Measure P) [μ.IsAddHaarMeasure] {F : E × P → V} {j : W → V}
    (hF : ContDiff ℝ ∞ F) (hj : ContDiff ℝ ∞ j)
    (htotal : ∀ z, incidenceEquation F j z = 0 →
      Function.Surjective (fderiv ℝ (incidenceEquation F j) z)) :
    μ {p | ¬ IsRegularIncidenceParameter F j p} = 0 :=
  sorry

/-- **§5.3, small relative perturbations in flat coordinates.** If `f : E → V` is already
transverse to `j : W → V` on the zero set `C` of a nonnegative smooth cutoff `β`, arbitrarily
small parameters are regular incidence parameters of the relative translation family, so the
relative translate is transverse to `j`, and it fixes `f` on `C`. -/
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

section ManifoldTransversality

variable {EM HM M EN HN N V : Type*}
  [NormedAddCommGroup EM] [NormedSpace ℝ EM] [TopologicalSpace HM]
  [TopologicalSpace M] [ChartedSpace HM M]
  [NormedAddCommGroup EN] [NormedSpace ℝ EN] [TopologicalSpace HN]
  [TopologicalSpace N] [ChartedSpace HN N]
  [NormedAddCommGroup V] [NormedSpace ℝ V]

/-- **§5.3.** A map `g : M → V` is transverse to `j : N → V` at `x ∈ M` when, at every `y ∈ N`
with `g x = j y`, the map `(u, v) ↦ dg(x) u − dj(y) v` from `T_x M × T_y N` to `V` is onto; it
holds vacuously when `g x` is not a value of `j`. On normed spaces, for smooth `F : E × P → V`
and `j`, the slice `F(·, p)` is transverse to `j` at every point exactly when `p` is a regular
incidence parameter, `mfderiv` being `fderiv` there. -/
def IsTransverseAt (I : ModelWithCorners ℝ EM HM) (J : ModelWithCorners ℝ EN HN)
    (g : M → V) (j : N → V) (x : M) : Prop :=
  ∀ y, g x = j y → Function.Surjective
    ((mfderiv I 𝓘(ℝ, V) g x : EM →L[ℝ] V).coprod (-(mfderiv J 𝓘(ℝ, V) j y : EN →L[ℝ] V)))

/-- **§5.3, generic relative perturbations on manifolds.** Let `M` and `N` be second-countable
boundaryless smooth manifolds over finite-dimensional real models and `f : M → V`, `j : N → V`
smooth maps into a finite-dimensional space. If `f` is transverse to `j` at every zero of a
nonnegative smooth `β : M → ℝ`, then the parameters `p` for which the relative translate
`f + β p` fails to be transverse to `j` at some point of `M` form a set that is null for every
additive Haar measure on `V` (outer measure); every translate equals `f` on the zero set of `β`.
The relative translation family is universally transverse, and the local form of §5.2 applies in
countably many products of charts of `M` and `N`. Parametric transversality to an embedded
submanifold is Lee, *Introduction to Smooth Manifolds*, Thm. 6.35; the form against a map, for
relative translation families, is this roadmap's, its cutoff argument extending Thm. 6.36 from
embedded submanifolds to maps. -/
theorem addHaar_setOf_not_forall_isTransverseAt_relativeTranslate
    (I : ModelWithCorners ℝ EM HM) (J : ModelWithCorners ℝ EN HN) [FiniteDimensional ℝ EM]
    [FiniteDimensional ℝ EN] [FiniteDimensional ℝ V] [IsManifold I ∞ M]
    [BoundarylessManifold I M] [SecondCountableTopology M] [IsManifold J ∞ N]
    [BoundarylessManifold J N] [SecondCountableTopology N] [MeasurableSpace V] [BorelSpace V]
    (μ : Measure V) [μ.IsAddHaarMeasure] {f : M → V} {β : M → ℝ} {j : N → V}
    (hf : ContMDiff I 𝓘(ℝ, V) ∞ f) (hβ : ContMDiff I 𝓘(ℝ) ∞ β) (hj : ContMDiff J 𝓘(ℝ, V) ∞ j)
    (hnonneg : ∀ x, 0 ≤ β x) (hgood : ∀ x, β x = 0 → IsTransverseAt I J f j x) :
    μ {p | ¬ ∀ x, IsTransverseAt I J (relativeTranslate f β p) j x} = 0 :=
  sorry

end ManifoldTransversality

end TauCetiRoadmap.DeRhamCohomologyAndDuality
