import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.FunctionalSpaces.BesselPotentialSpace
import Mathlib.Analysis.Distribution.Distribution
import Mathlib.Geometry.Manifold.VectorField.LieBracket
import TauCeti.Geometry.Symplectic.Manifold.AlmostComplex
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Analysis.Complex.CauchyIntegralPolydisc
import TauCetiRoadmap.DifferentialGeometry.Suggested
import Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification. These targets use the existing smooth almost-complex
and two-form carriers, fix the real differential/type and Nijenhuis conventions,
and expose tensoriality. DG0.4 transports the native degree-two API through
`legacySmoothTwoFormEquiv` to `SmoothForm I M ℝ 2`, with closedness compared
by `legacySmoothTwoFormEquiv_isClosed_iff`; the README specifies that generic
carrier as definitive. The density fiber, compactly supported smooth bundle
tests, compact-convergence dual and localized all-real-order Sobolev carrier
below use native objects. The README fixes their atlas, LF topology, pairing
and geometric L² comparison; these prototypes do not prove the analytic targets.
-/

noncomputable section

namespace TauCetiRoadmap.ComplexKahlerGeometry

open scoped Manifold ContDiff

section Realification

/-- K3.0 target: finite-dimensional complex smooth charts have real-analytic
transitions, using the native finite-dimensional Cauchy/analyticity API before
restricting scalars. The real scalar action is the one induced from ℂ. -/
theorem realified_isManifold_analytic
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
    {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℂ, E) ∞ M] : IsManifold 𝓘(ℝ, E) ω M := by
  sorry

end Realification

section LocalGeometry

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [CompleteSpace E] [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The (0,1) part of the real differential of a complex-valued function. -/
def dbarFunction (J : TauCeti.SmoothAlmostComplexStructure I M)
    (f : M → ℂ) (x : M) (v : TangentSpace I x) : ℂ :=
  (mvfderiv I f x v +
    Complex.I * mvfderiv I f x (J x v)) / 2

theorem dbarFunction_apply_J (J : TauCeti.SmoothAlmostComplexStructure I M)
    (f : M → ℂ) (x : M) (v : TangentSpace I x) :
    dbarFunction J f x (J x v) = -Complex.I * dbarFunction J f x v := by
  sorry

/-- Pointwise algebraic vanishing is precisely the complex-linearity equation. -/
theorem dbarFunction_eq_zero_iff (J : TauCeti.SmoothAlmostComplexStructure I M)
    (f : M → ℂ) :
    (∀ x v, dbarFunction J f x v = 0) ↔
      ∀ x v, mvfderiv I f x (J x v) =
        Complex.I * mvfderiv I f x v := by
  sorry

/-- The unscaled Nijenhuis expression on vector fields. -/
def nijenhuisOnFields (J : TauCeti.SmoothAlmostComplexStructure I M)
    (X Y : (x : M) → TangentSpace I x) (x : M) : TangentSpace I x :=
  VectorField.mlieBracket I (fun y ↦ J y (X y)) (fun y ↦ J y (Y y)) x -
    VectorField.mlieBracket I X Y x -
    J x (VectorField.mlieBracket I (fun y ↦ J y (X y)) Y x) -
    J x (VectorField.mlieBracket I X (fun y ↦ J y (Y y)) x)

/-- The fiberwise tensor whose field formula is fixed by the following theorem. -/
def nijenhuisTensor (J : TauCeti.SmoothAlmostComplexStructure I M) :
    (x : M) → TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x := by
  sorry

theorem nijenhuisTensor_onFields (J : TauCeti.SmoothAlmostComplexStructure I M)
    (X Y : (x : M) → TangentSpace I x)
    (hX : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)))
    (hY : ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, Y x⟩ : TangentBundle I M)))
    (x : M) : nijenhuisTensor J x (X x) (Y x) = nijenhuisOnFields J X Y x := by
  sorry

theorem nijenhuisTensor_skew (J : TauCeti.SmoothAlmostComplexStructure I M)
    (x : M) (v w : TangentSpace I x) :
    nijenhuisTensor J x v w = -nijenhuisTensor J x w v := by
  sorry

/-- An unbundled Kähler condition: compatible closed form and integrable complex structure. -/
def IsKahler (form : TauCeti.SmoothTwoForm I M)
    (J : TauCeti.SmoothAlmostComplexStructure I M) : Prop :=
  form.IsClosed ∧ form.Compatible J ∧ ∀ x v w, nijenhuisTensor J x v w = 0

section SobolevLocalization

open scoped SchwartzMap Distributions CompactConvergenceCLM

variable {n : ℕ} {F : Type*} [NormedAddCommGroup F]
  [InnerProductSpace ℂ F] [CompleteSpace F]

/-- K5a consumes the existing bundled/unbundled Euclidean equivalence. -/
theorem memSobolev_iff_bundled (s : ℝ)
    (u : TemperedDistribution (EuclideanSpace ℝ (Fin n)) F) :
    TemperedDistribution.MemSobolev s 2 u ↔
      ∃ v : BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) F s 2,
        v.toDistr = u := by
  constructor
  · intro hu
    exact ⟨hu.toBesselPotentialSpace, rfl⟩
  · rintro ⟨v, rfl⟩
    exact v.memSobolev_toDistr

end SobolevLocalization

/-- The density line's fiber uses DG's actual |det|-transforming carrier. -/
abbrev DensityFiber (I : ModelWithCorners ℝ E H) (x : M) :=
  TauCetiRoadmap.DifferentialGeometry.Density (TangentSpace I x) (Module.finrank ℝ E)

end LocalGeometry

section RealBundleTests

open Bundle
open scoped CompactConvergenceCLM SchwartzMap ENNReal

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F]
  (V : M → Type*) [∀ x, TopologicalSpace (V x)]
  [∀ x, AddCommGroup (V x)] [∀ x, Module ℝ (V x)]
  [TopologicalSpace (TotalSpace F V)] [FiberBundle F V] [VectorBundle ℝ F V]

/-- The real carrier imposes no complex scalar structure on its fibers. -/
def realBundleTestSubmodule [ContMDiffVectorBundle ∞ F V I] :
    Submodule ℝ (ContMDiffSection I F ∞ V) where
  carrier := {s | IsCompact (closure {x : M | s x ≠ 0})}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

abbrev RealBundleTest [ContMDiffVectorBundle ∞ F V I] :=
  realBundleTestSubmodule (I := I) F V

variable [ContMDiffVectorBundle ∞ F V I]

instance realBundleTestTopology [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    TopologicalSpace (RealBundleTest (I := I) F V) := by sorry

instance realBundleTestTopologicalAddGroup [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    IsTopologicalAddGroup (RealBundleTest (I := I) F V) := by sorry

instance realBundleTestContinuousSMul [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    ContinuousSMul ℝ (RealBundleTest (I := I) F V) := by sorry

instance realBundleTestLocallyConvex [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    LocallyConvexSpace ℝ (RealBundleTest (I := I) F V) := by sorry

/-- Real-linear extension by zero from an actual native chart/frame test. -/
def realBundleTestOfChart [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℝ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] (x : M)
    (e : Trivialization F (TotalSpace.proj : TotalSpace F V → M))
    (he : e ∈ trivializationAtlas F V) (Ω : TopologicalSpace.Opens E)
    (hΩ : (Ω : Set E) ⊆ (extChartAt I x).target)
    (hFrame : ∀ z ∈ (Ω : Set E), (extChartAt I x).symm z ∈ e.baseSet) :
    TestFunction Ω F ⊤ →ₗ[ℝ] RealBundleTest (I := I) F V := by sorry

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M]
  [CompleteSpace E] [FiniteDimensional ℝ E]
  [FiniteDimensional ℝ F] [CompleteSpace F]

open scoped Classical in
theorem realBundleTestOfChart_apply (x : M)
    (e : Trivialization F (TotalSpace.proj : TotalSpace F V → M))
    (he : e ∈ trivializationAtlas F V) (Ω : TopologicalSpace.Opens E)
    (hΩ : (Ω : Set E) ⊆ (extChartAt I x).target)
    (hFrame : ∀ z ∈ (Ω : Set E), (extChartAt I x).symm z ∈ e.baseSet)
    (φ : TestFunction Ω F ⊤) (y : M) :
    (realBundleTestOfChart F V x e he Ω hΩ hFrame φ).1 y =
      if y ∈ (extChartAt I x).source ∧ y ∈ e.baseSet then
        e.symm y (φ (extChartAt I x y)) else 0 := by sorry

theorem realBundleTest_continuous_iff
    (A : Type*) [AddCommGroup A] [Module ℝ A]
    [TopologicalSpace A] [IsTopologicalAddGroup A]
    [ContinuousSMul ℝ A] [LocallyConvexSpace ℝ A]
    (f : RealBundleTest (I := I) F V →ₗ[ℝ] A) :
    Continuous f ↔ ∀ (x : M)
      (e : Trivialization F (TotalSpace.proj : TotalSpace F V → M))
      (he : e ∈ trivializationAtlas F V) (Ω : TopologicalSpace.Opens E)
      (hΩ : (Ω : Set E) ⊆ (extChartAt I x).target)
      (hFrame : ∀ z ∈ (Ω : Set E), (extChartAt I x).symm z ∈ e.baseSet),
      Continuous (f.comp (realBundleTestOfChart F V x e he Ω hΩ hFrame)) := by sorry

/-- The compact-convergence real dual, also for bundles with no complexification chosen. -/
abbrev RealBundleDistribution := RealBundleTest (I := I) F V →L_c[ℝ] ℝ

end RealBundleTests

section BundleTests

open Bundle
open scoped CompactConvergenceCLM SchwartzMap ENNReal

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]

variable (F : Type*) [NormedAddCommGroup F] [NormedSpace ℂ F]
  (V : M → Type*) [∀ x, TopologicalSpace (V x)]
  [∀ x, AddCommGroup (V x)] [∀ x, Module ℂ (V x)]
  [TopologicalSpace (TotalSpace F V)] [FiberBundle F V]
  [VectorBundle ℝ F V]

/-- V is the dual coefficient bundle tensored with the density line in applications. -/
def bundleTestSubmodule [ContMDiffVectorBundle ∞ F V I] :
    Submodule ℝ (ContMDiffSection I F ∞ V) where
  carrier := {s | IsCompact (closure {x : M | s x ≠ 0})}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

abbrev BundleTest [ContMDiffVectorBundle ∞ F V I] := bundleTestSubmodule (I := I) F V

/-- The data is pointwise multiplication; smoothness and support closure are targets. -/
def bundleTestSmul [VectorBundle ℂ F V] [ContMDiffVectorBundle ∞ F V I]
    (c : ℂ) (s : BundleTest (I := I) F V) : BundleTest (I := I) F V :=
  ⟨⟨fun x ↦ c • s.1 x, by sorry⟩, by sorry⟩

variable [VectorBundle ℂ F V] [ContMDiffVectorBundle ∞ F V I]

instance bundleTestComplexSMul : SMul ℂ (BundleTest (I := I) F V) :=
  ⟨bundleTestSmul F V⟩

instance bundleTestComplexModule : Module ℂ (BundleTest (I := I) F V) where
  one_smul s := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact one_smul ℂ (s.1 x)
  mul_smul a b s := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact mul_smul a b (s.1 x)
  smul_add c s t := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact smul_add c (s.1 x) (t.1 x)
  smul_zero c := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact smul_zero c
  add_smul a b s := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact add_smul a b (s.1 x)
  zero_smul s := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact zero_smul ℂ (s.1 x)

theorem bundleTest_smul_apply (c : ℂ) (s : BundleTest (I := I) F V) (x : M) :
    (c • s).1 x = c • s.1 x := rfl

instance bundleTestScalarTower :
    IsScalarTower ℝ ℂ (BundleTest (I := I) F V) where
  smul_assoc a b s := by
    apply Subtype.ext
    apply ContMDiffSection.ext
    intro x
    exact smul_assoc a b (s.1 x)

/-- K5a constructs the fixed-compact derivative-seminorm inductive-limit topology. -/
instance bundleTestTopology [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℂ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    TopologicalSpace (BundleTest (I := I) F V) := by sorry

instance bundleTestTopologicalAddGroup [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℂ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    IsTopologicalAddGroup (BundleTest (I := I) F V) := by sorry

instance bundleTestContinuousSMul [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℂ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    ContinuousSMul ℂ (BundleTest (I := I) F V) := by sorry

instance bundleTestContinuousSMulReal [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℂ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    ContinuousSMul ℝ (BundleTest (I := I) F V) := IsScalarTower.continuousSMul ℂ

instance bundleTestLocallyConvex [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℂ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] :
    LocallyConvexSpace ℝ (BundleTest (I := I) F V) := by sorry

/-- Extension of an actual native chart/frame test; the equation below fixes its data. -/
def bundleTestOfChart [CompleteSpace E] [FiniteDimensional ℝ E]
    [FiniteDimensional ℂ F] [CompleteSpace F] [I.Boundaryless] [IsManifold I ∞ M] [T2Space M] (x : M)
    (e : Trivialization F (TotalSpace.proj : TotalSpace F V → M))
    (he : e ∈ trivializationAtlas F V) (Ω : TopologicalSpace.Opens E)
    (hΩ : (Ω : Set E) ⊆ (extChartAt I x).target)
    (hFrame : ∀ z ∈ (Ω : Set E), (extChartAt I x).symm z ∈ e.baseSet) :
    TestFunction Ω F ⊤ →ₗ[ℂ] BundleTest (I := I) F V := by sorry

variable [I.Boundaryless] [IsManifold I ∞ M] [T2Space M]
  [CompleteSpace E] [FiniteDimensional ℝ E]
  [FiniteDimensional ℂ F] [CompleteSpace F]

open scoped Classical in
theorem bundleTestOfChart_apply (x : M)
    (e : Trivialization F (TotalSpace.proj : TotalSpace F V → M))
    (he : e ∈ trivializationAtlas F V) (Ω : TopologicalSpace.Opens E)
    (hΩ : (Ω : Set E) ⊆ (extChartAt I x).target)
    (hFrame : ∀ z ∈ (Ω : Set E), (extChartAt I x).symm z ∈ e.baseSet)
    (φ : TestFunction Ω F ⊤) (y : M) :
    (bundleTestOfChart F V x e he Ω hΩ hFrame φ).1 y =
      if y ∈ (extChartAt I x).source ∧ y ∈ e.baseSet then
        e.symm y (φ (extChartAt I x y)) else 0 := by sorry

/-- This universal continuity rule pins the LF topology through native chart/frame tests. -/
theorem bundleTest_continuous_iff
    (A : Type*) [AddCommGroup A] [Module ℝ A] [Module ℂ A]
    [IsScalarTower ℝ ℂ A] [TopologicalSpace A] [IsTopologicalAddGroup A]
    [ContinuousSMul ℝ A] [LocallyConvexSpace ℝ A]
    (f : BundleTest (I := I) F V →ₗ[ℂ] A) :
    Continuous f ↔ ∀ (x : M)
      (e : Trivialization F (TotalSpace.proj : TotalSpace F V → M))
      (he : e ∈ trivializationAtlas F V) (Ω : TopologicalSpace.Opens E)
      (hΩ : (Ω : Set E) ⊆ (extChartAt I x).target)
      (hFrame : ∀ z ∈ (Ω : Set E), (extChartAt I x).symm z ∈ e.baseSet),
      Continuous (f.comp (bundleTestOfChart F V x e he Ω hΩ hFrame)) := by sorry

/-- Bilinear dual of density-valued tests with native compact-convergence topology. -/
abbrev BundleDistribution := BundleTest (I := I) F V →L_c[ℂ] ℂ

/-- Complex LF tests agree with the real LF carrier after restriction of scalars. -/
def bundleTestRestrictScalars :
    BundleTest (I := I) F V ≃L[ℝ] RealBundleTest (I := I) F V where
  toFun s := ⟨s.1, s.2⟩
  invFun s := ⟨s.1, s.2⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_add' _ _ := rfl
  map_smul' _ _ := rfl
  continuous_toFun := by sorry
  continuous_invFun := by sorry

omit [VectorBundle ℂ F V] in
theorem bundleTestRestrictScalars_apply (s : BundleTest (I := I) F V) (x : M) :
    (bundleTestRestrictScalars F V s).1 x = s.1 x := rfl

variable (n q : ℕ) (G : Type*) [NormedAddCommGroup G] [InnerProductSpace ℂ G]
  [CompleteSpace G] [FiniteDimensional ℂ G]
  (localize : Fin q → BundleDistribution (I := I) F V →L[ℂ]
    TemperedDistribution (EuclideanSpace ℝ (Fin n)) G)

/-- Actual compatible tuples in the native Hilbert product. -/
def bundleSobolevSubmodule (s : ℝ) : Submodule ℂ
    (PiLp 2 (fun _ : Fin q ↦ BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) G s 2)) where
  carrier := {v | ∃ u : BundleDistribution (I := I) F V,
    ∀ i, (v i).toDistr = localize i u}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- Norm, inner product and scalar operations are inherited from the native product. -/
abbrev BundleSobolev (s : ℝ) := bundleSobolevSubmodule F V n q G localize s

variable (s : ℝ)

omit [FiniteDimensional ℂ G] in
theorem bundleSobolev_norm_sq (u : BundleSobolev F V n q G localize s) :
    ‖u‖ ^ (2 : ℕ) = ∑ i, ‖u.1 i‖ ^ (2 : ℕ) :=
  PiLp.norm_sq_eq_of_L2 _ u.1

/-- The pinned atlas norm is the finite Hilbert-product norm. -/
def bundleSobolevLocalizations : BundleSobolev F V n q G localize s →ₗᵢ[ℂ]
    PiLp 2 (fun _ : Fin q ↦ BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) G s 2) := by
  exact (bundleSobolevSubmodule F V n q G localize s).subtypeₗᵢ

omit [FiniteDimensional ℂ G] in
theorem bundleSobolevLocalizations_apply (u : BundleSobolev F V n q G localize s)
    (i : Fin q) : bundleSobolevLocalizations F V n q G localize s u i = u.1 i := rfl

/-- Injectivity is an explicit argument exactly where reconstruction requires it. -/
def bundleSobolevToDistribution
    (hinj : Function.Injective (fun u ↦ fun i ↦ localize i u)) :
    BundleSobolev F V n q G localize s →ₗ[ℂ] BundleDistribution (I := I) F V where
  toFun u := Classical.choose u.2
  map_add' := by sorry
  map_smul' := by sorry

omit [FiniteDimensional ℂ G] in
theorem bundleSobolevToDistribution_localize
    (hinj : Function.Injective (fun u ↦ fun i ↦ localize i u))
    (u : BundleSobolev F V n q G localize s) (i : Fin q) :
    (u.1 i).toDistr = localize i (bundleSobolevToDistribution F V n q G localize s hinj u) :=
  Classical.choose_spec u.2 i

omit [FiniteDimensional ℂ G] in
/-- The atlas reconstruction estimates prove this closedness for geometric localizations. -/
theorem bundleSobolevComplete
    (hclosed : IsClosed (bundleSobolevSubmodule F V n q G localize s).carrier) :
    CompleteSpace (BundleSobolev F V n q G localize s) :=
  completeSpace_coe_iff_isComplete.mpr hclosed.isComplete

end BundleTests

section DistributionComplexification

open scoped CompactConvergenceCLM

variable (TR TC : Type*) [AddCommGroup TR] [Module ℝ TR] [TopologicalSpace TR]
  [AddCommGroup TC] [Module ℝ TC] [Module ℂ TC] [TopologicalSpace TC]

/-- K5a applies this to the LF real/imaginary split of density-valued bundle tests. -/
def realDistributionComplexify [IsScalarTower ℝ ℂ TC]
    (split : TC ≃L[ℝ] TR × TR)
    (hI : ∀ φ : TC, split (Complex.I • φ) = (-(split φ).2, (split φ).1)) :
    (TR →L_c[ℝ] ℝ) →L[ℝ] (TC →L_c[ℂ] ℂ) := by sorry

/-- Conjugation is real-linear on complex distributions, with compact-convergence topology. -/
def bundleDistributionConjugation [IsScalarTower ℝ ℂ TC]
    (split : TC ≃L[ℝ] TR × TR)
    (hI : ∀ φ : TC, split (Complex.I • φ) = (-(split φ).2, (split φ).1)) :
    (TC →L_c[ℂ] ℂ) →L[ℝ] (TC →L_c[ℂ] ℂ) := by sorry

variable [IsScalarTower ℝ ℂ TC] (split : TC ≃L[ℝ] TR × TR)
  (hI : ∀ φ : TC, split (Complex.I • φ) = (-(split φ).2, (split φ).1))

/-- This equation pins extension, including complex linearity on its test argument. -/
theorem realDistributionComplexify_apply (u : TR →L_c[ℝ] ℝ) (φ : TC) :
    realDistributionComplexify TR TC split hI u φ =
      (u (split φ).1 : ℂ) + Complex.I * (u (split φ).2 : ℂ) := by sorry

theorem bundleDistributionConjugation_apply (u : TC →L_c[ℂ] ℂ) (φ : TC) :
    bundleDistributionConjugation TR TC split hI u φ =
      star (u (split.symm ((split φ).1, -(split φ).2))) := by sorry

theorem bundleDistributionConjugation_involutive :
    Function.Involutive (bundleDistributionConjugation TR TC split hI) := by sorry

theorem realDistributionComplexify_range :
    Set.range (realDistributionComplexify TR TC split hI) =
      {u | bundleDistributionConjugation TR TC split hI u = u} := by sorry

end DistributionComplexification

section ComplexOrderMultipliers

open scoped SchwartzMap
variable (n : ℕ)

/-- Mathlib's Fourier variable ζ uses the 2π phase. -/
def complexBesselSymbol (z : ℂ) (ζ : EuclideanSpace ℝ (Fin n)) : ℂ :=
  Complex.exp ((z / 2) * (Real.log (1 + ‖ζ‖ ^ (2 : ℕ)) : ℂ))

theorem complexBesselSymbol_temperate (z : ℂ) :
    (complexBesselSymbol n z).HasTemperateGrowth := by sorry

variable (G : Type*) [NormedAddCommGroup G] [InnerProductSpace ℂ G] [CompleteSpace G]

def complexBesselMultiplier (z : ℂ) :
    SchwartzMap (EuclideanSpace ℝ (Fin n)) G →L[ℂ]
      SchwartzMap (EuclideanSpace ℝ (Fin n)) G :=
  SchwartzMap.fourierMultiplierCLM G (complexBesselSymbol n z)

def complexBesselDistributionMultiplier (z : ℂ) :
    TemperedDistribution (EuclideanSpace ℝ (Fin n)) G →L[ℂ]
      TemperedDistribution (EuclideanSpace ℝ (Fin n)) G :=
  TemperedDistribution.fourierMultiplierCLM G (complexBesselSymbol n z)

theorem complexBesselDistributionMultiplier_real (s : ℝ) :
    complexBesselDistributionMultiplier n G (s : ℂ) =
      TemperedDistribution.besselPotential (EuclideanSpace ℝ (Fin n)) G s := by sorry

/-- The imaginary-order factor is unitary on the native weighted Fourier L² carrier. -/
def complexBesselToL2 (s t : ℝ) :
    BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) G s 2 ≃ₗᵢ[ℂ]
      MeasureTheory.Lp G 2 (MeasureTheory.volume : MeasureTheory.Measure
        (EuclideanSpace ℝ (Fin n))) := by sorry

theorem complexBesselToL2_zero (s : ℝ) :
    complexBesselToL2 n G s 0 =
      BesselPotentialSpace.toLpₗᵢ (EuclideanSpace ℝ (Fin n)) G s 2 := by sorry

theorem complexBesselToL2_distribution (s t : ℝ)
    (u : BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) G s 2) :
    complexBesselDistributionMultiplier n G ((s : ℂ) + Complex.I * t) u.toDistr =
      MeasureTheory.Lp.toTemperedDistribution (complexBesselToL2 n G s t u) := by sorry

theorem complexBesselToL2_norm (s t : ℝ)
    (u : BesselPotentialSpace (EuclideanSpace ℝ (Fin n)) G s 2) :
    ‖complexBesselToL2 n G s t u‖ = ‖u‖ :=
  (complexBesselToL2 n G s t).norm_map u

end ComplexOrderMultipliers

end TauCetiRoadmap.ComplexKahlerGeometry
