import Mathlib.Topology.Sheaves.Flasque
import Mathlib.Algebra.Category.ModuleCat.EpiMono
import Mathlib.Basic.Complex.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Analysis.Distribution.Distribution
import Mathlib.Analysis.Calculus.FDeriv.Add
import Mathlib.LinearAlgebra.Quotient.Basic

/-!
# Suggested targets for Hyperfunctions

These signatures are aids, not the specification or an exhaustive checklist. The README is
definitive. This file retains the proved generic restriction/support/extension interface and adds an explicit
one-dimensional holomorphic quotient. Locality, analytic gluing and embedding are honest targets
with admissions; the full-dimensional Sato development remains the README specification.
-/

noncomputable section

open CategoryTheory Opposite TopologicalSpace

namespace TauCetiRoadmap.Hyperfunctions

universe u

variable {X : TopCat.{u}} (F : TopCat.Sheaf (ModuleCat.{u} ℂ) X)

/-- The native complex-linear restriction map. -/
def restrictLinear {U V : Opens X} (h : U ≤ V) :
    F.obj.obj (op V) →ₗ[ℂ] F.obj.obj (op U) :=
  (F.obj.map (homOfLE h).op).hom

@[simp] theorem restrictLinear_self (U : Opens X) (s : F.obj.obj (op U)) :
    restrictLinear F (le_refl U) s = s := by
  change (F.obj.map (𝟙 (op U))) s = s
  simp

/-- Sections on V supported in a closed Z are the actual restriction kernel. -/
def supportedSections (V : Opens X) (Z : Set X) (hZ : IsClosed Z) :
    Submodule ℂ (F.obj.obj (op V)) :=
  LinearMap.ker (restrictLinear F
    (U := V ⊓ ⟨Zᶜ, hZ.isOpen_compl⟩) (V := V) inf_le_left)

@[simp] theorem mem_supportedSections_iff (V : Opens X) (Z : Set X) (hZ : IsClosed Z)
    (s : F.obj.obj (op V)) :
    s ∈ supportedSections F V Z hZ ↔
      restrictLinear F (U := V ⊓ ⟨Zᶜ, hZ.isOpen_compl⟩) inf_le_left s = 0 :=
  Iff.rfl

/-- Native flasqueness gives extension over every open inclusion. -/
theorem exists_extension [F.IsFlasque] {U V : Opens X} (h : U ≤ V)
    (s : F.obj.obj (op U)) :
    ∃ t : F.obj.obj (op V), restrictLinear F h t = s := by
  exact (ModuleCat.epi_iff_surjective (F.obj.map (homOfLE h).op)).mp inferInstance s

/-- Two extensions differ by the actual kernel; no uniqueness of extension is asserted. -/
theorem sub_mem_ker_iff {U V : Opens X} (h : U ≤ V)
    (s t : F.obj.obj (op V)) :
    s - t ∈ LinearMap.ker (restrictLinear F h) ↔
      restrictLinear F h s = restrictLinear F h t := by
  simp only [LinearMap.mem_ker, map_sub, sub_eq_zero]

/-- Choosing one extension identifies its fibre with the native kernel. -/
def extensionFiberEquiv {U V : Opens X} (h : U ≤ V)
    (s : F.obj.obj (op U)) (t₀ : F.obj.obj (op V))
    (ht₀ : restrictLinear F h t₀ = s) :
    LinearMap.ker (restrictLinear F h) ≃
      {t : F.obj.obj (op V) // restrictLinear F h t = s} where
  toFun k := ⟨t₀ + k, by simp only [map_add, ht₀, LinearMap.mem_ker.mp k.property, add_zero]⟩
  invFun t := ⟨t - t₀, by simp only [LinearMap.mem_ker, map_sub, t.property, ht₀, sub_self]⟩
  left_inv k := by apply Subtype.ext; simp
  right_inv t := by apply Subtype.ext; simp

/-- The supported-section kernel gives the complete ambiguity of extension across Z. -/
theorem extension_across_closed [F.IsFlasque] (V : Opens X) (Z : Set X)
    (hZ : IsClosed Z) (s : F.obj.obj (op (V ⊓ ⟨Zᶜ, hZ.isOpen_compl⟩))) :
    ∃ t : F.obj.obj (op V),
      restrictLinear F (U := V ⊓ ⟨Zᶜ, hZ.isOpen_compl⟩) inf_le_left t = s ∧
      ∀ t' : F.obj.obj (op V),
        restrictLinear F (U := V ⊓ ⟨Zᶜ, hZ.isOpen_compl⟩) inf_le_left t' = s ↔
        t' - t ∈ supportedSections F V Z hZ := by
  obtain ⟨t, ht⟩ := exists_extension F inf_le_left s
  refine ⟨t, ht, fun t' ↦ ?_⟩
  change restrictLinear F inf_le_left t' = s ↔
    t' - t ∈ LinearMap.ker (restrictLinear F inf_le_left)
  rw [sub_mem_ker_iff, ht]



/-- Local extension on an open cover implies native flasqueness. The target requires
all restrictions inside each chosen neighborhood, not merely stalkwise surjectivity. -/
theorem isFlasque_of_local_extension
    (h : ∀ x : X, ∃ W : Opens X, x ∈ W ∧
      ∀ (U V : Opens X) (hUV : U ≤ V), V ≤ W →
        Function.Surjective (restrictLinear F hUV)) : F.IsFlasque := by
  sorry

/-! A genuine one-dimensional Sato representative carrier. Functions are extended by
zero outside their open domain only to use one native ambient function module. No
continuity across that artificial boundary is imposed or used. -/

/-- Holomorphic sections on U, in a native submodule of actual functions. -/
def holomorphicSections (U : Opens ℂ) : Submodule ℂ (ℂ → ℂ) where
  carrier := {f | DifferentiableOn ℂ f U ∧ ∀ z, z ∉ U → f z = 0}
  zero_mem' := ⟨differentiableOn_const 0, by simp⟩
  add_mem' := by
    intro f g hf hg
    exact ⟨hf.1.add hg.1, fun z hz => by simp [hf.2 z hz, hg.2 z hz]⟩
  smul_mem' := by
    intro c f hf
    exact ⟨hf.1.const_smul c, fun z hz => by simp [hf.2 z hz]⟩

/-- Actual holomorphic restriction, with no germ/opaque carrier placeholder. -/
def holomorphicRestrict {U V : Opens ℂ} (h : U ≤ V) :
    holomorphicSections V →ₗ[ℂ] holomorphicSections U where
  toFun f := ⟨U.carrier.indicator f, by
    refine ⟨(f.property.1.mono h).congr ?_, ?_⟩
    · intro z hz
      simp [Set.indicator_of_mem hz]
    · intro z hz
      simp [Set.indicator_of_notMem hz]⟩
  map_add' f g := by
    apply Subtype.ext
    funext z
    by_cases hz : z ∈ U <;> simp [hz]
  map_smul' c f := by
    apply Subtype.ext
    funext z
    by_cases hz : z ∈ U <;> simp [hz]

/-- The two components of the punctured complex line. -/
def nonRealOpen : Opens ℂ :=
  ⟨{z | z.im ≠ 0}, by
    change IsOpen (Complex.im ⁻¹' ({0} : Set ℝ)ᶜ)
    exact isClosed_singleton.isOpen_compl.preimage Complex.continuous_im⟩

/-- W(U)=C minus (R minus U); U is relatively closed in W(U). -/
def complexNeighborhood (U : Opens ℝ) : Opens ℂ :=
  nonRealOpen ⊔ ⟨Complex.re ⁻¹' U, U.isOpen.preimage Complex.continuous_re⟩

/-- Holomorphic functions that extend across the real open U. -/
def throughReal (U : Opens ℝ) : Submodule ℂ (holomorphicSections nonRealOpen) :=
  LinearMap.range (holomorphicRestrict (U := nonRealOpen)
    (V := complexNeighborhood U) le_sup_left)

/-- The one-dimensional holomorphic quotient representing Sato sections on U. -/
abbrev OneDimBoundaryQuotient (U : Opens ℝ) :=
  holomorphicSections nonRealOpen ⧸ throughReal U

theorem throughReal_antitone {U V : Opens ℝ} (h : U ≤ V) :
    throughReal V ≤ throughReal U := by
  intro f hf
  obtain ⟨g, rfl⟩ := hf
  have hW : complexNeighborhood U ≤ complexNeighborhood V :=
    sup_le_sup_left (fun z hz => h hz) _
  refine ⟨holomorphicRestrict hW g, ?_⟩
  apply Subtype.ext
  funext z
  by_cases hz : z ∈ nonRealOpen
  · have hzU : z ∈ complexNeighborhood U := by
      change z ∈ nonRealOpen ∨ z.re ∈ U
      exact Or.inl hz
    simp [holomorphicRestrict, hz, hzU]
  · simp [holomorphicRestrict, hz]

/-- Restriction is the native quotient map induced by the identity on off-real sections. -/
def oneDimBoundaryRestrict {U V : Opens ℝ} (h : U ≤ V) :
    OneDimBoundaryQuotient V →ₗ[ℂ] OneDimBoundaryQuotient U :=
  Submodule.mapQ (throughReal V) (throughReal U) LinearMap.id
    (by simpa using throughReal_antitone h)

/-- This presheaf has the actual holomorphic quotient as its object on every real open. -/
def oneDimBoundaryPresheaf : TopCat.Presheaf (ModuleCat ℂ) (TopCat.of ℝ) where
  obj U := ModuleCat.of ℂ (OneDimBoundaryQuotient U.unop)
  map f := ModuleCat.ofHom (oneDimBoundaryRestrict (leOfHom f.unop))
  map_id U := by
    apply ModuleCat.hom_ext
    apply LinearMap.ext
    intro q
    refine Quotient.inductionOn' q ?_
    intro f
    rfl
  map_comp f g := by
    apply ModuleCat.hom_ext
    apply LinearMap.ext
    intro q
    refine Quotient.inductionOn' q ?_
    intro f
    rfl

/-- Analytic Cousin/gluing target: the holomorphic quotient presheaf is a sheaf.
This is a Sato theorem target, not supplied by the algebraic quotient construction. -/
theorem oneDimBoundaryPresheaf_isSheaf : oneDimBoundaryPresheaf.IsSheaf := by
  sorry

/-- Native one-dimensional Sato sheaf on the explicit quotient representative carrier. -/
def oneDimSatoSheaf : TopCat.Sheaf (ModuleCat ℂ) (TopCat.of ℝ) :=
  ⟨oneDimBoundaryPresheaf, oneDimBoundaryPresheaf_isSheaf⟩

/-- All quotient restrictions are surjective; the sheaf theorem supplies actual gluing. -/
theorem oneDimSatoSheaf_isFlasque : oneDimSatoSheaf.IsFlasque := by
  constructor
  intro U V f
  apply (ModuleCat.epi_iff_surjective _).mpr
  intro q
  refine Quotient.inductionOn' q ?_
  intro g
  exact ⟨Submodule.Quotient.mk g, rfl⟩

/-- Restriction is precomposition with the actual native inclusion of test spaces.
The hypothesis selects the nonzero branch of TestFunction.monoCLM. -/
noncomputable def restrictDistribution {U V : Opens ℝ} (_h : U ≤ V) :
    Distribution V ℂ ⊤ →L[ℝ] Distribution U ℂ ⊤ :=
  ContinuousLinearMap.precompCompactConvergenceCLM ℂ
    (TestFunction.monoCLM ℝ : TestFunction U ℝ ⊤ →L[ℝ] TestFunction V ℝ ⊤)

@[simp] theorem restrictDistribution_apply {U V : Opens ℝ} (h : U ≤ V)
    (u : Distribution V ℂ ⊤) (φ : TestFunction U ℝ ⊤) :
    restrictDistribution h u φ = u (TestFunction.monoCLM ℝ φ) := rfl

/-- Canonical complex-linear extension of a real-test distribution to complex tests. -/
def pairComplexTest {U : Opens ℝ} (u : Distribution U ℂ ⊤)
    (φ : TestFunction U ℂ ⊤) : ℂ :=
  u (TestFunction.postcompCLM Complex.reCLM φ) +
    Complex.I * u (TestFunction.postcompCLM Complex.imCLM φ)

/-- An actual cutoff Cauchy kernel on the native complex test-function carrier.
The function is pinned; smoothness and support are analytic proof targets. -/
noncomputable def cauchyKernelTest (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤)
    (z : nonRealOpen) : TestFunction (⊤ : Opens ℝ) ℂ ⊤ where
  toFun t := (χ t : ℂ) / ((t : ℂ) - (z : ℂ))
  contDiff' := by sorry
  hasCompactSupport' := by sorry
  tsupport_subset' := Set.subset_univ _

@[simp] theorem cauchyKernelTest_apply
    (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤) (z : nonRealOpen) (t : ℝ) :
    cauchyKernelTest χ z t = (χ t : ℂ) / ((t : ℂ) - (z : ℂ)) := rfl

/-- The actual Cauchy transform, extended by zero off its open domain only for
compatibility with holomorphicSections' ambient-function encoding. -/
noncomputable def cauchyTransform (u : Distribution (⊤ : Opens ℝ) ℂ ⊤)
    (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤) (z : ℂ) : ℂ := by
  classical
  exact if hz : z ∈ nonRealOpen then
    (2 * (Real.pi : ℂ) * Complex.I)⁻¹ * pairComplexTest u (cauchyKernelTest χ ⟨z, hz⟩)
  else 0

/-- Compact localization makes the Cauchy transform holomorphic off the real line. -/
theorem cauchyTransform_holomorphic (u : Distribution (⊤ : Opens ℝ) ℂ ⊤)
    (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤) :
    cauchyTransform u χ ∈ holomorphicSections nonRealOpen := by
  sorry

/-- A concrete holomorphic representative of the cutoff Cauchy transform. -/
noncomputable def cauchyRepresentative (u : Distribution (⊤ : Opens ℝ) ℂ ⊤)
    (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤) : holomorphicSections nonRealOpen :=
  ⟨cauchyTransform u χ, cauchyTransform_holomorphic u χ⟩

/-- HF4's complex-linear embedding, pinned by restriction and the compact Cauchy
characterization below. It is not an arbitrary vector-space injection. -/
noncomputable def distributionToOneDimBoundary (U : Opens ℝ) :
    Distribution U ℂ ⊤ →ₗ[ℂ] OneDimBoundaryQuotient U := by
  sorry

/-- The embedding commutes with the actual restriction of distributions. -/
theorem distributionToOneDimBoundary_natural {U V : Opens ℝ} (h : U ≤ V)
    (u : Distribution V ℂ ⊤) :
    distributionToOneDimBoundary U (restrictDistribution h u) =
      oneDimBoundaryRestrict h (distributionToOneDimBoundary V u) := by
  sorry

/-- Compact-support characterization: the support assumption is stated directly
on native tests, and χ equals one on an actual open neighborhood of K. -/
theorem distributionToOneDimBoundary_compact
    (u : Distribution (⊤ : Opens ℝ) ℂ ⊤) (K : Compacts ℝ)
    (hu : ∀ φ : TestFunction (⊤ : Opens ℝ) ℝ ⊤,
      Disjoint (tsupport φ) (K : Set ℝ) → u φ = 0)
    (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤)
    (hχ : ∃ W : Opens ℝ, (K : Set ℝ) ⊆ W ∧ ∀ t ∈ W, χ t = 1) :
    distributionToOneDimBoundary (⊤ : Opens ℝ) u =
      Submodule.Quotient.mk (cauchyRepresentative u χ) := by
  sorry

/-- Delta fixes the Cauchy normalization on BOTH half-planes. -/
theorem cauchyTransform_delta_zero (χ : TestFunction (⊤ : Opens ℝ) ℝ ⊤)
    (hχ : χ 0 = 1) (z : nonRealOpen) :
    cauchyTransform
      (Distribution.mapCLM Complex.ofRealCLM (Distribution.delta 0)) χ z =
      -(2 * (Real.pi : ℂ) * Complex.I * (z : ℂ))⁻¹ := by
  sorry

/-- The analytic distribution comparison is injective on the actual native carrier. -/
theorem distributionToOneDimBoundary_injective (U : Opens ℝ) :
    Function.Injective (distributionToOneDimBoundary U) := by
  sorry

end TauCetiRoadmap.Hyperfunctions
