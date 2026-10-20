import Mathlib.RingTheory.AdjoinRoot
import Mathlib.LinearAlgebra.TensorProduct.Associator
import Mathlib.Algebra.Algebra.Bilinear
import Mathlib.Tactic

/-!
# Suggested rank-two Frobenius forms for GT6

This file is not the roadmap and is not exhaustive. The definitive specification
is README.md. It uses the actual polynomial relation quotient; no link complex or
cobordism is represented by a placeholder. The parameter c=0 over integers gives
a quotient presentation compared in GT6 with KhovanovHomology K2’s native dual-number
Frobenius object; c=1 over rationals gives the Lee algebra. Ordinary Kh and the
shared affine movie presentation remain at that roadmap; GT6 owns the deformation
and its filtered comparison.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.LeeFrobenius
open Polynomial TensorProduct Module
variable (R : Type*) [CommRing R]

def relation (c : R) : R[X] := X ^ 2 - C c
abbrev Carrier (c : R) := AdjoinRoot (relation R c)

def generator (c : R) : Carrier R c := AdjoinRoot.root (relation R c)

theorem relation_monic (c : R) : (relation R c).Monic :=
  Polynomial.monic_X_pow_sub_C c (by decide)

theorem generator_sq (c : R) : generator R c ^ 2 = algebraMap R (Carrier R c) c := by
  have h := AdjoinRoot.eval₂_root (relation R c)
  change ((X : R[X]) ^ 2 - C c).eval₂ (algebraMap R (Carrier R c)) (generator R c) = 0 at h
  rw [Polynomial.eval₂_sub, Polynomial.eval₂_X_pow, Polynomial.eval₂_C] at h
  exact sub_eq_zero.mp h

/-- Native quotient power basis; the zero coefficient ring is included. -/
def quotientBasis (c : R) : Basis (Fin 2) R (Carrier R c) := by
  classical
  by_cases h : Subsingleton R
  · letI := h
    letI := Module.subsingleton R (Carrier R c)
    letI := Module.subsingleton R (Fin 2 → R)
    exact Basis.ofEquivFun (LinearEquiv.ofSubsingleton _ _)
  · haveI : Nontrivial R := not_subsingleton_iff_nontrivial.mp h
    exact (AdjoinRoot.powerBasis' (relation_monic R c)).basis.reindex
      (finCongr (by
        change (relation R c).natDegree = 2
        simp [relation]))

theorem quotientBasis_eq_pow (c : R) (i : Fin 2) :
    quotientBasis R c i = generator R c ^ (i : ℕ) := by
  classical
  unfold quotientBasis
  split_ifs with h
  · have := h
    have := Module.subsingleton R (Carrier R c)
    exact Subsingleton.elim _ _
  · have : Nontrivial R := not_subsingleton_iff_nontrivial.mp h
    simp only [Basis.reindex_apply]
    exact (AdjoinRoot.powerBasis' (relation_monic R c)).basis_eq_pow _

@[simp] theorem quotientBasis_zero (c : R) : quotientBasis R c 0 = 1 := by
  rw [quotientBasis_eq_pow]; rfl

@[simp] theorem quotientBasis_one (c : R) : quotientBasis R c 1 = generator R c := by
  rw [quotientBasis_eq_pow]; simp

/-- The coefficient of X in the canonical degree-less-than-two representative. -/
def counit (c : R) : Carrier R c →ₗ[R] R :=
  (Finsupp.lapply 1).comp (quotientBasis R c).repr.toLinearMap

@[simp] theorem counit_one (c : R) : counit R c 1 = 0 := by
  change (quotientBasis R c).repr 1 1 = 0
  simpa using (quotientBasis R c).repr_self_apply (0 : Fin 2) (1 : Fin 2)

@[simp] theorem counit_generator (c : R) : counit R c (generator R c) = 1 := by
  change (quotientBasis R c).repr (generator R c) 1 = 1
  simpa using (quotientBasis R c).repr_self_apply (1 : Fin 2) (1 : Fin 2)

/-- Constant coefficient in the native two-element quotient basis. -/
def constantCoeff (c : R) : Carrier R c →ₗ[R] R :=
  (Finsupp.lapply 0).comp (quotientBasis R c).repr.toLinearMap

@[simp] theorem constantCoeff_one (c : R) : constantCoeff R c 1 = 1 := by
  change (quotientBasis R c).repr 1 0 = 1
  simpa using (quotientBasis R c).repr_self_apply (0 : Fin 2) (0 : Fin 2)

@[simp] theorem constantCoeff_generator (c : R) : constantCoeff R c (generator R c) = 0 := by
  change (quotientBasis R c).repr (generator R c) 0 = 0
  simpa using (quotientBasis R c).repr_self_apply (1 : Fin 2) (0 : Fin 2)

theorem decomposition (c : R) (x : Carrier R c) :
    x = constantCoeff R c x • (1 : Carrier R c) + counit R c x • generator R c := by
  have h := (quotientBasis R c).sum_repr x
  rw [Fin.sum_univ_two, quotientBasis_zero, quotientBasis_one] at h
  exact h.symm

/-- The Frobenius comultiplication, defined on the actual quotient basis. -/
def comul (c : R) : Carrier R c →ₗ[R] Carrier R c ⊗[R] Carrier R c :=
  (quotientBasis R c).constr R fun i =>
    if i = 0 then (1 : Carrier R c) ⊗ₜ[R] generator R c + generator R c ⊗ₜ[R] 1
    else generator R c ⊗ₜ[R] generator R c + c • ((1 : Carrier R c) ⊗ₜ[R] 1)

@[simp] theorem comul_one (c : R) :
    comul R c 1 = (1 : Carrier R c) ⊗ₜ[R] generator R c + generator R c ⊗ₜ[R] 1 := by
  unfold comul
  rw [← quotientBasis_zero R c, Basis.constr_basis]
  simp

@[simp] theorem comul_generator (c : R) :
    comul R c (generator R c) =
      generator R c ⊗ₜ[R] generator R c + c • ((1 : Carrier R c) ⊗ₜ[R] 1) := by
  unfold comul
  rw [← quotientBasis_one R c, Basis.constr_basis]
  simp

theorem of_eq_smul_one (c r : R) :
    AdjoinRoot.of (relation R c) r = r • (1 : Carrier R c) :=
  Algebra.algebraMap_eq_smul_one r

theorem counit_mul_generator (c : R) (x : Carrier R c) :
    counit R c (x * generator R c) = constantCoeff R c x := by
  have hc : counit R c (AdjoinRoot.of (relation R c) c) = 0 := by
    change counit R c (algebraMap R (Carrier R c) c) = 0
    rw [Algebra.algebraMap_eq_smul_one]
    simp
  have h := congrArg (fun a => counit R c (a * generator R c)) (decomposition R c x)
  simpa [add_mul, smul_mul_assoc, ← pow_two, generator_sq, hc] using h

theorem pairing_nondegenerate (c : R) (x : Carrier R c)
    (h : ∀ y : Carrier R c, counit R c (x * y) = 0) : x = 0 := by
  have hx : counit R c x = 0 := by simpa using h 1
  have hc : constantCoeff R c x = 0 := by simpa [counit_mul_generator] using h (generator R c)
  rw [decomposition R c x, hx, hc]
  simp

theorem comul_cocommutative (c : R) :
    (TensorProduct.comm R (Carrier R c) (Carrier R c)).toLinearMap.comp (comul R c) =
      comul R c := by
  apply (quotientBasis R c).ext
  intro i
  fin_cases i <;> simp [add_comm]

theorem left_counit (c : R) :
    (TensorProduct.lid R (Carrier R c)).toLinearMap.comp
      ((TensorProduct.map (counit R c) (LinearMap.id : Carrier R c →ₗ[R] Carrier R c)).comp
        (comul R c)) = LinearMap.id := by
  apply (quotientBasis R c).ext
  intro i
  fin_cases i <;> simp

theorem right_counit (c : R) :
    (TensorProduct.rid R (Carrier R c)).toLinearMap.comp
      ((TensorProduct.map (LinearMap.id : Carrier R c →ₗ[R] Carrier R c) (counit R c)).comp
        (comul R c)) = LinearMap.id := by
  apply (quotientBasis R c).ext
  intro i
  fin_cases i <;> simp

theorem comul_coassociative (c : R) :
    (TensorProduct.assoc R (Carrier R c) (Carrier R c) (Carrier R c)).toLinearMap.comp
      ((TensorProduct.map (comul R c) (LinearMap.id : Carrier R c →ₗ[R] Carrier R c)).comp
        (comul R c)) =
      (TensorProduct.map (LinearMap.id : Carrier R c →ₗ[R] Carrier R c) (comul R c)).comp
        (comul R c) := by
  apply (quotientBasis R c).ext
  intro i
  fin_cases i <;>
    simp [TensorProduct.tmul_add, TensorProduct.add_tmul, TensorProduct.smul_tmul,
      TensorProduct.tmul_smul, add_assoc, add_comm, add_left_comm]

/-- Frobenius compatibility with left multiplication, on native linear maps. -/
theorem frobenius_left (c : R) (x : Carrier R c) :
    (comul R c).comp (LinearMap.mul R (Carrier R c) x) =
      (TensorProduct.map (LinearMap.mul R (Carrier R c) x)
        (LinearMap.id : Carrier R c →ₗ[R] Carrier R c)).comp (comul R c) := by
  apply (quotientBasis R c).ext
  intro i
  fin_cases i <;> simp
  all_goals
    rw [decomposition R c x]
    simp [mul_add, ← pow_two, generator_sq,
      of_eq_smul_one, TensorProduct.add_tmul,
      TensorProduct.smul_tmul, TensorProduct.tmul_smul, smul_smul, mul_comm,
      add_assoc, add_comm, add_left_comm]

/-- Its right-hand companion is a separate stated interface. -/
theorem frobenius_right (c : R) (x : Carrier R c) :
    (comul R c).comp (LinearMap.mul R (Carrier R c) x) =
      (TensorProduct.map (LinearMap.id : Carrier R c →ₗ[R] Carrier R c)
        (LinearMap.mul R (Carrier R c) x)).comp (comul R c) := by
  ext y
  have h := congrArg (TensorProduct.comm R (Carrier R c) (Carrier R c))
    (LinearMap.congr_fun (frobenius_left R c x) y)
  have hcomm (z : Carrier R c) :
      TensorProduct.comm R (Carrier R c) (Carrier R c) (comul R c z) = comul R c z :=
    LinearMap.congr_fun (comul_cocommutative R c) z
  simpa only [LinearMap.comp_apply, ← TensorProduct.map_comm, hcomm] using h

/-- Coefficient change is induced by the actual quotient universal property. -/
def changeCoefficients {S : Type*} [CommRing S] (f : R →+* S) (c : R) :
    Carrier R c →+* Carrier S (f c) :=
  AdjoinRoot.lift ((algebraMap S (Carrier S (f c))).comp f) (generator S (f c)) (by
    change ((X : R[X]) ^ 2 - C c).eval₂ _ _ = 0
    rw [Polynomial.eval₂_sub, Polynomial.eval₂_X_pow, Polynomial.eval₂_C]
    simp [generator_sq])

@[simp] theorem changeCoefficients_generator {S : Type*} [CommRing S]
    (f : R →+* S) (c : R) :
    changeCoefficients R f c (generator R c) = generator S (f c) := by
  exact AdjoinRoot.lift_root _

/-- The integral Khovanov-to-rational-Khovanov coefficient map. -/
def integerToRational : Carrier ℤ 0 →+* Carrier ℚ 0 :=
  changeCoefficients ℤ (Int.castRingHom ℚ) 0

/-- The Lee idempotents use rational coefficients, not characteristic two. -/
def plusIdempotent : Carrier ℚ 1 := (1 / 2 : ℚ) • (1 + generator ℚ 1)
def minusIdempotent : Carrier ℚ 1 := (1 / 2 : ℚ) • (1 - generator ℚ 1)

@[simp] theorem plusIdempotent_mul_self :
    plusIdempotent * plusIdempotent = plusIdempotent := by
  have hg : generator ℚ 1 * generator ℚ 1 = 1 := by
    simpa [pow_two] using generator_sq ℚ 1
  have h : (1 + generator ℚ 1) * (1 + generator ℚ 1) =
      (2 : ℚ) • (1 + generator ℚ 1) := by
    simp only [two_smul]
    calc
      _ = 1 + generator ℚ 1 + generator ℚ 1 + generator ℚ 1 * generator ℚ 1 := by ring
      _ = _ := by rw [hg]; ring
  unfold plusIdempotent
  rw [smul_mul_smul_comm, h, smul_smul]
  norm_num

@[simp] theorem minusIdempotent_mul_self :
    minusIdempotent * minusIdempotent = minusIdempotent := by
  have hg : generator ℚ 1 * generator ℚ 1 = 1 := by
    simpa [pow_two] using generator_sq ℚ 1
  have h : (1 - generator ℚ 1) * (1 - generator ℚ 1) =
      (2 : ℚ) • (1 - generator ℚ 1) := by
    simp only [two_smul]
    calc
      _ = 1 - generator ℚ 1 - generator ℚ 1 + generator ℚ 1 * generator ℚ 1 := by ring
      _ = _ := by rw [hg]; ring
  unfold minusIdempotent
  rw [smul_mul_smul_comm, h, smul_smul]
  norm_num

@[simp] theorem idempotents_orthogonal : plusIdempotent * minusIdempotent = 0 := by
  have hg : generator ℚ 1 * generator ℚ 1 = 1 := by
    simpa [pow_two] using generator_sq ℚ 1
  unfold plusIdempotent minusIdempotent
  rw [smul_mul_smul_comm]
  have h : (1 + generator ℚ 1) * (1 - generator ℚ 1) = 0 := by
    calc
      _ = 1 - generator ℚ 1 * generator ℚ 1 := by ring
      _ = 0 := by rw [hg]; ring
  rw [h, smul_zero]

@[simp] theorem idempotents_sum : plusIdempotent + minusIdempotent = 1 := by
  unfold plusIdempotent minusIdempotent
  rw [← smul_add]
  have h : (1 + generator ℚ 1) + (1 - generator ℚ 1) = (2 : ℚ) • (1 : Carrier ℚ 1) := by
    rw [two_smul]; ring
  rw [h, smul_smul]
  norm_num

end TauCetiRoadmap.GeometricTopology.LeeFrobenius
