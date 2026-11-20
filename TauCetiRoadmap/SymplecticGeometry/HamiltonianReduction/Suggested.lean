import Mathlib
import TauCeti.Geometry.Lie.Adjoint.Basic
import TauCeti.Geometry.Symplectic.Hamiltonian.Manifold

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

/-- Differentiating the existing action at identity. By definition this is Tau Ceti's
`TauCeti.fundamentalVectorField I ξ`. -/
def fundamentalField (ξ : GroupLieAlgebra IG G) (x : M) : TangentSpace I x :=
  mfderiv IG I (fun g : G ↦ g • x) 1 ξ

/-- Coadjoint action obtained from the actual pinned tangent adjoint. On the algebraic dual
`Module.Dual` the same formula is Tau Ceti's `TauCeti.Lie.coadjointRepresentation`. -/
def coadjoint (g : G) (ν : StrongDual ℝ (GroupLieAlgebra IG G)) :
    StrongDual ℝ (GroupLieAlgebra IG G) :=
  ν.comp (TauCeti.Lie.adjointContinuousLinearMap (I := IG) g⁻¹)

/-- Smooth group action preserving the given two-form. -/
structure IsSmoothSymplecticAction (σ : TauCeti.SmoothTwoForm I M) : Prop where
  smooth : ContMDiff (IG.prod I) I ∞ (fun gx : G × M ↦ gx.1 • gx.2)
  preserves : ∀ (g : G) x v w,
    σ.bilinFormAt (g • x) (mfderiv I I (fun y : M ↦ g • y) x v)
      (mfderiv I I (fun y : M ↦ g • y) x w) = σ.bilinFormAt x v w

/-- Group-level moment map, with full equivariance rather than only infinitesimal data.
Tau Ceti's `TauCeti.SmoothTwoForm.IsEquivariantMomentMap` is this notion for `Module.Dual`-valued
maps with componentwise smoothness, stated for complete model spaces and a smooth action. -/
structure IsEquivariantMomentMap (σ : TauCeti.SmoothTwoForm I M)
    (μ : M → StrongDual ℝ EG) : Prop where
  smooth : ContMDiff I 𝓘(ℝ, StrongDual ℝ EG) ∞ μ
  hamiltonian : ∀ ξ : GroupLieAlgebra IG G,
    TauCeti.SmoothTwoForm.IsHamiltonianVectorField σ (fun x ↦ μ x ξ) (fundamentalField (IG := IG) ξ)
  equivariant : ∀ (g : G) x, μ (g • x) = coadjoint (IG := IG) g (μ x)

/-- Fundamental fields form an antihomomorphism into vector fields. Tau Ceti's
`TauCeti.mlieBracket_fundamentalVectorField` is this identity for a smooth action (the `smooth`
field of `ha`) when the model space `EG` of `G` is complete as well. -/
theorem fundamentalField_lie [CompleteSpace E] (σ : TauCeti.SmoothTwoForm I M)
    (ha : IsSmoothSymplecticAction (IG := IG) (G := G) σ)
    (ξ η : GroupLieAlgebra IG G) :
    fundamentalField (I := I) (M := M) ⁅ξ, η⁆ =
      -VectorField.mlieBracket I (fundamentalField (I := I) (M := M) ξ) (fundamentalField (I := I) (M := M) η) := by
  sorry

variable {F K Q : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
  [TopologicalSpace K] {J : ModelWithCorners ℝ F K}
  [TopologicalSpace Q] [ChartedSpace K Q] [IsManifold J ∞ Q]

/-- `σ` is the pullback of `τ` along `p`, evaluated on pairs of tangent vectors. For smooth `p`
(`hp : ContMDiff I J ∞ p`) it is equivalent to Tau Ceti's pullback equation
`TauCeti.SmoothForm.mpullback p hp τ = σ`. -/
def PullsBackTo (p : M → Q) (σ : TauCeti.SmoothTwoForm I M)
    (τ : TauCeti.SmoothTwoForm J Q) : Prop :=
  ∀ x v w, τ.bilinFormAt (p x) (mfderiv I J p x v) (mfderiv I J p x w) = σ.bilinFormAt x v w

/-- Quotient form uniqueness follows from surjectivity of projection and its tangent maps. It is
Tau Ceti's `TauCeti.mpullback_injective_of_surjective`, under the same hypotheses, read through
`PullsBackTo`. -/
theorem descendedForm_unique (p : M → Q) (hp : Function.Surjective p)
    (hdp : ∀ x, Function.Surjective (mfderiv I J p x))
    (σ : TauCeti.SmoothTwoForm I M) (τ₁ τ₂ : TauCeti.SmoothTwoForm J Q)
    (h₁ : PullsBackTo p σ τ₁) (h₂ : PullsBackTo p σ τ₂) : τ₁ = τ₂ := by
  sorry
/-- A closed basic form with exactly vertical kernel descends to a genuine symplectic form.
Tau Ceti's `TauCeti.SmoothForm.descendedForm` with
`TauCeti.SmoothTwoForm.isSymplectic_descendedForm_iff` gives it when `p` is a Mathlib
`IsSubmersion I J ∞ p` and `[I.Boundaryless]` holds, in place of `hdp` and the
`BoundarylessManifold` hypotheses here. -/
theorem descendedForm_exists [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    [BoundarylessManifold I M] [BoundarylessManifold J Q]
    (p : M → Q) (hp : Function.Surjective p)
    (hpsmooth : ContMDiff I J ∞ p)
    (hdp : ∀ x, Function.Surjective (mfderiv I J p x))
    (σ : TauCeti.SmoothTwoForm I M) (hclosed : σ.IsClosed)
    (hbasic : ∀ x y (v w : TangentSpace I x) (v' w' : TangentSpace I y),
      p x = p y → mfderiv I J p x v = mfderiv I J p y v' →
      mfderiv I J p x w = mfderiv I J p y w' → σ.bilinFormAt x v w = σ.bilinFormAt y v' w')
    (hkernel : ∀ x (v : TangentSpace I x),
      (∀ w, σ.bilinFormAt x v w = 0) ↔ mfderiv I J p x v = 0) :
    ∃ τ : TauCeti.SmoothTwoForm J Q, τ.IsSymplectic ∧ PullsBackTo p σ τ := by
  sorry
end TauCetiRoadmap.SymplecticGeometry
