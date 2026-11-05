import Mathlib

/-!
# Foams — algebraic acceptance statements

**This file is not the roadmap and is not exhaustive.** The definitive document is README.md.
These statements test two algebraic headlines required by the foam construction. A completed
implementation must prove them using its actual constructions and also meet the README targets.

* Section 0.8 reconstructs the unique Frobenius coalgebra from a perfect trace.
* Section 2.8 constructs a homogeneous basis of an integral graded retract.

The other headlines require carriers and operations constructed by the roadmap.
Evaluation polynomiality needs decorated closed prefoams, admissible colorings and their rational
evaluation (0.2–0.7, 1.1). Planar reconstruction needs the trace quotient and its splitting foams
(2.1–2.7). The concrete monoidal 2-categories and spatiality need closure-state 2-homs, composition
and chosen duality cells (Layers 3–5). Progressive spanning needs typed expressions and their
compiler (Layer 6). The canopolis requires disk categories and insertion (Layer 7).
KH1 needs KhovanovHomology K2's chosen graded Frobenius object, KH2 its circle tensors and the
nilvalent state functor, KH3 the compiler, and KH4 the formal surface category and disk action.
-/

namespace TauCetiRoadmap.Foams

/-- Section 0.8. A perfect trace on a finite free commutative algebra determines a unique
Frobenius coalgebra with that counit. Construct its comultiplication with a trace-dual basis
and prove independence of the basis. -/
theorem existsUnique_frobeniusCoalgebra
    (R A : Type*) [CommRing R] [CommRing A] [Algebra R A]
    [Module.Free R A] [Module.Finite R A]
    (ε : A →ₗ[R] R) (hε : ((LinearMap.mul R A).compr₂ ε).IsPerfPair) :
    ∃! c : Coalgebra R A, letI : Coalgebra R A := c
      Coalgebra.counit (R := R) (A := A) = ε ∧ Coalgebra.IsFrobenius R A := by
  sorry

/-- The equivariant coefficient ring Λ_N. The variable X i is e_(i+1). -/
def EquivariantRing (N : ℕ) : Type := MvPolynomial (Fin N) ℤ

namespace EquivariantRing

noncomputable instance (N : ℕ) : CommRing (EquivariantRing N) :=
  inferInstanceAs (CommRing (MvPolynomial (Fin N) ℤ))

noncomputable instance (N : ℕ) : Algebra ℤ (EquivariantRing N) :=
  inferInstanceAs (Algebra ℤ (MvPolynomial (Fin N) ℤ))

/-- The integral grading with e_(i+1) in degree 2(i+1). -/
def grading (N : ℕ) : ℤ → Submodule ℤ (EquivariantRing N) :=
  MvPolynomial.weightedHomogeneousSubmodule ℤ (fun i : Fin N => 2 * ((i : ℕ) + 1 : ℤ))

end EquivariantRing

/-- Section 2.8. The image of a degree-zero idempotent on a finite sum of shifted copies
of Λ_N has a finite homogeneous basis. The jth source summand has shift s j.
Reduce modulo the positive-degree ideal, lift an integral homogeneous basis, and use
bounded-below graded Nakayama on the resulting split map and its kernel. -/
theorem exists_homogeneous_basis_range_idempotent (N m : ℕ) (s : Fin m → ℤ)
    (p : (Fin m → EquivariantRing N) →ₗ[EquivariantRing N]
      (Fin m → EquivariantRing N))
    (hp : p.comp p = p)
    (hhom : ∀ (d : ℤ) (v : Fin m → EquivariantRing N),
      (∀ j, v j ∈ EquivariantRing.grading N (d - s j)) →
      ∀ j, p v j ∈ EquivariantRing.grading N (d - s j)) :
    ∃ (n : ℕ)
      (b : Module.Basis (Fin n) (EquivariantRing N) (LinearMap.range p))
      (d : Fin n → ℤ),
      ∀ i j, (b i).val j ∈ EquivariantRing.grading N (d i - s j) := by
  sorry

end TauCetiRoadmap.Foams
