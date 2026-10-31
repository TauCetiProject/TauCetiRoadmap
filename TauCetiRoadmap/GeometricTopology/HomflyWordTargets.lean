import TauCeti.GroupTheory.SpecificGroups.Braid.Word
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These are actual native braid words, free modules and relation quotients.
The terminating collected-form reduction, geometric closure/skein comparison
and the distinct diagram constructions remain required targets there.
-/
noncomputable section
namespace TauCetiRoadmap.GeometricTopology.HomflyWord
open TauCeti

abbrev Word := Σ n : ℕ+, BraidWord (n : ℕ)
abbrev Forms (R : Type*) [CommRing R] := Word →₀ R

def emptyOne : Word := ⟨1, []⟩
def basis {R : Type*} [CommRing R] (n : ℕ+) (w : BraidWord (n : ℕ)) : Forms R :=
  Finsupp.single ⟨n,w⟩ 1

def scalar {R : Type*} [CommRing R] : R →ₗ[R] Forms R := Finsupp.lsingle emptyOne

/-- This includes the old words in the next strand stage, without changing signs. -/
def liftWord (n : ℕ+) (w : BraidWord (n : ℕ)) : BraidWord ((n + 1 : ℕ+) : ℕ) :=
  w.map fun p => (⟨p.1.val, by have h := p.1.isLt; have hn := n.pos; simp only [PNat.add_coe, PNat.val_ofNat]; omega⟩,p.2)

def topGenerator (n : ℕ+) : Fin (((n + 1 : ℕ+) : ℕ) - 1) :=
  ⟨(n : ℕ) - 1, by have hn := n.pos; simp only [PNat.add_coe, PNat.val_ofNat]; omega⟩

/-- Quotient relations are fully linear; this is distinct from a directed reduction step. -/
inductive Relation {R : Type*} [CommRing R] (x y z : Rˣ) : Forms R → Prop
  | cancel (n : ℕ+) (u v : BraidWord (n : ℕ)) (a : Fin ((n : ℕ)-1))
      (e : ℤˣ) : Relation x y z
        (basis n (u ++ [(a,e),(a,-e)] ++ v) - basis n (u ++ v))
  | commute (n : ℕ+) (u v : BraidWord (n : ℕ)) (a b : Fin ((n : ℕ)-1))
      (h : b.val + 1 < a.val) : Relation x y z
        (basis n (u ++ [(a,1),(b,1)] ++ v) -
          basis n (u ++ [(b,1),(a,1)] ++ v))
  | braid (n : ℕ+) (u v : BraidWord (n : ℕ)) (a b : Fin ((n : ℕ)-1))
      (h : b.val + 1 = a.val) : Relation x y z
        (basis n (u ++ [(a,1),(b,1),(a,1)] ++ v) -
          basis n (u ++ [(b,1),(a,1),(b,1)] ++ v))
  | cyclic (n : ℕ+) (u v : BraidWord (n : ℕ)) : Relation x y z
        (basis n (u ++ v) - basis n (v ++ u))
  | stabilize (n : ℕ+) (u v : BraidWord (n : ℕ)) (e : ℤˣ) : Relation x y z
        (basis (n+1) (liftWord n u ++ [(topGenerator n,e)] ++ liftWord n v) -
          basis n (u ++ v))
  | skein (n : ℕ+) (u v : BraidWord (n : ℕ)) (a : Fin ((n : ℕ)-1)) :
      Relation x y z
        ((x : R) • basis n (u ++ [(a,1)] ++ v) +
          (y : R) • basis n (u ++ [(a,-1)] ++ v) + (z : R) • basis n (u ++ v))

def relations {R : Type*} [CommRing R] (x y z : Rˣ) : Submodule R (Forms R) :=
  Submodule.span R {r | Relation x y z r}
abbrev Quotient {R : Type*} [CommRing R] (x y z : Rˣ) := Forms R ⧸ relations x y z

def scalarQuotient {R : Type*} [CommRing R] (x y z : Rˣ) : R →ₗ[R] Quotient x y z :=
  (relations x y z).mkQ.comp scalar

/-- Normalization consumes the selected word's whole actual coefficient. -/
def replaceWhole {R : Type*} [CommRing R] (f : Forms R) (w : Word)
    (rhs : Forms R) : Forms R := f.erase w + f w • rhs

/-- A genuine scalar-to-quotient statement, without a fake invariant field. -/
theorem scalarQuotient_bijective {R : Type*} [CommRing R] (x y z : Rˣ) :
    Function.Bijective (scalarQuotient x y z) := by
  sorry

noncomputable def scalarEquiv {R : Type*} [CommRing R] (x y z : Rˣ) :
    R ≃ₗ[R] Quotient x y z := LinearEquiv.ofBijective _ (scalarQuotient_bijective x y z)

end TauCetiRoadmap.GeometricTopology.HomflyWord
