import TauCeti.KnotTheory.PDCode.Components
import Mathlib.Algebra.Quandle
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.LinearAlgebra.Quotient.Basic
import TauCeti.KnotTheory.Burau.Basic
import TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence

/-!
# Based Fox color ranks and numerical bounds: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The coloring kernel uses native PD sites and module constraints, including isolated
circles. Constants and local differences have actual linear definitions. Admissions
are future constructions/theorems; the geometric bridge/path, cut-end and family
comparisons in the README remain required independently of this file.
-/
noncomputable section
namespace TauCetiRoadmap.GeometricTopology.ColorRank
open TauCeti
variable {n : ℕ} (R : Type*) [CommRing R]

abbrev Sites (D : PDCode n) := Fin (4 * n) ⊕ Fin D.crossinglessComponentCount

def slot (D : PDCode n) (f : Sites D → R) (i : Fin n) (j : Fin 4) : R :=
  f (Sum.inl (D.crossing i j))

def constraints (D : PDCode n) :
    (Sites D → R) →ₗ[R] (Fin (4*n) → R) × (Fin n → R) × (Fin n → R) where
  toFun f :=
    (fun h ↦ f (Sum.inl (D.edgePair.val h)) - f (Sum.inl h),
     (fun i ↦ slot R D f i (if D.overPair i then 1 else 0) -
       slot R D f i (if D.overPair i then 3 else 2)),
     (fun i ↦ 2 * slot R D f i (if D.overPair i then 1 else 0) -
       slot R D f i (if D.overPair i then 0 else 1) -
       slot R D f i (if D.overPair i then 2 else 3)))
  map_add' f g := by ext <;> simp [slot] <;> ring
  map_smul' c f := by ext <;> simp [slot] <;> ring

def Colors (D : PDCode n) : Submodule R (Sites D → R) := (constraints R D).ker

def evaluation (D : PDCode n) (a : Sites D) : Colors R D →ₗ[R] R where
  toFun f := f.val a
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

abbrev Based (D : PDCode n) (a : Sites D) : Submodule R (Colors R D) :=
  (evaluation R D a).ker

def constant (D : PDCode n) : R →ₗ[R] Colors R D where
  toFun c := ⟨fun _ ↦ c, by
    change constraints R D (fun _ ↦ c) = 0
    ext <;> simp [constraints, slot, two_mul]⟩
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

@[simp] theorem evaluation_constant (D : PDCode n) (a : Sites D) (c : R) :
    evaluation R D a (constant R D c) = c := rfl

def constantSplit (D : PDCode n) (a : Sites D) :
    Colors R D ≃ₗ[R] R × Based R D a := by sorry

def basedQuotient (D : PDCode n) (a : Sites D) :
    Based R D a ≃ₗ[R] (Colors R D ⧸ (constant R D).range) := by sorry

def crossingChange (D : PDCode n) (i : Fin n) : PDCode n :=
  {D with overPair := Function.update D.overPair i (!(D.overPair i))}

def localDifference (D : PDCode n) (i : Fin n) : (Sites D → R) →ₗ[R] R where
  toFun f := slot R D f i 0 - slot R D f i 1
  map_add' f g := by simp [slot]; ring
  map_smul' c f := by simp [slot]; ring

def Common (D : PDCode n) (i : Fin n) : Submodule R (Sites D → R) :=
  Colors R D ⊓ (localDifference R D i).ker

/-- Each side imposes precisely the same all-four-colors-equal local restriction. -/
theorem common_crossingChange (D : PDCode n) (i : Fin n) :
    Common R D i = Common R (crossingChange D i) i := by sorry

def basedLocalDifference (D : PDCode n) (a : Sites D) (i : Fin n) :
    Based R D a →ₗ[R] R :=
  (localDifference R D i).comp ((Colors R D).subtype.comp (Based R D a).subtype)

variable (K : Type*) [Field K]

theorem common_based_codimension (D : PDCode n) (a : Sites D) (i : Fin n) :
    Module.finrank K (Based K D a) ≤
      Module.finrank K (basedLocalDifference K D a i).ker + 1 := by sorry

theorem based_crossingChange_rank (D : PDCode n) (a : Sites D) (i : Fin n) :
    Module.finrank K (Based K D a) ≤
      Module.finrank K (Based K (crossingChange D i) a) + 1 ∧
    Module.finrank K (Based K (crossingChange D i) a) ≤
      Module.finrank K (Based K D a) + 1 := by sorry

theorem dimension_split (D : PDCode n) (a : Sites D) :
    Module.finrank K (Colors K D) = Module.finrank K (Based K D a) + 1 := by sorry



def sampleRestriction (D : PDCode n) (b : ℕ) (samples : Fin b → Sites D) :
    Colors R D →ₗ[R] (Fin b → R) where
  toFun f j := f.val (samples j)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

/-- The geometric overpass theorem supplies this injective restriction. -/
theorem based_rank_le_samples (D : PDCode n) (b : ℕ) (samples : Fin b → Sites D)
    (j : Fin b) (h : Function.Injective (sampleRestriction K D b samples)) :
    Module.finrank K (Based K D (samples j)) + 1 ≤ b := by
  sorry

theorem based_reidemeister_rank {m : ℕ} (D : OrientedPDCode n)
    (E : OrientedPDCode m) (a : Sites D.toPDCode) (b : Sites E.toPDCode)
    (h : D.ReidemeisterEquiv E) :
    Module.finrank K (Based K D.toPDCode a) =
      Module.finrank K (Based K E.toPDCode b) := by
  sorry

/-- Native unreduced Burau transfer at t=-1, with column vectors. -/
def twoStrandTransfer : Matrix (Fin 2) (Fin 2) R :=
  TauCeti.KnotTheory.burauMatrix (n := 2) (-1 : R) 0

theorem transfer_coordinates :
    twoStrandTransfer R = !![2, -1; 1, 0] ∧
      (twoStrandTransfer R - 1) ^ 2 = 0 := by
  sorry

theorem transfer_power (m : ℕ) :
    twoStrandTransfer R ^ m = 1 + (m : R) • (twoStrandTransfer R - 1) := by
  sorry

theorem transfer_fixed (m : ℕ) (v : Fin 2 → R) :
    (twoStrandTransfer R ^ m).mulVec v = v ↔ (m : R) * (v 0 - v 1) = 0 := by
  sorry

/-- Reduced checkerboard matrix, after the geometric Fox/Goeritz comparison. -/
def pretzel333 : Matrix (Fin 2) (Fin 2) ℤ := !![6, -3; -3, 6]

def pretzelRows : Matrix (Fin 2) (Fin 2) ℤ := !![-1, 0; 2, 1]

def pretzelColumns : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, 2]

theorem pretzel_smith_certificate :
    pretzelRows * pretzel333 * pretzelColumns = Matrix.diagonal ![3, 9] := by
  decide +kernel

theorem pretzel_unimodular : pretzelRows.det = -1 ∧ pretzelColumns.det = -1 := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.ColorRank
