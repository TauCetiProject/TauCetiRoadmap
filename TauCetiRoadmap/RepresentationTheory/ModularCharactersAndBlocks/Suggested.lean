import TauCeti.RingTheory.Idempotents.Primitive.Decomposition
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

/-- Blocks use the native primitive-idempotent predicate in the actual centre. -/
abbrev IsBlockIdempotent (b : Subalgebra.center R (MonoidAlgebra R G)) : Prop :=
  TauCeti.IsPrimitiveIdempotent b

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

/-- Uniqueness is stronger than the native cardinality comparison. -/
theorem complete_blockIdempotents_unique {ι κ : Type*} [Fintype ι] [Fintype κ]
    (b : ι → Subalgebra.center k (MonoidAlgebra k G))
    (c : κ → Subalgebra.center k (MonoidAlgebra k G))
    (hb : CompleteOrthogonalIdempotents b) (hc : CompleteOrthogonalIdempotents c)
    (hbp : ∀ i, IsBlockIdempotent (b i)) (hcp : ∀ j, IsBlockIdempotent (c j)) :
    ∃ e : ι ≃ κ, ∀ i, b i = c (e i) := sorry

end TauCetiRoadmap.ModularCharactersAndBlocks
