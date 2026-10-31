import TauCeti.KnotTheory.PDCode.Alexander.Basic
import TauCetiRoadmap.GeometricTopology.ConwaySkeinTargets
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These are actual native PD orientations, elementary ideals and integer matrices.
The admitted ideal/Smith comparisons are future proofs, not certifications of
geometric link identities. Positive-leading order representatives are not signed
Conway normalizations. The README owns all actual diagram and cover maps.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.SmallCrossingInvariant
open TauCeti Polynomial LaurentPolynomial

/-- Rows0,1,2 are the explicit Borromean, P222 and negative-torus33 PD inputs. -/
def partner : Fin 3 → Equiv.Perm (Fin 24)
  | 0 =>
    { toFun := ![15, 10, 7, 20, 9, 16, 21, 2, 17, 4, 1, 14, 23, 18, 11, 0, 5, 8, 13, 22, 3,
        6, 19, 12]
      invFun := ![15, 10, 7, 20, 9, 16, 21, 2, 17, 4, 1, 14, 23, 18, 11, 0, 5, 8, 13, 22, 3,
        6, 19, 12]
      left_inv := by decide +kernel
      right_inv := by decide +kernel }
  | 1 =>
    { toFun := ![19, 22, 9, 16, 23, 18, 13, 20, 15, 2, 21, 12, 11, 6, 17, 8, 3, 14, 5, 0, 7,
        10, 1, 4]
      invFun := ![19, 22, 9, 16, 23, 18, 13, 20, 15, 2, 21, 12, 11, 6, 17, 8, 3, 14, 5, 0, 7,
        10, 1, 4]
      left_inv := by decide +kernel
      right_inv := by decide +kernel }
  | 2 =>
    { toFun := ![14, 10, 7, 23, 9, 17, 20, 2, 18, 4, 1, 13, 19, 11, 0, 22, 21, 5, 8, 12, 6,
        16, 15, 3]
      invFun := ![14, 10, 7, 23, 9, 17, 20, 2, 18, 4, 1, 13, 19, 11, 0, 22, 21, 5, 8, 12, 6,
        16, 15, 3]
      left_inv := by decide +kernel
      right_inv := by decide +kernel }

theorem partner_perfect (r : Fin 3) : IsPerfectMatching (partner r) := by
  fin_cases r <;> decide +kernel

def diagram (r : Fin 3) : PDCode 6 :=
  ⟨Equiv.refl _, ⟨partner r, partner_perfect r⟩, 0, fun _ => true⟩

def baseDirection : Fin 3 → Fin 24 → Bool
  | 0 => ![false, false, true, true, false, true, true, false, false, true, true, false, false,
      false, true, true, false, true, true, false, false, false, true, true]
  | 1 => ![false, false, true, true, false, false, true, true, false, false, true, true, false,
      false, true, true, false, false, true, true, false, false, true, true]
  | 2 => ![false, false, true, true, false, true, true, false, false, true, true, false, false,
      true, true, false, false, false, true, true, false, true, true, false]

def componentIndex : Fin 3 → Fin 24 → Fin 3
  | 0 => ![0, 1, 0, 1, 2, 0, 2, 0, 1, 2, 1, 2, 2, 0, 2, 0, 0, 1, 0, 1, 1, 2, 1, 2]
  | 1 => ![0, 1, 0, 1, 2, 1, 2, 1, 2, 0, 2, 0, 0, 2, 0, 2, 1, 0, 1, 0, 1, 2, 1, 2]
  | 2 => ![0, 1, 0, 1, 2, 0, 2, 0, 1, 2, 1, 2, 0, 2, 0, 2, 1, 0, 1, 0, 2, 1, 2, 1]

def direction (r : Fin 3) (mask : Fin 3 → Bool) (h : Fin 24) : Bool :=
  Bool.xor (baseDirection r h) (mask (componentIndex r h))

def oriented (r : Fin 3) (mask : Fin 3 → Bool) : OrientedPDCode 6 :=
  OrientedPDCode.mk (diagram r) (direction r mask)
    (by intro h; revert r mask h; decide +kernel)
    (by intro c s; revert r mask c s; decide +kernel)
    ∅ (by rfl)

/-- Positive-leading polynomial representatives of the actual order ideals. -/
def orderPolynomial (r : Fin 3) (mask : Fin 3 → Bool) : Polynomial ℤ :=
  match r with
  | 0 => (X-1)^4
  | 1 => if mask 0 = mask 1 ∧ mask 1 = mask 2 then 3*(X-1)^2
         else (X-1)^2*(X^2-X+1)
  | 2 => if mask 0 = mask 1 ∧ mask 1 ≠ mask 2 then (X-1)^2*(X^2+X+1)
         else (X-1)^2

def toLaurent : Polynomial ℤ →+* LaurentPolynomial ℤ :=
  Polynomial.eval₂RingHom LaurentPolynomial.C (T 1)

theorem elementaryIdeal_one (r : Fin 3) (mask : Fin 3 → Bool) :
    (oriented r mask).elementaryIdeal 1 =
      Ideal.span {toLaurent (orderPolynomial r mask)} := by
  sorry

/-- Integral Fox rows; each means 2over-under1-under2. -/
def foxMatrix : Fin 3 → Matrix (Fin 6) (Fin 6) ℤ
  | 0 => ![![-1, 0, -1, 2, 0, 0], ![2, -1, 0, 0, 0, -1], ![0, 2, 0, -1, -1, 0], ![0, -1, 2, 0,
      0, -1], ![-1, 0, -1, 0, 2, 0], ![0, 0, 0, -1, -1, 2]]
  | 1 => ![![-1, 0, 2, -1, 0, 0], ![0, -1, 0, 0, 2, -1], ![2, -1, 0, 0, 0, -1], ![-1, 2, 0, -1,
      0, 0], ![0, 0, -1, 2, -1, 0], ![0, 0, -1, 0, -1, 2]]
  | 2 => ![![-1, 0, -1, 0, 0, 2], ![0, 0, 2, -1, -1, 0], ![0, -1, 0, 0, 2, -1], ![-1, 0, -1, 0,
      2, 0], ![0, -1, 2, 0, 0, -1], ![0, 0, 0, -1, -1, 2]]

def foxSmith (r : Fin 3) : Matrix (Fin 6) (Fin 6) ℤ :=
  Matrix.diagonal (![1,1,1,if r = 0 then 4 else 2,
    if r = 0 then 4 else if r = 1 then 6 else 2,0])

theorem full_fox_smith (r : Fin 3) :
    ∃ P Q : Matrix (Fin 6) (Fin 6) ℤ,
      IsUnit P.det ∧ IsUnit Q.det ∧ P * foxMatrix r * Q = foxSmith r := by
  sorry

/-- A geometric Hopf tree uses σ=±1; this diagonal identity holds for all integers. -/
def treeSeifert {e : ℕ} (σ : Fin e → ℤ) : Matrix (Fin e) (Fin e) ℤ :=
  Matrix.diagonal fun i => -σ i

theorem tree_halfDeterminant {e : ℕ} (σ : Fin e → ℤ) :
    ConwaySkein.halfDeterminant (treeSeifert σ) =
      ConwaySkein.conwayEmbedding
        (Polynomial.C (∏ i, σ i) * Polynomial.X ^ e) := by
  sorry

def coprimeLeft : Matrix (Fin 2) (Fin 2) ℤ := !![2,-1; -5,3]
def coprimeRight : Matrix (Fin 2) (Fin 2) ℤ := !![1,5; 1,6]

theorem coprime_adapter :
    coprimeLeft.det = 1 ∧ coprimeRight.det = 1 ∧
      coprimeLeft * !![3,0; 0,5] * coprimeRight = !![1,0; 0,15] := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.SmallCrossingInvariant
