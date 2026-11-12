module

public import Mathlib
public import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.Basic

/-!
# Sobolev maps between manifolds: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Stated here: the generalized local classes on Euclidean domains (§1.1–§1.2) with the chain rule
for continuous inner maps (§2.1(a)), change of variables (§2.2) and Morrey continuity (§2.4);
the classes of Sobolev
functions and Sobolev maps on manifolds (§4.1–§4.2), the weak differential (§4.3), `C¹` members
(§4.4) and postcomposition (§4.6(b)); the oriented Jacobian of a linear map with its algebra
(§6.1); submersion pullback (§4.6(a)); positive density measures (§3.1); colocal weak
differentiability and its differential (§4.7–§4.8); Banach-valued pullback (§8.1); the extrinsic
characterization through split immersions (§9.1); smooth retractive embedding data (§9.2);
and intrinsic relative smooth approximation (§9.3).

The local classes below have finite-dimensional normed source with an additive Haar measure
`volume` (Lebesgue measure on an inner product space is the standard instance) and Banach-valued
target. In Tau Ceti
they replace the planar `TauCeti.MemLpLoc` and `TauCeti.MemWkpLoc`
(README, Existing code to refactor).

Not stated here: compatible tangent norms and `‖Df‖` (Layer 5), the finite-dimensional Jacobian
`J_f` of a map (Layer 6), Bochner top-form testing (Layer 8), intrinsic energy classes (§5.4)
and the controlled extrinsic space and finite-dimensional degree (Layers 10–11).
These use the explicit norm,
retraction and carrier hypotheses in README; no infinite-dimensional target volume is assumed.
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
of `u` on `Ω` are locally `Lᵖ`. This is `MemWkpLoc p Ω 1` of §1.1. -/
def MemW1pLoc (p : ℝ≥0∞) (Ω : Opens E) (u : E → F) : Prop :=
  MemLpLoc p Ω u ∧
    ∃ Du : E → E →L[ℝ] F, TauCeti.HasWeakFDerivOn volume Ω u Du ∧ MemLpLoc p Ω Du

/-- §1.2: the class is a sheaf for open covers. -/
theorem memW1pLoc_iSup_iff [CompleteSpace F] {p : ℝ≥0∞} {ι : Type*} (V : ι → Opens E)
    {u : E → F} : MemW1pLoc p (⨆ i, V i) u ↔ ∀ i, MemW1pLoc p (V i) u := by
  sorry

/-- §2.1(a): the chain rule for a continuous inner map and an outer map that is `C¹` on an open
set containing the image, with no bound on its derivative. -/
theorem MemW1pLoc.comp_contDiffOn [CompleteSpace F] [CompleteSpace G]
    {p : ℝ≥0∞} {Ω : Opens E} {u : E → F} {g : F → G} {W : Set F}
    (hu : MemW1pLoc p Ω u) (huc : ContinuousOn u Ω) (hW : IsOpen W) (hg : ContDiffOn ℝ 1 g W)
    (huW : MapsTo u Ω W) :
    MemW1pLoc p Ω (g ∘ u) := by
  sorry

/-- §2.2: change of variables under an injective `C¹` map with invertible derivative, with no
global bound on the derivative or its inverse. -/
theorem MemW1pLoc.comp_contDiffOn_diffeo [CompleteSpace F] {p : ℝ≥0∞}
    {Ω Ω' : Opens E} {Φ : E → E} {u : E → F} (hu : MemW1pLoc p Ω u)
    (hΦ : ContDiffOn ℝ 1 Φ Ω') (hinj : InjOn Φ Ω')
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

variable (E) in
/-- §3.1: the source measure has a strictly positive continuous density in every chart.
The measure is specified independently of any tangent norm. -/
def IsPositiveContinuousDensityMeasure [MeasurableSpace M] (μ : Measure M) : Prop :=
  ∀ x : M, ∃ w : E → ℝ, ContinuousOn w (extChartAt 𝓘(ℝ, E) x).target ∧
    (∀ y ∈ (extChartAt 𝓘(ℝ, E) x).target, 0 < w y) ∧
    Measure.map (extChartAt 𝓘(ℝ, E) x) (μ.restrict (extChartAt 𝓘(ℝ, E) x).source) =
      (volume.restrict (extChartAt 𝓘(ℝ, E) x).target).withDensity (fun y => ENNReal.ofReal (w y))

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

/-- §4.3: every member of the class has a weak differential. -/
theorem IsSobolevMap.exists_hasWeakMFDeriv [CompleteSpace E']
    [T2Space M] [SecondCountableTopology M]
    {p : ℝ≥0∞} {f : M → N} (hf : IsSobolevMap E E' p f) :
    ∃ Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x),
      HasWeakMFDeriv E E' f Df := by
  sorry

/-- §4.4: a `C¹` map is in the class for every exponent, and `mfderiv` is a weak differential
of it. -/
theorem isSobolevMap_of_contMDiff [CompleteSpace E'] {f : M → N}
    (hf : ContMDiff 𝓘(ℝ, E) 𝓘(ℝ, E') 1 f)
    (p : ℝ≥0∞) (hp : 1 ≤ p) :
    IsSobolevMap E E' p f ∧ HasWeakMFDeriv E E' f (fun x => mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E') f x) := by
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

variable (E E') in
/-- §8.1: pullback along a specified differential field, with fixed Banach coefficients.
For a Sobolev member, README requires this to be independent of the weak field almost everywhere. -/
def sobolevPullback {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    (f : M → N)
    (Df : (x : M) → TangentSpace 𝓘(ℝ, E) x →L[ℝ] TangentSpace 𝓘(ℝ, E') (f x))
    {k : ℕ} (form : TauCeti.RoughForm 𝓘(ℝ, E') N V k) :
    TauCeti.RoughForm 𝓘(ℝ, E) M V k :=
  fun x => (form (f x)).compContinuousLinearMap (Df x)

/-! ## Layer 9: the extrinsic characterization -/

/-- §9.1: for a split immersion `ι : N → E''` and a continuous `f`, `f` is a Sobolev map iff
`ι ∘ f` is a Sobolev function. Both target models may be Banach spaces of infinite dimension.
Injectivity of `mfderiv` alone does not replace the split-immersion hypothesis. A Nash
embedding is a finite-dimensional isometric special case (Heikkilä–Pankka, Remark 2). -/
theorem isSobolevMap_iff_memW1pLocM_comp_immersion [CompleteSpace E'] [CompleteSpace E'']
    {p : ℝ≥0∞} {f : M → N} {ι : N → E''}
    (hι : ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, E'') 1 ι)
    (hιimm : ∀ y, Manifold.IsImmersionAt 𝓘(ℝ, E') 𝓘(ℝ, E'') 1 ι y)
    (hf : Continuous f) :
    IsSobolevMap E E' p f ↔ MemW1pLocM E p (ι ∘ f) := by
  sorry

variable (E' E'') in
/-- §9.2: a smooth embedding with a smooth retraction from an open neighbourhood of its image.
The retraction is defined on the open subtype; no map from the ambient space to an empty
target, uniform tube, bounded derivative, or compactness of the target is implicit. -/
def IsSmoothRetractiveEmbedding (ι : N → E'') : Prop :=
  Topology.IsEmbedding ι ∧ ContMDiff 𝓘(ℝ, E') 𝓘(ℝ, E'') ∞ ι ∧
    ∃ U : Opens E'', ∃ hιU : ∀ y, ι y ∈ U, ∃ r : U → N,
      ContMDiff 𝓘(ℝ, E'') 𝓘(ℝ, E') ∞ r ∧ ∀ y, r ⟨ι y, hιU y⟩ = y

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

/-- §4.7: continuous Sobolev maps into a finite-dimensional target are colocal. -/
theorem IsSobolevMap.isColocallyWeaklyDifferentiable [FiniteDimensional ℝ E'] [BorelSpace N]
    [T2Space M] [SecondCountableTopology M] [T2Space N] [SecondCountableTopology N]
    [IsManifold 𝓘(ℝ, E) 1 M] [IsManifold 𝓘(ℝ, E') 1 N]
    {p : ℝ≥0∞} {u : M → N} (hu : IsSobolevMap E E' p u) (hp : 1 ≤ p) :
    IsColocallyWeaklyDifferentiable E E' u := by
  sorry

end Colocal

/-! ## Layer 6: the oriented Jacobian of a linear map -/

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

/-- §6.1: the defining identity. -/
theorem orientedJacobian_mul_volumeForm (oV : Orientation ℝ V (Fin n))
    (oW : Orientation ℝ W (Fin n)) (A : V →ₗ[ℝ] W) (v : Fin n → V) :
    oW.volumeForm (fun i => A (v i)) = orientedJacobian oV oW A * oV.volumeForm v := by
  sorry

/-- §6.1: multiplicativity. -/
theorem orientedJacobian_comp (oU : Orientation ℝ U (Fin n)) (oV : Orientation ℝ V (Fin n))
    (oW : Orientation ℝ W (Fin n)) (A : U →ₗ[ℝ] V) (B : V →ₗ[ℝ] W) :
    orientedJacobian oU oW (B ∘ₗ A) = orientedJacobian oV oW B * orientedJacobian oU oV A := by
  sorry

/-- §6.1: reversing the source orientation negates the Jacobian. -/
theorem orientedJacobian_neg_left (oV : Orientation ℝ V (Fin n))
    (oW : Orientation ℝ W (Fin n)) (A : V →ₗ[ℝ] W) :
    orientedJacobian (-oV) oW A = -orientedJacobian oV oW A := by
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

end TauCetiRoadmap.SobolevMapsBetweenManifolds
