import Mathlib
import Mathlib.Algebra.Lie.Derivation.Killing
import Mathlib.LinearAlgebra.JordanChevalley

/-!
# Nilpotent orbits: suggested lower interfaces

**This file is not the roadmap and is not exhaustive.** The definitive specification
is `README.md`. These declarations suggest native forms for the internal-Jordan,
triple/slice and polynomial-matrix interfaces. Their `sorry` proofs are construction
targets; elaboration does not implement them or complete the geometric chapters.
The scheme, represented-action, flag, resolution and component-action constructions
in the README remain required even when they are not prototyped in this file.

Existing Mathlib innerness and Jordan decomposition are consumed rather than
restated as new admitted theorems. No private Lie derivation or algebraic group
carrier is introduced. Actual named maps below have explicit formulas or return
data whose types retain the input equations.
-/

namespace TauCetiRoadmap.NilpotentOrbits

section LieSets

variable (K L : Type*) [Field K] [LieRing L] [LieAlgebra K L]

/-- This is ad-nilpotence. Identifying it with the nilpotent scheme's complex points
requires the semisimple hypotheses and dictionary specified in N1. -/
def adNilpotentSet : Set L := {x | IsNilpotent (LieAlgebra.ad K L x)}

@[simp] theorem mem_adNilpotentSet (x : L) :
    x ∈ adNilpotentSet K L ↔ IsNilpotent (LieAlgebra.ad K L x) := Iff.rfl

/-- The concrete affine translate of the kernel of ad(f). -/
def slodowySlice (e f : L) : Set L := {x | ⁅f, x - e⁆ = 0}

@[simp] theorem mem_slodowySlice (e f x : L) :
    x ∈ slodowySlice L e f ↔ ⁅f, x - e⁆ = 0 := Iff.rfl

@[simp] theorem base_mem_slodowySlice (e f : L) :
    e ∈ slodowySlice L e f := by simp [slodowySlice]

/-- The zero case is explicit; it does not invoke native nonzero IsSl2Triple. -/
@[simp] theorem zero_slodowySlice : slodowySlice L 0 0 = Set.univ := by
  ext x
  simp [slodowySlice]

end LieSets

section InternalJordan

variable {K L : Type*} [Field K] [LieRing L] [LieAlgebra K L]
  [Module.Finite K L] [LieAlgebra.IsKilling K L]

/-- Jordan parts that are actual native Lie derivations. Proving existence requires
the generalized-eigenspace Leibniz argument, beyond endomorphism decomposition. -/
structure JordanDerivationParts (D : LieDerivation K L L) where
  nilpotentPart : LieDerivation K L L
  semisimplePart : LieDerivation K L L
  sum_eq : D = nilpotentPart + semisimplePart
  nilpotent : IsNilpotent nilpotentPart.toLinearMap
  semisimple : Module.End.IsSemisimple semisimplePart.toLinearMap
  commute : Commute nilpotentPart.toLinearMap semisimplePart.toLinearMap

/-- The missing Leibniz-closure construction is a genuine dependent target, not
an assumption that arbitrary polynomials in a derivation satisfy Leibniz. -/
theorem nonempty_jordanDerivationParts [CharZero K] [IsAlgClosed K]
    (D : LieDerivation K L L) : Nonempty (JordanDerivationParts D) := sorry

/-- Reconstruct the parts in the original Lie algebra using implemented innerness. -/
theorem reconstruct_from_derivation_parts (x : L) (Dn Ds : LieDerivation K L L)
    (h_sum : LieDerivation.ad K L x = Dn + Ds)
    (h_nil : IsNilpotent Dn.toLinearMap)
    (h_ss : Module.End.IsSemisimple (Ds.toLinearMap : Module.End K L))
    (h_comm : Commute Dn.toLinearMap Ds.toLinearMap) :
    ∃ n s : L, x = n + s ∧
      LieDerivation.ad K L n = Dn ∧ LieDerivation.ad K L s = Ds ∧
      IsNilpotent (LieAlgebra.ad K L n) ∧
      Module.End.IsSemisimple (LieAlgebra.ad K L s) ∧
      Commute (LieAlgebra.ad K L n) (LieAlgebra.ad K L s) := by
  obtain ⟨n, hn⟩ := LieDerivation.IsKilling.exists_eq_ad Dn
  obtain ⟨s, hs⟩ := LieDerivation.IsKilling.exists_eq_ad Ds
  have h_inj : Function.Injective (LieDerivation.ad K L) :=
    LieDerivation.injective_ad_of_center_eq_bot (LieAlgebra.center_eq_bot K L)
  have hx : x = n + s := by
    apply h_inj
    rw [map_add, hn, hs]
    exact h_sum
  have hn_end : LieAlgebra.ad K L n = Dn.toLinearMap := by
    simpa using congrArg LieDerivation.toLinearMap hn
  have hs_end : LieAlgebra.ad K L s = Ds.toLinearMap := by
    simpa using congrArg LieDerivation.toLinearMap hs
  exact ⟨n, s, hx, hn, hs, hn_end ▸ h_nil, hs_end ▸ h_ss,
    by simpa only [hn_end, hs_end] using h_comm⟩

theorem unique_inner_representative (D : LieDerivation K L L) :
    ∃! x : L, LieDerivation.ad K L x = D := by
  obtain ⟨x, hx⟩ := LieDerivation.IsKilling.exists_eq_ad D
  refine ⟨x, hx, fun y hy => ?_⟩
  exact LieDerivation.injective_ad_of_center_eq_bot
    (LieAlgebra.center_eq_bot K L) (hy.trans hx.symm)

/-- Actual internal parts, with all reconstruction and Jordan equations retained
in the returned type. Existence still uses the admitted Leibniz-closure target. -/
noncomputable def internalJordanDecomposition [CharZero K] [IsAlgClosed K] (x : L) :
    {p : L × L // x = p.1 + p.2 ∧
      IsNilpotent (LieAlgebra.ad K L p.1) ∧
      Module.End.IsSemisimple (LieAlgebra.ad K L p.2) ∧
      Commute (LieAlgebra.ad K L p.1) (LieAlgebra.ad K L p.2)} := by
  refine Classical.choice ?_
  let P := Classical.choice (nonempty_jordanDerivationParts (LieDerivation.ad K L x))
  obtain ⟨n, s, hx, _, _, hn, hs, hc⟩ := reconstruct_from_derivation_parts
    x P.nilpotentPart P.semisimplePart P.sum_eq P.nilpotent P.semisimple P.commute
  exact ⟨⟨(n, s), hx, hn, hs, hc⟩⟩

end InternalJordan

section Triples

variable {K L : Type*} [Field K] [CharZero K] [LieRing L] [LieAlgebra K L]
  [FiniteDimensional K L]

/-- General Jacobson–Morozov, excluding the native predicate's impossible zero case. -/
theorem exists_isSl2Triple_of_nonzero_nilpotent [IsAlgClosed K]
    [LieAlgebra.IsKilling K L] (e : L) (hne : e ≠ 0)
    (he : IsNilpotent (LieAlgebra.ad K L e)) :
    ∃ h f : L, IsSl2Triple h e f := sorry

/-- The actual tangent/complement assertion supplied by sl₂ decomposition. -/
theorem sl2_transverse_complement (h e f : L) (T : IsSl2Triple h e f) :
    IsCompl (LinearMap.range (LieAlgebra.ad K L e))
      (LinearMap.ker (LieAlgebra.ad K L f)) := sorry

end Triples

section MatrixPolynomials

variable (K : Type*) [Field K] [CharZero K]

/-- The specified regular nilpotent block, including the zero-size matrix. -/
def regularBlock (n : ℕ) : Matrix (Fin n) (Fin n) K :=
  fun i j => if i.val + 1 = j.val then 1 else 0

/-- In size m+2 this is partition (m+1,1), including the sl₂ zero case m=0. -/
def subregularBlock (m : ℕ) : Matrix (Fin (m + 2)) (Fin (m + 2)) K :=
  fun i j => if i.val + 1 = j.val ∧ j.val < m + 1 then 1 else 0

theorem regularBlock_nilpotent (n : ℕ) : IsNilpotent (regularBlock K n) := sorry

theorem subregularBlock_nilpotent (m : ℕ) : IsNilpotent (subregularBlock K m) := sorry

end MatrixPolynomials

section MatrixPolynomialsOverQAlgebra

variable (A : Type*) [CommRing A] [Algebra ℚ A]

/-- Uniform polynomial over every coefficient ℚ-algebra. N5 separately
constructs the fixed schemes and the required pullback ideal containments. -/
def truncatedExp {n : ℕ} (N : ℕ) (X : Matrix (Fin n) (Fin n) A) :
    Matrix (Fin n) (Fin n) A :=
  ∑ k ∈ Finset.range N, ((Nat.factorial k : ℚ)⁻¹) • X ^ k

/-- The finite polynomial agrees with the existing native exponential. -/
theorem truncatedExp_eq_native {n : ℕ} (N : ℕ)
    (X : Matrix (Fin n) (Fin n) A) (hX : X ^ N = 0) :
    truncatedExp A N X = IsNilpotent.exp X :=
  (IsNilpotent.exp_eq_sum hX).symm

def truncatedLog {n : ℕ} (N : ℕ) (U : Matrix (Fin n) (Fin n) A) :
    Matrix (Fin n) (Fin n) A :=
  ∑ k ∈ Finset.range N,
    if k = 0 then 0 else (((-1 : ℚ) ^ (k + 1)) / (k : ℚ)) • (U - 1) ^ k

theorem truncatedLog_exp {n : ℕ} (N : ℕ) (hN : 0 < N)
    (X : Matrix (Fin n) (Fin n) A) (hX : X ^ N = 0) :
    truncatedLog A N (truncatedExp A N X) = X := sorry

theorem truncatedExp_log {n : ℕ} (N : ℕ) (hN : 0 < N)
    (U : Matrix (Fin n) (Fin n) A) (hU : (U - 1) ^ N = 0) :
    truncatedExp A N (truncatedLog A N U) = U := sorry

end MatrixPolynomialsOverQAlgebra

end TauCetiRoadmap.NilpotentOrbits
