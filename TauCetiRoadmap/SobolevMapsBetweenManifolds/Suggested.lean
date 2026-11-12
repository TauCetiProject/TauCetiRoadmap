module

public import Mathlib
public import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.Basic
public import TauCeti.Geometry.Manifold.Measure
public import TauCeti.Geometry.Manifold.Orientation.Basic
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
# Sobolev maps between manifolds: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, with the definitions they need. The local
classes have a finite-dimensional real normed source with an additive Haar measure `volume`
and a Banach-valued target.

Stated here: the Euclidean class with its sheaf property, chain rule for continuous inner maps,
change of variables and Morrey continuity (§1.2, §2.1(a), §2.2, §2.4); the class
`W^{1,p}_loc(M, N)` with its independence of the charts, existence and uniqueness of the weak
differential, `C¹` members, locality, and pullback by submersions and postcomposition with
their chain rules (§4.2–§4.6); colocal weak
differentiability with existence and uniqueness of its differential (§4.7–§4.8); the oriented
Jacobian of a linear map (§6.1) and local integrability of the Jacobian of a map for `p ≥ n`
(§6.3); the characterization through split immersions (§9.1);
intrinsic relative smooth approximation (§9.3); density for Banach targets with a closed
retractive embedding and controlled retraction data, and Schoen–Uhlenbeck density for compact
finite-dimensional targets (§10.3); the comparison of the local intrinsic class with the
extrinsic one for a compact target, with the target norm induced by its embedding (§10.4); and
the failure of density at `x/|x|` (§11.3).

Not statable at the pins:
* the `Lᵖ` characterization through `‖Df‖` for compatible continuous tangent norms (§5.2),
  the isometric clause of §9.1, and the energy classes of §5.4 for general compatible norms
  with their comparison with the continuous class: there is
  no carrier for continuous norms on the tangent spaces of a manifold (§5.1); Mathlib's
  `Bundle.RiemannianBundle` covers only the Riemannian case;
* commutation of the pullback of `V`-valued forms with the weak exterior derivative (§8.3):
  `TauCeti.integralTopForm` integrates scalar top forms only, and the `V`-valued integral that
  defines the weak exterior derivative is the target of §8.2;
* the degree of `W^{1,n}` maps and its integral formula (Layer 11): it is defined through the
  nearest-point retraction of RiemannianGeometry R6 and compared with the degree of continuous
  maps of DifferentialGeometry 10.5, and neither is at the pins; Tau Ceti has only
  `TauCeti.degreeAtRegularValue`, the signed count over a regular value of a `C¹` map.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SobolevMapsBetweenManifolds

open MeasureTheory TopologicalSpace Set Module Filter
open scoped Manifold ENNReal ContDiff Topology

/-! ## Layer 1: local classes on Euclidean domains -/

section Euclidean

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  {G : Type*} [NormedAddCommGroup G] [NormedSpace ℝ G]

/-- §1.1: `u` lies in `Lᵖ` on every compact subset of `U`. -/
def MemLpLoc (p : ℝ≥0∞) (U : Set E) (u : E → F) : Prop :=
  ∀ K : Set E, K ⊆ U → IsCompact K → MemLp u p (volume.restrict K)

/-- §1.2: the first-order local Sobolev class `W^{1,p}_loc(Ω; F)`: `u` and some weak derivative
of `u` on `Ω` are locally `Lᵖ`. -/
def MemW1pLoc (p : ℝ≥0∞) (Ω : Opens E) (u : E → F) : Prop :=
  MemLpLoc p Ω u ∧
    ∃ Du : E → E →L[ℝ] F, TauCeti.HasWeakFDerivOn volume Ω u Du ∧ MemLpLoc p Ω Du

/-- §1.2: the class is a sheaf for open covers. -/
theorem memW1pLoc_iSup_iff [CompleteSpace F] {p : ℝ≥0∞} {ι : Type*} (V : ι → Opens E)
    {u : E → F} : MemW1pLoc p (⨆ i, V i) u ↔ ∀ i, MemW1pLoc p (V i) u := by
  sorry

/-! ## Layer 2: Euclidean calculus of the local class -/

/-- §2.1(a): the chain rule for a continuous inner map and an outer map that is `C¹` on an open
set containing the image, with no bound on its derivative. -/
theorem MemW1pLoc.comp_contDiffOn [CompleteSpace F] [CompleteSpace G]
    {p : ℝ≥0∞} {Ω : Opens E} {u : E → F} {g : F → G} {W : Set F}
    (hu : MemW1pLoc p Ω u) (huc : ContinuousOn u Ω) (hW : IsOpen W) (hg : ContDiffOn ℝ 1 g W)
    (huW : MapsTo u Ω W) :
    MemW1pLoc p Ω (g ∘ u) := by
  sorry

/-- §2.2: change of variables under a `C¹` map with invertible derivative at every point, with
no global bound on the derivative or its inverse and no injectivity (Ziemer, Thm 2.2.2, for
bi-Lipschitz maps). -/
theorem MemW1pLoc.comp_contDiffOn_diffeo [CompleteSpace F] {p : ℝ≥0∞}
    {Ω Ω' : Opens E} {Φ : E → E} {u : E → F} (hu : MemW1pLoc p Ω u)
    (hΦ : ContDiffOn ℝ 1 Φ Ω')
    (hdet : ∀ x ∈ (Ω' : Set E), (fderiv ℝ Φ x).det ≠ 0) (hmaps : MapsTo Φ Ω' Ω) :
    MemW1pLoc p Ω' (u ∘ Φ) := by
  sorry

/-- §2.4: Morrey continuity for a Banach-valued target depends on the source dimension. -/
theorem MemW1pLoc.exists_continuousOn_ae_eq [CompleteSpace F] {p : ℝ≥0∞}
    {Ω : Opens E} {u : E → F} (hu : MemW1pLoc p Ω u) (hp : 1 ≤ p)
    (hpn : (finrank ℝ E : ℝ≥0∞) < p) :
    ∃ v : E → F, ContinuousOn v Ω ∧ v =ᵐ[volume.restrict Ω] u ∧ MemW1pLoc p Ω v := by
  sorry

end Euclidean

/-! ## Layer 4: Sobolev functions and Sobolev maps -/

section Manifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {E'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E'']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N]
  {P : Type*} [TopologicalSpace P] [ChartedSpace E'' P]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

variable (E E') in
/-- The open set of `E` on which the chart representative of `f` at `x` is defined: the points
of the target of the preferred chart at `x` that `f` maps into the source of the preferred chart
at `f x`. For continuous `f` the set is open and `interior` changes nothing. -/
def chartDomain (f : M → N) (x : M) : Opens E :=
  ⟨interior ((extChartAt 𝓘(ℝ, E) x).target ∩
      (extChartAt 𝓘(ℝ, E) x).symm ⁻¹' (f ⁻¹' (extChartAt 𝓘(ℝ, E') (f x)).source)),
    isOpen_interior⟩

variable (E) in
/-- §4.1: `u : M → F` lies in `W^{1,p}_loc(M; F)` when every chart representative lies in the
Euclidean class on the target of its chart. Members need not be continuous. -/
def MemW1pLocM (p : ℝ≥0∞) (u : M → F) : Prop :=
  ∀ x : M, MemW1pLoc p ⟨interior (extChartAt 𝓘(ℝ, E) x).target, isOpen_interior⟩
    (u ∘ (extChartAt 𝓘(ℝ, E) x).symm)

variable (E) in
/-- §4.1: an ordinary weak differential of a Banach-valued function on the source.
The function need not be continuous. -/
def HasWeakMFDerivFun (u : M → F)
    (Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] F) : Prop :=
  ∀ x : M, TauCeti.HasWeakFDerivOn volume
    ⟨interior (extChartAt 𝓘(ℝ, E) x).target, isOpen_interior⟩
    (u ∘ (extChartAt 𝓘(ℝ, E) x).symm) fun y =>
      (Du ((extChartAt 𝓘(ℝ, E) x).symm y)).comp
        (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) (extChartAt 𝓘(ℝ, E) x).symm y)

variable (E E') in
/-- §4.2: the class `W^{1,p}_loc(M, N)` of continuous maps whose chart representatives are
Sobolev. It involves no metric. -/
def IsSobolevMap (p : ℝ≥0∞) (f : M → N) : Prop :=
  Continuous f ∧ ∀ x : M,
    MemW1pLoc p (chartDomain E E' f x) (writtenInExtChartAt 𝓘(ℝ, E) 𝓘(ℝ, E') x f)

variable (E E') in
/-- §4.3: `Df` is a weak differential of `f`: in the preferred charts at every point, the chart
expression `dψ ∘ Df ∘ dφ⁻¹` is a weak derivative of the chart representative. -/
def HasWeakMFDeriv (f : M → N)
    (Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)) : Prop :=
  ∀ x : M, TauCeti.HasWeakFDerivOn volume (chartDomain E E' f x)
    (writtenInExtChartAt 𝓘(ℝ, E) 𝓘(ℝ, E') x f) fun y =>
      ((mfderiv 𝓘(ℝ, E') 𝓘(ℝ, E') (extChartAt 𝓘(ℝ, E') (f x))
          (f ((extChartAt 𝓘(ℝ, E) x).symm y))).comp
        ((Df ((extChartAt 𝓘(ℝ, E) x).symm y)).comp
          (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) (extChartAt 𝓘(ℝ, E) x).symm y)) : E →L[ℝ] E')

variable [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N] [IsManifold 𝓘(ℝ, E'') 1 P]

/-- §4.2: the class does not depend on the charts: a map is in it iff it is continuous and its
representative in every pair of charts of the `C¹` maximal atlases of `M` and `N` is Sobolev on
the open part of the source chart's target that the map sends into the target chart's source. -/
theorem isSobolevMap_iff_forall_maximalAtlas [CompleteSpace E'] {p : ℝ≥0∞} {f : M → N} :
    IsSobolevMap E E' p f ↔ Continuous f ∧
      ∀ e ∈ IsManifold.maximalAtlas 𝓘(ℝ, E) 1 M, ∀ e' ∈ IsManifold.maximalAtlas 𝓘(ℝ, E') 1 N,
        MemW1pLoc p ⟨interior ((e.extend 𝓘(ℝ, E)).target ∩
            (e.extend 𝓘(ℝ, E)).symm ⁻¹' (f ⁻¹' e'.source)), isOpen_interior⟩
          (e'.extend 𝓘(ℝ, E') ∘ f ∘ (e.extend 𝓘(ℝ, E)).symm) := by
  sorry

/-- §4.3: every member of the class has a weak differential. -/
theorem IsSobolevMap.exists_hasWeakMFDeriv [CompleteSpace E']
    [T2Space M] [SecondCountableTopology M]
    {p : ℝ≥0∞} {f : M → N} (hf : IsSobolevMap E E' p f) :
    ∃ Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x),
      HasWeakMFDeriv E E' f Df := by
  sorry

/-- §4.3: two weak differentials of a continuous map differ only on a null set. -/
theorem HasWeakMFDeriv.ae_eq [CompleteSpace E'] [T2Space M] [SecondCountableTopology M]
    {f : M → N}
    {Df Df' : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hf : Continuous f) (h : HasWeakMFDeriv E E' f Df) (h' : HasWeakMFDeriv E E' f Df') :
    TauCeti.IsNullSet 𝓘(ℝ, E) {x | Df x ≠ Df' x} := by
  sorry

/-- §4.4: a `C¹` map is in the class for every exponent, and `mfderiv` is a weak differential
of it. -/
theorem isSobolevMap_of_contMDiff [CompleteSpace E'] {f : M → N}
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') 1 f)
    (p : ℝ≥0∞) (hp : 1 ≤ p) :
    IsSobolevMap E E' p f ∧ HasWeakMFDeriv E E' f (fun x => mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E') f x) := by
  sorry

/-- §4.5: locality: a map whose restrictions to the sets of an open cover of `M` are in the
class is in the class; its continuity follows from the cover. -/
theorem IsSobolevMap.of_locally [CompleteSpace E'] {p : ℝ≥0∞} {f : M → N}
    (h : ∀ x, ∃ V : Opens M, x ∈ V ∧ IsSobolevMap E E' p (f ∘ ((↑) : V → M))) :
    IsSobolevMap E E' p f := by
  sorry

/-- §4.6(b): postcomposition with a `C¹` map, with no bound on its derivative. -/
theorem IsSobolevMap.comp_contMDiff [CompleteSpace E'] [CompleteSpace E'']
    {p : ℝ≥0∞} {f : M → N} {g : N → P}
    (hf : IsSobolevMap E E' p f) (hg : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, E'') 1 g) :
    IsSobolevMap E E'' p (g ∘ f) := by
  sorry

/-- §4.6(b): the chain rule for the weak differential. -/
theorem HasWeakMFDeriv.comp_contMDiff [CompleteSpace E'] [CompleteSpace E'']
    {f : M → N} {g : N → P}
    {Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hf : Continuous f) (hDf : HasWeakMFDeriv E E' f Df) (hg : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, E'') 1 g) :
    HasWeakMFDeriv E E'' (g ∘ f) (fun x => (mfderiv 𝓘(ℝ, E') 𝓘(ℝ, E'') g (f x)).comp (Df x)) := by
  sorry

/-- §4.6(a): precomposition by a submersion allows a larger finite-dimensional source. -/
theorem IsSobolevMap.comp_submersion [CompleteSpace E']
    {E₀ : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀] [FiniteDimensional ℝ E₀]
    [MeasureSpace E₀] [BorelSpace E₀] [(volume : Measure E₀).IsAddHaarMeasure]
    {M₀ : Type*} [TopologicalSpace M₀] [ChartedSpace E₀ M₀] [IsManifold 𝓘(ℝ, E₀) 1 M₀]
    {p : ℝ≥0∞} {f : M → N} {θ : M₀ → M}
    (hf : IsSobolevMap E E' p f)
    (hθ : ∀ x, Manifold.IsSubmersionAt 𝓘(ℝ, E₀) 𝓘(ℝ, E) 1 θ x) :
    IsSobolevMap E₀ E' p (f ∘ θ) := by
  sorry

/-- §4.6(a): the chain rule for precomposition by a submersion: `y ↦ Df(θ y) ∘ dθ_y` is a weak
differential of `f ∘ θ`. -/
theorem HasWeakMFDeriv.comp_submersion [CompleteSpace E']
    {E₀ : Type*} [NormedAddCommGroup E₀] [NormedSpace ℝ E₀] [FiniteDimensional ℝ E₀]
    [MeasureSpace E₀] [BorelSpace E₀] [(volume : Measure E₀).IsAddHaarMeasure]
    {M₀ : Type*} [TopologicalSpace M₀] [ChartedSpace E₀ M₀] [IsManifold 𝓘(ℝ, E₀) 1 M₀]
    {f : M → N} {θ : M₀ → M}
    {Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hf : Continuous f) (hDf : HasWeakMFDeriv E E' f Df)
    (hθ : ∀ x, Manifold.IsSubmersionAt 𝓘(ℝ, E₀) 𝓘(ℝ, E) 1 θ x) :
    HasWeakMFDeriv E₀ E' (f ∘ θ) (fun y => (Df (θ y)).comp (mfderiv 𝓘(ℝ, E₀) 𝓘(ℝ, E) θ y)) := by
  sorry

end Manifold

/-! ## Layers 4.7–4.8: measurable weak maps into finite-dimensional targets -/

section Colocal

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [MeasurableSpace N]

variable (E) in
/-- §3.2: almost-everywhere measurability of a target-valued map, read in source charts. -/
def IsChartAEMeasurableMap (u : M → N) : Prop :=
  ∀ x : M, AEMeasurable (u ∘ (extChartAt 𝓘(ℝ, E) x).symm)
    (volume.restrict (extChartAt 𝓘(ℝ, E) x).target)

variable (E E') in
/-- §4.7: colocal weak differentiability is tested by compactly supported scalar `C¹` probes.
Finite-dimensional target hypotheses are explicit; this is not the Banach-target definition. -/
def IsColocallyWeaklyDifferentiable [FiniteDimensional ℝ E'] (u : M → N) : Prop :=
  IsChartAEMeasurableMap E u ∧ ∀ φ : N → ℝ,
    ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, ℝ) 1 φ → HasCompactSupport φ →
      MemW1pLocM E 1 (φ ∘ u)

variable (E E') in
/-- §3.2: measurable differential coefficients on source/target chart intersections.
These intersections are measurable sets and need not be open. -/
def IsChartMeasurableMFDeriv (u : M → N)
    (Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x)) : Prop :=
  ∀ (x₀ : M) (y₀ : N),
    let coeff : E → E →L[ℝ] E' := fun y =>
      (mfderiv 𝓘(ℝ, E') 𝓘(ℝ, E') (extChartAt 𝓘(ℝ, E') y₀)
        (u ((extChartAt 𝓘(ℝ, E) x₀).symm y))).comp
        ((Du ((extChartAt 𝓘(ℝ, E) x₀).symm y)).comp
          (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) (extChartAt 𝓘(ℝ, E) x₀).symm y))
    AEStronglyMeasurable coeff
      (volume.restrict ((extChartAt 𝓘(ℝ, E) x₀).target ∩
        (extChartAt 𝓘(ℝ, E) x₀).symm ⁻¹' (u ⁻¹' (extChartAt 𝓘(ℝ, E') y₀).source)))

variable (E E') in
/-- §4.8: the measurable field gives the ordinary weak differential of every scalar probe.
Local integrability of the whole differential norm is an additional energy condition in §5.4. -/
def HasColocalWeakMFDeriv [FiniteDimensional ℝ E'] (u : M → N)
    (Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x)) : Prop :=
  IsColocallyWeaklyDifferentiable E E' u ∧ IsChartMeasurableMFDeriv E E' u Du ∧
    ∀ φ : N → ℝ, ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, ℝ) 1 φ → HasCompactSupport φ →
      HasWeakMFDerivFun E (φ ∘ u)
        (fun x => (mfderiv 𝓘(ℝ, E') 𝓘(ℝ, ℝ) φ (u x)).comp (Du x))

/-- §4.8: existence of the colocal weak differential for a measurable map. -/
theorem IsColocallyWeaklyDifferentiable.exists_hasColocalWeakMFDeriv
    [FiniteDimensional ℝ E'] [BorelSpace N]
    [T2Space M] [SecondCountableTopology M] [T2Space N] [SecondCountableTopology N]
    [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N]
    {u : M → N} (hu : IsColocallyWeaklyDifferentiable E E' u) :
    ∃ Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x),
      HasColocalWeakMFDeriv E E' u Du := by
  sorry

/-- §4.8: two colocal weak differentials of a map differ only on a null set
(Convent–Van Schaftingen, Prop. 1.2, p. 5). -/
theorem HasColocalWeakMFDeriv.ae_eq [FiniteDimensional ℝ E'] [BorelSpace N]
    [T2Space M] [SecondCountableTopology M] [T2Space N] [SecondCountableTopology N]
    [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N] {u : M → N}
    {Du Du' : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x)}
    (h : HasColocalWeakMFDeriv E E' u Du) (h' : HasColocalWeakMFDeriv E E' u Du') :
    TauCeti.IsNullSet 𝓘(ℝ, E) {x | Du x ≠ Du' x} := by
  sorry

/-- §4.7: continuous Sobolev maps into a finite-dimensional target are colocal. -/
theorem IsSobolevMap.isColocallyWeaklyDifferentiable [FiniteDimensional ℝ E'] [BorelSpace N]
    [T2Space M] [SecondCountableTopology M] [T2Space N] [SecondCountableTopology N]
    [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N]
    {p : ℝ≥0∞} {u : M → N} (hu : IsSobolevMap E E' p u) (hp : 1 ≤ p) :
    IsColocallyWeaklyDifferentiable E E' u := by
  sorry

end Colocal

/-! ## Layer 6: the Jacobian -/

section Jacobian

variable {U V W : Type*} [NormedAddCommGroup U] [InnerProductSpace ℝ U] [FiniteDimensional ℝ U]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
  [NormedAddCommGroup W] [InnerProductSpace ℝ W] [FiniteDimensional ℝ W]
  {n : ℕ} [Fact (finrank ℝ U = n)] [Fact (finrank ℝ V = n)] [Fact (finrank ℝ W = n)]

/-- §6.1: the oriented Jacobian `J(A)` of a linear map between oriented inner product spaces
of one dimension, determined by `o_W.volumeForm (A ∘ v) = J(A) · o_V.volumeForm v` for every
family `v`. It is computed on any basis; in dimension `0` it is `±1` according as the
orientations agree. -/
def orientedJacobian (oV : Orientation ℝ V (Fin n)) (oW : Orientation ℝ W (Fin n))
    (A : V →ₗ[ℝ] W) : ℝ :=
  let b := Module.finBasisOfFinrankEq ℝ V (Fact.out : finrank ℝ V = n)
  oW.volumeForm (fun i => A (b i)) / oV.volumeForm b

/-- §6.1: multiplicativity. -/
theorem orientedJacobian_comp (oU : Orientation ℝ U (Fin n)) (oV : Orientation ℝ V (Fin n))
    (oW : Orientation ℝ W (Fin n)) (A : U →ₗ[ℝ] V) (B : V →ₗ[ℝ] W) :
    orientedJacobian oU oW (B ∘ₗ A) = orientedJacobian oV oW B * orientedJacobian oU oV A := by
  sorry

/-- §6.1: the absolute value is the norm determinant. -/
theorem abs_orientedJacobian (oV : Orientation ℝ V (Fin n)) (oW : Orientation ℝ W (Fin n))
    (A : V →ₗ[ℝ] W) : |orientedJacobian oV oW A| = A.normDet := by
  sorry

/-- §6.1: Hadamard's inequality. -/
theorem abs_orientedJacobian_le (oV : Orientation ℝ V (Fin n)) (oW : Orientation ℝ W (Fin n))
    (A : V →ₗ[ℝ] W) : |orientedJacobian oV oW A| ≤ ‖LinearMap.toContinuousLinearMap A‖ ^ n := by
  sorry

/-- §6.1: for one orientation on both sides the Jacobian is the determinant. -/
theorem orientedJacobian_self (oV : Orientation ℝ V (Fin n)) (A : V →ₗ[ℝ] V) :
    orientedJacobian oV oV A = LinearMap.det A := by
  sorry

end Jacobian

section JacobianOfMap

open Bundle

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) 1 M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') 1 N]

/-- §6.3: for oriented manifolds of one dimension `n` with continuous Riemannian metrics and
`f ∈ W^{1,p}_loc(M, N)` with `n ≤ p`, the Jacobian `J_f(x) = J(Df(x))` of a weak differential,
for the tangent orientations and inner products, is locally integrable for the Riemannian
volume of `M`; the route is Hadamard's inequality `|J_f| ≤ ‖Df‖ⁿ`. -/
theorem IsSobolevMap.integrableOn_orientedJacobian
    [T2Space M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)]
    [RiemannianBundle (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    [IsContinuousRiemannianBundle E' (fun y : N ↦ TangentSpace 𝓘(ℝ, E') y)]
    {n : ℕ} [∀ x : M, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E) x) = n)]
    [∀ y : N, Fact (finrank ℝ (TangentSpace 𝓘(ℝ, E') y) = n)]
    (oM : TauCeti.Manifold.Orientation 𝓘(ℝ, E) M (Fin n))
    (oN : TauCeti.Manifold.Orientation 𝓘(ℝ, E') N (Fin n))
    {p : ℝ≥0∞} (hnp : (n : ℝ≥0∞) ≤ p) {f : M → N} (hf : IsSobolevMap E E' p f)
    {Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x)}
    (hDf : HasWeakMFDeriv E E' f Df) {K : Set M} (hK : IsCompact K) :
    IntegrableOn (fun x => orientedJacobian (oM.orientationAt x) (oN.orientationAt (f x))
        (Df x : TangentSpace 𝓘(ℝ, E) x →ₗ[ℝ] TangentSpace 𝓘(ℝ, E') (f x)))
      K (TauCeti.riemannianVolume 𝓘(ℝ, E) M) := by
  sorry

end JacobianOfMap

/-! ## Layer 9: immersions and smooth approximation -/

section Approximation

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {E'' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E'']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℝ, E) 1 M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N] [IsManifold 𝓘(ℝ, E') 1 N]

/-- §9.1: for a split immersion `ι : N → E''` and a continuous `f`, `f` is a Sobolev map iff
`ι ∘ f` is a Sobolev function. Both target models may be Banach spaces of infinite dimension.
Injectivity of `mfderiv` alone does not replace the split-immersion hypothesis. A Nash
embedding is a finite-dimensional isometric special case (Hajłasz 2009, §1, p. 185;
Heikkilä–Pankka, arXiv 2302.11440v2, proof of Prop. B.1, p. 24). -/
theorem isSobolevMap_iff_memW1pLocM_comp_immersion [CompleteSpace E'] [CompleteSpace E'']
    {p : ℝ≥0∞} {f : M → N} {ι : N → E''}
    (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, E'') 1 ι)
    (hιimm : ∀ y, Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, E'') 1 ι y)
    (hf : Continuous f) :
    IsSobolevMap E E' p f ↔ MemW1pLocM E p (ι ∘ f) := by
  sorry

variable (E E') in
/-- §9.3: chartwise locally uniform and first-order local Sobolev convergence.
Source and target charts in each test are fixed, including for the approximating maps. -/
def TendstoSobolevLoc (p : ℝ≥0∞) (fSeq : ℕ → M → N) (f : M → N) : Prop :=
  Continuous f ∧ (∀ j, Continuous (fSeq j)) ∧
    ∀ (x₀ : M) (y₀ : N) (U : Opens E), IsCompact (closure (U : Set E)) →
      closure (U : Set E) ⊆ (extChartAt 𝓘(ℝ, E) x₀).target →
      MapsTo (f ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) (closure (U : Set E))
        (extChartAt 𝓘(ℝ, E') y₀).source →
      let rep := fun g : M → N =>
        (extChartAt 𝓘(ℝ, E') y₀) ∘ g ∘ (extChartAt 𝓘(ℝ, E) x₀).symm
      (∀ᶠ j in atTop, MapsTo (fSeq j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm)
        (closure (U : Set E)) (extChartAt 𝓘(ℝ, E') y₀).source) ∧
      TendstoUniformlyOn (fun j => rep (fSeq j)) (rep f) atTop (closure (U : Set E)) ∧
      ∃ Du : E → E →L[ℝ] E', ∃ DuSeq : ℕ → E → E →L[ℝ] E',
        TauCeti.HasWeakFDerivOn volume U (rep f) Du ∧
        MemLp Du p (volume.restrict U) ∧
        (∀ᶠ j in atTop, TauCeti.HasWeakFDerivOn volume U (rep (fSeq j)) (DuSeq j) ∧
          MemLp (DuSeq j) p (volume.restrict U)) ∧
        Tendsto (fun j => eLpNorm (fun y => rep (fSeq j) y - rep f y) p (volume.restrict U))
          atTop (𝓝 0) ∧
        Tendsto (fun j => eLpNorm (fun y => DuSeq j y - Du y)
          p (volume.restrict U)) atTop (𝓝 0)

/-- §9.3: intrinsic relative approximation, without embedding or retraction hypotheses.
The full relative homotopy and graph-control API is specified in README. -/
theorem IsSobolevMap.exists_smooth_approx_rel [CompleteSpace E']
    [T2Space M] [SecondCountableTopology M] [T2Space N]
    [IsManifold 𝓘(ℝ, E) ∞ M] [IsManifold 𝓘(ℝ, E') ∞ N]
    {p : ℝ≥0∞} {f : M → N} (hf : IsSobolevMap E E' p f) (hp : 1 ≤ p) (hpfin : p < ⊤)
    {A : Set M} (hA : IsClosed A) {V : Opens M} (hAV : A ⊆ V)
    (hfV : ContMDiffOn 𝓘(ℝ, E) 𝓘(ℝ, E') ∞ f V)
    (O : ℕ → Opens (M × N)) (hO : ∀ j x, (x, f x) ∈ O j) :
    ∃ fSeq : ℕ → M → N, (∀ j, ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') ∞ (fSeq j)) ∧
      (∀ j x, (x, fSeq j x) ∈ O j) ∧ TendstoSobolevLoc E E' p fSeq f ∧
      ∃ V' : Opens M, A ⊆ V' ∧ closure (V' : Set M) ⊆ V ∧ ∀ j, EqOn (fSeq j) f V' := by
  sorry

end Approximation

/-! ## Layer 10: extrinsic spaces and smooth density -/

section Density

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasureSpace E] [BorelSpace E] [(volume : Measure E).IsAddHaarMeasure]
  {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
  {N : Type*} [TopologicalSpace N] [ChartedSpace E' N]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- §10.3: let `M` be closed of dimension `n`, and let `ι : N → F` be a smooth embedding with
closed image of a Banach manifold into a Banach space, with controlled retraction data: a map
`r` that is smooth on an open `U` containing the tube `{z | dist(z, ι(N)) < δ}`, with
`r ∘ ι = id`, and a `C¹` map `Q : F → F` (the map `Π` of Layer 10) with bounded derivative and
`Q = ι ∘ r` on the tube of width `δ / 2`; the retraction makes `ι` a split immersion. For
`n ≤ p < ∞`, every `u ∈ W^{1,p}(M; F)` with values in `ι(N)` almost everywhere is a `W^{1,p}`
limit of `ι ∘ g_j` with `g_j : M → N` smooth, the convergence of values and weak derivatives
being read in `Lᵖ` on compact subsets of charts. -/
theorem exists_smooth_approx_of_controlledRetraction [CompleteSpace E'] [CompleteSpace F]
    [IsManifold 𝓘(ℝ, E) ∞ M] [CompactSpace M] [T2Space M] [IsManifold 𝓘(ℝ, E') ∞ N] [T2Space N]
    (ι : N → F) (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, F) ∞ ι) (hιemb : Topology.IsClosedEmbedding ι)
    {U : Set F} (hU : IsOpen U) {r : F → N} (hr : ContMDiffOn 𝓘(ℝ, F) 𝓘(ℝ, E') ∞ r U)
    (hrι : ∀ y, r (ι y) = y) {δ : ℝ} (hδ : 0 < δ)
    (hT : {z | Metric.infDist z (range ι) < δ} ⊆ U)
    {Q : F → F} (hQ : ContDiff ℝ 1 Q) (hQb : ∃ C, ∀ z, ‖fderiv ℝ Q z‖ ≤ C)
    (hQr : ∀ z, Metric.infDist z (range ι) < δ / 2 → Q z = ι (r z))
    {p : ℝ≥0∞} (hnp : (finrank ℝ E : ℝ≥0∞) ≤ p) (hp : p < ⊤)
    {u : M → F} (hu : MemW1pLocM E p u) (hN : TauCeti.IsNullSet 𝓘(ℝ, E) {x | u x ∉ range ι}) :
    ∃ g : ℕ → M → N, (∀ j, ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') ∞ (g j)) ∧
      ∀ (x₀ : M) (K : Set E), IsCompact K → K ⊆ (extChartAt 𝓘(ℝ, E) x₀).target →
        ∃ Du : E → E →L[ℝ] F,
          TauCeti.HasWeakFDerivOn volume
              ⟨interior (extChartAt 𝓘(ℝ, E) x₀).target, isOpen_interior⟩
              (u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) Du ∧
            Tendsto (fun j => eLpNorm (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm -
              u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) p (volume.restrict K)) atTop (𝓝 0) ∧
            Tendsto (fun j => eLpNorm
              (fun y => fderiv ℝ (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) y - Du y) p
              (volume.restrict K)) atTop (𝓝 0) := by
  sorry

/-- §10.3, Schoen–Uhlenbeck: on a compact source of dimension `n`, for a compact target smoothly
embedded in `ℝᵐ` and `n ≤ p < ∞`, every `u ∈ W^{1,p}(M; ℝᵐ)` with values in the image almost
everywhere is a `W^{1,p}` limit of `ι ∘ g_j` with `g_j : M → N` smooth, the convergence of values
and weak derivatives being read in `Lᵖ` on compact subsets of charts (Hajłasz 2009, Thm 2.1,
p. 188, and its proof for `p = n`). -/
theorem exists_smooth_approx_of_ae_mem_range [FiniteDimensional ℝ E']
    [IsManifold 𝓘(ℝ, E) ∞ M] [CompactSpace M] [T2Space M]
    [IsManifold 𝓘(ℝ, E') ∞ N] [CompactSpace N] [T2Space N] {m : ℕ}
    (ι : N → EuclideanSpace ℝ (Fin m))
    (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, EuclideanSpace ℝ (Fin m)) ∞ ι)
    (hιemb : Topology.IsEmbedding ι)
    (hιimm : ∀ y, Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, EuclideanSpace ℝ (Fin m)) ∞ ι y)
    {p : ℝ≥0∞} (hnp : (finrank ℝ E : ℝ≥0∞) ≤ p) (hp : p < ⊤)
    {u : M → EuclideanSpace ℝ (Fin m)} (hu : MemW1pLocM E p u)
    (hN : TauCeti.IsNullSet 𝓘(ℝ, E) {x | u x ∉ Set.range ι}) :
    ∃ g : ℕ → M → N, (∀ j, ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') ∞ (g j)) ∧
      ∀ (x₀ : M) (K : Set E), IsCompact K → K ⊆ (extChartAt 𝓘(ℝ, E) x₀).target →
        ∃ Du : E → E →L[ℝ] EuclideanSpace ℝ (Fin m),
          TauCeti.HasWeakFDerivOn volume
              ⟨interior (extChartAt 𝓘(ℝ, E) x₀).target, isOpen_interior⟩
              (u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) Du ∧
            Tendsto (fun j => eLpNorm (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm -
              u ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) p (volume.restrict K)) atTop (𝓝 0) ∧
            Tendsto (fun j => eLpNorm
              (fun y => fderiv ℝ (ι ∘ g j ∘ (extChartAt 𝓘(ℝ, E) x₀).symm) y - Du y) p
              (volume.restrict K)) atTop (𝓝 0) := by
  sorry

/-- §10.4: for a compact target `N` with a smooth embedding `ι` into a finite-dimensional space
`F`, on any source `M`, `ι ∘ u ∈ W^{1,p}_loc(M; F)` iff `u` has a colocal weak differential `Du`
whose chart expressions composed with `dι` are locally `Lᵖ`: the local homogeneous class of
§5.4 for the target norm induced by `ι`. On a compact source this identifies that class with the
maps represented in `W^{1,p}_ι(M, N)` (Convent–Van Schaftingen, Prop. 1.6, p. 6, and Prop. 2.6,
p. 11). -/
theorem memW1pLocM_comp_iff_exists_hasColocalWeakMFDeriv [FiniteDimensional ℝ E']
    [FiniteDimensional ℝ F] [MeasurableSpace N] [BorelSpace N]
    [IsManifold 𝓘(ℝ, E) 1 M] [T2Space M] [SecondCountableTopology M]
    [IsManifold 𝓘(ℝ, E') ∞ N] [T2Space N] [CompactSpace N]
    {ι : N → F} (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, F) ∞ ι) (hιemb : Topology.IsEmbedding ι)
    (hιimm : ∀ y, Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, F) ∞ ι y)
    {p : ℝ≥0∞} (hp : 1 ≤ p) {u : M → N} :
    MemW1pLocM E p (ι ∘ u) ↔
      ∃ Du : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (u x),
        HasColocalWeakMFDeriv E E' u Du ∧ ∀ x : M,
          MemLpLoc (F := E →L[ℝ] F) p (extChartAt 𝓘(ℝ, E) x).target fun y =>
            ((mfderiv 𝓘(ℝ, E') 𝓘(ℝ, F) ι (u ((extChartAt 𝓘(ℝ, E) x).symm y))).comp
              ((Du ((extChartAt 𝓘(ℝ, E) x).symm y)).comp
                (mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) (extChartAt 𝓘(ℝ, E) x).symm y)) : E →L[ℝ] F) := by
  sorry

end Density

/-! ## Layer 11: failure of density below the dimension -/

/-- §11.3: for `n ≥ 2` and `n − 1 ≤ p < n`, the radial map `x ↦ x/‖x‖` of the open unit ball
of `ℝⁿ` is not a `W^{1,p}` limit of maps into the unit sphere that are smooth on the ball
(Hajłasz 2009, Thm 2.3, p. 189). -/
theorem not_exists_smooth_sphere_approx_radial (n : ℕ) (hn : 2 ≤ n) (p : ℝ≥0∞)
    (hp : ((n - 1 : ℕ) : ℝ≥0∞) ≤ p) (hpn : p < n)
    (Du : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n) →L[ℝ] EuclideanSpace ℝ (Fin n))
    (hDu : TauCeti.HasWeakFDerivOn volume ⟨Metric.ball 0 1, Metric.isOpen_ball⟩
      (fun x => ‖x‖⁻¹ • x) Du) :
    ¬ ∃ v : ℕ → EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin n),
      (∀ j, ContDiffOn ℝ ∞ (v j) (Metric.ball 0 1)) ∧
      (∀ j, ∀ x ∈ Metric.ball (0 : EuclideanSpace ℝ (Fin n)) 1, ‖v j x‖ = 1) ∧
      Tendsto (fun j => eLpNorm (fun x => v j x - ‖x‖⁻¹ • x) p
        (volume.restrict (Metric.ball 0 1))) atTop (𝓝 0) ∧
      Tendsto (fun j => eLpNorm (fun x => fderiv ℝ (v j) x - Du x) p
        (volume.restrict (Metric.ball 0 1))) atTop (𝓝 0) := by
  sorry

end TauCetiRoadmap.SobolevMapsBetweenManifolds
