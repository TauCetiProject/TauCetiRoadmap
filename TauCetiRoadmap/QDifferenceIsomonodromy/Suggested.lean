import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Basic.Complex.Basic
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.Discrete.Basic
import Mathlib.CategoryTheory.Functor.Const
import Mathlib.CategoryTheory.Limits.Shapes.Pullback.Categorical.Basic

/-!
# Suggested interfaces for q-difference equations and isomonodromy

The definitive specification is `README.md`. This file gives suggested forms for selected
algebraic targets. It uses the native scalar extension, categorical pullback and core.
The two theorem declarations state targets with `sorry`.
-/

namespace TauCetiRoadmap.QDifferenceIsomonodromy


open CategoryTheory CategoryTheory.Limits

/-- §0.1. The datum of a linearization uses Mathlib's scalar extension functor.
The category of modules with this datum is supplied by
PhiGammaModulesAndIwasawaCohomology §0.1. -/
abbrev Linearization {R : Type*} [CommRing R] (σ : R →+* R) (M : ModuleCat R) :=
  (ModuleCat.extendScalars σ).obj M ≅ M

section Models

variable {C D : Type*} [Category* C] [Category* D]

/-- §0.2. A model and its target, for the scalar extension functor `F`.
The categorical pullback uses all maps in both categories. -/
abbrev ScalarExtensionModels (F : C ⥤ D) :=
  CategoricalPullback F (𝟭 D)

/-- §0.2. Models of a fixed `M` use only isomorphisms and keep the comparison with `M`. -/
abbrev FixedObjectModels (F : C ⥤ D) (M : D) :=
  CategoricalPullback F.core ((Functor.const (Discrete PUnit.{1})).obj (show Core D from ⟨M⟩))

end Models

section Matrices

variable {K : Type*} [Field K]
variable {ι κ : Type*} [Fintype ι] [Fintype κ]

/-- §0.3. The sizes of the source and target systems may differ. -/
def IsHorizontal (σ : K ≃+* K) (A : Matrix ι ι K) (A' : Matrix κ κ K)
    (H : Matrix κ ι K) : Prop :=
  H.map σ * A = A' * H

/-- §6.2. The time square for two gauges and their translates. -/
def TimeSquare {ι : Type*} [Fintype ι]
    (Bᵢ Bⱼ BjAfterI BiAfterJ : Matrix ι ι K) : Prop :=
  BjAfterI * Bᵢ = BiAfterJ * Bⱼ

end Matrices

section PolynomialSteps

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- §7.1. A disjoint spectrum makes the Sylvester equation uniquely solvable. -/
theorem sylvester_existsUnique (X Y Z : Matrix ι ι ℂ)
    (hXY : ∀ a, X.charpoly.IsRoot a → ¬ Y.charpoly.IsRoot a) :
    ∃! Λ : Matrix ι ι ℂ, Y * Λ - Λ * X = Z := by
  sorry

variable {K : Type*} [Field K]

/-- §7.2. The normalized gauge attached to a linear right factor. -/
def rightFactorGauge (z : K) (B : Matrix ι ι K) : Matrix ι ι K :=
  1 - z⁻¹ • B

/-- §7.2. The spatial equation for the step, written before cancellation. -/
theorem rightFactorGauge_horizontal (q z : K) (hq : q ≠ 0) (hz : z ≠ 0)
    (L D B : Matrix ι ι K) :
    rightFactorGauge (q * z) B * (L * D * (z • 1 - B)) =
      ((z • 1 - q⁻¹ • B) * L * D) * rightFactorGauge z B := by
  sorry

end PolynomialSteps

end TauCetiRoadmap.QDifferenceIsomonodromy
