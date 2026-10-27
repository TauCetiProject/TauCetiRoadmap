import TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian.Suggested
import TauCeti.Geometry.Lie.Adjoint.Basic

/-!
These suggested forms are aids, not the specification. The README is definitive;
this file is neither exhaustive nor prescriptive. The local Hamiltonian adapter below
spells exactly PR480's equation while its module is not in this pinned dependency.
Implementations consume that owner's API and delete this adapter; it is not a new theory.
-/
noncomputable section
open scoped Manifold ContDiff
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- The exact HamiltonianSystems equation, in its pinned sign convention. -/
def HasHamiltonianField (σ : TauCeti.SmoothTwoForm I M) (f : M → ℝ)
    (X : (x : M) → TangentSpace I x) : Prop :=
  ∀ x v, σ.eval₂ x (X x) v = mvfderiv I f x v

open Classical in
/-- An illustrative adapter of HamiltonianSystems' chosen Hamiltonian field. -/
def chosenHamiltonianField (σ : TauCeti.SmoothTwoForm I M) (f : M → ℝ)
    (x : M) : TangentSpace I x :=
  if h : ∃ v : TangentSpace I x, ∀ w, σ.eval₂ x v w = mvfderiv I f x w then h.choose else 0

/-- The same bracket as `SmoothTwoForm.poissonBracket`; no independent laws are requested here. -/
def bracketValue (σ : TauCeti.SmoothTwoForm I M) (f g : M → ℝ) (x : M) : ℝ :=
  mvfderiv I f x (chosenHamiltonianField σ g x)
end TauCetiRoadmap.SymplecticGeometry
