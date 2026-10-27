import TauCeti.Geometry.Symplectic.SymplecticTransport
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

The linear step in the relative Darboux point-germ theorem. Subspace
restrictions need not be nondegenerate. The manifold statement additionally
requires chart realization, the relative primitive, and a controlled local
Moser flow; these are not consequences of the linear signatures alone.
-/

namespace TauCetiRoadmap.SymplecticGeometry.RelativeDarboux

open TauCeti

variable {V W : Type*} [AddCommGroup V] [Module ℝ V]
  [AddCommGroup W] [Module ℝ W]
  [FiniteDimensional ℝ V] [FiniteDimensional ℝ W]

/-- Symplectic Witt extension for arbitrary subspaces, including degenerate
ones. This admitted theorem is a construction target. -/
theorem symplectic_subspace_extension (ω₀ : SymplecticForm V)
    (ω₁ : SymplecticForm W) (hdim : Module.finrank ℝ V = Module.finrank ℝ W)
    (S : Submodule ℝ V) (T : Submodule ℝ W) (f : S ≃ₗ[ℝ] T)
    (hf : ∀ u v : S, ω₁ (f u) (f v) = ω₀ u v) :
    ∃ e : V ≃ₗ[ℝ] W, SymplecticForm.IsSymplectomorphism ω₀ ω₁ e ∧
      ∀ u : S, e u = f u := by
  sorry

/-- Matching two ambient forms at one point while fixing its tangent
subspace pointwise. No constant-rank submanifold hypothesis occurs here. -/
theorem symplectic_extension_fixing_subspace (ω₀ ω₁ : SymplecticForm V)
    (S : Submodule ℝ V) (hS : ∀ u v : S, ω₁ u v = ω₀ u v) :
    ∃ e : V ≃ₗ[ℝ] V, SymplecticForm.IsSymplectomorphism ω₀ ω₁ e ∧
      ∀ u : S, e u = u := by
  exact symplectic_subspace_extension ω₀ ω₁ rfl S S (LinearEquiv.refl ℝ S) hS

end TauCetiRoadmap.SymplecticGeometry.RelativeDarboux
