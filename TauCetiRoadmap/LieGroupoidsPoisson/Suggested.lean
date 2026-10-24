import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Comma.Arrow
import Mathlib.Geometry.Manifold.Algebra.SMul
import Mathlib.CategoryTheory.Types.Basic
import Mathlib.CategoryTheory.CodiscreteCategory
import Mathlib.CategoryTheory.Groupoid.Subgroupoid
import Mathlib.CategoryTheory.Action
import Mathlib.Algebra.LieRinehartAlgebra.Defs
import Mathlib.Geometry.Manifold.Algebra.SmoothFunctions
import Mathlib.Geometry.Manifold.VectorBundle.ContMDiffSection
import Mathlib.Geometry.Manifold.Submersion
import Mathlib.Geometry.Manifold.SmoothEmbedding
import TauCeti.Geometry.Manifold.Distribution
import TauCeti.Geometry.Manifold.VectorBundle.Section.SmoothZero
import TauCeti.Geometry.Manifold.LocalDiffeomorph
import TauCeti.Geometry.Lie.Tangent.LieEquiv
import TauCeti.Geometry.Lie.Adjoint.Basic
import TauCeti.Geometry.Lie.RightInvariantVectorField
import TauCetiRoadmap.DifferentialGeometry.Suggested

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification; these prototypes are aids, neither a required
implementation plan nor a substitute for its milestones. The algebraic groupoid
and Lie-Rinehart layers reuse Mathlib. README milestone G4.2a specifies the
legacy two-form adapter; these prototypes use DifferentialGeometry's generic
carrier, whose migration remains a target rather than an implemented API.
Missing smooth fiber-product, algebroid and
integration carriers are targets in the README, not opaque `Prop` fields here.
-/
noncomputable section
open CategoryTheory
open scoped Manifold ContDiff
universe u
namespace TauCetiRoadmap.LieGroupoidsPoisson

section DifferentialSubmersion
variable {E F H K X Y : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace H] [TopologicalSpace K]
  [TopologicalSpace X] [TopologicalSpace Y] [ChartedSpace H X] [ChartedSpace K Y]

/-- G0.1: the differential predicate uses arbitrary native models with corners. -/
def IsDiffSubmersionAt (I : ModelWithCorners ℝ E H) (J : ModelWithCorners ℝ F K)
    (f : X → Y) (x : X) : Prop :=
  (mfderiv I J f x).HasRightInverse
end DifferentialSubmersion

section RegularFibers
variable {n m : ℕ} {X : Type*} [TopologicalSpace X]
  [ChartedSpace (Fin n → ℝ) X] [IsManifold 𝓘(ℝ, Fin n → ℝ) ∞ X]

/-- G0.1: the map-level carrier keeps the ambient subtype topology. -/
abbrev RegularFiber (f : X → (Fin m → ℝ)) (c : Fin m → ℝ) :=
  {x : X // f x = c}

/-- G0.1: a charted-space witness transfers the existing section-zero theorem.
No nonempty-fiber hypothesis is imposed. -/
theorem exists_regularFiber_manifold (f : X → (Fin m → ℝ)) (c : Fin m → ℝ)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    ∃ cs : ChartedSpace (Fin (n - m) → ℝ) (RegularFiber f c),
      letI := cs
      IsManifold 𝓘(ℝ, Fin (n - m) → ℝ) ∞ (RegularFiber f c) ∧
      Manifold.IsSmoothEmbedding 𝓘(ℝ, Fin (n - m) → ℝ) 𝓘(ℝ, Fin n → ℝ) ∞
        (Subtype.val : RegularFiber f c → X) ∧
      ∀ z : RegularFiber f c,
        (mfderiv 𝓘(ℝ, Fin (n - m) → ℝ) 𝓘(ℝ, Fin n → ℝ) Subtype.val z).range =
          (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f z.1).ker := by
  sorry

/-- G0.1 prototype for a genuinely charted target manifold, not just the model space. -/
abbrev RegularFiberTarget {Y : Type*} [TopologicalSpace Y]
    (f : X → Y) (c : Y) := {x : X // f x = c}

/-- G0.1: use a target chart at `c` to build the regular-fiber atlas. -/
@[irreducible] noncomputable def regularFiberChartedSpaceOfTarget
    {Y : Type*} [TopologicalSpace Y] [ChartedSpace (Fin m → ℝ) Y]
    [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (c : Y)
    (φ : PartialDiffeomorph 𝓘(ℝ, Fin m → ℝ) 𝓘(ℝ, Fin m → ℝ)
      Y (Fin m → ℝ) ∞) (hc : c ∈ φ.source)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    ChartedSpace (Fin (n - m) → ℝ) (RegularFiberTarget f c) := by
  sorry

/-- G0.1: instantiate the target-manifold construction with its extended chart at `c`. -/
theorem exists_regularFiber_manifold_target
    {Y : Type*} [TopologicalSpace Y] [ChartedSpace (Fin m → ℝ) Y]
    [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (c : Y)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    ∃ cs : ChartedSpace (Fin (n - m) → ℝ) (RegularFiberTarget f c),
      letI := cs
      IsManifold 𝓘(ℝ, Fin (n - m) → ℝ) ∞ (RegularFiberTarget f c) ∧
      Manifold.IsSmoothEmbedding 𝓘(ℝ, Fin (n - m) → ℝ)
        𝓘(ℝ, Fin n → ℝ) ∞ (Subtype.val : RegularFiberTarget f c → X) := by
  let φ := TauCeti.extChartPartialDiffeomorph 𝓘(ℝ, Fin m → ℝ) ∞ c
  have hc : c ∈ φ.source := by
    rw [TauCeti.mem_extChartPartialDiffeomorph_source]
    exact BoundarylessManifold.isInteriorPoint
  refine ⟨regularFiberChartedSpaceOfTarget f c φ hc hf hreg, ?_⟩
  letI := regularFiberChartedSpaceOfTarget f c φ hc hf hreg
  exact ⟨by sorry, by sorry⟩

/-- G0.1: chart-parametrized transport of the native regular-zero atlas. -/
@[irreducible] def regularFiberChartedSpaceOf (f : X → (Fin m → ℝ))
    (c : Fin m → ℝ)
    (φ : PartialDiffeomorph 𝓘(ℝ, Fin m → ℝ) 𝓘(ℝ, Fin m → ℝ)
      (Fin m → ℝ) (Fin m → ℝ) ∞) (hc : c ∈ φ.source)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    ChartedSpace (Fin (n - m) → ℝ) (RegularFiber f c) := by
  sorry

/-- G0.1: the selected target chart is the native extended chart at c. -/
@[irreducible] def regularFiberChartedSpace (f : X → (Fin m → ℝ)) (c : Fin m → ℝ)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    ChartedSpace (Fin (n - m) → ℝ) (RegularFiber f c) :=
  regularFiberChartedSpaceOf f c
    (TauCeti.extChartPartialDiffeomorph 𝓘(ℝ, Fin m → ℝ) ∞ c)
    (by rw [TauCeti.mem_extChartPartialDiffeomorph_source]
        exact BoundarylessManifold.isInteriorPoint) hf hreg

/-- G0.1: the same fixed atlas is a smooth manifold. -/
theorem isManifold_regularFiber (f : X → (Fin m → ℝ)) (c : Fin m → ℝ)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    letI := regularFiberChartedSpace f c hf hreg
    IsManifold 𝓘(ℝ, Fin (n - m) → ℝ) ∞ (RegularFiber f c) := by
  sorry

/-- G0.1: inclusion is a smooth embedding for the named fiber atlas. -/
theorem isSmoothEmbedding_regularFiber (f : X → (Fin m → ℝ)) (c : Fin m → ℝ)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    letI := regularFiberChartedSpace f c hf hreg
    Manifold.IsSmoothEmbedding 𝓘(ℝ, Fin (n - m) → ℝ) 𝓘(ℝ, Fin n → ℝ) ∞
      (Subtype.val : RegularFiber f c → X) := by
  sorry

/-- G0.1: the named atlas gives the ambient tangent kernel. -/
theorem range_mfderiv_regularFiber (f : X → (Fin m → ℝ)) (c : Fin m → ℝ)
    (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f)
    (hreg : TauCetiRoadmap.DifferentialGeometry.IsRegularValue
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f c) :
    letI := regularFiberChartedSpace f c hf hreg
    ∀ z : RegularFiber f c,
      (mfderiv 𝓘(ℝ, Fin (n - m) → ℝ) 𝓘(ℝ, Fin n → ℝ) Subtype.val z).range =
        (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f z.1).ker := by
  sorry

/-- G0.1: normal form implies a surjective derivative on boundaryless models. -/
theorem submersion_split_mfderiv {Y : Type*} [TopologicalSpace Y]
    [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (hf : Manifold.IsSubmersion
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f) (x : X) :
    (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x).HasRightInverse := by
  sorry

/-- G0.1: the finite-dimensional converse keeps smoothness explicit. -/
theorem submersion_iff_split_mfderiv {Y : Type*} [TopologicalSpace Y]
    [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (hf : ContMDiff 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f) :
    Manifold.IsSubmersion 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f ↔
      ∀ x, IsDiffSubmersionAt 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x := by
  sorry
/-- G0.1: the actual tangent kernels form the native smooth distribution. -/
theorem submersionKernel_smooth {Y : Type*} [TopologicalSpace Y]
    [ChartedSpace (Fin m → ℝ) Y] [IsManifold 𝓘(ℝ, Fin m → ℝ) ∞ Y]
    (f : X → Y) (hf : Manifold.IsSubmersion
      𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) ∞ f) :
    TauCeti.IsContMDiffDistribution 𝓘(ℝ, Fin n → ℝ) ∞ (n - m)
      (fun x => (mfderiv 𝓘(ℝ, Fin n → ℝ) 𝓘(ℝ, Fin m → ℝ) f x).ker) := by
  sorry
end RegularFibers

/-- G0.4: equal-dimensional subspaces admit a common complement. -/
theorem exists_common_complement {E : Type*} [AddCommGroup E] [Module ℝ E]
    [FiniteDimensional ℝ E] (U V : Submodule ℝ E)
    (hdim : Module.finrank ℝ U = Module.finrank ℝ V) :
    ∃ W : Submodule ℝ E, IsCompl U W ∧ IsCompl V W := by
  sorry

section Groupoid
variable (M : Type*) [Groupoid M]

def source (g : Arrow M) : M := g.left

def target (g : Arrow M) : M := g.right

def unit (x : M) : Arrow M := Arrow.mk (𝟙 x)

def inverse (g : Arrow M) : Arrow M :=
  Arrow.mk (Groupoid.inv g.hom)

@[simp] theorem source_unit (x : M) : source M (unit M x) = x := rfl
@[simp] theorem target_unit (x : M) : target M (unit M x) = x := rfl
@[simp] theorem source_inverse (g : Arrow M) :
    source M (inverse M g) = target M g := rfl
@[simp] theorem target_inverse (g : Arrow M) :
    target M (inverse M g) = source M g := rfl

/-- Algebraic restriction uses the actual full subgroupoid. -/
def restrictedGroupoid (Y : Set M) : Subgroupoid M := Subgroupoid.full Y

end Groupoid

section PairGroupoid
variable (M : Type*)

/-- A pair-groupoid action is a functor from the existing codiscrete category. -/
def pairTransport (F : Codiscrete M ⥤ Type u) (x y : M) :
    F.obj (Codiscrete.mk x) ≃ F.obj (Codiscrete.mk y) :=
  (F.mapIso (Codiscrete.iso (Codiscrete.mk x) (Codiscrete.mk y))).toEquiv

/-- Choosing a base fiber trivializes the family of a pair-groupoid functor. -/
def pairTrivialization (F : Codiscrete M ⥤ Type u) (m₀ : M) :
    (Σ x, F.obj (Codiscrete.mk x)) ≃ M × F.obj (Codiscrete.mk m₀) where
  toFun p := (p.1, pairTransport M F p.1 m₀ p.2)
  invFun p := ⟨p.1, pairTransport M F m₀ p.1 p.2⟩
  left_inv := by sorry
  right_inv := by sorry

theorem pairTrivialization_base (F : Codiscrete M ⥤ Type u)
    (m₀ : M) (p : Σ x, F.obj (Codiscrete.mk x)) :
    (pairTrivialization M F m₀ p).1 = p.1 := rfl
end PairGroupoid

section SmoothSourceTarget
variable {E H M F K : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  (I : ModelWithCorners ℝ E H) [IsManifold I ∞ M]
  [Groupoid M] [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace K] [TopologicalSpace (Arrow M)]
  [ChartedSpace K (Arrow M)] (J : ModelWithCorners ℝ F K)
  [IsManifold J ∞ (Arrow M)]

/-- The source/target part of the Lie-groupoid axioms. G0 also requires smooth
units/inversion and smooth multiplication on the constructed fiber product. -/
structure HasSmoothSourceTarget : Prop where
  source_submersion : Manifold.IsSubmersion J I ∞ (source M)
  target_submersion : Manifold.IsSubmersion J I ∞ (target M)

omit [IsManifold I ∞ M] [IsManifold J ∞ (Arrow M)] in
/-- The smooth source/target data uses Mathlib's actual submersion theorem. -/
theorem source_contMDiff (h : HasSmoothSourceTarget (M := M) I J) :
    ContMDiff J I ∞ (source M) := h.source_submersion.contMDiff

/-- G0.2 consumes G0.1's normal-form/differential comparison. -/
theorem source_split_mfderiv
    [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [CompleteSpace E] [CompleteSpace F]
    [I.Boundaryless] [J.Boundaryless]
    (h : HasSmoothSourceTarget (M := M) I J) (g : Arrow M) :
    (mfderiv J I (source M) g).HasRightInverse := by
  sorry
end SmoothSourceTarget

section ActionAnchor
variable {E H G F K M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace G] [ChartedSpace H G]
  (I : ModelWithCorners ℝ E H) [Group G] [LieGroup I ∞ G]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [TopologicalSpace K]
  [TopologicalSpace M] [ChartedSpace K M] (J : ModelWithCorners ℝ F K) [MulAction G M]
  [IsManifold J ∞ M] [ContMDiffSMul I J ∞ G M]

/-- G1.4/G2.2: left actions use the negative fundamental field for the
action-algebroid anchor. -/
def actionAlgebroidAnchor (ξ : GroupLieAlgebra I G) (x : M) : TangentSpace J x :=
  -mfderiv I J (fun g : G => g • x) 1 ξ
end ActionAnchor

section PoissonAlgebra
variable (A : Type*) [CommRing A] [Algebra ℝ A]

/-- A bilinear bracket on the existing algebra, with all geometric Poisson laws.
The final Lie instances share this algebra's additive/module structures. -/
structure PoissonBracket where
  bracket : A →ₗ[ℝ] A →ₗ[ℝ] A
  antisymm : ∀ f g, bracket f g = -bracket g f
  jacobi : ∀ f g h, bracket f (bracket g h) + bracket g (bracket h f) +
    bracket h (bracket f g) = 0
  leibniz : ∀ f g h, bracket f (g * h) = bracket f g * h + g * bracket f h

theorem bracket_mul_left (p : PoissonBracket A) (f g h : A) :
    p.bracket (f * g) h = f * p.bracket g h + p.bracket f h * g := by
  sorry
end PoissonAlgebra

section SharpConvention
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace M] [ChartedSpace H M]
  {I : ModelWithCorners ℝ E H} [IsManifold I ∞ M]

/-- Sharp's sign is fixed by pairing with a second covector. -/
def IsSharp (π : ∀ x : M,
    (TangentSpace I x →L[ℝ] ℝ) [⋀^Fin 2]→L[ℝ] ℝ)
    (sharp : ∀ x : M, (TangentSpace I x →L[ℝ] ℝ) →ₗ[ℝ] TangentSpace I x) : Prop :=
  ∀ x α β, β (sharp x α) = π x ![α, β]

omit [IsManifold I ∞ M] in
/-- Evaluating sharp on exact covectors recovers the bivector bracket with its sign. -/
theorem sharp_eval_exact
    (π : ∀ x : M,
      (TangentSpace I x →L[ℝ] ℝ) [⋀^Fin 2]→L[ℝ] ℝ)
    (sharp : ∀ x : M, (TangentSpace I x →L[ℝ] ℝ) →ₗ[ℝ] TangentSpace I x)
    (hπ : IsSharp π sharp) (f g : M → ℝ) (x : M) :
    mvfderiv I g x (sharp x (mvfderiv I f x)) =
      π x ![mvfderiv I f x, mvfderiv I g x] := hπ x _ _

/-- The Hamiltonian equation uses DifferentialGeometry's generic degree-two form
carrier and tuple evaluation, not the legacy two-form coercion. -/
theorem sharp_exact_eq_neg_hamiltonian
    (σ : TauCetiRoadmap.DifferentialGeometry.SmoothForm I M ℝ 2)
    (sharp : ∀ x : M, (TangentSpace I x →L[ℝ] ℝ) →ₗ[ℝ] TangentSpace I x)
    (hinv : ∀ x α v,
      (σ : TauCetiRoadmap.DifferentialGeometry.RoughForm I M ℝ 2)
        x ![sharp x α, v] = -α v)
    (f : M → ℝ) (X : ∀ x, TangentSpace I x)
    (hX : ∀ x v,
      (σ : TauCetiRoadmap.DifferentialGeometry.RoughForm I M ℝ 2)
        x ![X x, v] = mvfderiv I f x v)
    (hσ : ∀ x v, (∀ w,
      (σ : TauCetiRoadmap.DifferentialGeometry.RoughForm I M ℝ 2) x ![v, w] = 0) → v = 0) :
    ∀ x, sharp x (mvfderiv I f x) = -X x := by
  sorry
end SharpConvention

section CotangentGroupSigns
variable {E H G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] [TopologicalSpace G] [ChartedSpace H G]
  (I : ModelWithCorners ℝ E H) [Group G] [LieGroup I ∞ G]

/-- Raw left trivialization; no negative dual Lie-algebra identification. -/
def cotangentSource (g : G) (α : TangentSpace I g →L[ℝ] ℝ) :
    GroupLieAlgebra I G →L[ℝ] ℝ :=
  α.comp (mfderiv I I (fun h : G ↦ g * h) 1)

/-- Raw target is right translation, agreeing with positive standard Lie–Poisson. -/
def cotangentTarget (g : G) (α : TangentSpace I g →L[ℝ] ℝ) :
    GroupLieAlgebra I G →L[ℝ] ℝ :=
  α.comp (mfderiv I I (fun h : G ↦ h * g) 1)

omit [LieGroup I ∞ G] in
@[simp] theorem cotangentSource_apply (g : G) (α : TangentSpace I g →L[ℝ] ℝ)
    (ξ : GroupLieAlgebra I G) :
    cotangentSource I g α ξ = α (mfderiv I I (fun h : G ↦ g * h) 1 ξ) := rfl
/-- The sign-bearing relation between raw source and target. -/
theorem cotangentTarget_eq_coadjoint_source (g : G)
    (α : TangentSpace I g →L[ℝ] ℝ) :
    cotangentTarget I g α = (cotangentSource I g α).comp
      (TauCeti.Lie.adjointContinuousLinearMap (I := I) g⁻¹) := by
  sorry

/-- Source-vertical right-invariant brackets are opposite the existing group bracket. -/
theorem rightInvariant_bracket [CompleteSpace E] [BoundarylessManifold I G]
    (ξ η : GroupLieAlgebra I G) :
    VectorField.mlieBracket I (mulRightInvariantVectorField ξ)
      (mulRightInvariantVectorField η) = -mulRightInvariantVectorField ⁅ξ, η⁆ := by
  sorry
end CotangentGroupSigns

section RankVaryingPlane
abbrev Plane := ℝ × ℝ

def dx (f : Plane → ℝ) (p : Plane) : ℝ := fderiv ℝ f p (1, 0)
def dy (f : Plane → ℝ) (p : Plane) : ℝ := fderiv ℝ f p (0, 1)

/-- Every smooth plane coefficient gives the bracket of `u ∂x ∧ ∂y`. -/
def planeBracket (u f g : Plane → ℝ) (p : Plane) : ℝ :=
  u p * (dx f p * dy g p - dy f p * dx g p)

theorem planeBracket_coordinates (u : Plane → ℝ) (p : Plane) :
    planeBracket u Prod.fst Prod.snd p = u p := by
  sorry

theorem planeBracket_jacobi (u f g h : Plane → ℝ)
    (hu : ContDiff ℝ ∞ u) (hf : ContDiff ℝ ∞ f)
    (hg : ContDiff ℝ ∞ g) (hh : ContDiff ℝ ∞ h) :
    planeBracket u f (planeBracket u g h) +
      planeBracket u g (planeBracket u h f) +
      planeBracket u h (planeBracket u f g) = 0 := by
  sorry
/-- The one-dimensional momentum function of a vector field coefficient. -/
def momentum (a : ℝ → ℝ) (p : Plane) : ℝ := a p.1 * p.2

def vectorBracket (a b : ℝ → ℝ) (q : ℝ) : ℝ :=
  a q * deriv b q - b q * deriv a q

/-- Canonical cotangent linear functions have the minus algebroid-dual bracket. -/
theorem momentum_bracket (a b : ℝ → ℝ)
    (ha : ContDiff ℝ ∞ a) (hb : ContDiff ℝ ∞ b) :
    planeBracket (fun _ ↦ 1) (momentum a) (momentum b) =
      -momentum (vectorBracket a b) := by
  sorry
end RankVaryingPlane
end TauCetiRoadmap.LieGroupoidsPoisson
