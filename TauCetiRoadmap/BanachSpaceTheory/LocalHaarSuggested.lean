import Mathlib.MeasureTheory.Function.Holder
import Mathlib.MeasureTheory.Function.LpSpace.Complete
import Mathlib.Analysis.Normed.Lp.lpHolder
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.Topology.Compactness.Paracompact
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.Algebra.Module.TransferInstance

/-!
Illustrative, nonexhaustive interfaces for B5.LocalHaarDual and A7.LocalTranslations.
The README is definitive. All carriers and maps are defined; admitted declarations
are explicit mathematical proof targets, never carrier or map values.
-/

noncomputable section
open MeasureTheory Filter
open scoped ENNReal NNReal Topology lp

namespace BanachSpaceTheory.LocalHaar

variable {X 𝕜 : Type*} [MeasurableSpace X] [RCLike 𝕜]

/-- One common finite bound on every finite-measure Borel test set. -/
def LocalBound (μ : Measure X) (f : X → 𝕜) (C : ℝ) : Prop :=
  0 ≤ C ∧ ∀ s : Set X, MeasurableSet s → μ s < ∞ →
    ∀ᵐ x ∂μ.restrict s, ‖f x‖ ≤ C

def LocallyBounded (μ : Measure X) (f : X → 𝕜) : Prop :=
  Measurable f ∧ ∃ C : ℝ, LocalBound μ f C

def LocalNull (μ : Measure X) (f : X → 𝕜) : Prop :=
  ∀ s : Set X, MeasurableSet s → μ s < ∞ →
    ∀ᵐ x ∂μ.restrict s, f x = 0

theorem bounded_zero (μ : Measure X) : LocallyBounded μ (0 : X → 𝕜) := by
  sorry

theorem bounded_add (μ : Measure X) (f g : X → 𝕜)
    (hf : LocallyBounded μ f) (hg : LocallyBounded μ g) :
    LocallyBounded μ (f + g) := by
  sorry

theorem bounded_smul (μ : Measure X) (c : 𝕜) (f : X → 𝕜)
    (hf : LocallyBounded μ f) : LocallyBounded μ (c • f) := by
  sorry

/-- Actual measurable-function submodule, with pointwise native operations. -/
def boundedSubmodule (μ : Measure X) : Submodule 𝕜 (X → 𝕜) where
  carrier := LocallyBounded μ
  zero_mem' := bounded_zero μ
  add_mem' := fun {f g} hf hg => bounded_add μ f g hf hg
  smul_mem' := fun c {f} hf => bounded_smul μ c f hf

abbrev Raw (𝕜 : Type*) [RCLike 𝕜] (μ : Measure X) :=
  ↥(boundedSubmodule (𝕜 := 𝕜) μ)

theorem null_zero (μ : Measure X) : LocalNull μ (0 : X → 𝕜) := by
  sorry

theorem null_add (μ : Measure X) (f g : X → 𝕜)
    (hf : LocalNull μ f) (hg : LocalNull μ g) : LocalNull μ (f + g) := by
  sorry

theorem null_smul (μ : Measure X) (c : 𝕜) (f : X → 𝕜)
    (hf : LocalNull μ f) : LocalNull μ (c • f) := by
  sorry

def nullSubmodule (μ : Measure X) : Submodule 𝕜 (Raw 𝕜 μ) where
  carrier := fun f => LocalNull μ f.val
  zero_mem' := null_zero μ
  add_mem' := fun {f g} hf hg => null_add μ f.val g.val hf hg
  smul_mem' := fun c {f} hf => null_smul μ c f.val hf

/-- A wrapper of the actual algebraic quotient, with only the local-norm topology below. -/
structure LocalHaarLInfinity (𝕜 : Type*) [RCLike 𝕜] (μ : Measure X) where
  toQuotient : Raw 𝕜 μ ⧸ nullSubmodule (𝕜 := 𝕜) μ

def quotientEquiv (μ : Measure X) :
    LocalHaarLInfinity 𝕜 μ ≃ (Raw 𝕜 μ ⧸ nullSubmodule (𝕜 := 𝕜) μ) where
  toFun := LocalHaarLInfinity.toQuotient
  invFun := LocalHaarLInfinity.mk
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

instance quotientAddGroup (μ : Measure X) : AddCommGroup (LocalHaarLInfinity 𝕜 μ) :=
  (quotientEquiv (𝕜 := 𝕜) μ).addCommGroup

instance quotientScalarModule (μ : Measure X) : Module 𝕜 (LocalHaarLInfinity 𝕜 μ) :=
  (quotientEquiv (𝕜 := 𝕜) μ).addEquiv.module 𝕜

def quotientLinearEquiv (μ : Measure X) :
    LocalHaarLInfinity 𝕜 μ ≃ₗ[𝕜] (Raw 𝕜 μ ⧸ nullSubmodule (𝕜 := 𝕜) μ) :=
  (quotientEquiv (𝕜 := 𝕜) μ).addEquiv.linearEquiv 𝕜

def classOf (μ : Measure X) : Raw 𝕜 μ →ₗ[𝕜] LocalHaarLInfinity 𝕜 μ :=
  (quotientLinearEquiv (𝕜 := 𝕜) μ).symm.toLinearMap.comp
    (nullSubmodule (𝕜 := 𝕜) μ).mkQ

def boundInf (μ : Measure X) (f : Raw 𝕜 μ) : ℝ :=
  sInf {C : ℝ | LocalBound μ f.val C}

theorem boundInf_congr (μ : Measure X) (f g : Raw 𝕜 μ)
    (h : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel f g) :
    boundInf μ f = boundInf μ g := by
  sorry

def localNorm (μ : Measure X) : LocalHaarLInfinity 𝕜 μ → ℝ :=
  fun f => Quotient.lift (boundInf μ) (boundInf_congr μ) f.toQuotient

instance localNormInstance (μ : Measure X) : Norm (LocalHaarLInfinity 𝕜 μ) :=
  ⟨localNorm μ⟩

abbrev quotientAddCommGroup (μ : Measure X) : AddCommGroup (LocalHaarLInfinity 𝕜 μ) := inferInstance
abbrev quotientModule (μ : Measure X) : Module 𝕜 (LocalHaarLInfinity 𝕜 μ) := inferInstance

/-- Native norm axioms for the specified infimum and quotient operations. -/
theorem normCore (μ : Measure X) : NormedSpace.Core 𝕜 (LocalHaarLInfinity 𝕜 μ) := by
  sorry

instance localNormedAddCommGroup (μ : Measure X) :
    NormedAddCommGroup (LocalHaarLInfinity 𝕜 μ) :=
  NormedAddCommGroup.ofCore (normCore μ)

instance localNormedSpace (μ : Measure X) : NormedSpace 𝕜 (LocalHaarLInfinity 𝕜 μ) :=
  NormedSpace.ofCore (normCore μ)

theorem normed_additive_parent (μ : Measure X) :
    (localNormedAddCommGroup (𝕜 := 𝕜) μ).toAddCommGroup = quotientAddCommGroup μ := rfl

theorem normed_scalar_parent (μ : Measure X) :
    (localNormedSpace (𝕜 := 𝕜) μ).toModule = quotientModule μ := rfl

theorem local_norm_class (μ : Measure X) (f : Raw 𝕜 μ) :
    ‖classOf (𝕜 := 𝕜) μ f‖ = sInf {C : ℝ | LocalBound μ f.val C} := rfl

theorem class_eq_zero (μ : Measure X) (f : Raw 𝕜 μ) :
    classOf (𝕜 := 𝕜) μ f = 0 ↔ LocalNull μ f.val := by
  change (LocalHaarLInfinity.mk (Submodule.Quotient.mk f) : LocalHaarLInfinity 𝕜 μ) =
      LocalHaarLInfinity.mk 0 ↔ _
  rw [LocalHaarLInfinity.mk.injEq]
  exact Submodule.Quotient.mk_eq_zero _

theorem boundInf_attained (μ : Measure X) (f : Raw 𝕜 μ) :
    LocalBound μ f.val (boundInf μ f) := by
  sorry

/-- Coercion from native global Lp∞ supplies an actual strongly measurable representative. -/
theorem globalRepresentative_bounded (μ : Measure X) (f : Lp 𝕜 ∞ μ) :
    LocallyBounded μ (f : X → 𝕜) := by
  sorry

def globalToLocalFun (μ : Measure X) (f : Lp 𝕜 ∞ μ) : LocalHaarLInfinity 𝕜 μ :=
  classOf (𝕜 := 𝕜) μ ⟨f, globalRepresentative_bounded μ f⟩

theorem globalToLocal_add (μ : Measure X) (f g : Lp 𝕜 ∞ μ) :
    globalToLocalFun μ (f + g) = globalToLocalFun μ f + globalToLocalFun μ g := by
  sorry

theorem globalToLocal_smul (μ : Measure X) (c : 𝕜) (f : Lp 𝕜 ∞ μ) :
    globalToLocalFun μ (c • f) = c • globalToLocalFun μ f := by
  sorry

def globalToLocalLinear (μ : Measure X) :
    Lp 𝕜 ∞ μ →ₗ[𝕜] LocalHaarLInfinity 𝕜 μ where
  toFun := globalToLocalFun μ
  map_add' := globalToLocal_add μ
  map_smul' := globalToLocal_smul μ

theorem globalToLocal_bound (μ : Measure X) (f : Lp 𝕜 ∞ μ) :
    ‖globalToLocalLinear (𝕜 := 𝕜) μ f‖ ≤ 1 * ‖f‖ := by
  sorry

def globalToLocal (μ : Measure X) : Lp 𝕜 ∞ μ →L[𝕜] LocalHaarLInfinity 𝕜 μ :=
  (globalToLocalLinear (𝕜 := 𝕜) μ).mkContinuous 1 (globalToLocal_bound μ)

theorem globalToLocal_kernel (μ : Measure X) (f : Lp 𝕜 ∞ μ) :
    globalToLocal (𝕜 := 𝕜) μ f = 0 ↔ LocalNull μ (f : X → 𝕜) := by
  sorry

theorem integrable_raw_product (μ : Measure X) (g : Raw 𝕜 μ) (f : Lp 𝕜 1 μ) :
    Integrable (fun x => f x * g.val x) μ := by
  sorry

/-- Bilinear scalar pairing; there is no complex conjugation. -/
def rawIntegral (μ : Measure X) (g : Raw 𝕜 μ) (f : Lp 𝕜 1 μ) : 𝕜 :=
  ∫ x, f x * g.val x ∂μ

theorem rawIntegral_congr (μ : Measure X) (g h : Raw 𝕜 μ)
    (heq : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel g h) :
    rawIntegral μ g = rawIntegral μ h := by
  sorry

def integralPair (μ : Measure X) : LocalHaarLInfinity 𝕜 μ → (Lp 𝕜 1 μ → 𝕜) :=
  fun g => Quotient.lift (rawIntegral μ) (rawIntegral_congr μ) g.toQuotient

theorem integralPair_add_right (μ : Measure X) (g : LocalHaarLInfinity 𝕜 μ)
    (f h : Lp 𝕜 1 μ) : integralPair μ g (f + h) = integralPair μ g f + integralPair μ g h := by
  sorry

theorem integralPair_smul_right (μ : Measure X) (g : LocalHaarLInfinity 𝕜 μ)
    (c : 𝕜) (f : Lp 𝕜 1 μ) : integralPair μ g (c • f) = c • integralPair μ g f := by
  sorry

def integralFunctionalLinear (μ : Measure X) (g : LocalHaarLInfinity 𝕜 μ) :
    Lp 𝕜 1 μ →ₗ[𝕜] 𝕜 where
  toFun := integralPair μ g
  map_add' := integralPair_add_right μ g
  map_smul' := integralPair_smul_right μ g

theorem integralPair_bound (μ : Measure X) (g : LocalHaarLInfinity 𝕜 μ)
    (f : Lp 𝕜 1 μ) : ‖integralPair μ g f‖ ≤ ‖g‖ * ‖f‖ := by
  sorry

def integralFunctional (μ : Measure X) (g : LocalHaarLInfinity 𝕜 μ) :
    StrongDual 𝕜 (Lp 𝕜 1 μ) :=
  (integralFunctionalLinear μ g).mkContinuous ‖g‖ (integralPair_bound μ g)

theorem integralFunctional_add (μ : Measure X) (g h : LocalHaarLInfinity 𝕜 μ) :
    integralFunctional μ (g + h) = integralFunctional μ g + integralFunctional μ h := by
  sorry

theorem integralFunctional_smul (μ : Measure X) (c : 𝕜) (g : LocalHaarLInfinity 𝕜 μ) :
    integralFunctional μ (c • g) = c • integralFunctional μ g := by
  sorry

def toDualLinear (μ : Measure X) :
    LocalHaarLInfinity 𝕜 μ →ₗ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ) where
  toFun := integralFunctional μ
  map_add' := integralFunctional_add μ
  map_smul' := integralFunctional_smul μ

theorem rawMul_bounded (μ : Measure X) (f g : Raw 𝕜 μ) :
    LocallyBounded μ (fun x => f.val x * g.val x) := by
  sorry

def rawMul (μ : Measure X) (f g : Raw 𝕜 μ) : Raw 𝕜 μ :=
  ⟨fun x => f.val x * g.val x, rawMul_bounded μ f g⟩

theorem localMul_congr (μ : Measure X) (f f' g g' : Raw 𝕜 μ)
    (hf : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel f f')
    (hg : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel g g') :
    classOf (𝕜 := 𝕜) μ (rawMul μ f g) = classOf (𝕜 := 𝕜) μ (rawMul μ f' g') := by
  sorry

def localMul (μ : Measure X) :
    LocalHaarLInfinity 𝕜 μ → LocalHaarLInfinity 𝕜 μ → LocalHaarLInfinity 𝕜 μ :=
  fun f g => Quotient.lift₂ (fun f g => classOf (𝕜 := 𝕜) μ (rawMul μ f g))
    (fun f g f' g' hf hg => localMul_congr μ f f' g g' hf hg) f.toQuotient g.toQuotient

theorem rawConj_bounded (μ : Measure X) (f : Raw 𝕜 μ) :
    LocallyBounded μ (fun x => star (f.val x)) := by
  sorry

def rawConj (μ : Measure X) (f : Raw 𝕜 μ) : Raw 𝕜 μ :=
  ⟨fun x => star (f.val x), rawConj_bounded μ f⟩

theorem localConj_congr (μ : Measure X) (f g : Raw 𝕜 μ)
    (h : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel f g) :
    classOf (𝕜 := 𝕜) μ (rawConj μ f) = classOf (𝕜 := 𝕜) μ (rawConj μ g) := by
  sorry

def localConj (μ : Measure X) : LocalHaarLInfinity 𝕜 μ → LocalHaarLInfinity 𝕜 μ :=
  fun f => Quotient.lift (fun f => classOf (𝕜 := 𝕜) μ (rawConj μ f)) (localConj_congr μ) f.toQuotient

theorem const_bounded (μ : Measure X) (c : 𝕜) : LocallyBounded μ (fun _ : X => c) := by
  sorry

def localConst (μ : Measure X) (c : 𝕜) : LocalHaarLInfinity 𝕜 μ :=
  classOf (𝕜 := 𝕜) μ ⟨fun _ => c, const_bounded μ c⟩

theorem localMul_norm (μ : Measure X) (f g : LocalHaarLInfinity 𝕜 μ) :
    ‖localMul μ f g‖ ≤ ‖f‖ * ‖g‖ := by
  sorry

theorem localConj_norm (μ : Measure X) (f : LocalHaarLInfinity 𝕜 μ) :
    ‖localConj μ f‖ = ‖f‖ := by
  sorry

theorem local_cstar_identity (μ : Measure X) (f : LocalHaarLInfinity 𝕜 μ) :
    ‖localMul μ (localConj μ f) f‖ = ‖f‖ ^ 2 := by
  sorry

section Haar
variable {G : Type*} [hGroup : Group G] [hTop : TopologicalSpace G] [hTG : IsTopologicalGroup G]
  [hLC : LocallyCompactSpace G] [hT2 : T2Space G] [hMeas : MeasurableSpace G] [hBorel : BorelSpace G]
variable (μ : Measure G) [hHaar : μ.IsHaarMeasure] [hRegular : μ.Regular]
include hGroup hTop hTG hLC hT2 hMeas hBorel hHaar hRegular

/-- Explicitly Haar-scoped surjectivity, not arbitrary-measure endpoint duality. -/
theorem globalToLocal_surjective : Function.Surjective (globalToLocal (𝕜 := 𝕜) μ) := by
  sorry

theorem toDual_norm (g : LocalHaarLInfinity 𝕜 μ) : ‖toDualLinear (𝕜 := 𝕜) μ g‖ = ‖g‖ := by
  sorry

def toDualIsometry : LocalHaarLInfinity 𝕜 μ →ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ) :=
  { toDualLinear (𝕜 := 𝕜) μ with norm_map' := toDual_norm μ }

theorem toDual_surjective : Function.Surjective (toDualIsometry (𝕜 := 𝕜) μ) := by
  sorry

def integralDualEquiv :
    LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] StrongDual 𝕜 (Lp 𝕜 1 μ) :=
  LinearIsometryEquiv.ofSurjective (toDualIsometry (𝕜 := 𝕜) μ) (toDual_surjective μ)

theorem integralDualEquiv_apply (g : Raw 𝕜 μ) (f : Lp 𝕜 1 μ) :
    integralDualEquiv (𝕜 := 𝕜) μ (classOf (𝕜 := 𝕜) μ g) f = ∫ x, f x * g.val x ∂μ := rfl

theorem globalToLocal_norm [SigmaFinite μ] (f : Lp 𝕜 ∞ μ) :
    ‖globalToLocal (𝕜 := 𝕜) μ f‖ = ‖f‖ := by
  sorry

def globalLocalEquiv [SigmaFinite μ] : Lp 𝕜 ∞ μ ≃ₗᵢ[𝕜] LocalHaarLInfinity 𝕜 μ :=
  LinearIsometryEquiv.ofSurjective
    { (globalToLocal (𝕜 := 𝕜) μ).toLinearMap with norm_map' := globalToLocal_norm μ }
    (globalToLocal_surjective μ)

/-- Left translation uses x⁻¹ on the argument. -/
theorem translate_raw_bounded (x : G) (g : Raw 𝕜 μ) :
    LocallyBounded μ (fun y => g.val (x⁻¹ * y)) := by
  sorry

def translateRaw (x : G) (g : Raw 𝕜 μ) : Raw 𝕜 μ :=
  ⟨fun y => g.val (x⁻¹ * y), translate_raw_bounded μ x g⟩

theorem translate_congr (x : G) (g h : Raw 𝕜 μ)
    (heq : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel g h) :
    classOf (𝕜 := 𝕜) μ (translateRaw μ x g) = classOf (𝕜 := 𝕜) μ (translateRaw μ x h) := by
  sorry

def translate (x : G) : LocalHaarLInfinity 𝕜 μ → LocalHaarLInfinity 𝕜 μ :=
  fun g => Quotient.lift (fun g => classOf (𝕜 := 𝕜) μ (translateRaw μ x g))
    (translate_congr μ x) g.toQuotient

theorem translate_add (x : G) (g h : LocalHaarLInfinity 𝕜 μ) :
    translate μ x (g + h) = translate μ x g + translate μ x h := by
  sorry

theorem translate_smul (x : G) (c : 𝕜) (g : LocalHaarLInfinity 𝕜 μ) :
    translate μ x (c • g) = c • translate μ x g := by
  sorry

def translateLinear (x : G) : LocalHaarLInfinity 𝕜 μ →ₗ[𝕜] LocalHaarLInfinity 𝕜 μ where
  toFun := translate μ x
  map_add' := translate_add μ x
  map_smul' := translate_smul μ x

theorem translate_norm (x : G) (g : LocalHaarLInfinity 𝕜 μ) :
    ‖translate μ x g‖ = ‖g‖ := by
  sorry

def translateIsometry (x : G) : LocalHaarLInfinity 𝕜 μ →ₗᵢ[𝕜] LocalHaarLInfinity 𝕜 μ :=
  { translateLinear μ x with norm_map' := translate_norm μ x }

theorem translate_inverse (x : G) (g : LocalHaarLInfinity 𝕜 μ) :
    translate μ x⁻¹ (translate μ x g) = g := by
  sorry

/-- Pairing covariance on the actual inverse-parameter native L1 translate. -/
theorem translation_pairing (x : G) (g : LocalHaarLInfinity 𝕜 μ) (f : Lp 𝕜 1 μ)
    (hf : MemLp (fun y => f (x * y)) 1 μ) :
    integralPair μ (translate μ x g) f =
      integralPair μ g (hf.toLp (fun y => f (x * y))) := by
  sorry


section Cosets
variable (H : OpenSubgroup G) [hSigma : SigmaCompactSpace H]
include hSigma

/-- A left coset space, with no normality or quotient-group assertion. -/
abbrev CosetIndex := G ⧸ H.toSubgroup

def cosetRepresentative (j : CosetIndex H) : G := Quotient.out j

def cosetMap (j : CosetIndex H) (h : H) : G := cosetRepresentative H j * (h : G)

/-- The actual pulled-back restriction along the injective coset parametrization. -/
def cosetMeasure (j : CosetIndex H) : Measure H := Measure.comap (cosetMap H j) μ

omit hMeas hBorel hHaar hRegular in
/-- Sigma-compact LCH cosets are normal by native paracompactness, not by compactness. -/
theorem coset_normalSpace : NormalSpace H := by
  let : LocallyCompactSpace H := H.isOpen.locallyCompactSpace
  let : ParacompactSpace H := paracompact_of_locallyCompact_sigmaCompact
  exact NormalSpace.of_paracompactSpace_r1Space

theorem coset_sigmaFinite (j : CosetIndex H) : SigmaFinite (cosetMeasure μ H j) := by
  sorry

/-- Restriction of the actual native L1 representative to the chosen coset. -/
theorem l1_component_memLp (f : Lp 𝕜 1 μ) (j : CosetIndex H) :
    MemLp (fun h : H => f (cosetMap H j h)) 1 (cosetMeasure μ H j) := by
  sorry

def l1Component (f : Lp 𝕜 1 μ) (j : CosetIndex H) : Lp 𝕜 1 (cosetMeasure μ H j) :=
  (l1_component_memLp μ H f j).toLp (fun h : H => f (cosetMap H j h))

theorem l1Components_mem (f : Lp 𝕜 1 μ) : Memℓp (l1Component μ H f) 1 := by
  sorry

def l1RestrictionFun (f : Lp 𝕜 1 μ) :
    lp (fun j : CosetIndex H => Lp 𝕜 1 (cosetMeasure μ H j)) 1 :=
  ⟨l1Component μ H f, l1Components_mem μ H f⟩

theorem l1Restriction_add (f g : Lp 𝕜 1 μ) :
    l1RestrictionFun μ H (f + g) = l1RestrictionFun μ H f + l1RestrictionFun μ H g := by
  sorry

theorem l1Restriction_smul (c : 𝕜) (f : Lp 𝕜 1 μ) :
    l1RestrictionFun μ H (c • f) = c • l1RestrictionFun μ H f := by
  sorry

def l1RestrictionLinear :
    Lp 𝕜 1 μ →ₗ[𝕜] lp (fun j : CosetIndex H => Lp 𝕜 1 (cosetMeasure μ H j)) 1 where
  toFun := l1RestrictionFun μ H
  map_add' := l1Restriction_add μ H
  map_smul' := l1Restriction_smul μ H

theorem l1Restriction_norm (f : Lp 𝕜 1 μ) : ‖l1RestrictionLinear μ H f‖ = ‖f‖ := by
  sorry

def l1RestrictionIsometry :
    Lp 𝕜 1 μ →ₗᵢ[𝕜] lp (fun j : CosetIndex H => Lp 𝕜 1 (cosetMeasure μ H j)) 1 :=
  { l1RestrictionLinear μ H with norm_map' := l1Restriction_norm μ H }

/-- Actual countable-support extension is the substantive surjectivity target. -/
theorem l1Restriction_surjective : Function.Surjective (l1RestrictionIsometry (𝕜 := 𝕜) μ H) := by
  sorry

def l1CosetEquiv :
    Lp 𝕜 1 μ ≃ₗᵢ[𝕜] lp (fun j : CosetIndex H => Lp 𝕜 1 (cosetMeasure μ H j)) 1 :=
  LinearIsometryEquiv.ofSurjective (l1RestrictionIsometry μ H) (l1Restriction_surjective μ H)

theorem local_component_memLp (g : Raw 𝕜 μ) (j : CosetIndex H) :
    MemLp (fun h : H => g.val (cosetMap H j h)) ∞ (cosetMeasure μ H j) := by
  sorry

def rawLocalComponent (g : Raw 𝕜 μ) (j : CosetIndex H) : Lp 𝕜 ∞ (cosetMeasure μ H j) :=
  (local_component_memLp μ H g j).toLp (fun h : H => g.val (cosetMap H j h))

theorem localComponent_congr (g h : Raw 𝕜 μ)
    (heq : (nullSubmodule (𝕜 := 𝕜) μ).quotientRel g h) :
    rawLocalComponent μ H g = rawLocalComponent μ H h := by
  sorry

def localComponent : LocalHaarLInfinity 𝕜 μ → ∀ j : CosetIndex H, Lp 𝕜 ∞ (cosetMeasure μ H j) :=
  fun g => Quotient.lift (rawLocalComponent μ H) (localComponent_congr μ H) g.toQuotient

theorem localComponents_mem (g : LocalHaarLInfinity 𝕜 μ) : Memℓp (localComponent μ H g) ∞ := by
  sorry

def localRestrictionFun (g : LocalHaarLInfinity 𝕜 μ) :
    lp (fun j : CosetIndex H => Lp 𝕜 ∞ (cosetMeasure μ H j)) ∞ :=
  ⟨localComponent μ H g, localComponents_mem μ H g⟩

theorem localRestriction_add (g h : LocalHaarLInfinity 𝕜 μ) :
    localRestrictionFun μ H (g + h) = localRestrictionFun μ H g + localRestrictionFun μ H h := by
  sorry

theorem localRestriction_smul (c : 𝕜) (g : LocalHaarLInfinity 𝕜 μ) :
    localRestrictionFun μ H (c • g) = c • localRestrictionFun μ H g := by
  sorry

def localRestrictionLinear :
    LocalHaarLInfinity 𝕜 μ →ₗ[𝕜] lp (fun j : CosetIndex H => Lp 𝕜 ∞ (cosetMeasure μ H j)) ∞ where
  toFun := localRestrictionFun μ H
  map_add' := localRestriction_add μ H
  map_smul' := localRestriction_smul μ H

theorem localRestriction_norm (g : LocalHaarLInfinity 𝕜 μ) :
    ‖localRestrictionLinear (𝕜 := 𝕜) μ H g‖ = ‖g‖ := by
  sorry

def localRestrictionIsometry :
    LocalHaarLInfinity 𝕜 μ →ₗᵢ[𝕜] lp (fun j : CosetIndex H => Lp 𝕜 ∞ (cosetMeasure μ H j)) ∞ :=
  { localRestrictionLinear (𝕜 := 𝕜) μ H with norm_map' := localRestriction_norm μ H }

/-- Bounded-continuous approximation, clopen pasting and radial-clipped limsup Borel gluing. -/
theorem localRestriction_surjective :
    Function.Surjective (localRestrictionIsometry (𝕜 := 𝕜) μ H) := by
  sorry

def localCosetEquiv :
    LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] lp (fun j : CosetIndex H => Lp 𝕜 ∞ (cosetMeasure μ H j)) ∞ :=
  LinearIsometryEquiv.ofSurjective (localRestrictionIsometry μ H) (localRestriction_surjective μ H)

/-- Explicit inverse component law retains the actual bounded family and chosen decomposition. -/
theorem localCosetEquiv_inverse_component
    (v : lp (fun j : CosetIndex H => Lp 𝕜 ∞ (cosetMeasure μ H j)) ∞) (j : CosetIndex H) :
    localComponent μ H ((localCosetEquiv (𝕜 := 𝕜) μ H).symm v) j = v j := by
  sorry

theorem l1CosetEquiv_inverse_component
    (v : lp (fun j : CosetIndex H => Lp 𝕜 1 (cosetMeasure μ H j)) 1) (j : CosetIndex H) :
    l1Component μ H ((l1CosetEquiv (𝕜 := 𝕜) μ H).symm v) j = v j := by
  sorry

theorem l1_norm_sum (f : Lp 𝕜 1 μ) :
    ‖f‖ = ∑' j : CosetIndex H, ‖l1Component μ H f j‖ := by
  sorry

end Cosets
end Haar
end BanachSpaceTheory.LocalHaar
