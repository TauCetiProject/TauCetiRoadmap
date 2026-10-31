import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.Data.Finsupp.Fintype
import Mathlib.GroupTheory.PGroup
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.RingTheory.Idempotents

/-!
# Modular characters and blocks: suggested interfaces

This file is not the roadmap and is not exhaustive. `README.md` is definitive;
these are suggested forms for selected algebraic targets, not a complete checklist.
Every `sorry` is a mathematical target.
-/

namespace TauCetiRoadmap.ModularCharactersAndBlocks

variable {R G : Type*} [CommRing R] [Group G]

/-- A primitive idempotent in the actual center of the group algebra. -/
def IsBlockIdempotent (b : Subalgebra.center R (MonoidAlgebra R G)) : Prop :=
  IsIdempotentElem b ∧ b ≠ 0 ∧
    ∀ e : Subalgebra.center R (MonoidAlgebra R G),
      IsIdempotentElem e → e * b = e → e = 0 ∨ e = b

variable {k : Type*} [Field k] [Finite G]

/-- The underlying coefficient projection; multiplicativity requires fixed inputs. -/
noncomputable def brauerProjection (P : Subgroup G) (x : MonoidAlgebra k G) :
    MonoidAlgebra k (Subgroup.centralizer (P : Set G)) := by
  classical
  letI := Fintype.ofFinite (Subgroup.centralizer (P : Set G))
  exact MonoidAlgebra.ofCoeff (Finsupp.equivFunOnFinite.symm fun c => x.coeff (c : G))

theorem brauerProjection_mul {p : ℕ} [Fact p.Prime] [CharP k p]
    (P : Subgroup G) (hP : IsPGroup p P) (x y : MonoidAlgebra k G)
    (hx : ∀ a : P, ∀ g : G, x.coeff ((a : G) * g * (a : G)⁻¹) = x.coeff g)
    (hy : ∀ a : P, ∀ g : G, y.coeff ((a : G) * g * (a : G)⁻¹) = y.coeff g) :
    brauerProjection P (x * y) = brauerProjection P x * brauerProjection P y := sorry

theorem exists_complete_blockIdempotents :
    ∃ (n : ℕ) (b : Fin n → Subalgebra.center k (MonoidAlgebra k G)),
      (∀ i, IsBlockIdempotent (b i)) ∧ CompleteOrthogonalIdempotents b := sorry

end TauCetiRoadmap.ModularCharactersAndBlocks
