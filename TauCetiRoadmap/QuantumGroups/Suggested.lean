/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.Matrix
import TauCeti.Algebra.Coalgebra.Subcomodule.Basic
import TauCeti.Algebra.Coalgebra.Star

/-!
# Quantum groups: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: weighted Schur orthogonality and the
algebraic compact-type characterization.

The following headlines are not statable at the pins without heavy constructions:
* Layer 0: the standard-solution, fiber-functor and Temperley–Lieb comparisons
  need rigid C*-tensor categories with their conjugate equations and the
  positive Temperley–Lieb quotients, none of which exist at the pins.
* Layer 1: classical multiplier/tensor comparison and compact Haar existence and
  uniqueness need the completed minimal C*-tensor functor and the analytic
  compact-quantum-group carrier.
* Layer 2: arbitrary-Hilbert complete reducibility and analytic Peter–Weyl density
  need free Hilbert C*-modules, their multiplier coactions and analytic CQGs.
* Layer 3: the dense Hopf core, Plancherel completion, modular/Kac comparison and
  unitary pivotal comparison need that analytic CQG, its Haar GNS completion,
  the full left Hilbert algebra and unitary tensor-category carriers.
* Layer 4: universal/reduced completion and coamenability criteria need the
  constructed C*-completions and their comparison maps.
* Layers 5–7: the SUq(2)/free orthogonal universal presentations, Tannaka–Krein and
  commutative reconstruction, fusion, Haar laws, dimensions and coamenability
  need the universal C*-algebras, analytic CQGs and rigid C*-fiber functors.
* Layer 8: the presentation, PBW basis, domain property, Hopf structure, Casimir
  and center, signed ladder modules, finite-simple classification, complete
  reducibility, ladder decomposition of locally finite modules, Clebsch–Gordan
  and recoupling isomorphisms, invariant metric, quantum traces and classical
  specialization are proved in the pinned Tau Ceti (`TauCeti.QuantumGroups.UqSl2`
  and `TauCeti.Algebra.Category.FiniteHopfModuleCat`) and are not restated; in
  particular the local-finiteness characterization of §8.4 is the pin's
  `TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`.
  The Biedenharn–Elliott pentagon of §8.5 is not statable: it needs channel
  coordinates on quadruple tensor products and recoupling maps between all five
  bracketings, which the pin's `TauCeti.UqSl2.clebschGordanRecouplingEquiv`
  supplies only for triple products. Nor is the compact comparison of §8.6,
  which needs analytic SUq(2).
-/

open scoped TensorProduct ComplexOrder
open Module
namespace TauCetiRoadmap.QuantumGroups

universe u v w

/-! ## Layer 3: The Hopf star core and weighted orthogonality -/

section HopfCore

variable {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A]

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [TauCeti.Comodule ℂ A H]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- Haar invariance on the core is stated by actual slice equations. -/
structure AlgebraicHaar where
  functional : A →ₗ[ℂ] ℂ
  normalized : functional 1 = 1
  left_invariant : ∀ a : A,
    (TensorProduct.rid ℂ A) ((TensorProduct.map (LinearMap.id) functional)
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  right_invariant : ∀ a : A,
    (TensorProduct.lid ℂ A) ((TensorProduct.map functional (LinearMap.id))
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  positive : ∀ a : A, 0 ≤ functional (star a * a)

/-- The matrix Ft is the pre-antipode F̃ in the README, rather than its transpose F.
Star preservation of the coproduct is the native `TauCeti.StarCoalgebra`. -/
theorem schur_orthogonality [TauCeti.StarCoalgebra ℂ A]
    [IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]
    (h : AlgebraicHaar (A := A)) (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    ∃ Ft : Matrix ι ι ℂ, Ft.PosDef ∧ Matrix.trace Ft = Matrix.trace Ft⁻¹ ∧
      (∀ i j k l,
        h.functional (star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) *
          TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l) =
          (if j = l then Ft⁻¹ i k / Matrix.trace Ft⁻¹ else 0)) ∧
      (∀ i j k l,
        h.functional (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j *
          star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l)) =
          (if i = k then Ft j l / Matrix.trace Ft else 0)) := by
  sorry

end HopfCore

/-! ## Layer 4: Algebraic compact type -/

/-- Coefficients of all finite unitary native comodules, in coordinate bases. -/
def unitaryCoefficientSet (A : Type u) [Ring A] [HopfAlgebra ℂ A] [StarRing A] : Set A :=
  {a | ∃ (n : ℕ) (ρ : TauCeti.Comodule ℂ A (Fin n → ℂ)),
    letI := ρ
    let U := TauCeti.Comodule.coefficientMatrix (C := A) (Pi.basisFun ℂ (Fin n))
    U ∈ unitary (Matrix (Fin n) (Fin n) A) ∧ ∃ i j, a = U i j}

/-- A Hopf star algebra has a normalized positive invariant integral exactly when
it is spanned by finite unitary coefficients (Timmermann, Theorem 3.2.12). -/
theorem compactType_iff (A : Type u) [Ring A] [Nontrivial A] [HopfAlgebra ℂ A]
    [StarRing A] [StarModule ℂ A] [TauCeti.StarCoalgebra ℂ A] :
    Nonempty (AlgebraicHaar (A := A)) ↔
      Submodule.span ℂ (unitaryCoefficientSet A) = ⊤ := by
  sorry

end TauCetiRoadmap.QuantumGroups
