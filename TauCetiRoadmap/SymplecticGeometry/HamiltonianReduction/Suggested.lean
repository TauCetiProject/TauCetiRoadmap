import TauCetiRoadmap.SymplecticGeometry.Suggested
import Mathlib.Geometry.Manifold.IsManifold.InteriorBoundary

/-!
These suggested forms are aids, not the specification. The README is definitive;
this file is neither exhaustive nor a required implementation plan. Every structure
field states a mathematical condition; missing constructions are honest `sorry` targets.
-/
noncomputable section
open scoped Manifold ContDiff
open Manifold
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M EG HG G : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M]
  [NormedAddCommGroup EG] [NormedSpace ℝ EG] [TopologicalSpace HG]
  {IG : ModelWithCorners ℝ EG HG} [TopologicalSpace G] [ChartedSpace HG G]
  [Group G] [LieGroup IG ∞ G] [MulAction G M]

/-- Differentiating the existing action at identity. -/
def fundamentalField (ξ : GroupLieAlgebra IG G) (x : M) : TangentSpace I x :=
  mfderiv IG I (fun g : G ↦ g • x) 1 ξ

/-- Coadjoint action obtained from the actual pinned tangent adjoint. -/
def coadjoint (g : G) (ν : StrongDual ℝ (GroupLieAlgebra IG G)) :
    StrongDual ℝ (GroupLieAlgebra IG G) :=
  ν.comp (TauCeti.Lie.adjointContinuousLinearMap (I := IG) g⁻¹)

/-- Smooth group action preserving the given two-form. -/
structure IsSmoothSymplecticAction (σ : TauCeti.SmoothTwoForm I M) : Prop where
  smooth : ContMDiff (IG.prod I) I ∞ (fun gx : G × M ↦ gx.1 • gx.2)
  preserves : ∀ (g : G) x v w,
    σ (g • x) (mfderiv I I (fun y : M ↦ g • y) x v)
      (mfderiv I I (fun y : M ↦ g • y) x w) = σ x v w

/-- Group-level moment map, with full equivariance rather than only infinitesimal data. -/
structure IsEquivariantMomentMap (σ : TauCeti.SmoothTwoForm I M)
    (μ : M → StrongDual ℝ EG) : Prop where
  smooth : ContMDiff I 𝓘(ℝ, StrongDual ℝ EG) ∞ μ
  hamiltonian : ∀ ξ : GroupLieAlgebra IG G,
    HasHamiltonianField σ (fun x ↦ μ x ξ) (fundamentalField (IG := IG) ξ)
  equivariant : ∀ (g : G) x, μ (g • x) = coadjoint (IG := IG) g (μ x)

/-- Fundamental fields are the exact antihomomorphism required by HamiltonianSystems. -/
theorem fundamentalField_lie [CompleteSpace E] (σ : TauCeti.SmoothTwoForm I M)
    (ha : IsSmoothSymplecticAction (IG := IG) (G := G) σ)
    (ξ η : GroupLieAlgebra IG G) :
    fundamentalField (I := I) (M := M) ⁅ξ, η⁆ =
      -VectorField.mlieBracket I (fundamentalField (I := I) (M := M) ξ) (fundamentalField (I := I) (M := M) η) := by
  sorry

/-- Conversion to PR480's algebraic dual, without changing its evaluation equation. -/
def algebraicMoment (μ : M → StrongDual ℝ EG) : M → Module.Dual ℝ (GroupLieAlgebra IG G) :=
  fun x ↦ (μ x).toLinearMap

theorem equivariantMoment_infinitesimal (σ : TauCeti.SmoothTwoForm I M)
    (μ : M → StrongDual ℝ EG) (hμ : IsEquivariantMomentMap (IG := IG) (G := G) σ μ)
    (ξ : GroupLieAlgebra IG G) :
    ContMDiff I 𝓘(ℝ, ℝ) ∞ (fun x ↦ algebraicMoment (IG := IG) μ x ξ) ∧
      HasHamiltonianField σ (fun x ↦ algebraicMoment (IG := IG) μ x ξ) (fundamentalField ξ) := by
  sorry

/-- Momentum for the intrinsic cotangent lift. -/
def cotangentMomentum (z : Cotangent I M) : StrongDual ℝ EG :=
  z.2.comp (mfderiv IG I (fun g : G ↦ g • z.1) 1)

/-- Cotangent action explicitly transports covectors by inverse base derivative. -/
def cotangentLiftedAction (g : G) (z : Cotangent I M) : Cotangent I M :=
  Bundle.TotalSpace.mk' (E →L[ℝ] ℝ) (g • z.1)
    (z.2.comp (mfderiv I I (fun q : M ↦ g⁻¹ • q) (g • z.1)))

theorem cotangentMomentum_hamiltonian [FiniteDimensional ℝ E]
    (ha : ContMDiff (IG.prod I) I ∞ (fun gx : G × M ↦ gx.1 • gx.2))
    (ξ : GroupLieAlgebra IG G) :
    HasHamiltonianField (canonicalForm (M := M) I)
      (fun z : Cotangent I M ↦ cotangentMomentum (IG := IG) (G := G) z ξ)
      (fun z ↦ mfderiv IG (cotangentModel I)
        (fun g : G ↦ cotangentLiftedAction g z) 1 ξ) := by
  sorry

variable {F K Q : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
  [TopologicalSpace Q] [ChartedSpace K Q] [IsManifold J ∞ Q]

/-- A temporary local adapter of PR480 `SmoothTwoForm.IsSymplecticMap` for form descent.
Its equation and argument data are unchanged; use the owner predicate and delete this
adapter when importing HamiltonianSystems. No independent pullback theory is intended. -/
def PullsBackTo (p : M → Q) (σ : TauCeti.SmoothTwoForm I M)
    (τ : TauCeti.SmoothTwoForm J Q) : Prop :=
  ∀ x v w, τ (p x) (mfderiv I J p x v) (mfderiv I J p x w) = σ x v w

/-- Quotient form uniqueness follows from surjectivity of projection and its tangent maps. -/
theorem descendedForm_unique (p : M → Q) (hp : Function.Surjective p)
    (hdp : ∀ x, Function.Surjective (mfderiv I J p x))
    (σ : TauCeti.SmoothTwoForm I M) (τ₁ τ₂ : TauCeti.SmoothTwoForm J Q)
    (h₁ : PullsBackTo p σ τ₁) (h₂ : PullsBackTo p σ τ₂) : τ₁ = τ₂ := by
  sorry
/-- A closed basic form with exactly vertical kernel descends to a genuine symplectic form. -/
theorem descendedForm_exists [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [BoundarylessManifold I M] [BoundarylessManifold J Q]
    (p : M → Q) (hp : Function.Surjective p)
    (hpsmooth : ContMDiff I J ∞ p)
    (hdp : ∀ x, Function.Surjective (mfderiv I J p x))
    (σ : TauCeti.SmoothTwoForm I M) (hclosed : σ.IsClosed)
    (hbasic : ∀ x y (v w : TangentSpace I x) (v' w' : TangentSpace I y),
      p x = p y → mfderiv I J p x v = mfderiv I J p y v' →
      mfderiv I J p x w = mfderiv I J p y w' → σ x v w = σ y v' w')
    (hkernel : ∀ x (v : TangentSpace I x),
      (∀ w, σ x v w = 0) ↔ mfderiv I J p x v = 0) :
    ∃ τ : TauCeti.SmoothTwoForm J Q, τ.IsSymplectic ∧ PullsBackTo p σ τ := by
  sorry
end TauCetiRoadmap.SymplecticGeometry
