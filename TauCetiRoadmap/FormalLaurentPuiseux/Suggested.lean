import Mathlib.RingTheory.LaurentSeries
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.Algebra.Lie.Loop
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.Galois.Profinite
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
These are suggested forms, not an exhaustive checklist. The README is the
definitive specification. Existing Laurent differentiation, Hahn exponent maps,
Kähler differentials and Galois topology are used directly. Proof placeholders
are targets, not assertions that the corresponding APIs have been implemented.
-/

noncomputable section

namespace TauCetiRoadmap.FormalLaurentPuiseux

open Polynomial
open scoped TensorProduct

universe u

variable (K : Type u) [Field K]

-- Choose the coefficientwise Hahn algebra action in these prototypes. This
-- agrees with the power-series-induced action; its tower instances are available.
local instance : Algebra K (HahnSeries ℤ K) := HahnSeries.instAlgebra
local instance : Algebra K (HahnSeries ℚ K) := HahnSeries.instAlgebra

/-- A single finite denominator for every nonzero coefficient. -/
def HasDenominator (n : ℕ+) (f : HahnSeries ℚ K) : Prop :=
  ∀ q : ℚ, f.coeff q ≠ 0 → ∃ k : ℤ, q = (k : ℚ) / ((n : ℕ) : ℚ)

/-- The exponent map used by the existing Hahn embedding. -/
def ramifiedExponent (n : ℕ+) : ℤ →+ ℚ where
  toFun k := (k : ℚ) / ((n : ℕ) : ℚ)
  map_zero' := by simp
  map_add' i j := by simp [add_div]

/-- The canonical rational-exponent embedding, u ↦ t^(1/n). -/
def ramifiedEmbedding (n : ℕ+) :
    LaurentSeries K →ₐ[K] HahnSeries ℚ K :=
  HahnSeries.embDomainAlgHom (ramifiedExponent n)
    (by
      intro i j h
      have hn : ((n : ℕ) : ℚ) ≠ 0 := by exact_mod_cast (ne_of_gt n.pos)
      have hij : (i : ℚ) = (j : ℚ) := (div_left_inj' hn).mp h
      exact_mod_cast hij)
    (by
      intro i j
      have hn : (0 : ℚ) < n := by exact_mod_cast n.pos
      change (i : ℚ) / n ≤ (j : ℚ) / n ↔ i ≤ j
      rw [div_le_div_iff_of_pos_right hn]
      exact_mod_cast (Iff.rfl : i ≤ j ↔ i ≤ j))

theorem ramifiedEmbedding_coeff (n : ℕ+)
    (f : LaurentSeries K) (k : ℤ) :
    (ramifiedEmbedding K n f).coeff ((k : ℚ) / ((n : ℕ) : ℚ)) = f.coeff k := by
  exact HahnSeries.embDomain_coeff

theorem ramifiedEmbedding_range (n : ℕ+) (f : HahnSeries ℚ K) :
    (∃ g : LaurentSeries K, ramifiedEmbedding K n g = f) ↔
      HasDenominator K n f := by
  sorry

/-- The finite-denominator subfield, characterized below by membership. -/
def puiseuxField : Subfield (HahnSeries ℚ K) := by
  sorry

theorem mem_puiseuxField_iff (f : HahnSeries ℚ K) :
    f ∈ puiseuxField K ↔ ∃ n : ℕ+, HasDenominator K n f := by
  sorry

/-- The constant field sits in Puiseux at level one. -/
def constantEmbedding : K →+* puiseuxField K := by
  sorry

theorem constantEmbedding_coe (a : K) :
    (constantEmbedding K a : HahnSeries ℚ K) = HahnSeries.C a := by
  sorry

instance : Algebra K (puiseuxField K) := (constantEmbedding K).toAlgebra

/-- The level-one inclusion is required to give the Puiseux field its F-algebra. -/
def baseEmbedding : LaurentSeries K →ₐ[K] puiseuxField K := by
  sorry

theorem baseEmbedding_coe (f : LaurentSeries K) :
    (baseEmbedding K f : HahnSeries ℚ K) = ramifiedEmbedding K 1 f := by
  sorry

instance : Algebra (LaurentSeries K) (puiseuxField K) :=
  (baseEmbedding K).toRingHom.toAlgebra

instance : IsScalarTower K (LaurentSeries K) (puiseuxField K) := by
  sorry

/-- General substitution allows ramification; coordinates are its order-one case. -/
def laurentSubstitution (φ : PowerSeries K) (hφ : φ ≠ 0)
    (hconstant : PowerSeries.constantCoeff φ = 0) :
    LaurentSeries K →ₐ[K] LaurentSeries K := by
  sorry

theorem substitution_parameter (φ : PowerSeries K) (hφ : φ ≠ 0)
    (hconstant : PowerSeries.constantCoeff φ = 0) :
    laurentSubstitution K φ hφ hconstant (HahnSeries.single 1 1) =
      (φ : LaurentSeries K) := by
  sorry

theorem laurentSubstitution_powerSeries (φ : PowerSeries K) (hφ : φ ≠ 0)
    (hconstant : PowerSeries.constantCoeff φ = 0) (g : PowerSeries K) :
    laurentSubstitution K φ hφ hconstant (g : LaurentSeries K) =
      ((PowerSeries.subst φ g : PowerSeries K) : LaurentSeries K) := by
  sorry

theorem laurentSubstitution_continuous (φ : PowerSeries K) (hφ : φ ≠ 0)
    (hconstant : PowerSeries.constantCoeff φ = 0) :
    Continuous (laurentSubstitution K φ hφ hconstant) := by
  sorry

/-- Product rule for the existing Laurent derivative. -/
theorem derivative_mul {R : Type*} [CommRing R] (f g : LaurentSeries R) :
    LaurentSeries.derivative R (f * g) =
      LaurentSeries.derivative R f * g + f * LaurentSeries.derivative R g := by
  sorry

/-- Package the existing linear map as a derivation; its action is pinned below. -/
def laurentDerivation : Derivation K (LaurentSeries K) (LaurentSeries K) := by
  sorry

theorem laurentDerivation_apply (f : LaurentSeries K) :
    laurentDerivation K f = LaurentSeries.derivative K f := by
  sorry

theorem continuous_derivation_unique (δ : Derivation K (LaurentSeries K) (LaurentSeries K))
    (hδ : Continuous δ) : ∃! a : LaurentSeries K, δ = a • laurentDerivation K := by
  sorry

/-- The specified quotient of algebraic Kähler differentials. -/
abbrev ContinuousDifferentials :=
  (KaehlerDifferential K (LaurentSeries K)) ⧸
    LinearMap.ker (laurentDerivation K).liftKaehlerDifferential

/-- Coefficient in the dt trivialization; this equivalence carries the module topology. -/
def continuousDifferentialsEquiv :
    ContinuousDifferentials K ≃ₗ[LaurentSeries K] LaurentSeries K := by
  sorry

theorem continuousDifferentialsEquiv_d (f : LaurentSeries K) :
    continuousDifferentialsEquiv K
      (Submodule.Quotient.mk (KaehlerDifferential.D K (LaurentSeries K) f)) =
      LaurentSeries.derivative K f := by
  sorry

def residue (f : LaurentSeries K) : K := f.coeff (-1)

theorem residue_derivative (f : LaurentSeries K) :
    residue K (LaurentSeries.derivative K f) = 0 := by
  simp [residue, LaurentSeries.derivative, LaurentSeries.hasseDeriv_coeff]

/-- Universal integral coefficient identity, specialized to fields only afterwards. -/
theorem residue_coefficient_identity {R : Type*} [CommRing R]
    (e k : ℕ+) (u : (PowerSeries R)ˣ) :
    (e : R) * PowerSeries.coeff ((e : ℕ) * (k : ℕ))
      (↑(u ^ (-(k : ℤ))) : PowerSeries R) +
    PowerSeries.coeff ((e : ℕ) * (k : ℕ) - 1)
      ((↑(u ^ (-(k : ℤ) - 1)) : PowerSeries R) *
        PowerSeries.derivative (u : PowerSeries R)) = 0 := by
  sorry

/-- The finite-map residue formula includes inseparable/characteristic-p cases. -/
theorem residue_substitution (φ : PowerSeries K) (hφ : φ ≠ 0)
    (hconstant : PowerSeries.constantCoeff φ = 0) (f : LaurentSeries K) :
    residue K (laurentSubstitution K φ hφ hconstant f *
      LaurentSeries.derivative K (φ : LaurentSeries K)) =
      (φ : LaurentSeries K).orderTop.untop (by
        rw [HahnSeries.orderTop_ne_top]
        exact fun h => hφ (HahnSeries.ofPowerSeries_injective (Γ := ℤ) (R := K) (by simpa using h))) •
      residue K f := by
  sorry

theorem exists_primitive_iff [CharZero K] (f : LaurentSeries K) :
    (∃ g : LaurentSeries K, LaurentSeries.derivative K g = f) ↔ residue K f = 0 := by
  sorry

/-- This formula pins the normalization of the rational-exponent derivative. -/
def puiseuxDerivative [CharZero K] : Derivation K (puiseuxField K) (puiseuxField K) := by
  sorry

theorem puiseuxDerivative_coeff [CharZero K] (f : puiseuxField K) (q : ℚ) :
    (puiseuxDerivative K f : HahnSeries ℚ K).coeff q =
      ((q + 1 : ℚ) : K) * (f : HahnSeries ℚ K).coeff (q + 1) := by
  sorry

structure CompatiblePrimitiveRoots where
  root : ℕ+ → K
  primitive : ∀ n, IsPrimitiveRoot (root n) (n : ℕ)
  compatible : ∀ n m : ℕ+, (n : ℕ) ∣ (m : ℕ) →
    root m ^ ((m : ℕ) / (n : ℕ)) = root n

/-- Algebraic compatible-family subgroup. The README additionally requires
the profinite limit built from discrete type synonyms of these finite groups;
this signature does not install a topology on the coefficient field or its units. -/
def CompatibleRootsOfUnity :
    Subgroup ((n : ℕ+) → rootsOfUnity (n : ℕ) K) where
  carrier := { r | ∀ n m : ℕ+, (n : ℕ) ∣ (m : ℕ) →
    (r m : Kˣ) ^ ((m : ℕ) / (n : ℕ)) = (r n : Kˣ) }
  one_mem' := by intro n m h; simp
  mul_mem' := by
    intro r s hr hs n m h
    change ((r m : Kˣ) * (s m : Kˣ)) ^ ((m : ℕ) / (n : ℕ)) =
      (r n : Kˣ) * (s n : Kˣ)
    rw [mul_pow, hr n m h, hs n m h]
  inv_mem' := by
    intro r hr n m h
    change ((r m : Kˣ)⁻¹) ^ ((m : ℕ) / (n : ℕ)) = (r n : Kˣ)⁻¹
    rw [inv_pow, hr n m h]

/-- The degree-preserving factor-Hensel target used by the L5 induction. -/
theorem factor_hensel (P : Polynomial (PowerSeries K)) (hP : P.Monic)
    (G₀ H₀ : Polynomial K) (hG₀ : G₀.Monic) (hH₀ : H₀.Monic)
    (hcoprime : IsCoprime G₀ H₀)
    (hred : P.map PowerSeries.constantCoeff = G₀ * H₀) :
    ∃! gh : Polynomial (PowerSeries K) × Polynomial (PowerSeries K),
      gh.1.Monic ∧ gh.2.Monic ∧ P = gh.1 * gh.2 ∧
      gh.1.map PowerSeries.constantCoeff = G₀ ∧
      gh.2.map PowerSeries.constantCoeff = H₀ ∧
      gh.1.natDegree = G₀.natDegree ∧ gh.2.natDegree = H₀.natDegree := by
  sorry

section PolynomialLoop
variable {L : Type*} [LieRing L] [LieAlgebra K L]

/-- Polynomial modes embed into the coefficient-module carrier. -/
def polynomialLoopEmbedding :
    (AddMonoidAlgebra K ℤ ⊗[K] L) →ₗ[K] HahnModule ℤ K L := by
  sorry

theorem polynomialLoopEmbedding_single (j : ℤ) (v : L) :
    polynomialLoopEmbedding K (AddMonoidAlgebra.single j 1 ⊗ₜ[K] v) =
      HahnModule.of K (HahnSeries.single j v) := by
  sorry
end PolynomialLoop

/-- The formal theorem concerns the finite-denominator subfield. -/
theorem puiseuxField_isAlgClosed [CharZero K] [IsAlgClosed K] :
    IsAlgClosed (puiseuxField K) := by
  sorry

/-- A compatible parameter-root choice in Mathlib's algebraic closure. -/
structure RamifiedRoots where
  root : ℕ+ → AlgebraicClosure (LaurentSeries K)
  power : ∀ n, root n ^ (n : ℕ) =
    algebraMap (LaurentSeries K) _ (HahnSeries.single 1 1)
  compatible : ∀ n m : ℕ+, (n : ℕ) ∣ (m : ℕ) →
    root m ^ ((m : ℕ) / (n : ℕ)) = root n

/-- The chosen roots fix the profinite generator; the Galois carrier is Mathlib's. -/
def absoluteGaloisEquiv [CharZero K] [IsAlgClosed K]
    (ζ : CompatiblePrimitiveRoots K) :
    ((AlgebraicClosure (LaurentSeries K)) ≃ₐ[LaurentSeries K]
      (AlgebraicClosure (LaurentSeries K))) ≃ₜ* TauCeti.zHat.{u} := by
  sorry

theorem absoluteGaloisEquiv_generator [CharZero K] [IsAlgClosed K]
    (ζ : CompatiblePrimitiveRoots K) (u : RamifiedRoots K) (n : ℕ+) :
    (absoluteGaloisEquiv K ζ).symm TauCeti.zHat.gen (u.root n) =
      algebraMap (LaurentSeries K) (AlgebraicClosure (LaurentSeries K))
        (algebraMap K (LaurentSeries K) (ζ.root n)) * u.root n := by
  sorry

end TauCetiRoadmap.FormalLaurentPuiseux
