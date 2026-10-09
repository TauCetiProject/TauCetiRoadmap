import Mathlib
import TauCeti.Topology.Algebra.Group.LocallyConstant
import TauCeti.NumberTheory.LocalField.UnitFiltration.Basic
import TauCeti.NumberTheory.Padics.RingHoms
import TauCeti.NumberTheory.Padics.PadicIntegers
import TauCeti.RingTheory.FittingIdeal.Basic
import TauCeti.RingTheory.FittingIdeal.BaseChange
import TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic
import TauCeti.Algebra.Module.AuslanderReiten.Transpose
import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Basic
import TauCeti.Algebra.MonoidAlgebra.Exactness
import TauCeti.RepresentationTheory.LinearCharacter.Basic
import TauCeti.Algebra.MonoidAlgebra.SubgroupCharSum
import TauCeti.GroupTheory.FiniteAbelian.CharacterOrthogonality
import TauCeti.Algebra.HopfAlgebra.Antipode
import TauCeti.LinearAlgebra.Matrix.Minor
import TauCeti.LinearAlgebra.ExteriorPower.Basic

/-!
# Suggested Lean forms: p-adic measures, completed group algebras, and characteristic ideals

This file is not the roadmap and it is not exhaustive. The roadmap document (README.md) is
definitive; references of the form §k.n are to its subsections. These signatures suggest names, hypotheses and tests so that contributors
converge on them. All new proofs use `sorry`; nothing here is claimed formalised.
The layers appear in the order L0, L1, L2, L3, L4, L6, then the universal character of L3a; the
statements of L3a and L5 that cannot be typed at the pinned libraries are named in the closing
comment.

The algebraic declarations work with an explicit Dirac homomorphism `δ : G →* R` into a
commutative ring and its existing total quotient ring. The completed group algebra, topology,
continuous-character integral, and comparison with its augmentation kernel are separate inputs
of the roadmap. `IsFractionRing` does not assume that `R` is a domain. `Submodule.div`, not
the domain-specific inverse operation on fractional ideals, supplies the carrier.
-/

noncomputable section

open scoped AbstractMeasure PowerSeries

namespace AbstractMeasure

section Weight

variable {X Y R : Type*} [TopologicalSpace X] [CompactSpace X]
  [TopologicalSpace Y] [CompactSpace Y] [NormedCommRing R]

/-- Multiply an existing measure by a continuous test function; no new measure carrier. -/
def weight (g : C(X, R)) : D(X, R) →ₗ[R] D(X, R) := sorry

theorem weight_apply (g : C(X, R)) (μ : D(X, R)) (f : C(X, R)) :
    weight g μ f = μ (g * f) := sorry

theorem weight_one (μ : D(X, R)) : weight 1 μ = μ := sorry
theorem weight_zero (μ : D(X, R)) : weight 0 μ = 0 := sorry
theorem weight_mul (g h : C(X, R)) (μ : D(X, R)) :
    weight (g * h) μ = weight g (weight h μ) := sorry
theorem weight_const (r : R) (μ : D(X, R)) :
    weight (ContinuousMap.const X r) μ = r • μ := sorry
theorem weight_dirac (g : C(X, R)) (x : X) :
    weight g (dirac R x) = g x • dirac R x := sorry

theorem map_weight (h : C(X, Y)) (g : C(Y, R)) (μ : D(X, R)) :
    map h (weight (g.comp h) μ) = weight g (map h μ) := sorry

theorem iterate_weight_apply (g : C(X, R)) (μ : D(X, R)) (k : ℕ) (f : C(X, R)) :
    ((weight g)^[k] μ) f = μ (g ^ k * f) := sorry

end Weight
end AbstractMeasure

namespace PowerSeries

variable (R : Type*) [CommRing R]

/-- The Mahler derivation is a multiple of the existing formal derivative. -/
def mahlerDerivation : Derivation R R⟦X⟧ R⟦X⟧ := (1 + X : R⟦X⟧) • derivative

theorem mahlerDerivation_apply (F : R⟦X⟧) :
    mahlerDerivation R F = (1 + X) * derivative F := sorry

theorem coeff_mahlerDerivation (F : R⟦X⟧) (n : ℕ) :
    coeff n (mahlerDerivation R F) =
      (n + 1 : R) * coeff (n + 1) F + (n : R) * coeff n F := sorry

theorem mahlerDerivation_C (r : R) : mahlerDerivation R (C r) = 0 := sorry
theorem mahlerDerivation_X : mahlerDerivation R X = 1 + X := sorry
theorem mahlerDerivation_mul (F G : R⟦X⟧) :
    mahlerDerivation R (F * G) = F * mahlerDerivation R G + G * mahlerDerivation R F := sorry

theorem map_mahlerDerivation {S : Type*} [CommRing S] (f : R →+* S) (F : R⟦X⟧) :
    map f (mahlerDerivation R F) = mahlerDerivation S (map f F) := sorry

theorem map_iterate_mahlerDerivation {S : Type*} [CommRing S]
    (f : R →+* S) (F : R⟦X⟧) (k : ℕ) :
    map f ((mahlerDerivation R)^[k] F) = (mahlerDerivation S)^[k] (map f F) := sorry

variable [Algebra ℚ R]

theorem derivative_subst_exp_sub_one (F : R⟦X⟧) :
    derivative (subst (exp R - 1) F) = subst (exp R - 1) (mahlerDerivation R F) := sorry

theorem iterate_derivative_subst_exp_sub_one (F : R⟦X⟧) (k : ℕ) :
    (derivative (R := R))^[k] (subst (exp R - 1) F) =
      subst (exp R - 1) ((mahlerDerivation R)^[k] F) := sorry

theorem constantCoeff_iterate_mahlerDerivation (F : R⟦X⟧) (k : ℕ) :
    constantCoeff ((mahlerDerivation R)^[k] F) =
      (k.factorial : R) * coeff k (subst (exp R - 1) F) := sorry

end PowerSeries

namespace AbstractMeasure

variable {p : ℕ} [Fact p.Prime]

theorem id_mul_mahler (n : ℕ) :
    (ContinuousMap.id ℤ_[p]) * mahler n =
      (n + 1) • mahler (p := p) (n + 1) + n • mahler (p := p) n := sorry

theorem amiceTransform_weight_id (μ : D(ℤ_[p], ℤ_[p])) :
    (weight (ContinuousMap.id ℤ_[p]) μ).amiceTransform =
      PowerSeries.mahlerDerivation ℤ_[p] μ.amiceTransform := sorry

theorem amiceTransform_iterate_weight_id (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    ((weight (ContinuousMap.id ℤ_[p]))^[k] μ).amiceTransform =
      (PowerSeries.mahlerDerivation ℤ_[p])^[k] μ.amiceTransform := sorry

theorem ordinaryMoment_eq_constantCoeff (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    μ ((ContinuousMap.id ℤ_[p]) ^ k) =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation ℤ_[p])^[k] μ.amiceTransform) := sorry

/-- Embed the evaluated integral, not the measure; exp is purely formal over Q_p. -/
theorem ordinaryMoment_eq_factorial_coeff (μ : D(ℤ_[p], ℤ_[p])) (k : ℕ) :
    (μ ((ContinuousMap.id ℤ_[p]) ^ k) : ℚ_[p]) =
      (k.factorial : ℚ_[p]) * PowerSeries.coeff k
        (PowerSeries.subst (PowerSeries.exp ℚ_[p] - 1)
          (PowerSeries.map (algebraMap ℤ_[p] ℚ_[p]) μ.amiceTransform)) := sorry

end AbstractMeasure

namespace Iwasawa

variable {G R : Type*} [Group G] [CommRing R]
variable (δ : G →* R) (Q : Type*) [CommRing Q] [Algebra R Q] [IsFractionRing R Q]

/-- Fractions made integral by every Dirac difference. -/
def pseudomeasures : Submodule R Q :=
  (1 : Submodule R Q) /
    Submodule.span R (Set.range (fun g : G => algebraMap R Q (δ g - 1)))

theorem mem_pseudomeasures_iff (z : Q) :
    z ∈ pseudomeasures δ Q ↔
      ∀ g : G, ∃ r : R, algebraMap R Q r = algebraMap R Q (δ g - 1) * z := sorry

theorem pseudomeasures_eq_top_of_trivial (hδ : ∀ g, δ g = 1) :
    pseudomeasures δ Q = ⊤ := sorry

/-- The canonical integral inclusion, with its linear structure inherited from the total quotient. -/
def integral : R →ₗ[R] pseudomeasures δ Q := sorry

theorem coe_integral (r : R) : (integral δ Q r : Q) = algebraMap R Q r := sorry

theorem integral_zero : integral δ Q 0 = 0 := sorry

theorem integral_injective : Function.Injective (integral δ Q) := sorry

theorem pseudomeasure_ext (x y : pseudomeasures δ Q) (h : (x : Q) = (y : Q)) : x = y := sorry

/-- The unique integral numerator after multiplication by `δ g - 1`. -/
def numerator (g : G) : pseudomeasures δ Q →ₗ[R] R := sorry

theorem algebraMap_numerator (g : G) (z : pseudomeasures δ Q) :
    algebraMap R Q (numerator δ Q g z) = algebraMap R Q (δ g - 1) * (z : Q) := sorry

theorem numerator_unique (g : G) (z : pseudomeasures δ Q) (r : R)
    (hr : algebraMap R Q r = algebraMap R Q (δ g - 1) * (z : Q)) :
    numerator δ Q g z = r := sorry

theorem numerator_integral (g : G) (r : R) :
    numerator δ Q g (integral δ Q r) = (δ g - 1) * r := sorry

theorem numerator_one (z : pseudomeasures δ Q) : numerator δ Q 1 z = 0 := sorry

theorem numerator_cross (g h : G) (z : pseudomeasures δ Q) :
    (δ h - 1) * numerator δ Q g z = (δ g - 1) * numerator δ Q h z := sorry

variable (A : Type*) [CommRing A] [Algebra R A]

/-- Evaluation is defined only for a clearing factor with unit image. -/
def evalAt (g : G) (hg : IsUnit (algebraMap R A (δ g - 1))) :
    pseudomeasures δ Q →ₗ[R] A := sorry

theorem evalAt_spec (g : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (z : pseudomeasures δ Q) :
    algebraMap R A (δ g - 1) * evalAt δ Q A g hg z =
      algebraMap R A (numerator δ Q g z) := sorry

theorem evalAt_eq (g h : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (hh : IsUnit (algebraMap R A (δ h - 1))) :
    evalAt δ Q A g hg = evalAt δ Q A h hh := sorry

theorem evalAt_integral (g : G) (hg : IsUnit (algebraMap R A (δ g - 1))) (r : R) :
    evalAt δ Q A g hg (integral δ Q r) = algebraMap R A r := sorry

theorem evalAt_unique (g : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (L : pseudomeasures δ Q →ₗ[R] A)
    (hL : ∀ r : R, L (integral δ Q r) = algebraMap R A r) :
    L = evalAt δ Q A g hg := sorry

theorem evalAt_map {B : Type*} [CommRing B] [Algebra R B] (f : A →ₐ[R] B)
    (g : G) (hg : IsUnit (algebraMap R A (δ g - 1)))
    (hgB : IsUnit (algebraMap R B (δ g - 1))) (z : pseudomeasures δ Q) :
    f (evalAt δ Q A g hg z) = evalAt δ Q B g hgB z := sorry

/-- A ring homomorphism cannot kill a regular element and extend to the total quotient ring. -/
theorem no_fraction_extension {R Q A : Type*} [CommRing R] [CommRing Q] [Algebra R Q]
    [IsFractionRing R Q] [CommRing A] [Nontrivial A] (f : R →+* A)
    (s : R) (hs : s ∈ nonZeroDivisors R) (hfs : f s = 0) :
    ¬ ∃ F : Q →+* A, F.comp (algebraMap R Q) = f := sorry

end Iwasawa

namespace SuggestedTests

open PowerSeries AbstractMeasure

-- SuggestedTests.weight_zero_atom: weighting by x is not injective on all Z_p measures.
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 0) = 0 ∧
    dirac ℤ_[3] 0 ≠ 0 := sorry
-- SuggestedTests.weight_one_atom
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 1) = dirac ℤ_[3] 1 := sorry
-- SuggestedTests.weight_two_atom
example : weight (ContinuousMap.id ℤ_[3]) (dirac ℤ_[3] 2) =
    (2 : ℤ_[3]) • dirac ℤ_[3] 2 := sorry

-- SuggestedTests.mahler_constant
example : mahlerDerivation ℤ (C 7) = 0 := sorry
-- SuggestedTests.mahler_X: distinguishes (1+T)D from D and TD.
example : mahlerDerivation ℤ X = 1 + X := sorry
-- SuggestedTests.mahler_square
example : mahlerDerivation ℤ ((1 + X) ^ 2) = C 2 * (1 + X) ^ 2 := sorry
-- SuggestedTests.mahler_char_three: no characteristic-zero injectivity assertion.
example : mahlerDerivation (ZMod 3) (X ^ 3) = 0 ∧
    (X ^ 3 : PowerSeries (ZMod 3)) ≠ 0 := sorry

-- Explicit subst notation and the paper-style dotted notation agree.
example (F : PowerSeries ℚ) : F.subst (exp ℚ - 1) = subst (exp ℚ - 1) F := rfl

-- SuggestedTests.ordinary_zero: the zero-th moment of delta_0 is 1, not 0.
example : PowerSeries.constantCoeff
    ((mahlerDerivation ℤ_[3])^[0] (dirac ℤ_[3] (0 : ℤ_[3])).amiceTransform) = 1 := sorry
-- SuggestedTests.ordinary_two_third: ordinary third moment is 8, not a Mahler coefficient.
example : (dirac ℤ_[3] 2) ((ContinuousMap.id ℤ_[3]) ^ 3) = 8 ∧
    coeff 3 ((dirac ℤ_[3] (2 : ℤ_[3])).amiceTransform) = 0 := sorry
-- SuggestedTests.exp_factorial: coefficient is 8/3! = 4/3, not 8.
example : coeff 3 (subst (exp ℚ - 1) ((1 + X : PowerSeries ℚ) ^ 2)) = 4 / 3 := sorry

-- Carrier: the trivial Dirac map imposes no integrality condition, even on 1/2.
-- SuggestedTests.trivial_half
example : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (1 : PUnit →* ℤ) ℚ := sorry

-- Carrier: agreement with integral scalars.
-- SuggestedTests.integer_three
example : (3 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ := sorry

-- Carrier: it is a module, not generally a subring. The differences generate (2) in this example.
-- SuggestedTests.half_not_quarter
example : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ ∧
    (1 / 4 : ℚ) ∉ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ := sorry

-- Integral inclusion: computed values, zero and injectivity reject a collapsed embedding.
-- SuggestedTests.integral_three
example : (Iwasawa.integral (Units.coeHom ℤ) ℚ 3 : ℚ) = 3 := sorry
-- SuggestedTests.integral_zero
example : (Iwasawa.integral (Units.coeHom ℤ) ℚ 0 : ℚ) = 0 := sorry
-- SuggestedTests.integral_one_ne_zero
example : Iwasawa.integral (Units.coeHom ℤ) ℚ 1 ≠
    Iwasawa.integral (Units.coeHom ℤ) ℚ 0 := sorry

-- Numerator: the identity element has zero difference.
-- SuggestedTests.numerator_identity
example (z : Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ) :
    Iwasawa.numerator (Units.coeHom ℤ) ℚ 1 z = 0 := sorry

-- Numerator: integral compatibility.
-- SuggestedTests.numerator_integral_two
example : Iwasawa.numerator (Units.coeHom ℤ) ℚ (-1)
    (Iwasawa.integral (Units.coeHom ℤ) ℚ 2) = -4 := sorry

-- Numerator: nonintegral pseudomeasure, integral cleared numerator.
-- SuggestedTests.numerator_half
example (h : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ) :
    Iwasawa.numerator (Units.coeHom ℤ) ℚ (-1) ⟨1 / 2, h⟩ = -1 := sorry

-- Evaluation: zero, integral agreement and the nonintegral half are distinct checks.
-- SuggestedTests.evaluation_zero
example (hu : IsUnit (algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1))) :
    Iwasawa.evalAt (Units.coeHom ℤ) ℚ ℚ (-1) hu 0 = 0 := sorry

-- SuggestedTests.evaluation_integral_three
example (hu : IsUnit (algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1))) :
    Iwasawa.evalAt (Units.coeHom ℤ) ℚ ℚ (-1) hu
      (Iwasawa.integral (Units.coeHom ℤ) ℚ 3) = 3 := sorry

-- SuggestedTests.evaluation_half
example (h : (1 / 2 : ℚ) ∈ Iwasawa.pseudomeasures (Units.coeHom ℤ) ℚ)
    (hu : IsUnit (algebraMap ℤ ℚ (Units.coeHom ℤ (-1) - 1))) :
    Iwasawa.evalAt (Units.coeHom ℤ) ℚ ℚ (-1) hu ⟨1 / 2, h⟩ = 1 / 2 := sorry

-- A nonzero denominator is insufficient over a general target ring: 2 is not a unit in ℤ.
-- SuggestedTests.nonzero_not_unit
example : (2 : ℤ) ≠ 0 ∧ ¬ IsUnit (2 : ℤ) := sorry

-- Augmentation cannot extend to the full fraction ring because it kills X.
-- SuggestedTests.augmentation_obstruction
example : ¬ ∃ F : FractionRing (Polynomial ℚ) →+* ℚ,
    F.comp (algebraMap (Polynomial ℚ) (FractionRing (Polynomial ℚ))) =
      Polynomial.evalRingHom (0 : ℚ) := sorry

-- The same obstruction occurs away from the augmentation point: evaluation at 3 kills X-3.
-- SuggestedTests.nontrivial_point_obstruction
example : ¬ ∃ F : FractionRing (Polynomial ℚ) →+* ℚ,
    F.comp (algebraMap (Polynomial ℚ) (FractionRing (Polynomial ℚ))) =
      Polynomial.evalRingHom (3 : ℚ) := sorry

end SuggestedTests


namespace AbstractMeasure

section BoundedOperators

open scoped Classical

variable (p : ℕ) [Fact p.Prime]

/-- The subset p Z_p is clopen in Z_p. -/
theorem isClopen_pMultiples : IsClopen {x : ℤ_[p] | (p : ℤ_[p]) ∣ x} := sorry

/-- Exact division on p Z_p, extended by zero; no division of measure values. -/
def divideByP : C(ℤ_[p], ℤ_[p]) := sorry

theorem divideByP_mul (x : ℤ_[p]) : divideByP p ((p : ℤ_[p]) * x) = x := sorry
theorem mul_divideByP (x : ℤ_[p]) (hx : (p : ℤ_[p]) ∣ x) :
    (p : ℤ_[p]) * divideByP p x = x := sorry
theorem divideByP_of_not_dvd (x : ℤ_[p]) (hx : ¬ (p : ℤ_[p]) ∣ x) :
    divideByP p x = 0 := sorry

variable (R : Type*) [NormedCommRing R]

local notation "χ" => LocallyConstant.toContinuousMap (LocallyConstant.charFn R (isClopen_pMultiples p))
local notation "mₚ" => (ContinuousMap.mk (fun x : ℤ_[p] => (p : ℤ_[p]) * x)
  (Continuous.mul continuous_const continuous_id))

def restrictMultiples : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem restrictMultiples_eq_weight : restrictMultiples p R = weight χ := sorry
theorem restrictMultiples_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    restrictMultiples p R μ f = μ (χ * f) := sorry
theorem restrictMultiples_dirac (x : ℤ_[p]) :
    restrictMultiples p R (dirac R x) = if (p : ℤ_[p]) ∣ x then dirac R x else 0 := by
  classical
  sorry
theorem restrictMultiples_idem (μ : D(ℤ_[p], R)) :
    restrictMultiples p R (restrictMultiples p R μ) = restrictMultiples p R μ := sorry

def phiMeasure : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem phiMeasure_eq_map : phiMeasure p R = map mₚ := sorry
theorem phiMeasure_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    phiMeasure p R μ f = μ (f.comp mₚ) := sorry
theorem phiMeasure_dirac (x : ℤ_[p]) :
    phiMeasure p R (dirac R x) = dirac R ((p : ℤ_[p]) * x) := sorry
theorem phiMeasure_injective : Function.Injective (phiMeasure p R) := sorry

def psiMeasure : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem psiMeasure_eq_map_restrict : psiMeasure p R =
    (map (divideByP p)).comp (restrictMultiples p R) := sorry
theorem psiMeasure_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    psiMeasure p R μ f = μ (χ * f.comp (divideByP p)) := sorry
theorem psiMeasure_dirac (x : ℤ_[p]) :
    psiMeasure p R (dirac R x) =
      if (p : ℤ_[p]) ∣ x then dirac R (divideByP p x) else 0 := by
  classical
  sorry
theorem psiMeasure_phiMeasure (μ : D(ℤ_[p], R)) :
    psiMeasure p R (phiMeasure p R μ) = μ := sorry
theorem phiMeasure_psiMeasure (μ : D(ℤ_[p], R)) :
    phiMeasure p R (psiMeasure p R μ) = restrictMultiples p R μ := sorry

def unitRestriction : D(ℤ_[p], R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem unitRestriction_eq_sub : unitRestriction p R =
    LinearMap.id - restrictMultiples p R := sorry
theorem unitRestriction_apply (μ : D(ℤ_[p], R)) (f : C(ℤ_[p], R)) :
    unitRestriction p R μ f = μ ((1 - χ) * f) := sorry
theorem unitRestriction_dirac (x : ℤ_[p]) :
    unitRestriction p R (dirac R x) = if IsUnit x then dirac R x else 0 := by
  classical
  sorry
theorem unitRestriction_idem (μ : D(ℤ_[p], R)) :
    unitRestriction p R (unitRestriction p R μ) = unitRestriction p R μ := sorry
theorem unitRestriction_eq_self_iff (μ : D(ℤ_[p], R)) :
    unitRestriction p R μ = μ ↔ ∀ f : C(ℤ_[p], R), μ (χ * f) = 0 := sorry
theorem unitRestriction_eq_self_iff_psi_eq_zero (μ : D(ℤ_[p], R)) :
    unitRestriction p R μ = μ ↔ psiMeasure p R μ = 0 := sorry
theorem psiMeasure_unitRestriction (μ : D(ℤ_[p], R)) :
    psiMeasure p R (unitRestriction p R μ) = 0 := sorry
theorem unitRestriction_phiMeasure (μ : D(ℤ_[p], R)) :
    unitRestriction p R (phiMeasure p R μ) = 0 := sorry

end BoundedOperators

section AmiceOperators

variable (p : ℕ) [Fact p.Prime]
open PowerSeries
local notation "B" => ℤ_[p]⟦X⟧
local notation "b" => ((1 + X : B) ^ p - 1)

/-- Finite Mahler expansion of the dilation x ↦ p x. -/
theorem mahler_mul_prime (n : ℕ) (x : ℤ_[p]) :
    mahler n ((p : ℤ_[p]) * x) =
      ∑ k ∈ Finset.range (n + 1), coeff n (b ^ k) * mahler k x := sorry

theorem amiceTransform_phiMeasure (μ : D(ℤ_[p], ℤ_[p])) :
    (phiMeasure p ℤ_[p] μ).amiceTransform = subst b μ.amiceTransform := sorry

/-- Transport of the integral bounded-measure psi along the existing Amice equivalence. -/
def psiSeries : B →ₗ[ℤ_[p]] B := sorry

theorem psiSeries_eq_transport : psiSeries p =
    (amiceTransformEquiv (p := p)).toLinearMap.comp
      ((psiMeasure p ℤ_[p]).comp (amiceTransformEquiv (p := p)).symm.toLinearMap) := sorry
theorem psiSeries_amiceTransform (μ : D(ℤ_[p], ℤ_[p])) :
    psiSeries p μ.amiceTransform = (psiMeasure p ℤ_[p] μ).amiceTransform := sorry
theorem psiSeries_phi (F : B) : psiSeries p (subst b F) = F := sorry
theorem psiSeries_one : psiSeries p 1 = 1 := sorry
theorem psiSeries_one_add_X : psiSeries p (1 + X) = 0 := sorry
theorem amiceTransform_unitRestriction (μ : D(ℤ_[p], ℤ_[p])) :
    (unitRestriction p ℤ_[p] μ).amiceTransform =
      μ.amiceTransform - subst b (psiSeries p μ.amiceTransform) := sorry

end AmiceOperators
end AbstractMeasure

namespace SuggestedTests
open AbstractMeasure PowerSeries

-- SuggestedTests.divide_zero
example : divideByP 3 0 = 0 := sorry
-- SuggestedTests.divide_six
example : divideByP 3 6 = 2 := sorry
-- SuggestedTests.divide_unit
example : divideByP 3 1 = 0 := sorry
-- SuggestedTests.divide_dyadic
example : divideByP 2 6 = 3 := sorry

-- SuggestedTests.restrict_zero_atom: zero is in p Z_p.
example : restrictMultiples 3 ℤ_[3] (dirac ℤ_[3] 0) = dirac ℤ_[3] 0 := sorry
-- SuggestedTests.restrict_unit_atom
example : restrictMultiples 3 ℤ_[3] (dirac ℤ_[3] 1) = 0 := sorry
-- SuggestedTests.restrict_three_atom
example : restrictMultiples 3 ℤ_[3] (dirac ℤ_[3] 3) = dirac ℤ_[3] 3 := sorry

-- SuggestedTests.phi_zero
example : phiMeasure 3 ℤ_[3] 0 = 0 := sorry
-- SuggestedTests.phi_two_atom
example : phiMeasure 3 ℤ_[3] (dirac ℤ_[3] 2) = dirac ℤ_[3] 6 := sorry
-- SuggestedTests.phi_mass
example (μ : D(ℤ_[3], ℤ_[3])) : phiMeasure 3 ℤ_[3] μ 1 = μ 1 := sorry

-- SuggestedTests.psi_zero_atom
example : psiMeasure 3 ℤ_[3] (dirac ℤ_[3] 0) = dirac ℤ_[3] 0 := sorry
-- SuggestedTests.psi_six_atom
example : psiMeasure 3 ℤ_[3] (dirac ℤ_[3] 6) = dirac ℤ_[3] 2 := sorry
-- SuggestedTests.psi_unit_atom
example : psiMeasure 3 ℤ_[3] (dirac ℤ_[3] 1) = 0 := sorry
-- SuggestedTests.psi_dyadic
example : psiMeasure 2 ℤ_[2] (dirac ℤ_[2] 6) = dirac ℤ_[2] 3 := sorry

-- SuggestedTests.unit_one_atom
example : unitRestriction 3 ℤ_[3] (dirac ℤ_[3] 1) = dirac ℤ_[3] 1 := sorry
-- SuggestedTests.unit_zero_atom
example : unitRestriction 3 ℤ_[3] (dirac ℤ_[3] 0) = 0 := sorry
-- SuggestedTests.unit_three_atom
example : unitRestriction 3 ℤ_[3] (dirac ℤ_[3] 3) = 0 := sorry

-- SuggestedTests.psi_series_zero
example : psiSeries 3 0 = 0 := sorry
-- SuggestedTests.psi_series_one
example : psiSeries 3 1 = 1 := sorry
-- SuggestedTests.psi_series_unit
example : psiSeries 3 (1 + X) = 0 := sorry
-- SuggestedTests.psi_series_cube
example : psiSeries 3 ((1 + X) ^ 3) = 1 + X := sorry
-- SuggestedTests.psi_series_dyadic
example : psiSeries 2 ((1 + X) ^ 2) = 1 + X := sorry

-- The source-label error changes a numerical integral, not the valid psi-phi theorem.
-- SuggestedTests.source_measure_label
example : phiMeasure 3 ℤ_[3] (dirac ℤ_[3] 1) (ContinuousMap.id ℤ_[3]) = 3 ∧
    dirac ℤ_[3] (1 : ℤ_[3]) (ContinuousMap.id ℤ_[3]) = 1 := sorry
-- SuggestedTests.mahler_prime_second
example (x : ℤ_[3]) : mahler 2 (3 * x) = 3 * mahler 1 x + 9 * mahler 2 x := sorry
-- SuggestedTests.psi_not_multiplicative
example : psiSeries 2 (1 + X) * psiSeries 2 (1 + X) ≠
    psiSeries 2 ((1 + X) * (1 + X)) := sorry
end SuggestedTests


namespace PadicInt
variable {p : ℕ} [Fact p.Prime]

/-- Identify two existing unit-inverse functions; neither function is redefined. -/
theorem inv_eq_ringInverse (x : ℤ_[p]) : x.inv = Ring.inverse x := sorry

theorem continuous_inv : Continuous (PadicInt.inv (p := p)) := sorry
end PadicInt

namespace AbstractMeasure
section UnitInverse
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "ι" => (ContinuousMap.mk PadicInt.inv PadicInt.continuous_inv : C(Z, Z))
local notation "x" => (ContinuousMap.id Z)

/-- Weight by the existing unit inverse extended by zero, on the existing integral measure. -/
def inverseWeight : D(Z, Z) →ₗ[Z] D(Z, Z) := weight ι

theorem inverseWeight_eq_weight : inverseWeight p = weight ι := sorry
theorem inverseWeight_apply (μ : D(Z, Z)) (f : C(Z, Z)) :
    inverseWeight p μ f = μ (ι * f) := sorry
theorem inverseWeight_dirac (a : Z) :
    inverseWeight p (dirac Z a) = a.inv • dirac Z a := sorry

theorem inverseWeight_unitRestriction (μ : D(Z, Z)) :
    inverseWeight p (unitRestriction p Z μ) = inverseWeight p μ ∧
      unitRestriction p Z (inverseWeight p μ) = inverseWeight p μ := sorry

theorem weight_id_inverseWeight (μ : D(Z, Z)) :
    weight x (inverseWeight p μ) = unitRestriction p Z μ := sorry

theorem inverseWeight_weight_id (μ : D(Z, Z)) :
    inverseWeight p (weight x μ) = unitRestriction p Z μ := sorry

theorem inverseWeight_unique (μ : D(Z, Z)) (hμ : psiMeasure p Z μ = 0) :
    ∃! ν : D(Z, Z), psiMeasure p Z ν = 0 ∧ weight x ν = μ := sorry

/-- The map is raw pushforward along a unit dilation, with its direction explicit. -/
theorem inverseWeight_map_unit (a : Zˣ) (μ : D(Z, Z)) :
    inverseWeight p (map ⟨fun z : Z => (a : Z) * z,
      continuous_const.mul continuous_id⟩ μ) =
    (a⁻¹ : Zˣ) • map ⟨fun z : Z => (a : Z) * z,
      continuous_const.mul continuous_id⟩ (inverseWeight p μ) := sorry

open PowerSeries
local notation "B" => Z⟦X⟧
local notation "b" => ((1 + X : B) ^ p - 1)

/-- Transport through the existing integral Amice equivalence. -/
def inverseMahler : B →ₗ[Z] B :=
    (amiceTransformEquiv (p := p)).toLinearMap.comp
      ((inverseWeight p).comp (amiceTransformEquiv (p := p)).symm.toLinearMap)

theorem inverseMahler_eq_transport : inverseMahler p =
    (amiceTransformEquiv (p := p)).toLinearMap.comp
      ((inverseWeight p).comp (amiceTransformEquiv (p := p)).symm.toLinearMap) := sorry

theorem inverseMahler_amiceTransform (μ : D(Z, Z)) :
    inverseMahler p μ.amiceTransform = (inverseWeight p μ).amiceTransform := sorry

theorem psiSeries_inverseMahler (F : B) : psiSeries p (inverseMahler p F) = 0 := sorry

theorem mahlerDerivation_inverseMahler (F : B) :
    mahlerDerivation Z (inverseMahler p F) = F - subst b (psiSeries p F) := sorry

theorem inverseMahler_mahlerDerivation (F : B) :
    inverseMahler p (mahlerDerivation Z F) = F - subst b (psiSeries p F) := sorry

theorem inverseMahler_unique (F : B) (hF : psiSeries p F = 0) :
    ∃! G : B, psiSeries p G = 0 ∧ mahlerDerivation Z G = F := sorry
end UnitInverse
end AbstractMeasure

namespace SuggestedTests
open scoped AbstractMeasure
open AbstractMeasure PowerSeries
-- SuggestedTests.inverse_weight_zero_atom
example : inverseWeight 3 (dirac ℤ_[3] 0) = 0 := sorry
-- SuggestedTests.inverse_weight_unit_atom
example : inverseWeight 3 (dirac ℤ_[3] 1) = dirac ℤ_[3] 1 := sorry
-- SuggestedTests.inverse_weight_two_atom
example : (2 : ℤ_[3]) • inverseWeight 3 (dirac ℤ_[3] 2) = dirac ℤ_[3] 2 := sorry
-- SuggestedTests.inverse_weight_nonunit_atom
example : inverseWeight 3 (dirac ℤ_[3] 3) = 0 := sorry
-- SuggestedTests.inverse_weight_dyadic_atom
example : (3 : ℤ_[2]) • inverseWeight 2 (dirac ℤ_[2] 3) = dirac ℤ_[2] 3 := sorry
-- SuggestedTests.inverse_weight_dilation_factor
example : (2 : ℤ_[3]) • inverseWeight 3
    (map ⟨fun z : ℤ_[3] => 2 * z, continuous_const.mul continuous_id⟩
      (dirac ℤ_[3] 1)) = dirac ℤ_[3] 2 := sorry
-- SuggestedTests.inverse_mahler_constant
example : inverseMahler 3 (1 : ℤ_[3]⟦X⟧) = 0 := sorry
-- SuggestedTests.inverse_mahler_unit
example : inverseMahler 3 (1 + X) = 1 + X := sorry
-- SuggestedTests.inverse_mahler_square
example : (2 : ℤ_[3]) • inverseMahler 3 ((1 + X) ^ 2) = (1 + X) ^ 2 := sorry
-- SuggestedTests.inverse_mahler_nonunit
example : inverseMahler 3 ((1 + X) ^ 3) = 0 := sorry
-- SuggestedTests.inverse_mahler_dyadic
example : (3 : ℤ_[2]) • inverseMahler 2 ((1 + X) ^ 3) = (1 + X) ^ 3 := sorry
end SuggestedTests

/-! ## Integral topological root averaging

The receiving ring is the existing valuation integer ring of C_p, with its
induced topology. The topology on power series is the coefficientwise p-adic
product topology. Topological evaluation, not formal substitution at a nonzero
constant, defines root translation. The operator psiSeries is the preceding one.
-/

namespace IwasawaAveraging
open Filter Topology PowerSeries
open scoped PowerSeries.WithPiTopology Valued NNReal Classical

variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "O" => 𝒪[ℂ_[p]]
local notation "B" => Z⟦X⟧
local notation "b" => ((1 + X : B) ^ p - 1)
local notation "j₀" => (RingHom.comp (algebraMap ℚ_[p] ℂ_[p]) (algebraMap Z ℚ_[p]))

-- The complete-space instance is the pinned closed-subspace theorem.
local instance : CompleteSpace O :=
  (Valued.isClosed_integer ℂ_[p]).isComplete.completeSpace_coe

/-- Small valuation balls give an ideal basis on the existing integer ring. -/
theorem integerRing_linearTopology : IsLinearTopology O O := by sorry
local instance : IsLinearTopology O O := integerRing_linearTopology p

/-- The canonical coefficient map, the existing composite lifted into its unit ball. -/
def integralCoefficientMap : Z →+* O := sorry

theorem integralCoefficientMap_coe (x : Z) :
    ((integralCoefficientMap p x : O) : ℂ_[p]) = j₀ x := by sorry

theorem integralCoefficientMap_continuous : Continuous (integralCoefficientMap p) := by sorry

theorem integralCoefficientMap_injective : Function.Injective (integralCoefficientMap p) := by sorry

theorem primeRoot_sub_one_norm {ζ : ℂ_[p]} (hζ : ζ ^ p = 1) : ‖ζ - 1‖ < 1 := by sorry

theorem integerRoot_sub_one_topologicallyNilpotent {ζ : O} (hζ : ζ ^ p = 1) :
    IsTopologicallyNilpotent (ζ - 1) := by sorry

theorem invTransform_uniform_tail (f : C(Z, Z)) (ε : ℝ) (hε : 0 < ε) :
    ∃ N : ℕ, ∀ F : B, ∀ n : ℕ, N ≤ n →
      ‖AbstractMeasure.invTransform F f -
        ∑ k ∈ Finset.range n, PadicInt.mahlerEquiv Z f k * F.coeff k‖ < ε := by sorry

/-- Integral Amice evaluation is continuous for the coefficientwise topology. -/
theorem continuous_invTransform_apply (f : C(Z, Z)) :
    Continuous (fun F : B => AbstractMeasure.invTransform F f) := by sorry

theorem continuous_psiSeries : Continuous (AbstractMeasure.psiSeries p) := by sorry

theorem continuous_phi_psiSeries :
    Continuous (fun F : B => subst b (AbstractMeasure.psiSeries p F)) := by sorry

theorem amiceTransform_dirac_nat (n : ℕ) :
    (AbstractMeasure.dirac Z (n : Z)).amiceTransform = (1 + X : B) ^ n := by sorry

theorem phi_psiSeries_one_add_X_pow (n : ℕ) :
    subst b (AbstractMeasure.psiSeries p ((1 + X : B) ^ n)) =
      if p ∣ n then (1 + X : B) ^ n else 0 := by sorry

theorem rootTranslation_hasEval (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) :
    PowerSeries.HasEval (C (ζ ^ i) * (1 + X : O⟦X⟧) - 1) := by sorry

/-- Only integral input coefficients are evaluated; the target has its genuine topology. -/
def rootTranslation (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) : B →+* O⟦X⟧ := sorry

theorem rootTranslation_eq_eval (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) (F : B) :
    rootTranslation p ζ hζ i F =
      PowerSeries.eval₂ ((PowerSeries.C : O →+* O⟦X⟧).comp (integralCoefficientMap p))
        (C (ζ ^ i) * (1 + X) - 1) F := by sorry

theorem rootTranslation_continuous (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) :
    Continuous (rootTranslation p ζ hζ i) := by sorry

theorem rootTranslation_polynomial (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) (P : Polynomial Z) :
    rootTranslation p ζ hζ i (P : B) =
      P.eval₂ ((PowerSeries.C : O →+* O⟦X⟧).comp (integralCoefficientMap p))
        (C (ζ ^ i) * (1 + X) - 1) := by sorry

theorem rootTranslation_one_add_X_pow (ζ : O) (hζ : ζ ^ p = 1) (i n : ℕ) :
    rootTranslation p ζ hζ i ((1 + X : B) ^ n) = C (ζ ^ (i * n)) * (1 + X) ^ n := by sorry

theorem rootTranslation_hasSum (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ) (F : B) :
    HasSum (fun n => C (integralCoefficientMap p (F.coeff n)) *
      (C (ζ ^ i) * (1 + X : O⟦X⟧) - 1) ^ n) (rootTranslation p ζ hζ i F) := by sorry

theorem rootTranslation_zeroth (ζ : O) (hζ : ζ ^ p = 1) (F : B) :
    rootTranslation p ζ hζ 0 F = PowerSeries.map (integralCoefficientMap p) F := by sorry

theorem primitiveRoot_power_sum {R : Type*} [CommRing R] [IsDomain R]
    {ζ : R} (hζ : IsPrimitiveRoot ζ p) (n : ℕ) :
    (∑ i ∈ Finset.range p, ζ ^ (i * n)) = if p ∣ n then (p : R) else 0 := by sorry

theorem root_average_polynomial (ζ : O) (hζ : IsPrimitiveRoot ζ p) (P : Polynomial Z) :
    (p : O⟦X⟧) * PowerSeries.map (integralCoefficientMap p)
      (subst b (AbstractMeasure.psiSeries p (P : B))) =
      ∑ i ∈ Finset.range p, rootTranslation p ζ hζ.pow_eq_one i (P : B) := by sorry

theorem root_average (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    (p : O⟦X⟧) * PowerSeries.map (integralCoefficientMap p)
      (subst b (AbstractMeasure.psiSeries p F)) =
      ∑ i ∈ Finset.range p, rootTranslation p ζ hζ.pow_eq_one i F := by sorry

theorem root_average_integral_descent (ζ : O) (hζ : IsPrimitiveRoot ζ p) (F : B) :
    ∃! G : B, (p : O⟦X⟧) * PowerSeries.map (integralCoefficientMap p) (subst b G) =
      ∑ i ∈ Finset.range p, rootTranslation p ζ hζ.pow_eq_one i F := by sorry

section Fractions
local notation "CPS" => ℂ_[p]⟦X⟧
local notation "Q" => FractionRing CPS
local notation "J" => RingHom.comp (algebraMap CPS Q) (PowerSeries.map j₀)
local notation "Y" => ((algebraMap CPS Q) (1 + X))
local notation "c" => (RingHom.comp (algebraMap CPS Q) (PowerSeries.C : ℂ_[p] →+* CPS))

/-- Polynomial affine substitution has no zero denominator for nonzero Q. -/
theorem translated_polynomial_ne_zero (ζ : ℂ_[p]) (hζ : ζ ≠ 0)
    (P : Polynomial Z) (hP : P ≠ 0) :
    P.eval₂ (RingHom.comp c j₀) (c ζ * Y - 1) ≠ 0 := by sorry

theorem rootTranslation_rational (ζ : O) (hζ : ζ ^ p = 1) (i : ℕ)
    (P Q₀ : Polynomial Z) (hQ : IsUnit (Q₀.coeff 0)) (F : B)
    (hF : (Q₀ : B) * F = (P : B)) :
    (algebraMap CPS Q) (PowerSeries.map (Valued.integer ℂ_[p]).subtype
      (rootTranslation p ζ hζ i F)) =
      P.eval₂ (RingHom.comp c j₀) (c ((ζ : ℂ_[p]) ^ i) * Y - 1) /
        Q₀.eval₂ (RingHom.comp c j₀) (c ((ζ : ℂ_[p]) ^ i) * Y - 1) := by sorry

theorem rational_root_average (ζ : ℂ_[p]) (hζ : IsPrimitiveRoot ζ p)
    (P Q₀ : Polynomial Z) (hQ : IsUnit (Q₀.coeff 0)) (F : B)
    (hF : (Q₀ : B) * F = (P : B)) :
    (p : Q) * J (subst b (AbstractMeasure.psiSeries p F)) =
      ∑ i ∈ Finset.range p,
        P.eval₂ (RingHom.comp c j₀) (c (ζ ^ i) * Y - 1) /
          Q₀.eval₂ (RingHom.comp c j₀) (c (ζ ^ i) * Y - 1) := by sorry
end Fractions

section AlgebraicFractions
variable {K : Type*} [Field K] [CharZero K]

theorem root_denominator_ne_zero {ζ y : K} (hζ : IsPrimitiveRoot ζ p)
    (hy : y ^ p ≠ 1) (i : ℕ) : ζ ^ i * y - 1 ≠ 0 := by sorry

theorem root_partial_fractions {ζ y : K} (hζ : IsPrimitiveRoot ζ p)
    (hy : y ^ p ≠ 1) :
    (∑ i ∈ Finset.range p, 1 / (ζ ^ i * y - 1)) = (p : K) / (y ^ p - 1) := by sorry

theorem translated_polynomial_descent_ne_zero (j : Z →+* K) (e : K →+* ℂ_[p])
    (he : e.comp j = j₀) (ζ : K) (hζ : ζ ≠ 0)
    (P : Polynomial Z) (hP : P ≠ 0) :
    let ι := algebraMap (PowerSeries K) (FractionRing (PowerSeries K))
    let c := ι.comp (PowerSeries.C : K →+* PowerSeries K)
    P.eval₂ (RingHom.comp c j) (c ζ * ι (1 + X) - 1) ≠ 0 := by sorry

/-- The receiving field can be the finite cyclotomic subfield of C_p. -/
theorem rational_root_average_descent (j : Z →+* K) (e : K →+* ℂ_[p])
    (he : e.comp j = j₀) (ζ : K) (hζ : IsPrimitiveRoot ζ p)
    (P Q₀ : Polynomial Z) (hQ : IsUnit (Q₀.coeff 0)) (F : B)
    (hF : (Q₀ : B) * F = (P : B)) :
    let ι := algebraMap (PowerSeries K) (FractionRing (PowerSeries K))
    let J := ι.comp (PowerSeries.map j)
    let c := ι.comp (PowerSeries.C : K →+* PowerSeries K)
    let Y := ι (1 + X)
    (p : FractionRing (PowerSeries K)) * J (subst b (AbstractMeasure.psiSeries p F)) =
      ∑ i ∈ Finset.range p,
        P.eval₂ (RingHom.comp c j) (c (ζ ^ i) * Y - 1) /
          Q₀.eval₂ (RingHom.comp c j) (c (ζ ^ i) * Y - 1) := by sorry
end AlgebraicFractions

-- IwasawaAveraging.Tests.coefficient_zero
example : integralCoefficientMap p 0 = 0 := by sorry
-- IwasawaAveraging.Tests.coefficient_one
example : integralCoefficientMap p 1 = 1 := by sorry
-- IwasawaAveraging.Tests.coefficient_agreement
example (x : Z) : ((integralCoefficientMap p x : O) : ℂ_[p]) = j₀ x := by sorry

-- IwasawaAveraging.Tests.translation_zero
example (h : (-1 : 𝒪[ℂ_[2]]) ^ 2 = 1) :
    rootTranslation 2 (-1) h 1 0 = 0 := by sorry
-- IwasawaAveraging.Tests.translation_variable
example (h : (-1 : 𝒪[ℂ_[2]]) ^ 2 = 1) :
    rootTranslation 2 (-1) h 1 X = -2 - X := by sorry
-- IwasawaAveraging.Tests.translation_odd_power
example (h : (-1 : 𝒪[ℂ_[2]]) ^ 2 = 1) :
    rootTranslation 2 (-1) h 1 ((1 + X) ^ 3) = -(1 + X) ^ 3 := by sorry

-- IwasawaAveraging.Tests.average_variable_two
example (h : IsPrimitiveRoot (-1 : 𝒪[ℂ_[2]]) 2) :
    (∑ i ∈ Finset.range 2, rootTranslation 2 (-1) h.pow_eq_one i X) = -2 := by sorry
-- IwasawaAveraging.Tests.partial_fractions_two
example : (∑ i ∈ Finset.range 2, 1 / (((-1 : ℚ) ^ i) * 2 - 1)) = 2 / 3 := by sorry

end IwasawaAveraging

/-! ## Bounded Mahler coefficients and extension of integral measures

The domain of the inverse is the existing bounded continuous sequence type.
The codomain is the existing AbstractMeasure. The coefficient action is bounded;
the target norm need not be multiplicative. This section gives the Z_p-domain
case of coefficient extension, with genuine continuity and convergence.
-/

open scoped BoundedContinuousFunction
namespace AbstractMeasure
section BoundedCoefficients
variable {p : ℕ} [Fact p.Prime]
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R]
  [hU : IsUltrametricDist R] [hC : CompleteSpace R] [hB : IsBoundedSMul ℤ_[p] R]

include hU hC hB in
theorem boundedMahler_summable (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    Summable (fun n => PadicInt.mahlerEquiv R f n * c n) := sorry

/-- Pair a continuous function's vanishing Mahler coefficients with a bounded sequence. -/
def boundedMahlerPairing {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
    [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
    (c : ℕ →ᵇ R) : C(ℤ_[p], R) →ₗ[R] R := sorry

theorem boundedMahlerPairing_apply (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    boundedMahlerPairing c f = ∑' n, PadicInt.mahlerEquiv R f n * c n := sorry
theorem boundedMahlerPairing_add (c : ℕ →ᵇ R) (f g : C(ℤ_[p], R)) :
    boundedMahlerPairing c (f + g) = boundedMahlerPairing c f + boundedMahlerPairing c g := sorry
theorem boundedMahlerPairing_smul (c : ℕ →ᵇ R) (r : R) (f : C(ℤ_[p], R)) :
    boundedMahlerPairing c (r • f) = r * boundedMahlerPairing c f := sorry
theorem boundedMahlerPairing_bound (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    ‖boundedMahlerPairing c f‖ ≤ ‖c‖ * ‖f‖ := sorry
theorem boundedMahlerPairing_integral (F : ℤ_[p]⟦X⟧) (c : ℕ →ᵇ ℤ_[p])
    (hc : ∀ n, c n = F.coeff n) (f : C(ℤ_[p], ℤ_[p])) :
    boundedMahlerPairing c f = invTransform F f := sorry

/-- The continuous functional; boundedness is part of the input type. -/
def boundedInvTransform {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
    [CompleteSpace R] [IsBoundedSMul ℤ_[p] R] : (ℕ →ᵇ R) →ₗ[R] D(ℤ_[p], R) := sorry

theorem boundedInvTransform_apply (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    boundedInvTransform c f = boundedMahlerPairing c f := sorry
theorem boundedInvTransform_mahler (c : ℕ →ᵇ R) (n : ℕ) :
    boundedInvTransform c ((mahler n : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) = c n := sorry
theorem amiceTransform_boundedInvTransform (c : ℕ →ᵇ R) :
    (boundedInvTransform (p := p) c).amiceTransform = PowerSeries.mk c := sorry
theorem boundedInvTransform_unique (c : ℕ →ᵇ R) (μ : D(ℤ_[p], R))
    (h : μ.amiceTransform = PowerSeries.mk c) : μ = boundedInvTransform c := sorry
theorem boundedInvTransform_zero : boundedInvTransform (p := p) (R := R) 0 = 0 := sorry
theorem boundedInvTransform_add (c d : ℕ →ᵇ R) :
    boundedInvTransform (p := p) (c + d) = boundedInvTransform c + boundedInvTransform d := sorry
theorem boundedInvTransform_smul (r : R) (c : ℕ →ᵇ R) :
    boundedInvTransform (p := p) (r • c) = r • boundedInvTransform c := sorry
theorem boundedInvTransform_integral (F : ℤ_[p]⟦X⟧) (c : ℕ →ᵇ ℤ_[p])
    (hc : ∀ n, c n = F.coeff n) : boundedInvTransform c = invTransform F := sorry
theorem boundedInvTransform_bound (c : ℕ →ᵇ R) (f : C(ℤ_[p], R)) :
    ‖boundedInvTransform c f‖ ≤ ‖c‖ * ‖f‖ := sorry

omit [IsUltrametricDist R] [CompleteSpace R] in
include hB in
theorem integralCoefficient_norm_le (z : ℤ_[p]) :
    ‖algebraMap ℤ_[p] R z‖ ≤ ‖(1 : R)‖ := sorry

omit [IsUltrametricDist R] [CompleteSpace R] in
/-- The mapped Amice coefficients, bounded by the norm of the target unit. -/
def integralAmiceCoefficients {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsBoundedSMul ℤ_[p] R]
    (μ : D(ℤ_[p], ℤ_[p])) : ℕ →ᵇ R := sorry

omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_apply (μ : D(ℤ_[p], ℤ_[p])) (n : ℕ) :
    integralAmiceCoefficients (R := R) μ n = algebraMap ℤ_[p] R (μ.amiceTransform.coeff n) := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_norm (μ : D(ℤ_[p], ℤ_[p])) :
    ‖integralAmiceCoefficients (R := R) μ‖ ≤ ‖(1 : R)‖ := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_zero : integralAmiceCoefficients (p := p) (R := R) 0 = 0 := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_add (μ ν : D(ℤ_[p], ℤ_[p])) :
    integralAmiceCoefficients (R := R) (μ + ν) =
      integralAmiceCoefficients μ + integralAmiceCoefficients ν := sorry
omit [IsUltrametricDist R] [CompleteSpace R] in
theorem integralAmiceCoefficients_smul (a : ℤ_[p]) (μ : D(ℤ_[p], ℤ_[p])) :
    integralAmiceCoefficients (R := R) (a • μ) =
      algebraMap ℤ_[p] R a • integralAmiceCoefficients μ := sorry
theorem integralAmiceCoefficients_self (μ : D(ℤ_[p], ℤ_[p])) (n : ℕ) :
    integralAmiceCoefficients (R := ℤ_[p]) μ n = μ.amiceTransform.coeff n := sorry

/-- Extend integral coefficients on Z_p by the bounded inverse, in the existing measure type. -/
def extendIntegralCoefficients {p : ℕ} [Fact p.Prime] {R : Type*}
    [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
    [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
    (μ : D(ℤ_[p], ℤ_[p])) : D(ℤ_[p], R) := sorry

theorem extendIntegralCoefficients_apply (μ : D(ℤ_[p], ℤ_[p])) (f : C(ℤ_[p], R)) :
    extendIntegralCoefficients μ f =
      ∑' n, PadicInt.mahlerEquiv R f n * algebraMap ℤ_[p] R (μ.amiceTransform.coeff n) := sorry
theorem amiceTransform_extendIntegralCoefficients (μ : D(ℤ_[p], ℤ_[p])) :
    (extendIntegralCoefficients (R := R) μ).amiceTransform =
      μ.amiceTransform.map (algebraMap ℤ_[p] R) := sorry
theorem extendIntegralCoefficients_test (μ : D(ℤ_[p], ℤ_[p])) (f : C(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) μ (f • (1 : C(ℤ_[p], R))) =
      algebraMap ℤ_[p] R (μ f) := sorry
theorem extendIntegralCoefficients_unique (μ : D(ℤ_[p], ℤ_[p])) (ν : D(ℤ_[p], R))
    (hν : ∀ f : C(ℤ_[p], ℤ_[p]),
      ν (f • (1 : C(ℤ_[p], R))) = algebraMap ℤ_[p] R (μ f)) :
    ν = extendIntegralCoefficients μ := sorry
theorem extendIntegralCoefficients_zero :
    extendIntegralCoefficients (p := p) (R := R) 0 = 0 := sorry
theorem extendIntegralCoefficients_add (μ ν : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (μ + ν) =
      extendIntegralCoefficients μ + extendIntegralCoefficients ν := sorry
theorem extendIntegralCoefficients_smul (a : ℤ_[p]) (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (a • μ) =
      algebraMap ℤ_[p] R a • extendIntegralCoefficients μ := sorry
theorem extendIntegralCoefficients_self (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := ℤ_[p]) μ = μ := sorry
theorem extendIntegralCoefficients_bound (μ : D(ℤ_[p], ℤ_[p])) (f : C(ℤ_[p], R)) :
    ‖extendIntegralCoefficients (R := R) μ f‖ ≤ ‖(1 : R)‖ * ‖f‖ := sorry
theorem extendIntegralCoefficients_dirac (x : ℤ_[p]) :
    extendIntegralCoefficients (R := R) (dirac ℤ_[p] x) = dirac R x := sorry
theorem extendIntegralCoefficients_map (μ : D(ℤ_[p], ℤ_[p])) (g : C(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (map g μ) = map g (extendIntegralCoefficients μ) := sorry
theorem extendIntegralCoefficients_weight (μ : D(ℤ_[p], ℤ_[p])) (g : C(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (weight g μ) =
      weight (g • (1 : C(ℤ_[p], R))) (extendIntegralCoefficients μ) := sorry
end BoundedCoefficients
end AbstractMeasure

namespace SuggestedTests.BoundedCoefficients
open AbstractMeasure
open scoped BoundedContinuousFunction

-- Assemble the pinned norm-bound constructor with the existing subtype norm.
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)

-- boundedMahlerPairing_constant
example : boundedMahlerPairing (p := 3)
    (BoundedContinuousFunction.const ℕ (1 / 3 : ℚ_[3])) (1 : C(ℤ_[3], ℚ_[3])) = 1 / 3 := sorry
-- boundedMahlerPairing_zero
example (f : C(ℤ_[3], ℚ_[3])) : boundedMahlerPairing (0 : ℕ →ᵇ ℚ_[3]) f = 0 := sorry
-- boundedMahlerPairing_integral
example (F : ℤ_[3]⟦X⟧) (c : ℕ →ᵇ ℤ_[3]) (hc : ∀ n, c n = F.coeff n)
    (f : C(ℤ_[3], ℤ_[3])) : boundedMahlerPairing c f = invTransform F f := sorry
-- boundedInvTransform_nonintegral
example : boundedInvTransform (p := 3)
    (BoundedContinuousFunction.const ℕ (1 / 3 : ℚ_[3])) (1 : C(ℤ_[3], ℚ_[3])) = 1 / 3 := sorry
-- boundedInvTransform_zero
example : boundedInvTransform (p := 3) (R := ℚ_[3]) 0 = 0 := sorry
-- boundedInvTransform_integral
example (F : ℤ_[3]⟦X⟧) (c : ℕ →ᵇ ℤ_[3]) (hc : ∀ n, c n = F.coeff n) :
    boundedInvTransform c = invTransform F := sorry
-- boundedInvTransform_unbounded (the excluded sequence cannot be packaged)
example : ¬ ∃ c : ℕ →ᵇ ℚ_[3], ∀ n, c n = ((3 : ℚ_[3]) ^ n)⁻¹ := sorry
-- The corresponding putative pairing has terms identically one, so it diverges.
example : ¬ Summable (fun n : ℕ => (3 : ℚ_[3]) ^ n * ((3 : ℚ_[3]) ^ n)⁻¹) := sorry
-- integralAmiceCoefficients_dirac_zero
example : integralAmiceCoefficients (R := ℚ_[3]) (dirac ℤ_[3] 0) 0 = 1 ∧
    integralAmiceCoefficients (R := ℚ_[3]) (dirac ℤ_[3] 0) 1 = 0 := sorry
-- integralAmiceCoefficients_zero
example (n : ℕ) : integralAmiceCoefficients (p := 3) (R := ℚ_[3]) 0 n = 0 := sorry
-- integralAmiceCoefficients_self
example (μ : D(ℤ_[3], ℤ_[3])) (n : ℕ) :
    integralAmiceCoefficients (R := ℤ_[3]) μ n = μ.amiceTransform.coeff n := sorry
-- extendIntegralCoefficients_square
example : extendIntegralCoefficients (R := ℚ_[3]) (dirac ℤ_[3] 2)
    ⟨fun x : ℤ_[3] => algebraMap ℤ_[3] ℚ_[3] (x ^ 2),
      (continuous_algebraMap _ _).comp (continuous_id.pow 2)⟩ = 4 := sorry
-- extendIntegralCoefficients_zero
example : extendIntegralCoefficients (p := 3) (R := ℚ_[3]) 0 = 0 := sorry
-- extendIntegralCoefficients_self
example (μ : D(ℤ_[3], ℤ_[3])) : extendIntegralCoefficients (R := ℤ_[3]) μ = μ := sorry
-- extendIntegralCoefficients_pushforward
example : extendIntegralCoefficients (R := ℚ_[3])
    (map ⟨fun x : ℤ_[3] => 2 * x, continuous_const.mul continuous_id⟩ (dirac ℤ_[3] 1)) =
      dirac ℚ_[3] 2 := sorry
-- extendIntegralCoefficients_weight
example : extendIntegralCoefficients (R := ℚ_[2])
    (weight (ContinuousMap.id ℤ_[2]) (dirac ℤ_[2] 3)) = (3 : ℚ_[2]) • dirac ℚ_[2] 3 := sorry
end SuggestedTests.BoundedCoefficients


/-! Clopen restriction and the intrinsic unit-group carrier (RJW Remarks 3.31 and 3.33). -/
namespace ContinuousMap
open TopologicalSpace
variable {X : Type*} [TopologicalSpace X] [CompactSpace X]
variable (s : Clopens X) (R : Type*) [NormedCommRing R]

/-- Extend a test function by zero across the complementary clopen. -/
def zeroExtendClopen : C(s, R) →L[R] C(X, R) := sorry

theorem zeroExtendClopen_apply_mem (f : C(s, R)) (x : s) :
    zeroExtendClopen s R f x = f x := sorry

theorem zeroExtendClopen_apply_not_mem (f : C(s, R)) (x : X) (hx : x ∉ s) :
    zeroExtendClopen s R f x = 0 := sorry

theorem norm_zeroExtendClopen (f : C(s, R)) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖zeroExtendClopen s R f‖ = ‖f‖ := sorry

theorem restrict_zeroExtendClopen (f : C(s, R)) :
    (zeroExtendClopen s R f).restrict s = f := sorry

theorem zeroExtendClopen_restrict (f : C(X, R)) :
    zeroExtendClopen s R (f.restrict s) =
      (LocallyConstant.charFn R s.isClopen).toContinuousMap * f := sorry
end ContinuousMap

namespace AbstractMeasure
open TopologicalSpace
section Clopen
variable {X Y : Type*} [TopologicalSpace X] [CompactSpace X]
  [TopologicalSpace Y] [CompactSpace Y]
variable (s : Clopens X) (R : Type*) [NormedCommRing R]

/-- Restriction to the existing measure carrier on the clopen subtype. -/
def restrictClopen : D(X, R) →ₗ[R] D(s, R) := sorry

theorem restrictClopen_apply (μ : D(X, R)) (f : C(s, R)) :
    restrictClopen s R μ f = μ (ContinuousMap.zeroExtendClopen s R f) := sorry

theorem restrictClopen_map_subtype (ν : D(s, R)) :
    restrictClopen s R (map (ContinuousMap.subtypeVal s) ν) = ν := sorry

theorem map_subtype_restrictClopen_apply (μ : D(X, R)) (f : C(X, R)) :
    map (ContinuousMap.subtypeVal s) (restrictClopen s R μ) f =
      μ ((LocallyConstant.charFn R s.isClopen).toContinuousMap * f) := sorry

theorem existsUnique_map_subtype_iff (μ : D(X, R)) :
    (∃! ν : D(s, R), map (ContinuousMap.subtypeVal s) ν = μ) ↔
      ∀ f : C(X, R), (∀ x : s, f x = 0) → μ f = 0 := sorry

theorem map_subtype_restrictClopen_add_compl (μ : D(X, R)) :
    map (ContinuousMap.subtypeVal s) (restrictClopen s R μ) +
      map (ContinuousMap.subtypeVal (sᶜ : Clopens X)) (restrictClopen (sᶜ : Clopens X) R μ) = μ := sorry

/-- The two complementary restrictions, inverse to the sum of existing pushforwards. -/
def clopenDecomposition : D(X, R) ≃ₗ[R] D(s, R) × D((sᶜ : Clopens X), R) := sorry

theorem clopenDecomposition_apply (μ : D(X, R)) :
    clopenDecomposition s R μ = (restrictClopen s R μ, restrictClopen (sᶜ : Clopens X) R μ) := sorry

theorem clopenDecomposition_symm_apply (ν : D(s, R)) (η : D((sᶜ : Clopens X), R)) :
    (clopenDecomposition s R).symm (ν, η) =
      map (ContinuousMap.subtypeVal s) ν + map (ContinuousMap.subtypeVal (sᶜ : Clopens X)) η := sorry

theorem restrictClopen_dirac_mem (x : s) :
    restrictClopen s R (dirac R (x : X)) = dirac R x := sorry

theorem restrictClopen_dirac_not_mem (x : X) (hx : x ∉ s) :
    restrictClopen s R (dirac R x) = 0 := sorry

theorem restrictClopen_map_preimage (q : C(X, Y)) (t : Clopens Y) (μ : D(X, R)) :
    restrictClopen t R (map q μ) =
      map (q.restrictPreimage t)
        (restrictClopen ⟨q ⁻¹' (t : Set Y), t.isClopen.preimage q.continuous⟩ R μ) := sorry
end Clopen
end AbstractMeasure

namespace PadicInt
open TopologicalSpace
variable (p : ℕ) [Fact p.Prime]

theorem isClopen_isUnit : IsClopen {x : ℤ_[p] | IsUnit x} := sorry

/-- Identify existing units, with their existing topology, with the clopen unit locus. -/
def unitsHomeomorphIsUnit : (ℤ_[p])ˣ ≃ₜ {x : ℤ_[p] // IsUnit x} := sorry

theorem unitsHomeomorphIsUnit_apply (u : (ℤ_[p])ˣ) :
    (unitsHomeomorphIsUnit p u).val = (u : ℤ_[p]) := sorry

theorem unitsHomeomorphIsUnit_symm_apply (x : {x : ℤ_[p] // IsUnit x}) :
    ((unitsHomeomorphIsUnit p).symm x : ℤ_[p]) = x.val := sorry
end PadicInt

namespace AbstractMeasure
section IntrinsicUnits
variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p]))
local notation "uClopen" => (TopologicalSpace.Clopens.mk (fun x : ℤ_[p] => IsUnit x) (PadicInt.isClopen_isUnit p) :
  TopologicalSpace.Clopens ℤ_[p])

/-- Restrict to the unit locus and transport to the existing units type. -/
def restrictUnits : D(ℤ_[p], R) →ₗ[R] D((ℤ_[p])ˣ, R) := sorry

theorem restrictUnits_eq_transport (μ : D(ℤ_[p], R)) :
    restrictUnits p R μ = arrowCongrLeft (PadicInt.unitsHomeomorphIsUnit p).symm
      (restrictClopen uClopen R μ) := sorry

theorem restrictUnits_apply (μ : D(ℤ_[p], R)) (f : C((ℤ_[p])ˣ, R)) :
    restrictUnits p R μ f = μ (ContinuousMap.zeroExtendClopen uClopen R
      (f.comp ⟨(PadicInt.unitsHomeomorphIsUnit p).symm, (PadicInt.unitsHomeomorphIsUnit p).symm.continuous⟩)) := sorry

theorem restrictUnits_map_val (ν : D((ℤ_[p])ˣ, R)) :
    restrictUnits p R (map uMap ν) = ν := sorry

theorem map_val_restrictUnits (μ : D(ℤ_[p], R)) :
    map uMap (restrictUnits p R μ) = unitRestriction p R μ := sorry

/-- A linear equivalence: the multiplicative and additive convolutions are distinct. -/
def unitsMeasureEquivKerPsi : D((ℤ_[p])ˣ, R) ≃ₗ[R] LinearMap.ker (psiMeasure p R) := sorry

theorem unitsMeasureEquivKerPsi_apply (ν : D((ℤ_[p])ˣ, R)) :
    (unitsMeasureEquivKerPsi p R ν).val = map uMap ν := sorry

theorem unitsMeasureEquivKerPsi_symm_apply (μ : LinearMap.ker (psiMeasure p R)) :
    (unitsMeasureEquivKerPsi p R).symm μ = restrictUnits p R μ.val := sorry

theorem restrictUnits_dirac (u : (ℤ_[p])ˣ) :
    restrictUnits p R (dirac R (u : ℤ_[p])) = dirac R u := sorry

theorem restrictUnits_dirac_nonunit (x : ℤ_[p]) (hx : ¬ IsUnit x) :
    restrictUnits p R (dirac R x) = 0 := sorry
end IntrinsicUnits

/-- Integral unit measures identify with the kernel of the bounded series ψ. -/
def unitsMeasureAmiceEquiv (p : ℕ) [Fact p.Prime] :
    D((ℤ_[p])ˣ, ℤ_[p]) ≃ₗ[ℤ_[p]] LinearMap.ker (psiSeries p) := sorry

theorem unitsMeasureAmiceEquiv_apply (p : ℕ) [Fact p.Prime]
    (ν : D((ℤ_[p])ˣ, ℤ_[p])) :
    (unitsMeasureAmiceEquiv p ν).val =
      (map (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p])) ν).amiceTransform := sorry

theorem unitsMeasureAmiceEquiv_symm_apply (p : ℕ) [Fact p.Prime]
    (F : LinearMap.ker (psiSeries p)) :
    (unitsMeasureAmiceEquiv p).symm F =
      restrictUnits p ℤ_[p] ((amiceTransformEquiv (p := p)).symm F.val) := sorry
end AbstractMeasure


namespace SuggestedTests.Clopen
open AbstractMeasure ContinuousMap TopologicalSpace PowerSeries
local notation "S" => (Clopens.mk (Set.singleton (0 : Fin 2)) (isClopen_discrete _) : Clopens (Fin 2))

-- clopen_zero_extension_inside
example : zeroExtendClopen S ℤ (ContinuousMap.const S 7) 0 = 7 := sorry
-- clopen_zero_extension_outside
example : zeroExtendClopen S ℤ (ContinuousMap.const S 7) 1 = 0 := sorry
-- clopen_zero_extension_empty
example : zeroExtendClopen (⊥ : Clopens (Fin 2)) ℤ 0 = 0 := sorry
-- clopen_zero_extension_full
example : zeroExtendClopen (⊤ : Clopens (Fin 2)) ℤ
    (ContinuousMap.const (⊤ : Clopens (Fin 2)) 7) = ContinuousMap.const (Fin 2) 7 := sorry

-- clopen_restriction_signed_atoms
example : restrictClopen S ℤ ((2 : ℤ) • dirac ℤ (0 : Fin 2) - (3 : ℤ) • dirac ℤ (1 : Fin 2)) =
    (2 : ℤ) • dirac ℤ (⟨0, by change (0 : Fin 2) = 0; rfl⟩ : S) := sorry
-- clopen_restriction_outside
example : restrictClopen S ℤ (dirac ℤ (1 : Fin 2)) = 0 := sorry
-- clopen_restriction_empty
example (μ : D(Fin 2, ℤ)) : restrictClopen (⊥ : Clopens (Fin 2)) ℤ μ = 0 := sorry
-- clopen_restriction_section
example (ν : D(S, ℤ)) : restrictClopen S ℤ (map (ContinuousMap.subtypeVal S) ν) = ν := sorry

-- clopen_decomposition_signed_atoms
example : clopenDecomposition S ℤ
    ((2 : ℤ) • dirac ℤ (0 : Fin 2) - (3 : ℤ) • dirac ℤ (1 : Fin 2)) =
      ((2 : ℤ) • dirac ℤ (⟨0, by change (0 : Fin 2) = 0; rfl⟩ : S),
       (-3 : ℤ) • dirac ℤ (⟨1, by change ¬ (1 : Fin 2) = 0; decide⟩ : (Sᶜ : Clopens (Fin 2)))) := sorry
-- clopen_decomposition_inverse
example : (clopenDecomposition S ℤ).symm
    (dirac ℤ (⟨0, by change (0 : Fin 2) = 0; rfl⟩ : S), dirac ℤ (⟨1, by change ¬ (1 : Fin 2) = 0; decide⟩ : (Sᶜ : Clopens (Fin 2)))) =
      dirac ℤ (0 : Fin 2) + dirac ℤ (1 : Fin 2) := sorry
-- clopen_decomposition_zero
example : clopenDecomposition S ℤ 0 = (0, 0) := sorry

-- units_homeomorph_one
example : (PadicInt.unitsHomeomorphIsUnit 3 (1 : (ℤ_[3])ˣ)).val = 1 := sorry
-- units_homeomorph_dyadic_sign
example : (PadicInt.unitsHomeomorphIsUnit 2 (-1 : (ℤ_[2])ˣ)).val = -1 := sorry
-- units_homeomorph_inverse
example : (PadicInt.unitsHomeomorphIsUnit 2).symm ⟨1, isUnit_one⟩ = 1 := sorry
-- units_homeomorph_excludes_zero
example (u : (ℤ_[3])ˣ) : (PadicInt.unitsHomeomorphIsUnit 3 u).val ≠ 0 := sorry

-- intrinsic_units_mixed_atoms
example : restrictUnits 3 ℤ_[3] (dirac ℤ_[3] 1 + (2 : ℤ_[3]) • dirac ℤ_[3] 3) =
    dirac ℤ_[3] (1 : (ℤ_[3])ˣ) := sorry
-- intrinsic_units_zero_atom
example : restrictUnits 3 ℤ_[3] (dirac ℤ_[3] 0) = 0 := sorry
-- intrinsic_units_nonzero_nonunit
example : restrictUnits 3 ℤ_[3] (dirac ℤ_[3] 3) = 0 := sorry
-- intrinsic_units_dyadic_sign
example : restrictUnits 2 ℤ_[2] (dirac ℤ_[2] (-1) - dirac ℤ_[2] 0) =
    dirac ℤ_[2] (-1 : (ℤ_[2])ˣ) := sorry

-- units_kernel_zero
example : unitsMeasureEquivKerPsi 3 ℤ_[3] 0 = 0 := sorry
-- units_kernel_atom
example : (unitsMeasureEquivKerPsi 3 ℤ_[3] (dirac ℤ_[3] (1 : (ℤ_[3])ˣ))).val =
    dirac ℤ_[3] 1 := sorry
-- units_kernel_dyadic_sign
example : (unitsMeasureEquivKerPsi 2 ℤ_[2] (dirac ℤ_[2] (-1 : (ℤ_[2])ˣ))).val =
    dirac ℤ_[2] (-1) := sorry

-- units_amice_zero
example : unitsMeasureAmiceEquiv 3 0 = 0 := sorry
-- units_amice_one_atom
example : (unitsMeasureAmiceEquiv 3 (dirac ℤ_[3] (1 : (ℤ_[3])ˣ))).val = 1 + X := sorry
-- units_amice_dyadic_first_moment
example : coeff 1
    (unitsMeasureAmiceEquiv 2 (dirac ℤ_[2] (-1 : (ℤ_[2])ˣ))).val = -1 := sorry
-- units_amice_two_atoms_mass
example : coeff 0 (unitsMeasureAmiceEquiv 3
    (dirac ℤ_[3] (1 : (ℤ_[3])ˣ) + dirac ℤ_[3] (-1 : (ℤ_[3])ˣ))).val = 2 := sorry
-- units_kernel_different_convolutions
example :
    map (⟨fun z : ℤ_[2] × ℤ_[2] => z.1 + z.2, continuous_fst.add continuous_snd⟩)
      (prodMk (dirac ℤ_[2] 1) (dirac ℤ_[2] 1)) ≠
    map (⟨Units.val, Units.continuous_val⟩ : C((ℤ_[2])ˣ, ℤ_[2]))
      (map (⟨fun z : (ℤ_[2])ˣ × (ℤ_[2])ˣ => z.1 * z.2,
        continuous_fst.mul continuous_snd⟩)
        (prodMk (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)) (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)))) := sorry
end SuggestedTests.Clopen

/-! Topologies on the existing measure carrier. The existing definitions are
selected locally; neither one is installed as a global instance. -/
namespace AbstractMeasure
open TopologicalSpace

section WeakClopen
variable {X Y R : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  [CompactSpace X] [CompactSpace Y] [NormedCommRing R]

theorem continuous_map_weak (q : C(X,Y)) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(Y,R) := WeakTopology
    Continuous (map (R := R) (E := R) q) := by sorry

theorem continuous_restrictClopen_weak (s : Clopens X) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(s,R) := WeakTopology
    Continuous (restrictClopen s R) := by sorry

theorem isClosedEmbedding_map_subtype_weak (s : Clopens X) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(s,R) := WeakTopology
    Topology.IsClosedEmbedding (map (R := R) (E := R) (ContinuousMap.subtypeVal (s : Set X))) := by sorry

theorem isHomeomorph_clopenDecomposition_weak (s : Clopens X) :
    letI : TopologicalSpace D(X,R) := WeakTopology
    letI : TopologicalSpace D(s,R) := WeakTopology
    letI : TopologicalSpace D((sᶜ : Clopens X),R) := WeakTopology
    IsHomeomorph (clopenDecomposition s R) := by sorry
end WeakClopen

section StrongClopen
variable {X Y K : Type*} [TopologicalSpace X] [TopologicalSpace Y]
  [CompactSpace X] [CompactSpace Y] [NontriviallyNormedField K]

theorem norm_map_le (q : C(X,Y)) (μ : D(X,K)) :
    ‖toCLMEquiv (map q μ)‖ ≤ ‖toCLMEquiv μ‖ := by sorry

theorem norm_restrictClopen_le (s : Clopens X) (μ : D(X,K)) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (restrictClopen s K μ)‖ ≤ ‖toCLMEquiv μ‖ := by sorry

theorem norm_map_subtype (s : Clopens X) (ν : D(s,K)) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (map (R := K) (E := K) (ContinuousMap.subtypeVal (s : Set X)) ν)‖ = ‖toCLMEquiv ν‖ := by sorry

theorem isClosedEmbedding_map_subtype_strong (s : Clopens X) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    letI : TopologicalSpace D(X,K) := StrongTopology
    letI : TopologicalSpace D(s,K) := StrongTopology
    Topology.IsClosedEmbedding (map (R := K) (E := K) (ContinuousMap.subtypeVal (s : Set X))) := by sorry

theorem isHomeomorph_clopenDecomposition_strong (s : Clopens X) :
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    letI : CompactSpace (sᶜ : Clopens X) := isCompact_iff_compactSpace.mp s.isClopen.compl.isClosed.isCompact
    letI : TopologicalSpace D(X,K) := StrongTopology
    letI : TopologicalSpace D(s,K) := StrongTopology
    letI : TopologicalSpace D((sᶜ : Clopens X),K) := StrongTopology
    IsHomeomorph (clopenDecomposition s K) := by sorry
end StrongClopen

section WeakUnits
variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]

theorem continuous_restrictUnits_weak :
    letI : TopologicalSpace D(ℤ_[p],R) := WeakTopology
    letI : TopologicalSpace D((ℤ_[p])ˣ,R) := WeakTopology
    Continuous (restrictUnits p R) := by sorry

theorem isHomeomorph_unitsMeasureEquivKerPsi_weak :
    letI : TopologicalSpace D(ℤ_[p],R) := WeakTopology
    letI : TopologicalSpace D((ℤ_[p])ˣ,R) := WeakTopology
    IsHomeomorph (unitsMeasureEquivKerPsi p R) := by sorry
end WeakUnits

section IntegralAmiceTopology
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]

theorem isHomeomorph_amiceTransformEquiv_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := WeakTopology
    IsHomeomorph (amiceTransformEquiv (p := p)) := by sorry

theorem isHomeomorph_unitsMeasureAmiceEquiv_weak :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    IsHomeomorph (unitsMeasureAmiceEquiv p) := by sorry
end IntegralAmiceTopology

section StrongUnits
variable (p : ℕ) [Fact p.Prime] (K : Type*) [NontriviallyNormedField K]
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p]))

theorem norm_map_units_val (ν : D((ℤ_[p])ˣ,K)) :
    ‖toCLMEquiv (map uMap ν)‖ = ‖toCLMEquiv ν‖ := by sorry

theorem isHomeomorph_unitsMeasureEquivKerPsi_strong :
    letI : TopologicalSpace D(ℤ_[p],K) := StrongTopology
    letI : TopologicalSpace D((ℤ_[p])ˣ,K) := StrongTopology
    IsHomeomorph (unitsMeasureEquivKerPsi p K) := by sorry
end StrongUnits
end AbstractMeasure

namespace SuggestedTests.ClopenTopology
open AbstractMeasure TopologicalSpace Filter
open scoped Topology PowerSeries.WithPiTopology

-- ClopenTopologyTests.weak_scaled_dirac: convergence can be tested pointwise.
example (q : C(ℤ_[3], ℤ_[3])) :
    letI : TopologicalSpace D(ℤ_[3],ℤ_[3]) := WeakTopology
    Tendsto (fun n : ℕ => AbstractMeasure.map q ((3 : ℤ_[3])^n • dirac ℤ_[3] 1)) atTop
      (𝓝 (0 : D(ℤ_[3],ℤ_[3]))) := by sorry
-- ClopenTopologyTests.empty_restriction: empty restriction has norm zero.
example (μ : D(ℤ_[3],ℚ_[3])) :
    let s : Clopens ℤ_[3] := ⊥
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (restrictClopen s ℚ_[3] μ)‖ = 0 := by sorry
-- ClopenTopologyTests.full_inclusion: the full clopen preserves norm.
example (ν : D((⊤ : Clopens ℤ_[3]),ℚ_[3])) :
    letI : CompactSpace (⊤ : Clopens ℤ_[3]) :=
      isCompact_iff_compactSpace.mp (⊤ : Clopens ℤ_[3]).isClosed.isCompact
    ‖toCLMEquiv (map (R := ℚ_[3]) (E := ℚ_[3]) (ContinuousMap.subtypeVal ((⊤ : Clopens ℤ_[3]) : Set ℤ_[3])) ν)‖ =
      ‖toCLMEquiv ν‖ := by sorry
-- ClopenTopologyTests.dropped_atom: restriction need not preserve norm.
example :
    let s : Clopens ℤ_[3] := ⊥
    letI : CompactSpace s := isCompact_iff_compactSpace.mp s.isClosed.isCompact
    ‖toCLMEquiv (restrictClopen s ℚ_[3] (dirac ℚ_[3] 0))‖ <
      ‖toCLMEquiv (dirac ℚ_[3] (0 : ℤ_[3]))‖ := by sorry
-- ClopenTopologyTests.unit_atom_norm: no missing normalization on inclusion.
example :
    ‖toCLMEquiv (map (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[2])ˣ,ℤ_[2]))
      (dirac ℚ_[2] (1 : (ℤ_[2])ˣ)))‖ = 1 := by sorry
-- ClopenTopologyTests.amice_monomials: weak convergence is coefficientwise.
example :
    letI : TopologicalSpace D(ℤ_[3],ℤ_[3]) := WeakTopology
    Tendsto (fun n : ℕ => (amiceTransformEquiv (p := 3)).symm
      ((PowerSeries.X : PowerSeries ℤ_[3])^n)) atTop (𝓝 0) := by sorry
-- ClopenTopologyTests.dyadic_unit_kernel: both directions use the existing units group.
example :
    letI : TopologicalSpace D((ℤ_[2])ˣ,ℤ_[2]) := WeakTopology
    Continuous (unitsMeasureAmiceEquiv 2).symm := by sorry
end SuggestedTests.ClopenTopology

/-! ## Bounded Amice norm and the rational integral lattice

Every norm below is on the existing field-valued continuous dual via
`toCLMEquiv`. No norm instance is added to integral AbstractMeasure.
-/
namespace AbstractMeasure
open scoped BoundedContinuousFunction
section FieldAmice
variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [Algebra ℤ_[p] K]
  [IsBoundedSMul ℤ_[p] K]

theorem norm_coeff_amiceTransform_le (μ : D(ℤ_[p], K)) (n : ℕ) :
    ‖μ.amiceTransform.coeff n‖ ≤ ‖toCLMEquiv μ‖ := by sorry

/-- The existing Amice coefficients, bundled in the existing bounded sequence space. -/
def boundedAmiceCoefficients : D(ℤ_[p], K) →ₗ[K] (ℕ →ᵇ K) := by sorry

theorem boundedAmiceCoefficients_apply (μ : D(ℤ_[p], K)) (n : ℕ) :
    boundedAmiceCoefficients μ n = μ.amiceTransform.coeff n := by sorry

theorem boundedAmiceCoefficients_zero :
    boundedAmiceCoefficients (p := p) (K := K) 0 = 0 := by sorry

theorem boundedAmiceCoefficients_add (μ ν : D(ℤ_[p], K)) :
    boundedAmiceCoefficients (μ + ν) =
      boundedAmiceCoefficients μ + boundedAmiceCoefficients ν := by sorry

theorem boundedAmiceCoefficients_smul (a : K) (μ : D(ℤ_[p], K)) :
    boundedAmiceCoefficients (a • μ) = a • boundedAmiceCoefficients μ := by sorry

theorem boundedAmiceCoefficients_norm_le (μ : D(ℤ_[p], K)) :
    ‖boundedAmiceCoefficients μ‖ ≤ ‖toCLMEquiv μ‖ := by sorry

variable [IsUltrametricDist K] [CompleteSpace K]

theorem norm_boundedInvTransform (c : ℕ →ᵇ K) :
    ‖toCLMEquiv (boundedInvTransform (p := p) c)‖ = ‖c‖ := by sorry

theorem boundedInvTransform_boundedAmiceCoefficients (μ : D(ℤ_[p], K)) :
    boundedInvTransform (boundedAmiceCoefficients μ) = μ := by sorry

/-- The strong continuous-dual model is isometric to bounded Amice sequences. -/
def boundedAmiceEquiv : (C(ℤ_[p], K) →L[K] K) ≃ₗᵢ[K] (ℕ →ᵇ K) := by sorry

theorem boundedAmiceEquiv_apply (μ : D(ℤ_[p], K)) :
    boundedAmiceEquiv (toCLMEquiv μ) = boundedAmiceCoefficients μ := by sorry

theorem boundedAmiceEquiv_symm_apply (c : ℕ →ᵇ K) :
    (boundedAmiceEquiv (p := p)).symm c =
      toCLMEquiv (boundedInvTransform c) := by sorry

theorem boundedAmiceCoefficients_norm (μ : D(ℤ_[p], K)) :
    ‖boundedAmiceCoefficients μ‖ = ‖toCLMEquiv μ‖ := by sorry

theorem mem_range_amiceTransform_iff (F : K⟦X⟧) :
    (∃ μ : D(ℤ_[p], K), μ.amiceTransform = F) ↔
      ∃ C : ℝ, 0 ≤ C ∧ ∀ n, ‖F.coeff n‖ ≤ C := by sorry
end FieldAmice

section RationalIntegralLattice
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

theorem extendIntegralCoefficients_injective :
    Function.Injective (extendIntegralCoefficients (p := p) (R := ℚ_[p])) := by sorry

theorem norm_extendIntegralCoefficients (μ : D(ℤ_[p], ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p]) μ)‖ =
      ‖integralAmiceCoefficients (R := ℚ_[p]) μ‖ := by sorry

theorem integral_extension_iff_norm_le_one (ν : D(ℤ_[p], ℚ_[p])) :
    (∃! μ : D(ℤ_[p], ℤ_[p]), extendIntegralCoefficients (R := ℚ_[p]) μ = ν) ↔
      ‖toCLMEquiv ν‖ ≤ 1 := by sorry

theorem isClosed_range_integral_extension :
    IsClosed (Set.range (fun μ : D(ℤ_[p], ℤ_[p]) =>
      toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p]) μ))) := by sorry

theorem exists_integral_power_scaling (ν : D(ℤ_[p], ℚ_[p])) :
    ∃ n : ℕ, ∃ μ : D(ℤ_[p], ℤ_[p]),
      ν = (((p : ℚ_[p]) ^ n)⁻¹) • extendIntegralCoefficients μ := by sorry
end RationalIntegralLattice
end AbstractMeasure

namespace SuggestedTests.BoundedAmiceNorm
open AbstractMeasure
open scoped BoundedContinuousFunction
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)

-- bounded_coefficients_dirac_zero
example : boundedAmiceCoefficients (dirac ℚ_[3] (0 : ℤ_[3])) 0 = 1 ∧
    boundedAmiceCoefficients (dirac ℚ_[3] (0 : ℤ_[3])) 1 = 0 := by sorry
-- bounded_coefficients_nonintegral
example : boundedAmiceCoefficients ((1 / 3 : ℚ_[3]) • dirac ℚ_[3] (0 : ℤ_[3])) 0 =
    1 / 3 := by sorry
-- bounded_coefficients_zero
example : boundedAmiceCoefficients (p := 2) (K := ℚ_[2]) 0 = 0 := by sorry
-- bounded_isometry_dirac
example : ‖boundedAmiceEquiv (toCLMEquiv (dirac ℚ_[2] (1 : ℤ_[2])))‖ = 1 := by sorry
-- bounded_isometry_nonintegral
example : ‖boundedAmiceEquiv (toCLMEquiv
    ((1 / 3 : ℚ_[3]) • dirac ℚ_[3] (0 : ℤ_[3])))‖ = 3 := by sorry
-- bounded_isometry_constant_inverse
example : (boundedAmiceEquiv (p := 3)).symm
    (BoundedContinuousFunction.const ℕ (1 / 3 : ℚ_[3])) (1 : C(ℤ_[3], ℚ_[3])) =
    1 / 3 := by sorry
-- unit_ball_excludes_nonintegral_dirac
example : ¬ ∃ μ : D(ℤ_[3], ℤ_[3]), extendIntegralCoefficients (R := ℚ_[3]) μ =
    (1 / 3 : ℚ_[3]) • dirac ℚ_[3] (0 : ℤ_[3]) := by sorry
-- dyadic_integral_scaling
example : (1 / 2 : ℚ_[2]) • dirac ℚ_[2] (1 : ℤ_[2]) =
    ((2 : ℚ_[2]) ^ 1)⁻¹ • extendIntegralCoefficients (dirac ℤ_[2] (1 : ℤ_[2])) := by sorry
end SuggestedTests.BoundedAmiceNorm

/-! Weak/norm topology continuation on existing measure carriers. -/
namespace AbstractMeasure
open Filter Topology
section DiracTopology
variable {X R : Type*} [TopologicalSpace X] [NormedCommRing R]

theorem continuous_dirac_weak :
    @Continuous X D(X,R) _ WeakTopology (dirac R) := by sorry

variable {K : Type*} [NontriviallyNormedField K] [CompactSpace X]
theorem norm_dirac (x : X) : ‖toCLMEquiv (dirac K x)‖ = 1 := by sorry

theorem norm_dirac_sub (hK : ∀ a b : K, ‖a+b‖ ≤ max ‖a‖ ‖b‖)
    [TotallySeparatedSpace X] {x y : X} (hxy : x ≠ y) :
    ‖toCLMEquiv (dirac K x - dirac K y)‖ = 1 := by sorry

theorem not_isCompact_measure_unitBall [Infinite X] [TotallySeparatedSpace X]
    (hK : ∀ a b : K, ‖a+b‖ ≤ max ‖a‖ ‖b‖) :
    ¬ IsCompact {L : C(X,K) →L[K] K | ‖L‖ ≤ 1} := by sorry
end DiracTopology

section PrimePowerTopology
variable (p : ℕ) [Fact p.Prime]

theorem tendsto_dirac_prime_powers_weak (R : Type*) [NormedCommRing R] :
    letI : TopologicalSpace D(ℤ_[p],R) := WeakTopology
    Tendsto (fun n : ℕ => dirac R ((p : ℤ_[p])^n))
      atTop (𝓝 (dirac R 0)) := by sorry

theorem norm_dirac_prime_powers_sub_zero (n : ℕ) :
    ‖toCLMEquiv (dirac ℚ_[p] ((p : ℤ_[p])^n) - dirac ℚ_[p] 0)‖ = 1 := by sorry

theorem not_tendsto_dirac_prime_powers_strong :
    ¬ Tendsto (fun n : ℕ => toCLMEquiv (dirac ℚ_[p] ((p : ℤ_[p])^n)))
      atTop (𝓝 (toCLMEquiv (dirac ℚ_[p] 0))) := by sorry
end PrimePowerTopology
end AbstractMeasure

namespace ContinuousMap
variable {X : Type*} [TopologicalSpace X] [CompactSpace X]
variable (p : ℕ) [Fact p.Prime]

theorem exists_integral_test_scaling (f : C(X,ℚ_[p])) :
    ∃ n : ℕ, ∃ g : C(X,ℤ_[p]), ∀ x, (g x : ℚ_[p]) = (p : ℚ_[p])^n * f x := by sorry
end ContinuousMap

namespace AbstractMeasure
open Topology
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]

theorem compactSpace_integralMeasures_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := WeakTopology
    CompactSpace D(ℤ_[p],ℤ_[p]) := by sorry

variable [IsBoundedSMul ℤ_[p] ℚ_[p]]
theorem continuous_extendIntegralCoefficients_weak :
    @Continuous D(ℤ_[p],ℤ_[p]) D(ℤ_[p],ℚ_[p]) WeakTopology WeakTopology
      (extendIntegralCoefficients (p := p) (R := ℚ_[p])) := by sorry

theorem isClosedEmbedding_extendIntegralCoefficients_weak :
    letI : TopologicalSpace D(ℤ_[p],ℤ_[p]) := WeakTopology
    letI : TopologicalSpace D(ℤ_[p],ℚ_[p]) := WeakTopology
    IsClosedEmbedding (extendIntegralCoefficients (p := p) (R := ℚ_[p])) := by sorry
end AbstractMeasure

namespace WeakNormTests
open AbstractMeasure Filter Topology
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)

-- WeakNormTests.dyadic_dirac_difference
example : ‖toCLMEquiv (dirac ℚ_[2] (0 : ℤ_[2]) - dirac ℚ_[2] 1)‖ = 1 := by sorry
-- WeakNormTests.equal_dirac_points
example : ‖toCLMEquiv (dirac ℚ_[3] (0 : ℤ_[3]) - dirac ℚ_[3] 0)‖ = 0 := by sorry
-- WeakNormTests.integral_dyadic_weak_limit
example :
    letI : TopologicalSpace D(ℤ_[2],ℤ_[2]) := WeakTopology
    Tendsto (fun n : ℕ => dirac ℤ_[2] ((2 : ℤ_[2])^n)) atTop (𝓝 (dirac ℤ_[2] 0)) := by sorry
-- WeakNormTests.ternary_weak_not_strong
example :
    (letI : TopologicalSpace D(ℤ_[3],ℚ_[3]) := WeakTopology;
      Tendsto (fun n : ℕ => dirac ℚ_[3] ((3 : ℤ_[3])^n)) atTop (𝓝 (dirac ℚ_[3] 0))) ∧
    ¬ Tendsto (fun n : ℕ => toCLMEquiv (dirac ℚ_[3] ((3 : ℤ_[3])^n)))
      atTop (𝓝 (toCLMEquiv (dirac ℚ_[3] 0))) := by sorry
-- WeakNormTests.nonintegral_constant_scaling
example :
    (∀ x : ℤ_[3], ((ContinuousMap.const ℤ_[3] (1 : ℤ_[3])) x : ℚ_[3]) =
      (3 : ℚ_[3]) * (ContinuousMap.const ℤ_[3] (1/3 : ℚ_[3])) x) ∧
    ¬ ∃ g : C(ℤ_[3],ℤ_[3]), ∀ x, (g x : ℚ_[3]) = (1/3 : ℚ_[3]) := by sorry
-- WeakNormTests.dyadic_integral_weak_embedding
example :
    letI : TopologicalSpace D(ℤ_[2],ℤ_[2]) := WeakTopology
    letI : TopologicalSpace D(ℤ_[2],ℚ_[2]) := WeakTopology
    IsClosedEmbedding (extendIntegralCoefficients (p := 2) (R := ℚ_[2])) := by sorry
-- WeakNormTests.amice_monomial_norm
example (n : ℕ) :
    ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[3])
      ((amiceTransformEquiv (p := 3)).symm (PowerSeries.X ^ n)))‖ = 1 := by sorry
end WeakNormTests

/-! ## Integral coefficient extension on the existing unit domain

The norm is always that of the rational existing continuous dual. The integral
carrier receives no new norm or topology instance in this specification.
-/
namespace AbstractMeasure
section UnitIntegralCoefficients
variable {p : ℕ} [Fact p.Prime] {R : Type*}
  [NormedCommRing R] [Algebra ℤ_[p] R] [IsUltrametricDist R]
  [CompleteSpace R] [IsBoundedSMul ℤ_[p] R]
local notation "U" => (ℤ_[p])ˣ
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, ℤ_[p]))

theorem extendIntegralCoefficients_unitRestriction (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralCoefficients (R := R) (unitRestriction p ℤ_[p] μ) =
      unitRestriction p R (extendIntegralCoefficients μ) := by sorry

def extendIntegralUnitCoefficients (μ : D(U, ℤ_[p])) : D(U, R) := sorry

theorem extendIntegralUnitCoefficients_eq (μ : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) μ =
      restrictUnits p R (extendIntegralCoefficients (map uMap μ)) := by sorry
theorem extendIntegralUnitCoefficients_zero :
    extendIntegralUnitCoefficients (p := p) (R := R) 0 = 0 := by sorry
theorem extendIntegralUnitCoefficients_add (μ ν : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) (μ + ν) =
      extendIntegralUnitCoefficients μ + extendIntegralUnitCoefficients ν := by sorry
theorem extendIntegralUnitCoefficients_smul (a : ℤ_[p]) (μ : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) (a • μ) =
      algebraMap ℤ_[p] R a • extendIntegralUnitCoefficients μ := by sorry
theorem extendIntegralUnitCoefficients_self (μ : D(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := ℤ_[p]) μ = μ := by sorry
theorem extendIntegralUnitCoefficients_dirac (u : U) :
    extendIntegralUnitCoefficients (R := R) (dirac ℤ_[p] u) = dirac R u := by sorry

theorem map_val_extendIntegralUnitCoefficients (μ : D(U, ℤ_[p])) :
    map uMap (extendIntegralUnitCoefficients (R := R) μ) =
      extendIntegralCoefficients (map uMap μ) := by sorry

theorem extendIntegralUnitCoefficients_test (μ : D(U, ℤ_[p])) (f : C(U, ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) μ (f • (1 : C(U, R))) =
      algebraMap ℤ_[p] R (μ f) := by sorry

theorem extendIntegralUnitCoefficients_unique (μ : D(U, ℤ_[p])) (ν : D(U, R))
    (hν : ∀ f : C(U, ℤ_[p]),
      ν (f • (1 : C(U, R))) = algebraMap ℤ_[p] R (μ f)) :
    ν = extendIntegralUnitCoefficients μ := by sorry

theorem extendIntegralUnitCoefficients_restrict (μ : D(ℤ_[p], ℤ_[p])) :
    extendIntegralUnitCoefficients (R := R) (restrictUnits p ℤ_[p] μ) =
      restrictUnits p R (extendIntegralCoefficients μ) := by sorry
end UnitIntegralCoefficients

section RationalUnitLattice
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]
local notation "U" => (ℤ_[p])ˣ
local notation "uMap" => (ContinuousMap.mk Units.val Units.continuous_val : C(U, ℤ_[p]))

theorem extendIntegralUnitCoefficients_injective :
    Function.Injective (extendIntegralUnitCoefficients (p := p) (R := ℚ_[p])) := by sorry

theorem norm_extendIntegralUnitCoefficients (μ : D(U, ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) μ)‖ =
      ‖integralAmiceCoefficients (R := ℚ_[p]) (map uMap μ)‖ := by sorry

theorem unit_integral_extension_iff_norm_le_one (ν : D(U, ℚ_[p])) :
    (∃! μ : D(U, ℤ_[p]), extendIntegralUnitCoefficients (R := ℚ_[p]) μ = ν) ↔
      ‖toCLMEquiv ν‖ ≤ 1 := by sorry

theorem isClosed_range_unit_integral_extension :
    IsClosed (Set.range (fun μ : D(U, ℤ_[p]) =>
      toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) μ))) := by sorry

theorem exists_unit_integral_power_scaling (ν : D(U, ℚ_[p])) :
    ∃ n : ℕ, ∃ μ : D(U, ℤ_[p]),
      ν = (((p : ℚ_[p]) ^ n)⁻¹) • extendIntegralUnitCoefficients μ := by sorry

theorem norm_extendIntegral_restrictUnits_le (μ : D(ℤ_[p], ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) (restrictUnits p ℤ_[p] μ))‖ ≤
      ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p]) μ)‖ := by sorry
end RationalUnitLattice
end AbstractMeasure

namespace SuggestedTests.UnitIntegralLattice
open AbstractMeasure
variable {p : ℕ} [Fact p.Prime] [IsBoundedSMul ℤ_[p] ℚ_[p]]

-- UnitIntegralTests.zero
example : extendIntegralUnitCoefficients (p := p) (R := ℚ_[p]) 0 = 0 := by sorry
-- UnitIntegralTests.dirac_one
example : extendIntegralUnitCoefficients (p := p) (R := ℚ_[p])
    (dirac ℤ_[p] (1 : (ℤ_[p])ˣ)) = dirac ℚ_[p] (1 : (ℤ_[p])ˣ) := by sorry
-- UnitIntegralTests.native_self
example (μ : D((ℤ_[p])ˣ, ℤ_[p])) : extendIntegralUnitCoefficients (R := ℤ_[p]) μ = μ := by sorry
-- UnitIntegralTests.mixed_restriction
example : extendIntegralUnitCoefficients (R := ℚ_[p])
    (restrictUnits p ℤ_[p] (dirac ℤ_[p] (1 : ℤ_[p]) + dirac ℤ_[p] (p : ℤ_[p]))) =
      dirac ℚ_[p] (1 : (ℤ_[p])ˣ) := by sorry
-- UnitIntegralTests.nonintegral_atom
example : ¬ ∃ μ : D((ℤ_[p])ˣ, ℤ_[p]),
    extendIntegralUnitCoefficients (R := ℚ_[p]) μ =
      (p : ℚ_[p])⁻¹ • dirac ℚ_[p] (1 : (ℤ_[p])ˣ) := by sorry
-- UnitIntegralTests.supported_norm
example (μ : D((ℤ_[p])ˣ, ℤ_[p])) :
    ‖toCLMEquiv (extendIntegralUnitCoefficients (R := ℚ_[p]) μ)‖ =
    ‖toCLMEquiv (extendIntegralCoefficients (R := ℚ_[p])
      (map (ContinuousMap.mk Units.val Units.continuous_val : C((ℤ_[p])ˣ, ℤ_[p])) μ))‖ := by sorry
-- UnitIntegralTests.nonunit_restriction
example : extendIntegralUnitCoefficients (R := ℚ_[p])
    (restrictUnits p ℤ_[p] (dirac ℤ_[p] (p : ℤ_[p]))) = 0 := by sorry
end SuggestedTests.UnitIntegralLattice

/-! ## Cartier operators on power series (§2.9)

The coefficient-decimation operators `Λ_r` (`r ∈ ℕ`) of modulus `q ≥ 1` on `k⟦X⟧`, for any
commutative ring `k`: `coeff n (Λ_r F) = coeff (q * n + r) F`. For every `k` one has
`Λ_r (F(X^q) * G) = F * Λ_r G` and `F = ∑_{r<q} X^r · (Λ_r F)(X^q)`; over a finite field with
`q` elements, `F(X^q) = F^q`, which gives Christol's relations. This roadmap plans the operator
here; the Laurent-series version belongs to a later roadmap; the residue
averaging operator below is the signed sum `∑_{i<p} (-1)^i Λ_i` at `q = p` over `ZMod p`. -/
namespace PowerSeries

variable (k : Type*) [CommRing k]

/-- §2.9: the Cartier operator `Λ_r` of modulus `q` on power series,
`coeff n (Λ_r F) = coeff (q * n + r) F`. -/
def cartier (q r : ℕ) : k⟦X⟧ →ₗ[k] k⟦X⟧ where
  toFun F := PowerSeries.mk fun n => coeff (q * n + r) F
  map_add' := by sorry
  map_smul' := by sorry

variable {k}

theorem coeff_cartier (q r n : ℕ) (F : k⟦X⟧) :
    coeff n (cartier k q r F) = coeff (q * n + r) F := sorry

theorem cartier_monomial (q r m : ℕ) (hq : 0 < q) (a : k) :
    cartier k q r (monomial m a) =
      if r ≤ m ∧ q ∣ m - r then monomial ((m - r) / q) a else 0 := sorry

theorem cartier_one_zero (F : k⟦X⟧) : cartier k 1 0 F = F := sorry

/-- The general semilinearity: `Λ_r (F(X^q) * G) = F * Λ_r G` over any commutative ring, for an
actual residue `r < q`. The hypothesis is necessary: with `q = 1`, `r = 1`, `F = X`, `G = 1` the
left side is `1` and the right side is `0` (`CartierTests.out_of_range`). -/
theorem cartier_expand_mul (q r : ℕ) (hq : q ≠ 0) (hr : r < q) (F G : k⟦X⟧) :
    cartier k q r (expand q hq F * G) = F * cartier k q r G := sorry

/-- Decomposition of a series by residue classes of exponents modulo `q`. -/
theorem sum_X_pow_mul_expand_cartier (q : ℕ) (hq : q ≠ 0) (F : k⟦X⟧) :
    F = ∑ r ∈ Finset.range q, X ^ r * expand q hq (cartier k q r F) := sorry

/-- Christol's relation over a finite field with `q` elements: `Λ_r (F^q * G) = F * Λ_r G`, for
`r < q`; for `K = 𝔽₃`, `r = 3`, `F = X`, `G = 1` the two sides are `1` and `0`
(`CartierTests.out_of_range_finite_field`). -/
theorem cartier_pow_card_mul {K : Type*} [Field K] [Fintype K] (r : ℕ)
    (hr : r < Fintype.card K) (F G : K⟦X⟧) :
    cartier K (Fintype.card K) r (F ^ Fintype.card K * G) =
      F * cartier K (Fintype.card K) r G := sorry

/-- Over a finite field with `q` elements, `F = ∑_{r<q} X^r (Λ_r F)^q`. -/
theorem eq_sum_X_pow_mul_cartier_pow {K : Type*} [Field K] [Fintype K] (F : K⟦X⟧) :
    F = ∑ r ∈ Finset.range (Fintype.card K),
      X ^ r * (cartier K (Fintype.card K) r F) ^ Fintype.card K := sorry

end PowerSeries

namespace CartierTests
open PowerSeries

-- test CartierTests.single (computation) [§2.9]
example : cartier (ZMod 3) 3 1 (monomial 7 (1 : ZMod 3)) = monomial 2 1 ∧
    cartier (ZMod 3) 3 0 (monomial 7 (1 : ZMod 3)) = 0 := sorry
-- test CartierTests.modulus_one (degenerate) [§2.9]
example (F : ℤ⟦X⟧) : cartier ℤ 1 0 F = F := sorry
-- test CartierTests.frobenius (characterisation) [§2.9]
example (F : (ZMod 3)⟦X⟧) : cartier (ZMod 3) 3 0 (F ^ 3) = F := sorry
-- test CartierTests.residue_shift (computation) [§2.9]
example : cartier (ZMod 3) 3 1 (X : (ZMod 3)⟦X⟧) = 1 ∧
    cartier (ZMod 3) 3 0 (X : (ZMod 3)⟦X⟧) = 0 := sorry
-- test CartierTests.not_multiplicative (non-example) [§2.9]
example : cartier (ZMod 2) 2 0 ((X : (ZMod 2)⟦X⟧) * X) ≠
    cartier (ZMod 2) 2 0 (X : (ZMod 2)⟦X⟧) * cartier (ZMod 2) 2 0 (X : (ZMod 2)⟦X⟧) := sorry
-- test CartierTests.out_of_range (non-example) [§2.9]
-- `q = 1`, `r = 1` (so `F(X^q) = F = X`): `Λ_1 (X · 1) = 1` while `X · Λ_1 1 = 0`, so `cartier_expand_mul` needs `r < q`.
example : cartier ℤ 1 1 (expand 1 one_ne_zero (X : ℤ⟦X⟧) * 1) = 1 ∧
    (X : ℤ⟦X⟧) * cartier ℤ 1 1 1 = 0 := sorry
-- test CartierTests.out_of_range_finite_field (non-example) [§2.9]
-- `K = 𝔽₃`, `r = 3 = #K`: `Λ_3 (X^3 · 1) = 1` while `X · Λ_3 1 = 0`, so `cartier_pow_card_mul` needs `r < #K`.
example : cartier (ZMod 3) 3 3 ((X : (ZMod 3)⟦X⟧) ^ 3 * 1) = 1 ∧
    (X : (ZMod 3)⟦X⟧) * cartier (ZMod 3) 3 3 1 = 0 := sorry

end CartierTests

/-!
## Residue of the integral averaging operator

Existing ZMod p and existing power series are used. The Cartier operators are the power-series
operators `PowerSeries.cartier` defined above (§2.9); only modulus q=p and
0≤i<p are consumed. The residue operator is their signed sum; its semilinearity is the finite-field
specialization of `cartier_expand_mul`.
The previous AbstractMeasure.psiMeasure_dirac signature is promoted, not declared twice.
-/
namespace IwasawaResidue
open PowerSeries
open scoped PowerSeries.WithPiTopology
variable (p : ℕ) [Fact p.Prime]
local notation "B" => ℤ_[p]⟦X⟧
local notation "B₀" => (ZMod p)⟦X⟧
local notation "ρ" => PowerSeries.map (PadicInt.toZMod (p := p))
local notation "φ₀" => PowerSeries.expand p (Nat.Prime.ne_zero (Fact.out : p.Prime))
local instance : TopologicalSpace (ZMod p) := ⊥
local instance : DiscreteTopology (ZMod p) := ⟨rfl⟩

theorem isLocallyConstant_toZMod : IsLocallyConstant (PadicInt.toZMod (p := p)) := sorry

theorem continuous_residue_map : Continuous (ρ : B → B₀) := sorry

theorem psiSeries_one_add_X_pow (n : ℕ) :
    AbstractMeasure.psiSeries p ((1+X : B)^n) =
      if p ∣ n then (1+X : B)^(n/p) else 0 := sorry

/-- §2.10: the finite weighted sum Σ (-1)^i Λ_i of the Cartier operators of modulus p. -/
def residuePsi : B₀ →ₗ[ZMod p] B₀ :=
  ∑ i ∈ Finset.range p, ((-1 : ZMod p) ^ i) • PowerSeries.cartier (ZMod p) p i

theorem coeff_residuePsi (F : B₀) (n : ℕ) :
    (residuePsi p F).coeff n =
      ∑ i ∈ Finset.range p, (-1 : ZMod p)^i * F.coeff (p*n+i) := sorry

theorem residuePsi_zero : residuePsi p 0 = 0 := sorry

theorem residuePsi_add (F G : B₀) : residuePsi p (F+G) = residuePsi p F + residuePsi p G := sorry

theorem residuePsi_smul (a : ZMod p) (F : B₀) : residuePsi p (a • F) = a • residuePsi p F := sorry

theorem residuePsi_monomial (n : ℕ) (a : ZMod p) :
    residuePsi p (monomial n a) = monomial (n/p) ((-1 : ZMod p)^(n%p) * a) := sorry

theorem residuePsi_one : residuePsi p 1 = 1 := sorry

/-- Characterization with the exact power-series coefficient interface of the supplier. -/
theorem residuePsi_eq_sum_cartier
    (C : ℕ → B₀ →ₗ[ZMod p] B₀)
    (hcoeff : ∀ i < p, ∀ F n, (C i F).coeff n = F.coeff (p*n+i)) (F : B₀) :
    residuePsi p F = ∑ i ∈ Finset.range p, (-1 : ZMod p)^i • C i F := sorry

theorem continuous_residuePsi : Continuous (residuePsi p) := sorry

theorem residuePsi_expand_mul (F G : B₀) :
    residuePsi p (φ₀ F * G) = F * residuePsi p G := sorry

theorem residuePsi_one_add_X_pow_lt (r : ℕ) (hr : r < p) :
    residuePsi p ((1+X : B₀)^r) = if r=0 then 1 else 0 := sorry

theorem residuePsi_one_add_X_pow (n : ℕ) :
    residuePsi p ((1+X : B₀)^n) =
      if p ∣ n then (1+X : B₀)^(n/p) else 0 := sorry

theorem residue_psiSeries_polynomial (P : Polynomial ℤ_[p]) :
    ρ (AbstractMeasure.psiSeries p (P : B)) = residuePsi p (ρ (P : B)) := sorry

theorem residue_psiSeries (F : B) :
    ρ (AbstractMeasure.psiSeries p F) = residuePsi p (ρ F) := sorry

theorem residuePsi_expand (F : B₀) : residuePsi p (φ₀ F) = F := sorry

theorem residuePsi_pole_basis :
    residuePsi p ((1+X : B₀)*X^(p-1)) = (1+X : B₀) := sorry

theorem residuePsi_pole_cancelled (H : B₀) :
    residuePsi p ((1+X)*X^(p-1)*φ₀ H) = (1+X)*H := sorry

theorem shifted_expand_fixed_zero (H : B₀) (h : X^(p-1)*φ₀ H = H) : H=0 := sorry

theorem pole_error_fixed_zero (H : B₀)
    (h : residuePsi p ((1+X)*X^(p-1)*φ₀ H) = (1+X)*X^(p-1)*φ₀ H) : H=0 := sorry

-- ResiduePsiTests.zero: degenerate value.
example : residuePsi 3 0 = 0 := sorry
-- ResiduePsiTests.ternary_X: distinguishes weighted extraction from Λ_0.
example : residuePsi 3 (X : (ZMod 3)⟦X⟧) = -1 := sorry
-- ResiduePsiTests.dyadic_X: no odd-prime restriction.
example : residuePsi 2 (X : (ZMod 2)⟦X⟧) = 1 := sorry
-- ResiduePsiTests.native_monomial: compatibility with the existing coefficient carrier.
example : residuePsi 3 (monomial 7 (2 : ZMod 3)) = monomial 2 (1 : ZMod 3) := sorry
-- ResiduePsiTests.nonmultiplicative: linear averaging is not a ring map.
example : residuePsi 2 ((1+X : (ZMod 2)⟦X⟧)^2) ≠
    (residuePsi 2 (1+X : (ZMod 2)⟦X⟧))^2 := sorry
-- ResiduePsiTests.integral_ternary: the integral operator before reduction.
example : AbstractMeasure.psiSeries 3 ((1+X : ℤ_[3]⟦X⟧)^6) = (1+X)^2 := sorry
-- ResiduePsiTests.actual_reduction: exact comparison on an arbitrary series.
example (F : ℤ_[2]⟦X⟧) : PowerSeries.map PadicInt.toZMod (AbstractMeasure.psiSeries 2 F) =
    residuePsi 2 (PowerSeries.map PadicInt.toZMod F) := sorry
-- ResiduePsiTests.pole_polynomial: the dyadic formula stays inside power series.
example : residuePsi 2 ((1+X : (ZMod 2)⟦X⟧)*X) = 1+X := sorry
-- ResiduePsiTests.nonzero_error: H=1 does not give a fixed error term.
example : residuePsi 3 ((1+X : (ZMod 3)⟦X⟧)*X^2) ≠ (1+X)*X^2 := sorry
end IwasawaResidue

/-! Finite measure coefficients and joint p-power precision (L1).
These signatures are plans. The completed group-algebra carrier remains
owned by ProfiniteProPGroups Layer9. -/
namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section FiniteCoefficients
variable {X A B R : Type*} [TopologicalSpace X]
  [Fintype A] [DecidableEq A] [TopologicalSpace A] [DiscreteTopology A]
  [Fintype B] [DecidableEq B] [TopologicalSpace B] [DiscreteTopology B]
  [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

def finiteProjection (q : C(X,A)) : D(X,R) →ₗ[R] (A →₀ R) := sorry
theorem finiteProjection_zero (q : C(X,A)) : finiteProjection (R := R) q 0 = 0 := sorry
theorem finiteProjection_add (q : C(X,A)) (μ ν : D(X,R)) :
    finiteProjection q (μ+ν) = finiteProjection q μ + finiteProjection q ν := sorry
theorem finiteProjection_smul (q : C(X,A)) (c : R) (μ : D(X,R)) :
    finiteProjection q (c • μ) = c • finiteProjection q μ := sorry
theorem finiteProjection_apply (q : C(X,A)) (μ : D(X,R)) (a : A) :
    finiteProjection q μ a = μ ((ContinuousMap.equivFnOfDiscrete.symm
      (Function.update (fun _ => 0) a 1)).comp q) := sorry
theorem finiteProjection_pairing (q : C(X,A)) (μ : D(X,R)) (h : A → R) :
    μ ((ContinuousMap.equivFnOfDiscrete.symm h).comp q) =
      ∑ a, h a * finiteProjection q μ a := sorry
theorem finiteProjection_dirac (q : C(X,A)) (x : X) :
    finiteProjection q (dirac R x) = Finsupp.single (q x) 1 := sorry
theorem finiteProjection_refinement (q : C(X,A)) (h : C(A,B)) (μ : D(X,R)) :
    finiteProjection (h.comp q) μ = Finsupp.mapDomain h (finiteProjection q μ) := sorry
theorem finiteProjection_totalMass (q : C(X,A)) (μ : D(X,R)) :
    ∑ a, finiteProjection q μ a = μ (ContinuousMap.const X 1) := sorry
theorem finiteProjection_reconstruct (μ : D(A,R)) :
    μ = ∑ a, finiteProjection (ContinuousMap.id A) μ a • dirac R a := sorry
theorem finiteProjection_bijective :
    Function.Bijective (finiteProjection (R := R) (ContinuousMap.id A)) := sorry
end FiniteCoefficients

section FiniteTopology
variable {X A R : Type*} [TopologicalSpace X]
  [Fintype A] [DecidableEq A] [TopologicalSpace A] [DiscreteTopology A]
  [NormedCommRing R]
theorem continuous_finiteProjection_coeff (q : C(X,A)) (a : A) :
    letI := WeakTopology (X := X) (R := R) (E := R)
    Continuous (fun μ : D(X,R) => finiteProjection q μ a) := sorry
variable [CompactSpace X] [T2Space X] [TotallyDisconnectedSpace X]
theorem finiteProjection_ext (μ ν : D(X,R))
    (h : ∀ (n : ℕ) (q : C(X,Fin n)), finiteProjection q μ = finiteProjection q ν) :
    μ = ν := sorry
end FiniteTopology

section JointFinite
variable {X A B : Type*} [TopologicalSpace X]
  [Fintype A] [DecidableEq A] [TopologicalSpace A] [DiscreteTopology A]
  [Fintype B] [DecidableEq B] [TopologicalSpace B] [DiscreteTopology B]
variable (p : ℕ) [Fact p.Prime]
def jointFiniteProjection (r : ℕ) (q : C(X,A)) :
    D(X,ℤ_[p]) →+ (A →₀ ZMod (p^r)) := sorry
theorem jointFiniteProjection_zero (r : ℕ) (q : C(X,A)) :
    jointFiniteProjection p r q 0 = 0 := sorry
theorem jointFiniteProjection_add (r : ℕ) (q : C(X,A)) (μ ν : D(X,ℤ_[p])) :
    jointFiniteProjection p r q (μ+ν) =
      jointFiniteProjection p r q μ + jointFiniteProjection p r q ν := sorry
theorem jointFiniteProjection_zero_precision (q : C(X,A)) (μ : D(X,ℤ_[p])) :
    jointFiniteProjection p 0 q μ = 0 := sorry
theorem jointFiniteProjection_apply (r : ℕ) (q : C(X,A)) (μ : D(X,ℤ_[p])) (a : A) :
    jointFiniteProjection p r q μ a = PadicInt.toZModPow r (finiteProjection q μ a) := sorry
theorem jointFiniteProjection_precision (r s : ℕ) (hrs : r ≤ s)
    (q : C(X,A)) (μ : D(X,ℤ_[p])) :
    Finsupp.mapRange (ZMod.castHom (pow_dvd_pow p hrs) (ZMod (p^r))) (map_zero _)
      (jointFiniteProjection p s q μ) = jointFiniteProjection p r q μ := sorry
theorem jointFiniteProjection_refinement (r : ℕ) (q : C(X,A)) (h : C(A,B))
    (μ : D(X,ℤ_[p])) :
    jointFiniteProjection p r (h.comp q) μ =
      Finsupp.mapDomain h (jointFiniteProjection p r q μ) := sorry
theorem jointFiniteProjection_dirac (r : ℕ) (q : C(X,A)) (x : X) :
    jointFiniteProjection p r q (dirac ℤ_[p] x) = Finsupp.single (q x) 1 := sorry
variable [CompactSpace X] [T2Space X] [TotallyDisconnectedSpace X]
theorem jointFiniteProjection_ext (μ ν : D(X,ℤ_[p]))
    (h : ∀ (r n : ℕ) (q : C(X,Fin n)),
      jointFiniteProjection p r q μ = jointFiniteProjection p r q ν) : μ = ν := sorry
end JointFinite
end
end AbstractMeasure

namespace FiniteProjectionTests
open scoped AbstractMeasure
open AbstractMeasure
-- FiniteProjectionTests.dirac_identity
example : finiteProjection (ContinuousMap.id (Fin 2)) (dirac ℤ (0 : Fin 2)) =
    Finsupp.single 0 1 := sorry
-- FiniteProjectionTests.collapse_sums
example : finiteProjection (ContinuousMap.const (Fin 2) (0 : Fin 1))
    ((2 : ℤ) • dirac ℤ (0 : Fin 2) + (3 : ℤ) • dirac ℤ (1 : Fin 2)) 0 = 5 := sorry
-- FiniteProjectionTests.empty_fiber
example : finiteProjection (ContinuousMap.const (Fin 1) (0 : Fin 2))
    (dirac ℤ (0 : Fin 1)) 1 = 0 := sorry
-- FiniteProjectionTests.joint_dirac
example : jointFiniteProjection 2 2 (ContinuousMap.id (Fin 1))
    (dirac ℤ_[2] (0 : Fin 1)) = Finsupp.single 0 1 := sorry
-- FiniteProjectionTests.zero_precision
example : jointFiniteProjection 2 0 (ContinuousMap.id (Fin 1))
    (dirac ℤ_[2] (0 : Fin 1)) = 0 := sorry
-- FiniteProjectionTests.precision_matters
example :
    jointFiniteProjection 2 1 (ContinuousMap.id (Fin 1))
      ((2 : ℤ_[2]) • dirac ℤ_[2] (0 : Fin 1)) = 0 ∧
    jointFiniteProjection 2 2 (ContinuousMap.id (Fin 1))
      ((2 : ℤ_[2]) • dirac ℤ_[2] (0 : Fin 1)) 0 = 2 ∧
    jointFiniteProjection 2 2 (ContinuousMap.id (Fin 1))
      ((2 : ℤ_[2]) • dirac ℤ_[2] (0 : Fin 1)) ≠ 0 := sorry
end FiniteProjectionTests

/-! ## Dilation pushforward and the existing formal binomial substitution
These signatures compare existing maps. They introduce no arithmetic Galois action. -/
namespace AbstractMeasure
noncomputable section
open scoped BigOperators PowerSeries.WithPiTopology
open PowerSeries
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => PadicInt p
local notation "B" => PowerSeries Z
local notation "ba" a => (binomialSeries Z a - 1)
set_option quotPrecheck false in
local notation "dil" a => (⟨fun x : Z => a*x,
  continuous_const.mul continuous_id⟩ : C(Z,Z))

/-- §2.11: the Mahler function `mahler n` at `a * m`, `m : ℕ`, expanded in the Mahler basis with
the coefficients of `(binomialSeries a - 1)^k`. -/
theorem mahler_mul_padic_nat (a : Z) (m n : ℕ) :
    mahler n (a * (m : Z)) =
      ∑ k ∈ Finset.range (n+1), coeff n ((ba a)^k) * mahler k (m : Z) := by sorry
/-- §2.11: the Mahler dilation identity, `mahler n (a * x) = Σ_k coeff n ((binomialSeries a - 1)^k)
* mahler k x`, from the natural case by continuity. -/
theorem mahler_mul_padic (a : Z) (n : ℕ) (x : Z) :
    mahler n (a*x) =
      ∑ k ∈ Finset.range (n+1), coeff n ((ba a)^k) * mahler k x := by sorry
/-- §2.11: the Amice transform of the dilation pushforward is the binomial substitution `S_a`. -/
theorem amiceTransform_map_mul (a : Z) (μ : D(Z,Z)) :
    (map (dil a) μ).amiceTransform = subst (ba a) μ.amiceTransform := by sorry
/-- §2.11: unit restriction commutes with dilation by a unit. -/
theorem unitRestriction_map_unit (R : Type*) [NormedCommRing R]
    (a : Zˣ) (μ : D(Z,R)) :
    unitRestriction p R (map (dil (a : Z)) μ) =
      map (dil (a : Z)) (unitRestriction p R μ) := by sorry
/-- §2.11: dilation by a unit preserves the kernel of `psiSeries`. -/
theorem psiSeries_subst_binomial_eq_zero (a : Zˣ) (F : B)
    (hF : psiSeries p F = 0) :
    psiSeries p (subst (ba (a : Z)) F) = 0 := by sorry
/-- §2.11: inverse Mahler covariance under binomial substitution by a unit, with the factor `a⁻¹`. -/
theorem inverseMahler_subst_binomial_unit (a : Zˣ) (F : B) :
    inverseMahler p (subst (ba (a : Z)) F) =
      (↑(a⁻¹) : Z) • subst (ba (a : Z)) (inverseMahler p F) := by sorry
/-- §2.11: the binomial substitution `S_a` is continuous for the coefficientwise topology. -/
theorem continuous_subst_binomial (a : Z) :
    Continuous (fun F : B => subst (ba a) F) := by sorry

-- DilationTests.zero_scalar: collapse to the mass, including nonzero measures.
example (μ : D(Z,Z)) :
    (map (dil (0 : Z)) μ).amiceTransform = C (μ 1) := by sorry
-- DilationTests.identity_scalar.
example (F : B) : subst (ba (1 : Z)) F = F := by sorry
-- DilationTests.negative_scalar: binomial substitution is not coefficient dilation.
example : coeff 2 ((map (dil (-1 : Z)) (dirac Z (2 : Z))).amiceTransform) = 3 := by sorry
-- DilationTests.prime_scalar: agreement with the Frobenius map.
example (μ : D(Z,Z)) : (map (dil (p : Z)) μ).amiceTransform =
    (phiMeasure p Z μ).amiceTransform := by sorry
end

-- DilationTests.inverse_factor: the coefficient is the inverse unit.
example : (2 : PadicInt 3) • inverseMahler 3
    (PowerSeries.subst (PowerSeries.binomialSeries (PadicInt 3) (2 : PadicInt 3) - 1)
      (1 + PowerSeries.X : PowerSeries (PadicInt 3))) =
      (1 + PowerSeries.X : PowerSeries (PadicInt 3))^2 := by sorry
-- DilationTests.dyadic_inverse_factor.
example : (3 : PadicInt 2) • inverseMahler 2
    (PowerSeries.subst (PowerSeries.binomialSeries (PadicInt 2) (3 : PadicInt 2) - 1)
      (1 + PowerSeries.X : PowerSeries (PadicInt 2))) =
      (1 + PowerSeries.X : PowerSeries (PadicInt 2))^3 := by sorry
-- DilationTests.nonunit_kernel_control.
example : psiSeries 3 (1 + PowerSeries.X) = 0 ∧
    psiSeries 3 (PowerSeries.subst (0 : PowerSeries (PadicInt 3))
      (1 + PowerSeries.X : PowerSeries (PadicInt 3))) ≠ 0 := by sorry
end AbstractMeasure

/-! Convolution and finite algebra coordinates (L1).
The right-handed orientation and the principal names are those of Mathlib's
`Mathlib/NumberTheory/Padics/Measure/Monoid.lean`, which is in the pinned Mathlib. All
proofs below are `sorry`; the structural fields fix the multiplication and the identity of the
ring instance. -/
namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section Convolution
variable {G H R : Type*} [TopologicalSpace G] [Monoid G] [ContinuousMul G]
  [LocallyCompactSpace G] [TopologicalSpace H] [Monoid H] [ContinuousMul H]
  [LocallyCompactSpace H] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/- Right convolution of a function, the convolution product and the algebra of measures are
Mathlib's `AbstractMeasure.convolveFunRight` (with `convolveFunRight_apply`,
`convolveFunRight_dirac_apply`, `convolveFunRight_apply_one`, `convolveFunRight_one`,
`convolveFunRight_mul`), the `Mul`, `One`, `Ring` and `Algebra R` instances on `D(G,R)` with
`mul_def`, `mul_apply`, `dirac_mul_dirac`, `one_def` and `one_apply`, and the `CommRing` instance
for commutative `G` (`Mathlib.NumberTheory.Padics.Measure.Monoid`); they are not restated. The
examples below exercise those instances. -/
theorem algebraMap_apply (r : R) (f : C(G,R)) :
    algebraMap R D(G,R) r f = r * f 1 := sorry
theorem map_mul (h : G →* H) (hh : Continuous h) (μ ν : D(G,R)) :
    map ⟨h,hh⟩ (μ*ν) = map ⟨h,hh⟩ μ * map ⟨h,hh⟩ ν := sorry
theorem mul_totalMass (μ ν : D(G,R)) :
    (μ*ν) (ContinuousMap.const G 1) =
      μ (ContinuousMap.const G 1) * ν (ContinuousMap.const G 1) := sorry

-- ConvolutionTests.function_right_dirac
example (f : C(G,R)) (x y : G) : convolveFunRight (dirac R y) f x = f (x*y) := sorry
-- ConvolutionTests.function_identity
example (f : C(G,R)) : convolveFunRight (dirac R (1 : G)) f = f := sorry
-- ConvolutionTests.function_constant
example (ν : D(G,R)) (c : R) : convolveFunRight ν (ContinuousMap.const G c) =
    ContinuousMap.const G (c * ν (ContinuousMap.const G 1)) := sorry
-- ConvolutionTests.product_dirac
example (x y : G) : dirac R x * dirac R y = dirac R (x*y) := sorry
-- ConvolutionTests.product_zero
example (μ : D(G,R)) : 0 * μ = 0 := sorry
-- ConvolutionTests.algebra_right_unit
example (μ : D(G,R)) : μ * dirac R 1 = μ := sorry
-- ConvolutionTests.algebra_left_unit
example (μ : D(G,R)) : dirac R 1 * μ = μ := sorry
-- ConvolutionTests.algebra_scalar
example (r : R) : algebraMap R D(G,R) r = r • dirac R 1 := sorry
end Convolution

section CommutativeConvolution
variable {G R : Type*} [TopologicalSpace G] [CommMonoid G] [ContinuousMul G]
  [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
  [CommRing R] [TopologicalSpace R] [IsTopologicalRing R] [T0Space R]
end CommutativeConvolution

section FiniteAlgebra
variable {G A R : Type*} [TopologicalSpace G] [Monoid G] [ContinuousMul G]
  [LocallyCompactSpace G] [TopologicalSpace A] [Monoid A] [Fintype A] [DecidableEq A]
  [DiscreteTopology A] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]
theorem finiteProjection_map (q : C(G,A)) (μ : D(G,R)) :
    finiteProjection (.id A) (map q μ) = finiteProjection q μ := sorry
theorem finite_convolution_expansion (μ ν : D(A,R)) :
    μ*ν = ∑ a, ∑ b, (finiteProjection (.id A) μ a * finiteProjection (.id A) ν b) •
      dirac R (a*b) := sorry
theorem finiteProjection_mul (q : G →* A) (hq : Continuous q) (μ ν : D(G,R)) :
    MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ (μ*ν)) =
      MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ μ) *
        MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ ν) := sorry
def finiteProjectionAlgHom (q : G →* A) (hq : Continuous q) :
    D(G,R) →ₐ[R] MonoidAlgebra R A := sorry
theorem finiteProjectionAlgHom_apply (q : G →* A) (hq : Continuous q) (μ : D(G,R)) :
    finiteProjectionAlgHom q hq μ = MonoidAlgebra.ofCoeff (finiteProjection ⟨q,hq⟩ μ) := sorry
theorem finiteProjectionAlgHom_coeff (q : G →* A) (hq : Continuous q) (μ : D(G,R)) (a : A) :
    (finiteProjectionAlgHom q hq μ).coeff a = finiteProjection ⟨q,hq⟩ μ a := sorry
theorem finiteProjectionAlgHom_dirac (q : G →* A) (hq : Continuous q) (x : G) :
    finiteProjectionAlgHom (R := R) q hq (dirac R x) = MonoidAlgebra.single (q x) 1 := sorry

def finiteProjectionAlgEquiv : D(A,R) ≃ₐ[R] MonoidAlgebra R A := sorry
theorem finiteProjectionAlgEquiv_apply (μ : D(A,R)) :
    finiteProjectionAlgEquiv μ = finiteProjectionAlgHom (MonoidHom.id A) continuous_id μ := sorry
theorem finiteProjectionAlgEquiv_symm_apply (c : MonoidAlgebra R A) :
    finiteProjectionAlgEquiv.symm c = ∑ a, c.coeff a • dirac R a := sorry
theorem finiteProjectionAlgEquiv_symm_single (a : A) (r : R) :
    finiteProjectionAlgEquiv.symm (MonoidAlgebra.single a r) = r • dirac R a := sorry
-- ConvolutionTests.finite_algebra_one
example (q : G →* A) (hq : Continuous q) :
    finiteProjectionAlgHom (R := R) q hq 1 = 1 := sorry
-- ConvolutionTests.finite_algebra_atoms
example (q : G →* A) (hq : Continuous q) (x y : G) :
    finiteProjectionAlgHom (R := R) q hq (dirac R x * dirac R y) =
      MonoidAlgebra.single (q x * q y) 1 := sorry
-- ConvolutionTests.finite_equiv_atom
example (a : A) : finiteProjectionAlgEquiv (dirac R a) = MonoidAlgebra.single a 1 := sorry
-- ConvolutionTests.finite_equiv_inverse_zero
example : (finiteProjectionAlgEquiv (R := R) (A := A)).symm 0 = 0 := sorry
-- ConvolutionTests.finite_equiv_inverse_product
example (a b : A) (r s : R) :
    finiteProjectionAlgEquiv.symm (MonoidAlgebra.single a r * MonoidAlgebra.single b s) =
      (r*s) • dirac R (a*b) := sorry

variable (p : ℕ) [Fact p.Prime]
theorem jointFiniteProjection_mul (r : ℕ) (q : G →* A) (hq : Continuous q)
    (μ ν : D(G,ℤ_[p])) :
    MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ (μ*ν)) =
      MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ μ) *
        MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ ν) := sorry
def jointFiniteProjectionRingHom (r : ℕ) (q : G →* A) (hq : Continuous q) :
    D(G,ℤ_[p]) →+* MonoidAlgebra (ZMod (p^r)) A := sorry
theorem jointFiniteProjectionRingHom_apply (r : ℕ) (q : G →* A) (hq : Continuous q)
    (μ : D(G,ℤ_[p])) : jointFiniteProjectionRingHom p r q hq μ =
      MonoidAlgebra.ofCoeff (jointFiniteProjection p r ⟨q,hq⟩ μ) := sorry
theorem jointFiniteProjectionRingHom_dirac (r : ℕ) (q : G →* A) (hq : Continuous q) (x : G) :
    jointFiniteProjectionRingHom p r q hq (dirac ℤ_[p] x) = MonoidAlgebra.single (q x) 1 := sorry
theorem jointFiniteProjectionRingHom_zero_precision (q : G →* A) (hq : Continuous q)
    (μ : D(G,ℤ_[p])) : jointFiniteProjectionRingHom p 0 q hq μ = 0 := sorry
end FiniteAlgebra

-- ConvolutionTests.ordered_permutations
example :
    letI : TopologicalSpace (Equiv.Perm (Fin 3)) := ⊥
    letI : DiscreteTopology (Equiv.Perm (Fin 3)) := ⟨rfl⟩
    dirac ℤ (Equiv.swap (0 : Fin 3) 1) * dirac ℤ (Equiv.swap (1 : Fin 3) 2) ≠
      dirac ℤ (Equiv.swap (1 : Fin 3) 2) * dirac ℤ (Equiv.swap (0 : Fin 3) 1) := sorry
-- ConvolutionTests.finite_algebra_collapse
example {A : Type*} [Group A] [Fintype A] [DecidableEq A] [TopologicalSpace A]
    [DiscreteTopology A] (x y : A) :
    letI : TopologicalSpace PUnit := ⊥
    finiteProjectionAlgHom (R := ℤ) (1 : A →* PUnit) (by fun_prop)
      ((2 : ℤ) • dirac ℤ x + (3 : ℤ) • dirac ℤ y) =
        MonoidAlgebra.single 1 5 := sorry
-- ConvolutionTests.joint_ring_one
example :
    letI : TopologicalSpace PUnit := ⊥
    jointFiniteProjectionRingHom 2 2 (MonoidHom.id PUnit) continuous_id
      (1 : D(PUnit,ℤ_[2])) = MonoidAlgebra.single 1 1 := sorry
-- ConvolutionTests.joint_ring_zero_precision
example :
    letI : TopologicalSpace PUnit := ⊥
    jointFiniteProjectionRingHom 2 0 (MonoidHom.id PUnit) continuous_id
      (1 : D(PUnit,ℤ_[2])) = 0 := sorry
-- ConvolutionTests.joint_ring_product
example :
    letI : TopologicalSpace PUnit := ⊥
    jointFiniteProjectionRingHom 2 3 (MonoidHom.id PUnit) continuous_id
      (((2 : ℤ_[2]) • dirac ℤ_[2] (1 : PUnit)) * ((3 : ℤ_[2]) • dirac ℤ_[2] 1)) =
        MonoidAlgebra.single 1 6 := sorry
end
end AbstractMeasure

/-! ## Concrete finite quotients of p-adic units
The local-field unit filtration is imported from the pinned Tau Ceti library.
These signatures compare it with the modular-unit reductions.
-/
namespace PadicInt
open Filter Topology ValuativeRel IsNonarchimedeanLocalField
variable (p : ℕ) [Fact p.Prime]

/- The unit reduction `red_n : ℤ_pˣ → (ℤ/pⁿ)ˣ` is Tau Ceti's `PadicInt.unitsToZModPow n`
(`TauCeti.NumberTheory.Padics.RingHoms`), a continuous homomorphism; its value on units
(`coe_unitsToZModPow_apply`), surjectivity (`surjective_units_map_toZModPow`) and the
continuity of `toZModPow` are library facts and are not restated. -/
/- The identification `𝒪[ℚ_p] = PadicInt.subring p` is Tau Ceti's `Padic.integerRing_eq_subring`
(`TauCeti.NumberTheory.LocalField.Padic`). The kernel of `unitsToZModPow n` is Tau Ceti's
`TauCeti.unitsPrincipal p n` (`TauCeti.NumberTheory.Padics.PrincipalUnits`), whose membership,
openness and neighbourhood-basis lemmas `mem_unitsPrincipal_iff`, `isOpen_unitsPrincipal` and
`hasBasis_nhds_one_unitsPrincipal` are not restated. -/
theorem unitsToZModPow_zero (u : (ℤ_[p])ˣ) : (PadicInt.unitsToZModPow (p := p) 0).toMonoidHom u = 1 := sorry
theorem unitsToZModPow_refinement (m n : ℕ) (h : m ≤ n) :
    (ZMod.unitsMap (pow_dvd_pow p h)).comp ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom) = (PadicInt.unitsToZModPow (p := p) m).toMonoidHom := sorry
theorem toZModPow_eq_iff_norm_sub_le (n : ℕ) (x y : ℤ_[p]) :
    toZModPow n x = toZModPow n y ↔ ‖x-y‖ ≤ (p:ℝ)^(-(n:ℤ)) := sorry
theorem unitsToZModPow_ker_eq_unitFiltration (n : ℕ) :
    ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom).ker = (TauCeti.unitFiltration ℚ_[p] n).comap
      (Units.map (Coe.ringHom (p := p)).toMonoidHom) := sorry
theorem exists_ker_unitsToZModPow_le (H : OpenSubgroup (ℤ_[p])ˣ) :
    ∃ n, ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom).ker ≤ H.toSubgroup := sorry
-- Separation of units by their reductions is `TauCeti.iInf_unitsPrincipal_eq_bot` and is not restated.

def unitsToZModPowQuotient (n : ℕ) :
    (ℤ_[p])ˣ ⧸ ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom).ker ≃* (ZMod (p^n))ˣ := sorry
theorem unitsToZModPowQuotient_mk (n : ℕ) (u : (ℤ_[p])ˣ) :
    unitsToZModPowQuotient p n (QuotientGroup.mk u) = (PadicInt.unitsToZModPow (p := p) n).toMonoidHom u := sorry
theorem unitsToZModPowQuotient_symm_apply (n : ℕ) (u : (ℤ_[p])ˣ) :
    (unitsToZModPowQuotient p n).symm ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom u) = QuotientGroup.mk u := sorry
theorem unitsToZModPowQuotient_eq_native (n : ℕ) :
    unitsToZModPowQuotient p n = QuotientGroup.quotientKerEquivOfSurjective
      ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom) (PadicInt.surjective_units_map_toZModPow n) := sorry

theorem exists_unitsToZModPow_factor {A : Type*} [Group A] [TopologicalSpace A]
    [DiscreteTopology A] (q : (ℤ_[p])ˣ →* A) (hq : Continuous q) :
    ∃ n, ∃ t : (ZMod (p^n))ˣ →* A, t.comp ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom) = q := sorry
theorem unitsToZModPow_factor_unique {A : Type*} [Monoid A] (n : ℕ)
    (t t' : (ZMod (p^n))ˣ →* A)
    (h : t.comp ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom) = t'.comp ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom)) : t=t' := sorry
end PadicInt

namespace UnitReductionTests
-- UnitReductionTests.coefficient_agreement
example (u : (ℤ_[3])ˣ) : ((PadicInt.unitsToZModPow (p := 3) 2).toMonoidHom u : ZMod (3^2)) =
    PadicInt.toZModPow 2 (u : ℤ_[3]) := sorry
-- UnitReductionTests.zero_level
example (u : (ℤ_[2])ˣ) : (PadicInt.unitsToZModPow (p := 2) 0).toMonoidHom u = 1 := sorry
-- UnitReductionTests.dyadic_first_level
example : (PadicInt.unitsToZModPow (p := 2) 1).toMonoidHom (-1) = (PadicInt.unitsToZModPow (p := 2) 1).toMonoidHom 1 := sorry
-- UnitReductionTests.dyadic_second_level
example : (PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom (-1) ≠ (PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom 1 := sorry
-- UnitReductionTests.odd_sign
example : ((PadicInt.unitsToZModPow (p := 3) 2).toMonoidHom (-1) : ZMod (3^2)) = 8 := sorry
-- UnitReductionTests.quotient_zero
example (u : (ℤ_[3])ˣ) :
    PadicInt.unitsToZModPowQuotient 3 0 (QuotientGroup.mk u) = 1 := sorry
-- UnitReductionTests.quotient_representative
example (u : (ℤ_[3])ˣ) : PadicInt.unitsToZModPowQuotient 3 2 (QuotientGroup.mk u) =
    (PadicInt.unitsToZModPow (p := 3) 2).toMonoidHom u := sorry
-- UnitReductionTests.quotient_dyadic_sign
example : PadicInt.unitsToZModPowQuotient 2 2 (QuotientGroup.mk (-1)) ≠
    PadicInt.unitsToZModPowQuotient 2 2 (QuotientGroup.mk 1) := sorry
-- UnitReductionTests.actual_unit_dirac_coordinate
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.jointFiniteProjectionRingHom 2 3 ((PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom)
      ((PadicInt.unitsToZModPow (p := 2) 2).continuous) (AbstractMeasure.dirac ℤ_[2] u) =
      MonoidAlgebra.single ((PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom u) 1 := sorry
-- UnitReductionTests.actual_unit_zero_precision
example (u : (ℤ_[2])ˣ) :
    AbstractMeasure.jointFiniteProjectionRingHom 2 0 ((PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom)
      ((PadicInt.unitsToZModPow (p := 2) 2).continuous) (AbstractMeasure.dirac ℤ_[2] u) = 0 := sorry
end UnitReductionTests


/-! Concrete locally constant tests and measure separation on p-adic units.
Existing uniform local constancy is imported from Tau Ceti. All bodies below are
`sorry`; the proof outlines are in the roadmap. -/

noncomputable section
open scoped AbstractMeasure
variable (p : ℕ) [Fact p.Prime]

theorem PadicInt.unitsToZModPow_function_factor_iff {A : Type*} (n : ℕ) (f : (ℤ_[p])ˣ → A) :
    (∃ g : (ZMod (p^n))ˣ → A, g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f) ↔
      ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom).ker ≤ TauCeti.rightTranslationStabilizer f := sorry

theorem PadicInt.exists_unitsToZModPow_locallyConstant_factor {A : Type*} (f : (ℤ_[p])ˣ → A)
    (hf : IsLocallyConstant f) :
    ∃ n, ∃ g : (ZMod (p^n))ˣ → A, g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f := sorry

theorem PadicInt.isLocallyConstant_iff_unitsToZModPow_factor {A : Type*} (f : (ℤ_[p])ˣ → A) :
    IsLocallyConstant f ↔ ∃ n, ∃ g : (ZMod (p^n))ˣ → A,
      g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f := sorry

theorem PadicInt.unitsToZModPow_function_factor_unique {A : Type*} (n : ℕ)
    (g h : (ZMod (p^n))ˣ → A)
    (heq : g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = h ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom) : g = h := sorry

theorem PadicInt.unitsToZModPow_function_factor_refinement {A : Type*} (m n : ℕ) (hmn : m ≤ n)
    (f : (ℤ_[p])ˣ → A) (g : (ZMod (p^m))ˣ → A)
    (hg : g ∘ (PadicInt.unitsToZModPow (p := p) m).toMonoidHom = f) :
    (g ∘ ZMod.unitsMap (pow_dvd_pow p hmn)) ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f := sorry

theorem PadicInt.exists_unitsToZModPow_continuous_factor {A : Type*} [TopologicalSpace A] [DiscreteTopology A]
    (f : (ℤ_[p])ˣ → A) (hf : Continuous f) :
    ∃ n, ∃ g : (ZMod (p^n))ˣ → A, g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f := sorry

theorem PadicInt.unitsToZModPow_zero_factor_iff {A : Type*} (f : (ℤ_[p])ˣ → A) :
    (∃ g : (ZMod (p^0))ˣ → A, g ∘ (PadicInt.unitsToZModPow (p := p) 0).toMonoidHom = f) ↔
      ∀ x, f x = f 1 := sorry

theorem PadicInt.dense_unitsToZModPow_tests {R : Type*} [MetricSpace R] :
    Dense {f : C((ℤ_[p])ˣ,R) | ∃ n, ∃ g : (ZMod (p^n))ˣ → R,
      g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f} := sorry

theorem AbstractMeasure.unitsToZModPow_ext {R : Type*} [NormedCommRing R]
    (μ ν : D((ℤ_[p])ˣ,R))
    (h : ∀ n, AbstractMeasure.finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ =
      AbstractMeasure.finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ ν) : μ = ν := sorry

theorem AbstractMeasure.jointUnitToZModPow_ext (μ ν : D((ℤ_[p])ˣ,ℤ_[p]))
    (h : ∀ r n, AbstractMeasure.jointFiniteProjection p r ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ =
      AbstractMeasure.jointFiniteProjection p r ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ ν) : μ = ν := sorry

theorem AbstractMeasure.diagonalUnitToZModPow_ext (μ ν : D((ℤ_[p])ˣ,ℤ_[p]))
    (h : ∀ n, AbstractMeasure.jointFiniteProjection p n ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ =
      AbstractMeasure.jointFiniteProjection p n ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ ν) : μ = ν := sorry

namespace UnitDescentTests
-- UnitDescentTests.zero_level_constant
example (c : ℤ) : ∃ g : (ZMod (3^0))ˣ → ℤ,
    g ∘ (PadicInt.unitsToZModPow (p := 3) 0).toMonoidHom = fun _ => c := sorry
-- UnitDescentTests.dyadic_depth_one_insufficient
example : ¬ ∃ g : (ZMod (2^1))ˣ → (ZMod (2^2))ˣ,
    g ∘ (PadicInt.unitsToZModPow (p := 2) 1).toMonoidHom = (PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom := sorry
-- UnitDescentTests.joint_zero_precision
example (μ : D((ℤ_[2])ˣ,ℤ_[2])) :
    AbstractMeasure.jointFiniteProjection 2 0
      ⟨(PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 2).continuous⟩ μ = 0 := sorry
-- UnitDescentTests.dyadic_joint_dirac
example : AbstractMeasure.jointFiniteProjection 2 2
    ⟨(PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 2).continuous⟩
    (AbstractMeasure.dirac ℤ_[2] (1 : (ℤ_[2])ˣ)) =
      Finsupp.single ((PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom 1) 1 := sorry
end UnitDescentTests
end

/-! ## Ordinary moments over coefficient algebras

The coordinate is the existing pointwise scalar action on the constant-one test.
Only continuous scalar action is needed here. Formal exponential substitution
additionally requires a rational algebra; it is not imposed on the p-adic integers.
-/
namespace AbstractMeasure
section AlgebraMoments
variable {p : ℕ} [Fact p.Prime]
variable {R : Type*} [NormedCommRing R] [Algebra ℤ_[p] R]
  [ContinuousSMul ℤ_[p] R]
local notation "xR" => ((ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p], R)))

theorem id_mul_mahler_algebra (n : ℕ) :
    xR * ((mahler n : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) =
      (n + 1) • ((mahler (n + 1) : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) +
        n • ((mahler n : C(ℤ_[p], ℤ_[p])) • (1 : C(ℤ_[p], R))) := by sorry

theorem constantCoeff_amiceTransform (μ : D(ℤ_[p], R)) :
    PowerSeries.constantCoeff μ.amiceTransform = μ 1 := by sorry

theorem amiceTransform_weight_id_algebra (μ : D(ℤ_[p], R)) :
    (weight xR μ).amiceTransform =
      PowerSeries.mahlerDerivation R μ.amiceTransform := by sorry

theorem amiceTransform_iterate_weight_id_algebra (μ : D(ℤ_[p], R)) (k : ℕ) :
    ((weight xR)^[k] μ).amiceTransform =
      (PowerSeries.mahlerDerivation R)^[k] μ.amiceTransform := by sorry

theorem ordinaryMoment_eq_constantCoeff_algebra (μ : D(ℤ_[p], R)) (k : ℕ) :
    μ (xR ^ k) =
      PowerSeries.constantCoeff ((PowerSeries.mahlerDerivation R)^[k] μ.amiceTransform) := by sorry

theorem ordinaryMoment_eq_factorial_coeff_algebra [Algebra ℚ R]
    (μ : D(ℤ_[p], R)) (k : ℕ) :
    μ (xR ^ k) = (k.factorial : R) * PowerSeries.coeff k
      (PowerSeries.subst (PowerSeries.exp R - 1) μ.amiceTransform) := by sorry
end AlgebraMoments
end AbstractMeasure

namespace SuggestedTests.AlgebraMoments
open AbstractMeasure PowerSeries
-- Same standard norm-action instance used by the earlier rational-coefficient tests.
local instance (p : ℕ) [Fact p.Prime] : IsBoundedSMul ℤ_[p] ℚ_[p] :=
  IsBoundedSMul.of_norm_smul_le (by sorry)
-- AlgebraMomentTests.integral_coordinate: exactly the preceding integral test function.
example {p : ℕ} [Fact p.Prime] :
    (ContinuousMap.id ℤ_[p]) • (1 : C(ℤ_[p], ℤ_[p])) = ContinuousMap.id ℤ_[p] := by sorry
-- AlgebraMomentTests.zeroth_mass: degree zero retains the atom at zero.
example :
    let xQ : C(ℤ_[2],ℚ_[2]) := (ContinuousMap.id ℤ_[2]) • 1
    (dirac ℚ_[2] (0 : ℤ_[2])) (xQ ^ 0) = 1 := by sorry
-- AlgebraMomentTests.zero_measure: any degree and any coefficient algebra.
example {p : ℕ} [Fact p.Prime] {R : Type*} [NormedCommRing R]
    [Algebra ℤ_[p] R] [ContinuousSMul ℤ_[p] R] (k : ℕ) :
    constantCoeff ((mahlerDerivation R)^[k] (0 : D(ℤ_[p],R)).amiceTransform) = 0 := by sorry
-- AlgebraMomentTests.scaled_atom: arbitrary coefficient-field scalar.
example {p : ℕ} [Fact p.Prime] {K : Type*} [NontriviallyNormedField K]
    [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] (c : K) (a : ℤ_[p]) (k : ℕ) :
    constantCoeff ((mahlerDerivation K)^[k] (c • dirac K a).amiceTransform) =
      c * (algebraMap ℤ_[p] K a) ^ k := by sorry
-- AlgebraMomentTests.dyadic_second: ordinary and binomial moments differ.
example :
    let μ := dirac ℚ_[2] (2 : ℤ_[2])
    constantCoeff ((mahlerDerivation ℚ_[2])^[2] μ.amiceTransform) = 4 ∧
      coeff 2 μ.amiceTransform = 1 := by sorry
-- AlgebraMomentTests.nonintegral_third: the measure need not take values in Z_3.
example :
    let μ : D(ℤ_[3],ℚ_[3]) := (1 / 3 : ℚ_[3]) • dirac ℚ_[3] (2 : ℤ_[3])
    constantCoeff ((mahlerDerivation ℚ_[3])^[3] μ.amiceTransform) = 8 / 3 ∧
      coeff 3 μ.amiceTransform = 0 := by sorry
-- AlgebraMomentTests.factorial: omitting 3! changes 8/3 into 4/9.
example :
    let μ : D(ℤ_[3],ℚ_[3]) := (1 / 3 : ℚ_[3]) • dirac ℚ_[3] (2 : ℤ_[3])
    coeff 3 (subst (exp ℚ_[3] - 1) μ.amiceTransform) = 4 / 9 := by sorry
-- AlgebraMomentTests.weight_zero_atom: multiplication by the coordinate is not injective.
example :
    let xQ : C(ℤ_[2],ℚ_[2]) := (ContinuousMap.id ℤ_[2]) • 1
    weight xQ (dirac ℚ_[2] (0 : ℤ_[2])) = 0 := by sorry
end SuggestedTests.AlgebraMoments

/-! Reconstruction of integral unit measures from compatible finite coefficients.
The input is an explicit family and its transition law. This is not a new
completed group-algebra carrier. -/
noncomputable section
open scoped AbstractMeasure
namespace AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
variable (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
variable (hc : ∀ {m n : ℕ} (h : m ≤ n),
  Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m)

include hc in
theorem unitCoordinate_pairing_refinement (m n : ℕ) (h : m ≤ n)
    (g : (ZMod (p^m))ˣ → ℤ_[p]) :
    ∑ a, g a * c m a =
      ∑ b, g (ZMod.unitsMap (pow_dvd_pow p h) b) * c n b := by sorry
include hc in
theorem unitCoordinate_pairing_independent (m n : ℕ)
    (g : (ZMod (p^m))ˣ → ℤ_[p]) (h : (ZMod (p^n))ˣ → ℤ_[p])
    (heq : g ∘ (PadicInt.unitsToZModPow (p := p) m).toMonoidHom = h ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom) :
    ∑ a, g a * c m a = ∑ b, h b * c n b := by sorry

def unitCoordinateIntegral (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hc : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m) : LocallyConstant (ℤ_[p])ˣ ℤ_[p] →ₗ[ℤ_[p]] ℤ_[p] := by sorry
theorem unitCoordinateIntegral_factor (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p])
    (n : ℕ) (g : (ZMod (p^n))ˣ → ℤ_[p])
    (hg : g ∘ (PadicInt.unitsToZModPow (p := p) n).toMonoidHom = f) :
    unitCoordinateIntegral p c hc f = ∑ a, g a * c n a := by sorry
theorem unitCoordinateIntegral_norm_le (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    ‖unitCoordinateIntegral p c hc f‖ ≤ ‖f.toContinuousMap‖ := by sorry
theorem unitCoordinateIntegral_zero : unitCoordinateIntegral p c hc 0 = 0 := by sorry
theorem unitCoordinateIntegral_add (f g : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    unitCoordinateIntegral p c hc (f+g) =
      unitCoordinateIntegral p c hc f + unitCoordinateIntegral p c hc g := by sorry
theorem unitCoordinateIntegral_smul (a : ℤ_[p]) (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    unitCoordinateIntegral p c hc (a • f) = a * unitCoordinateIntegral p c hc f := by sorry

def ofUnitCoordinates (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hc : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m) : D((ℤ_[p])ˣ,ℤ_[p]) := by sorry
theorem ofUnitCoordinates_locallyConstant (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) :
    ofUnitCoordinates p c hc f.toContinuousMap = unitCoordinateIntegral p c hc f := by sorry
theorem ofUnitCoordinates_norm_le (f : C((ℤ_[p])ˣ,ℤ_[p])) :
    ‖ofUnitCoordinates p c hc f‖ ≤ ‖f‖ := by sorry
theorem finiteProjection_ofUnitCoordinates (n : ℕ) :
    finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩
      (ofUnitCoordinates p c hc) = c n := by sorry
theorem ofUnitCoordinates_mass :
    ofUnitCoordinates p c hc (ContinuousMap.const _ 1) = c 0 1 := by sorry
theorem ofUnitCoordinates_zero
    (h0 : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (0 : (ZMod (p^n))ˣ →₀ ℤ_[p]) = 0) :
    ofUnitCoordinates p (fun _ => 0) h0 = 0 := by sorry
theorem ofUnitCoordinates_add
    (d : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hd : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (d n) = d m)
    (hcd : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n+d n) = c m+d m) :
    ofUnitCoordinates p (fun n => c n+d n) hcd =
      ofUnitCoordinates p c hc + ofUnitCoordinates p d hd := by sorry
theorem ofUnitCoordinates_smul (a : ℤ_[p])
    (hac : ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (a • c n) = a • c m) :
    ofUnitCoordinates p (fun n => a • c n) hac = a • ofUnitCoordinates p c hc := by sorry

include hc in
theorem existsUnique_ofUnitCoordinates : ∃! μ : D((ℤ_[p])ˣ,ℤ_[p]),
    ∀ n, finiteProjection
      ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ = c n := by sorry

theorem unitCoordinates_compatible (μ : D((ℤ_[p])ˣ,ℤ_[p])) {m n : ℕ} (h : m ≤ n) :
    Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h))
      (finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ) =
      finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) m).toMonoidHom, (PadicInt.unitsToZModPow (p := p) m).continuous⟩ μ := by sorry
theorem ofUnitCoordinates_finiteProjection (μ : D((ℤ_[p])ˣ,ℤ_[p])) :
    ofUnitCoordinates p
      (fun n => finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ)
      (fun h => unitCoordinates_compatible p μ h) = μ := by sorry
end AbstractMeasure

namespace UnitCoordinateTests
open AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
variable (c : ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
variable (hc : ∀ {m n : ℕ} (h : m ≤ n),
  Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c n) = c m)
-- UnitCoordinateTests.lc_zero: even nonzero coordinates annihilate the zero test.
example : unitCoordinateIntegral p c hc 0 = 0 := by sorry
-- UnitCoordinateTests.lc_constant: the zero group level records total mass.
example (a : ℤ_[p]) : unitCoordinateIntegral p c hc (LocallyConstant.const _ a) = a * c 0 1 := by sorry
-- UnitCoordinateTests.lc_dirac: no averaging factor appears.
example (u : (ℤ_[p])ˣ) (a : ℤ_[p])
    (hca : ∀ n, c n = Finsupp.single ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom u) a)
    (f : LocallyConstant (ℤ_[p])ˣ ℤ_[p]) : unitCoordinateIntegral p c hc f = a * f u := by sorry
-- UnitCoordinateTests.zero: a zero family gives the zero measure.
example (hcz : ∀ n, c n = 0) : ofUnitCoordinates p c hc = 0 := by sorry
-- UnitCoordinateTests.dirac: Dirac compatibility, with arbitrary integral mass.
example (u : (ℤ_[p])ˣ) (a : ℤ_[p])
    (hca : ∀ n, c n = Finsupp.single ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom u) a) :
    ofUnitCoordinates p c hc = a • dirac ℤ_[p] u := by sorry
-- UnitCoordinateTests.mass_not_average: two atoms contribute the sum of their masses.
example (u v : (ℤ_[p])ˣ)
    (hca : ∀ n, c n = 2 • Finsupp.single ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom u) 1 +
      3 • Finsupp.single ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom v) 1) :
    ofUnitCoordinates p c hc (ContinuousMap.const _ 1) = 5 := by sorry
-- UnitCoordinateTests.dyadic_first_depth: shallow group quotients do not determine a measure.
example : finiteProjection
    ⟨(PadicInt.unitsToZModPow (p := 2) 1).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 1).continuous⟩
    (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)-dirac ℤ_[2] (-1)) = 0 := by sorry
-- UnitCoordinateTests.dyadic_second_depth: both integral signs survive at depth two.
example : finiteProjection
    ⟨(PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 2).continuous⟩
    (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)-dirac ℤ_[2] (-1)) ≠ 0 := by sorry
end UnitCoordinateTests
end

/-! Weak topology from the finite unit coordinates. These are adapters on
existing measures and function products, not a second completed group algebra. -/
noncomputable section
open scoped AbstractMeasure Topology
namespace AbstractMeasure
variable (p : ℕ) [Fact p.Prime]
local notation "M" => D((ℤ_[p])ˣ,ℤ_[p])
set_option quotPrecheck false in
local notation "Q" => fun n : ℕ =>
  (ContinuousMap.mk ((PadicInt.unitsToZModPow (p := p) n).toMonoidHom) ((PadicInt.unitsToZModPow (p := p) n).continuous) :
    C((ℤ_[p])ˣ,(ZMod (p^n))ˣ))

theorem compactSpace_unitMeasures_weak :
    letI : TopologicalSpace M := WeakTopology
    CompactSpace M := by sorry

theorem isClosedEmbedding_unitCoordinates_weak :
    letI : TopologicalSpace M := WeakTopology
    Topology.IsClosedEmbedding (fun μ : M => fun (n : ℕ) (a : (ZMod (p^n))ˣ) =>
      finiteProjection (Q n) μ a) := by sorry

theorem range_unitCoordinates :
    Set.range (fun μ : M => fun (n : ℕ) (a : (ZMod (p^n))ˣ) => finiteProjection (Q n) μ a) =
      {c : ∀ n : ℕ, (ZMod (p^n))ˣ → ℤ_[p] |
        ∀ {m n : ℕ} (h : m ≤ n),
          Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h))
            (Finsupp.equivFunOnFinite.symm (c n)) = Finsupp.equivFunOnFinite.symm (c m)} := by sorry

theorem continuous_ofUnitCoordinates {X : Type*} [TopologicalSpace X]
    (c : X → ∀ n : ℕ, (ZMod (p^n))ˣ →₀ ℤ_[p])
    (hc : ∀ x, ∀ {m n : ℕ} (h : m ≤ n),
      Finsupp.mapDomain (ZMod.unitsMap (pow_dvd_pow p h)) (c x n) = c x m)
    (hcont : ∀ n a, Continuous (fun x => c x n a)) :
    letI : TopologicalSpace M := WeakTopology
    Continuous (fun x => ofUnitCoordinates p (c x) (hc x)) := by sorry

theorem isClosedEmbedding_jointUnitCoordinates_weak :
    letI : TopologicalSpace M := WeakTopology
    Topology.IsClosedEmbedding (fun μ : M => fun (r n : ℕ) (a : (ZMod (p^n))ˣ) =>
      jointFiniteProjection p r (Q n) μ a) := by sorry

theorem tendsto_unitMeasures_weak_iff_joint {ι : Type*} (l : Filter ι)
    (μ : ι → M) (ν : M) :
    letI : TopologicalSpace M := WeakTopology
    Filter.Tendsto μ l (𝓝 ν) ↔ ∀ r n, ∀ᶠ i in l,
      jointFiniteProjection p r (Q n) (μ i) = jointFiniteProjection p r (Q n) ν := by sorry

theorem hasBasis_unitMeasures_weak_zero :
    letI : TopologicalSpace M := WeakTopology
    (𝓝 (0 : M)).HasBasis (fun _ : ℕ × ℕ => True)
      (fun k => {μ : M | jointFiniteProjection p k.1 (Q k.2) μ = 0}) := by sorry

theorem hasBasis_unitMeasures_weak_zero_diagonal :
    letI : TopologicalSpace M := WeakTopology
    (𝓝 (0 : M)).HasBasis (fun _ : ℕ => True)
      (fun k => {μ : M | jointFiniteProjection p k (Q k) μ = 0}) := by sorry

theorem unitMeasures_isTopologicalRing_weak :
    letI : TopologicalSpace M := WeakTopology
    IsTopologicalRing M := by sorry

theorem unitMeasures_isLinearTopology_weak :
    letI : TopologicalSpace M := WeakTopology
    IsLinearTopology M M := by sorry
end AbstractMeasure

namespace UnitCoordinateTopologyTests
open AbstractMeasure
-- UnitCoordinateTopologyTests.scaled_atoms: coefficient precision is topological data.
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    Filter.Tendsto (fun k : ℕ => (p : ℤ_[p])^k • dirac ℤ_[p] (1 : (ℤ_[p])ˣ))
      Filter.atTop (𝓝 0) := by sorry
-- UnitCoordinateTopologyTests.constant_atom: depth without coefficient precision is insufficient.
example :
    letI : TopologicalSpace D((ℤ_[2])ˣ,ℤ_[2]) := WeakTopology
    ¬ Filter.Tendsto (fun _ : ℕ => dirac ℤ_[2] (1 : (ℤ_[2])ˣ)) Filter.atTop (𝓝 0) := by sorry
-- UnitCoordinateTopologyTests.incompatible_mass: the ambient coordinate product is larger than the image.
example (p : ℕ) [Fact p.Prime] :
    ¬ ∃ μ : D((ℤ_[p])ˣ,ℤ_[p]),
      finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) 0).toMonoidHom, (PadicInt.unitsToZModPow (p := p) 0).continuous⟩ μ =
        Finsupp.single 1 1 ∧
      finiteProjection ⟨(PadicInt.unitsToZModPow (p := p) 1).toMonoidHom, (PadicInt.unitsToZModPow (p := p) 1).continuous⟩ μ = 0 := by sorry
-- UnitCoordinateTopologyTests.independent_precisions: either shallow axis loses information.
example :
    let μ := (2 : ℤ_[2]) • (dirac ℤ_[2] (1 : (ℤ_[2])ˣ)-dirac ℤ_[2] (-1))
    jointFiniteProjection 2 1 ⟨(PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 2).continuous⟩ μ = 0 ∧
    jointFiniteProjection 2 2 ⟨(PadicInt.unitsToZModPow (p := 2) 1).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 1).continuous⟩ μ = 0 ∧
    jointFiniteProjection 2 2 ⟨(PadicInt.unitsToZModPow (p := 2) 2).toMonoidHom, (PadicInt.unitsToZModPow (p := 2) 2).continuous⟩ μ ≠ 0 := by sorry
-- UnitCoordinateTopologyTests.zero_precision: a basis member may be the whole space.
example (p : ℕ) [Fact p.Prime] (n : ℕ) :
    {μ : D((ℤ_[p])ˣ,ℤ_[p]) | jointFiniteProjection p 0
      ⟨(PadicInt.unitsToZModPow (p := p) n).toMonoidHom, (PadicInt.unitsToZModPow (p := p) n).continuous⟩ μ = 0} = Set.univ := by sorry
-- UnitCoordinateTopologyTests.dirac_parameter: the inverse coordinate topology agrees with existing Dirac.
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    Continuous (dirac ℤ_[p] : (ℤ_[p])ˣ → D((ℤ_[p])ˣ,ℤ_[p])) := by sorry
-- UnitCoordinateTopologyTests.convolution_limits: joint weak continuity, not only separate continuity.
example (p : ℕ) [Fact p.Prime] :
    letI : TopologicalSpace D((ℤ_[p])ˣ,ℤ_[p]) := WeakTopology
    Continuous (fun z : D((ℤ_[p])ˣ,ℤ_[p]) × D((ℤ_[p])ˣ,ℤ_[p]) => z.1*z.2) := by sorry
-- UnitCoordinateTopologyTests.dyadic_square: integral signs do not split into eigenspaces.
example :
    let μ := dirac ℤ_[2] (-1 : (ℤ_[2])ˣ)-dirac ℤ_[2] 1
    μ*μ = (-2 : ℤ_[2]) • μ := by sorry
end UnitCoordinateTopologyTests
end

/-! Comparison with the completed group algebra (§1.7). The carrier is Tau Ceti's
`TauCeti.completedGroupAlgebra ℤ_[p] Γ`
(`TauCeti.Topology.Algebra.Group.Profinite.CompletedGroupAlgebra.Basic`), with
`completedGroupAlgebra.proj` to the finite levels and `completedGroupAlgebra.of` for the image of
a group element; a cofinal tower of finite quotients presents the same ring. -/
noncomputable section
open scoped AbstractMeasure
namespace AbstractMeasure
section CompletedGroupAlgebra
variable (p : ℕ) [Fact p.Prime]
variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ] [CompactSpace Γ]
  [TotallyDisconnectedSpace Γ]
variable {A : ℕ → Type*} [∀ n, Group (A n)] [∀ n, Fintype (A n)] [∀ n, TopologicalSpace (A n)]
  [∀ n, DiscreteTopology (A n)]

/-- §1.7: a countable tower of finite quotients of a topological group
`Γ`: continuous surjections `q n : Γ →* A n` with transition maps `t h : A n →* A m` for
`m ≤ n`, compatible with the `q`, whose kernels separate points. -/
structure FiniteQuotientTower (Γ : Type*) [Group Γ] [TopologicalSpace Γ]
    (A : ℕ → Type*) [∀ n, Group (A n)] [∀ n, TopologicalSpace (A n)] where
  q : ∀ n, Γ →* A n
  continuous_q : ∀ n, Continuous (q n)
  surjective_q : ∀ n, Function.Surjective (q n)
  t : ∀ {m n : ℕ}, m ≤ n → (A n →* A m)
  t_q : ∀ {m n : ℕ} (h : m ≤ n) (x : Γ), t h (q n x) = q m x
  separates : ∀ x : Γ, x ≠ 1 → ∃ n, q n x ≠ 1

theorem FiniteQuotientTower.t_comp (T : FiniteQuotientTower Γ A) {k m n : ℕ} (hkm : k ≤ m)
    (hmn : m ≤ n) (x : Γ) : T.t hkm (T.t hmn (T.q n x)) = T.t (hkm.trans hmn) (T.q n x) := sorry
theorem FiniteQuotientTower.ker_cofinal (T : FiniteQuotientTower Γ A) (U : Subgroup Γ)
    (hU : IsOpen (U : Set Γ)) : ∃ n, (T.q n).ker ≤ U := sorry
/-- The tower `red_n : ℤ_pˣ → (ℤ/pⁿ)ˣ` of the units. -/
def FiniteQuotientTower.unitTower :
    FiniteQuotientTower (ℤ_[p])ˣ (fun n => (ZMod (p ^ n))ˣ) := sorry
/-- The tower `ρ_n : ℤ_p → ℤ/pⁿ` of the additive group, written multiplicatively. -/
def FiniteQuotientTower.padicTower :
    FiniteQuotientTower (Multiplicative ℤ_[p]) (fun n => Multiplicative (ZMod (p ^ n))) := sorry

-- test unitTower_q (agreement) [§1.7]
example (n : ℕ) : (FiniteQuotientTower.unitTower p).q n = (PadicInt.unitsToZModPow (p := p) n).toMonoidHom := sorry
-- test constant_tower_finite (degenerate) [§1.7]
example {B : Type*} [Group B] [Fintype B] [TopologicalSpace B] [DiscreteTopology B] :
    Nonempty (FiniteQuotientTower B (fun _ => B)) ∧
      ∀ T : FiniteQuotientTower B (fun _ => B), (∀ n, T.q n = MonoidHom.id B) →
        ∀ {m n : ℕ} (h : m ≤ n), T.t h = MonoidHom.id B := sorry
-- test trivial_maps_not_a_tower (non-example) [§1.7]
example [Nontrivial Γ] :
    ¬ ∃ T : FiniteQuotientTower Γ (fun _ => PUnit), ∀ n, T.q n = 1 := sorry

/-- §1.7: the `ℤ_p`-algebra map from integral measures on `Γ` to
Tau Ceti's completed group algebra `ℤ_p⟦Γ⟧`, whose projection to the level `Γ ⧸ U` is the finite
algebra projection along `Γ → Γ ⧸ U`. -/
def toCompletedGroupAlgebra : D(Γ,ℤ_[p]) →ₐ[ℤ_[p]] TauCeti.completedGroupAlgebra ℤ_[p] Γ := sorry
theorem toCompletedGroupAlgebra_apply (μ : D(Γ,ℤ_[p])) (U : OpenNormalSubgroup Γ)
    [Fintype (Γ ⧸ U.toSubgroup)] [DiscreteTopology (Γ ⧸ U.toSubgroup)] :
    TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U (toCompletedGroupAlgebra p μ) =
      finiteProjectionAlgHom (QuotientGroup.mk' U.toSubgroup) continuous_quotient_mk' μ := sorry
theorem toCompletedGroupAlgebra_dirac (x : Γ) :
    toCompletedGroupAlgebra p (dirac ℤ_[p] x) = TauCeti.completedGroupAlgebra.of ℤ_[p] Γ x := sorry
theorem toCompletedGroupAlgebra_injective :
    Function.Injective (toCompletedGroupAlgebra p (Γ := Γ)) := sorry
/-- Every compatible family of finite-level coefficients comes from a measure (RJW 3.16). -/
theorem toCompletedGroupAlgebra_surjective :
    Function.Surjective (toCompletedGroupAlgebra p (Γ := Γ)) := sorry
theorem isClosedEmbedding_toCompletedGroupAlgebra :
    letI : TopologicalSpace D(Γ,ℤ_[p]) := WeakTopology
    Topology.IsClosedEmbedding (toCompletedGroupAlgebra p (Γ := Γ)) := sorry
theorem compactSpace_integralMeasures_weak_of_tower (T : FiniteQuotientTower Γ A) :
    letI : TopologicalSpace D(Γ,ℤ_[p]) := WeakTopology
    CompactSpace D(Γ,ℤ_[p]) := sorry

-- test dirac_product_levels (computation) [§1.7]
example (x y : Γ) (U : OpenNormalSubgroup Γ) :
    TauCeti.completedGroupAlgebra.proj ℤ_[p] Γ U
        (toCompletedGroupAlgebra p (dirac ℤ_[p] x * dirac ℤ_[p] y)) =
      MonoidAlgebra.single (QuotientGroup.mk (x * y) : Γ ⧸ U.toSubgroup) 1 := sorry
-- test dirac_separated (non-example) [§1.7]
example (x y : Γ) (hxy : x ≠ y) :
    toCompletedGroupAlgebra p (dirac ℤ_[p] x) ≠ toCompletedGroupAlgebra p (dirac ℤ_[p] y) := sorry
-- test dirac_one (degenerate) [§1.7]
example : toCompletedGroupAlgebra p (dirac ℤ_[p] (1 : Γ)) = 1 := sorry

/-- §1.7: coefficient extension along a finite free `ℤ_p`-algebra. -/
def completedGroupAlgebraBaseChange (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O]
    [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O] :
    TensorProduct ℤ_[p] O D(Γ,ℤ_[p]) ≃ₗ[O] D(Γ,O) := sorry
theorem completedGroupAlgebraBaseChange_tmul_dirac (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O]
    [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O] (a : O) (x : Γ) :
    completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] a (dirac ℤ_[p] x)) =
      a • dirac O x := sorry
theorem completedGroupAlgebraBaseChange_mul (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O]
    [Module.Free ℤ_[p] O] [Module.Finite ℤ_[p] O] (a b : O) (μ ν : D(Γ,ℤ_[p])) :
    completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] (a * b) (μ * ν)) =
      completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] a μ) *
        completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] b ν) := sorry

-- test baseChange_padicInt (degenerate) [§1.7]
example (μ : D(Γ,ℤ_[p])) :
    completedGroupAlgebraBaseChange p ℤ_[p] (TensorProduct.tmul ℤ_[p] 1 μ) = μ := sorry
-- test baseChange_one_tmul_dirac (computation) [§1.7]
example (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O]
    [Module.Finite ℤ_[p] O] (x : Γ) :
    completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] 1 (dirac ℤ_[p] x)) =
      dirac O x := sorry
-- test baseChange_injective_on_basis (non-example) [§1.7]
example (O : Type*) [NormedCommRing O] [Algebra ℤ_[p] O] [Module.Free ℤ_[p] O]
    [Module.Finite ℤ_[p] O] (a b : O) (hab : a ≠ b) (x : Γ) :
    completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] a (dirac ℤ_[p] x)) ≠
      completedGroupAlgebraBaseChange p O (TensorProduct.tmul ℤ_[p] b (dirac ℤ_[p] x)) := sorry
end CompletedGroupAlgebra
end AbstractMeasure
end

/-! ## §1.7: extension of coefficients along a bounded ring map

The map `ι_j : D(X, O) → D(X, K)` for a profinite `X`, a normed commutative ring `O`, a
nonarchimedean nontrivially normed field `K` and a continuous ring homomorphism `j : O → K` with
`‖j a‖ ≤ ‖a‖` (the case of use: `O` the valuation ring of a finite extension of `ℚ_p` inside
`ℂ_p`, `j` the inclusion). It is determined by `ι_j(μ)(j ∘ f) = j(μ f)` on test functions; it is
`j`-semilinear, commutes with pushforward, is a ring homomorphism for the convolutions on a
profinite monoid, and is compatible with the admissible evaluation of pseudo-measures of L3. It is
an extension map; nothing is asserted about its image. L3a defines the bounded functions `F_μ`
on the character space through it. -/
namespace AbstractMeasure
noncomputable section
section CoefficientExtension

variable {X : Type*} [TopologicalSpace X] [CompactSpace X] [T2Space X]
  [TotallyDisconnectedSpace X]
variable (O K : Type*) [NormedCommRing O] [NontriviallyNormedField K] [IsUltrametricDist K]
variable (j : O →+* K)

/-- §1.7: `ι_j : D(X, O) →+ D(X, K)`, the additive map with
`ι_j(μ)(j ∘ f) = j(μ f)`; on a locally constant `Σ cᵢ 1_{Uᵢ}` its value is `Σ cᵢ j(μ(1_{Uᵢ}))`,
extended by continuity using the ultrametric bound `‖Σ cᵢ j(μ 1_{Uᵢ})‖ ≤ max ‖cᵢ‖ · sup ‖j(μ 1_U)‖`. -/
def extendCoefficients (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) : D(X, O) →+ D(X, K) := sorry

theorem extendCoefficients_apply_comp (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) (μ : D(X, O)) (f : C(X, O)) :
    extendCoefficients O K j hj hjc μ ((ContinuousMap.mk j hjc).comp f) = j (μ f) := sorry
theorem extendCoefficients_smul (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) (a : O) (μ : D(X, O)) :
    extendCoefficients O K j hj hjc (a • μ) = j a • extendCoefficients O K j hj hjc μ := sorry
theorem extendCoefficients_dirac (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) (x : X) :
    extendCoefficients O K j hj hjc (dirac O x) = dirac K x := sorry
theorem extendCoefficients_map (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) {Y : Type*} [TopologicalSpace Y] [CompactSpace Y] [T2Space Y]
    [TotallyDisconnectedSpace Y] (φ : C(X, Y)) (μ : D(X, O)) :
    extendCoefficients O K j hj hjc (map φ μ) = map φ (extendCoefficients O K j hj hjc μ) := sorry
/-- Injectivity for an isometric `j` into a complete field (the image of `j` is then closed). -/
theorem extendCoefficients_injective (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) [CompleteSpace K] (hiso : Isometry j) :
    Function.Injective (extendCoefficients O K j hj hjc (X := X)) := sorry
/-- The operator-norm bound on the field-valued carrier; this is the meaning of `‖μ‖` for an
`O`-valued measure in L3a, where no norm is installed on `D(X, O)` itself. -/
theorem norm_toCLMEquiv_extendCoefficients_le (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) (hj1 : ∀ a, ‖j a‖ ≤ 1) (μ : D(X, O)) :
    ‖toCLMEquiv (extendCoefficients O K j hj hjc μ)‖ ≤ 1 := sorry

variable [CommMonoid X] [ContinuousMul X] [LocallyCompactSpace X]

/-- `ι_j` as a ring homomorphism for the right-handed convolutions of a profinite monoid. -/
def extendCoefficientsRingHom (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) : D(X, O) →+* D(X, K) := sorry
theorem coe_extendCoefficientsRingHom (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) :
    ⇑(extendCoefficientsRingHom O K j hj hjc (X := X)) = ⇑(extendCoefficients O K j hj hjc (X := X)) := sorry
theorem extendCoefficients_mul (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) (μ ν : D(X, O)) :
    extendCoefficients O K j hj hjc (μ * ν) =
      extendCoefficients O K j hj hjc μ * extendCoefficients O K j hj hjc ν := sorry
/-- Compatibility with the admissible evaluation of L3 (`Iwasawa.evalAt_spec` transported along
`ι_j`): the extended cleared numerator is the cleared numerator of the extended pseudo-measure. -/
theorem extendCoefficients_numerator_evalAt (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) {G : Type*} [Group G] (δ : G →* D(X, O))
    (Q : Type*) [CommRing Q] [Algebra D(X, O) Q] [IsFractionRing D(X, O) Q] (g : G)
    (z : Iwasawa.pseudomeasures δ Q) :
    letI : Algebra D(X, O) D(X, K) := (extendCoefficientsRingHom O K j hj hjc).toAlgebra
    ∀ hg : IsUnit (algebraMap D(X, O) D(X, K) (δ g - 1)),
      extendCoefficients O K j hj hjc (δ g - 1) * Iwasawa.evalAt δ Q D(X, K) g hg z =
        extendCoefficients O K j hj hjc (Iwasawa.numerator δ Q g z) := sorry

-- test extendCoefficients_id (degenerate) [§1.7]
example (μ : D(X, K)) :
    extendCoefficients K K (RingHom.id K) (fun _ => le_rfl) continuous_id μ = μ := sorry
-- test extendCoefficients_dirac_apply (computation) [§1.7]
example (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) (x : X) (f : C(X, K)) :
    extendCoefficients O K j hj hjc (dirac O x) f = f x := sorry
-- test extendCoefficients_two_smul (non-example) [§1.7]
-- a map forgetting the coefficient would send `2 δ_x` to `δ_x`.
example (hj : ∀ a, ‖j a‖ ≤ ‖a‖) (hjc : Continuous j) [CharZero K] (x : X) :
    extendCoefficients O K j hj hjc ((2 : O) • dirac O x) ≠
      extendCoefficients O K j hj hjc (dirac O x) := sorry

end CoefficientExtension
end
end AbstractMeasure

/-! Continuous-character integration and positive moments on unit measures.
No completed group algebra or total-fraction-ring character extension is assumed. -/
namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section CharacterIntegration
variable {G R : Type*} [TopologicalSpace G] [Monoid G] [ContinuousMul G]
  [LocallyCompactSpace G] [CommRing R] [TopologicalSpace R] [IsTopologicalRing R]

/- The Dirac monoid homomorphism `AbstractMeasure.diracHom : G →* D(G,R)` and `diracHom_apply` are Mathlib
(`Mathlib.NumberTheory.Padics.Measure.Monoid`); `diracHom_pow` is `map_pow` and `diracHom_map` is
`map_dirac`. -/

def characterIntegralAlgHom (κ : ContinuousMonoidHom G R) : D(G,R) →ₐ[R] R := sorry
theorem characterIntegralAlgHom_apply (κ : ContinuousMonoidHom G R) (μ : D(G,R)) :
    characterIntegralAlgHom κ μ = μ κ.toContinuousMap := sorry
theorem characterIntegralAlgHom_dirac (κ : ContinuousMonoidHom G R) (g : G) :
    characterIntegralAlgHom κ (dirac R g) = κ g := sorry
theorem characterIntegralAlgHom_one_character (μ : D(G,R)) :
    characterIntegralAlgHom (1 : ContinuousMonoidHom G R) μ = μ 1 := sorry
theorem characterIntegralAlgHom_diracHom (κ : ContinuousMonoidHom G R) :
    (characterIntegralAlgHom κ).toMonoidHom.comp (diracHom (R := R)) = κ.toMonoidHom := sorry

-- UnitMomentTests.dirac_hom_one
example : diracHom (G := G) (R := R) 1 = 1 := sorry
-- UnitMomentTests.dirac_hom_zero_coefficients
example (g : G) : diracHom (R := ZMod 1) g = 0 := sorry
-- UnitMomentTests.dirac_hom_product
example (g h : G) : diracHom (R := R) (g*h) = dirac R g * dirac R h := sorry
-- UnitMomentTests.character_zero
example (κ : ContinuousMonoidHom G R) : characterIntegralAlgHom κ 0 = 0 := sorry
-- UnitMomentTests.character_identity_mass
example (κ : ContinuousMonoidHom G R) : characterIntegralAlgHom κ 1 = 1 := sorry
-- UnitMomentTests.character_scalar_atom
example (κ : ContinuousMonoidHom G R) (c : R) (g : G) :
    characterIntegralAlgHom κ (c • dirac R g) = c * κ g := sorry
end CharacterIntegration

section PositiveMoments
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local notation "uTest" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))
local notation "j" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))


-- The inherited ring operations are unchanged; use the existing commutativity theorem locally.

theorem polynomial_apply_eq_zero_of_positive_moments (μ : D(Z,Z))
    (hμ : ∀ k : ℕ, 0 < k → μ ((ContinuousMap.id Z)^k) = 0)
    (f : Polynomial Z) (hf : f.coeff 0 = 0) :
    μ ⟨fun x => f.eval x, by fun_prop⟩ = 0 := sorry
theorem mahler_apply_eq_zero_of_positive_moments (μ : D(Z,Z))
    (hμ : ∀ k : ℕ, 0 < k → μ ((ContinuousMap.id Z)^k) = 0)
    (n : ℕ) (hn : 0 < n) : μ (mahler n) = 0 := sorry
theorem amice_eq_constant_of_positive_moments (μ : D(Z,Z))
    (hμ : ∀ k : ℕ, 0 < k → μ ((ContinuousMap.id Z)^k) = 0) :
    μ.amiceTransform = PowerSeries.C (μ 1) := sorry

theorem units_eq_zero_of_positive_moments (μ : M)
    (hμ : ∀ k : ℕ, 0 < k → μ (uTest^k) = 0) : μ = 0 := sorry
theorem units_mul_moment (μ ν : M) (k : ℕ) :
    (μ*ν) (uTest^k) = μ (uTest^k) * ν (uTest^k) := sorry
theorem units_regular_of_positive_moments (μ : M)
    (hμ : ∀ k : ℕ, 0 < k → μ (uTest^k) ≠ 0) : μ ∈ nonZeroDivisors M := sorry
theorem exists_one_add_prime_unit : ∃ a : U, (a : Z) = (p+1 : ℕ) := sorry
theorem one_add_prime_unit_pow_ne_one (a : U) (ha : (a : Z) = (p+1 : ℕ))
    (k : ℕ) (hk : 0 < k) : (a : Z)^k ≠ 1 := sorry
theorem dirac_sub_one_regular (a : U) (ha : ∀ k : ℕ, 0 < k → (a : Z)^k ≠ 1) :
    dirac Z a - 1 ∈ nonZeroDivisors M := sorry
theorem one_add_prime_dirac_sub_one_regular (a : U) (ha : (a : Z) = (p+1 : ℕ)) :
    dirac Z a - 1 ∈ nonZeroDivisors M := sorry

local notation "Q" => FractionRing M
local notation "PM" => Iwasawa.pseudomeasures (diracHom (G := U) (R := Z)) Q

def positivePseudoMoment (k : ℕ) (hk : 0 < k) : PM → ℚ_[p] := sorry
theorem positivePseudoMoment_eq (k : ℕ) (hk : 0 < k) (a : U)
    (ha : (a : Z) = (p+1 : ℕ)) (z : PM) :
    positivePseudoMoment p k hk z =
      ((Iwasawa.numerator (diracHom (G := U) (R := Z)) Q a z) (uTest^k) : ℚ_[p]) /
        ((a : Z)^k-1 : Z) := sorry
theorem positivePseudoMoment_integral (k : ℕ) (hk : 0 < k) (μ : M) :
    positivePseudoMoment p k hk (Iwasawa.integral (diracHom (G := U) (R := Z)) Q μ) =
      (μ (uTest^k) : ℚ_[p]) := sorry
theorem positivePseudoMoment_add (k : ℕ) (hk : 0 < k) (z η : PM) :
    positivePseudoMoment p k hk (z+η) =
      positivePseudoMoment p k hk z + positivePseudoMoment p k hk η := sorry
theorem positivePseudoMoment_smul (k : ℕ) (hk : 0 < k) (μ : M) (z : PM) :
    positivePseudoMoment p k hk (μ • z) =
      (μ (uTest^k) : ℚ_[p]) * positivePseudoMoment p k hk z := sorry
theorem positivePseudoMoment_numerator (k : ℕ) (hk : 0 < k) (g : U) (z : PM) :
    ((Iwasawa.numerator (diracHom (G := U) (R := Z)) Q g z) (uTest^k) : ℚ_[p]) =
      (((g : Z)^k-1 : Z) : ℚ_[p]) * positivePseudoMoment p k hk z := sorry
theorem pseudomeasure_eq_zero_of_positive_moments (z : PM)
    (hz : ∀ (k : ℕ) (hk : 0 < k), positivePseudoMoment p k hk z = 0) : z = 0 := sorry

theorem no_totalMass_fraction_extension :
    ¬ ∃ F : Q →+* Z, F.comp (algebraMap M Q) =
      (characterIntegralAlgHom (1 : ContinuousMonoidHom U Z)).toRingHom := sorry

-- UnitMomentTests.ambient_zero_atom
example : (∀ k : ℕ, 0 < k → dirac Z (0 : Z) ((ContinuousMap.id Z)^k) = 0) ∧
    dirac Z (0 : Z) ≠ 0 := sorry
-- UnitMomentTests.even_moments_insufficient
example : (∀ k : ℕ, (dirac Z (1 : U)-dirac Z (-1 : U)) (uTest^(2*k)) = 0) ∧
    dirac Z (1 : U)-dirac Z (-1 : U) ≠ 0 := sorry
-- UnitMomentTests.torsion_difference
example : (dirac Z (-1 : U)-1) * (dirac Z (-1 : U)+1) = 0 ∧
    dirac Z (-1 : U)+1 ≠ 0 := sorry
-- UnitMomentTests.regular_identity
example : (1 : M) ∈ nonZeroDivisors M := sorry
-- UnitMomentTests.pseudomoment_zero
example (k : ℕ) (hk : 0 < k) : positivePseudoMoment p k hk 0 = 0 := sorry
-- UnitMomentTests.pseudomoment_one
example (k : ℕ) (hk : 0 < k) : positivePseudoMoment p k hk
    (Iwasawa.integral (diracHom (G := U) (R := Z)) Q 1) = 1 := sorry
-- UnitMomentTests.pseudomoment_sign
example (k : ℕ) (hk : 0 < k) : positivePseudoMoment p k hk
    (Iwasawa.integral (diracHom (G := U) (R := Z)) Q (dirac Z (-1 : U))) = (-1 : ℚ_[p])^k := sorry
end PositiveMoments
end
end AbstractMeasure

namespace AbstractMeasure
noncomputable section
open scoped AbstractMeasure
section UnitCharacterEvaluation
variable (p : ℕ) [Fact p.Prime]
local notation "Z" => ℤ_[p]
local notation "U" => Zˣ
local notation "M" => D(U,Z)
local notation "Q" => FractionRing M
local notation "δ" => (diracHom (G := U) (R := Z))
local notation "PM" => Iwasawa.pseudomeasures δ Q
local notation "uTest" => (ContinuousMap.mk Units.val Units.continuous_val : C(U,Z))

/-- The integral-character specialization, on the pseudomeasure module only. -/
def unitCharacterEval (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) : PM →+ ℚ_[p] := sorry
theorem unitCharacterEval_eq (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (g : U) (hg : κ g ≠ 1) (z : PM) :
    unitCharacterEval p κ hκ z =
      ((Iwasawa.numerator δ Q g z) κ.toContinuousMap : ℚ_[p]) / ((κ g-1 : Z) : ℚ_[p]) := sorry
theorem unitCharacterEval_integral (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (μ : M) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q μ) = (μ κ.toContinuousMap : ℚ_[p]) := sorry
theorem unitCharacterEval_smul (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (μ : M) (z : PM) :
    unitCharacterEval p κ hκ (μ • z) =
      (μ κ.toContinuousMap : ℚ_[p]) * unitCharacterEval p κ hκ z := sorry
theorem unitCharacterEval_dirac (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q (dirac Z g)) = (κ g : ℚ_[p]) := sorry
theorem unitCharacterEval_numerator (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (g : U) (z : PM) :
    ((Iwasawa.numerator δ Q g z) κ.toContinuousMap : ℚ_[p]) =
      ((κ g-1 : Z) : ℚ_[p]) * unitCharacterEval p κ hκ z := sorry

theorem unitCharacterEval_unique (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (L : PM →+ ℚ_[p])
    (hL : ∀ (μ : M) (z : PM), L (μ • z) = (μ κ.toContinuousMap : ℚ_[p]) * L z)
    (hI : ∀ μ : M, L (Iwasawa.integral δ Q μ) = (μ κ.toContinuousMap : ℚ_[p])) :
    L = unitCharacterEval p κ hκ := sorry
theorem unitCharacterEval_eq_positivePseudoMoment (κ : ContinuousMonoidHom U Z)
    (hκ : κ ≠ 1) (k : ℕ) (hk : 0 < k) (hpow : ∀ g : U, κ g = (g : Z)^k) (z : PM) :
    unitCharacterEval p κ hκ z = positivePseudoMoment p k hk z := sorry
theorem unitCharacterEval_ext (z η : PM)
    (h : ∀ (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1),
      unitCharacterEval p κ hκ z = unitCharacterEval p κ hκ η) : z = η := sorry
theorem unitCharacterEval_norm_le (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1)
    (g : U) (hg : κ g ≠ 1) (z : PM) :
    ‖unitCharacterEval p κ hκ z‖ ≤ ‖κ g-1‖⁻¹ := sorry

variable {S : Type*} [TopologicalSpace S]
theorem continuous_unitCharacterIntegral (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (μ : M) :
    Continuous (fun s => (μ (κ s).toContinuousMap : ℚ_[p])) := sorry
theorem isOpen_unitCharacterClearing (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (g : U) :
    IsOpen {s : S | κ s g ≠ 1} := sorry
theorem continuousOn_unitCharacterClearing (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (g : U) (z : PM) :
    ContinuousOn (fun s => ((Iwasawa.numerator δ Q g z) (κ s).toContinuousMap : ℚ_[p]) /
      ((κ s g-1 : Z) : ℚ_[p])) {s : S | κ s g ≠ 1} := sorry
theorem continuous_unitCharacterEval (κ : S → ContinuousMonoidHom U Z)
    (hκ : Continuous (fun s => (κ s).toContinuousMap)) (z : PM) :
    Continuous (fun s : {s : S // κ s ≠ 1} => unitCharacterEval p (κ s.val) s.property z) := sorry

-- UnitCharacterTests.zero
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) : unitCharacterEval p κ hκ 0 = 0 := sorry
-- UnitCharacterTests.one
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q 1) = 1 := sorry
-- UnitCharacterTests.scalar_atom
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (c : Z) (g : U) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q (c • dirac Z g)) = (c*κ g : Z) := sorry
-- UnitCharacterTests.trivial_character_no_patch
example (g : U) : (1 : ContinuousMonoidHom U Z) g-1 = 0 := sorry
-- UnitCharacterTests.torsion_clearing_allowed
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (hs : κ (-1) = -1) (z : PM) :
    unitCharacterEval p κ hκ z =
      ((Iwasawa.numerator δ Q (-1) z) κ.toContinuousMap : ℚ_[p]) / (-2) := sorry
-- UnitCharacterTests.kernel_numerator
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (g : U) (hg : κ g = 1) (z : PM) :
    ((Iwasawa.numerator δ Q g z) κ.toContinuousMap : ℚ_[p]) = 0 := sorry
-- UnitCharacterTests.dyadic_denominator_not_integral_unit
example : (-2 : ℚ_[2]) ≠ 0 ∧ ¬ IsUnit (-2 : ℤ_[2]) := sorry
-- UnitCharacterTests.constant_family
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (z : PM) :
    Continuous (fun _s : S => unitCharacterEval p κ hκ z) := sorry
-- UnitCharacterTests.power_sign
example (κ : ContinuousMonoidHom U Z) (hκ : κ ≠ 1) (k : ℕ)
    (hpow : ∀ g : U, κ g = (g : Z)^k) :
    unitCharacterEval p κ hκ (Iwasawa.integral δ Q (dirac Z (-1))) = (-1 : ℚ_[p])^k := sorry
end UnitCharacterEvaluation
end
end AbstractMeasure

/-! Residue-class restrictions on the existing bounded measure carrier.
No Fourier averaging or coefficient-field extension is implicit in these signatures. -/
namespace PadicInt
variable {p : ℕ} [Fact p.Prime]

theorem isClopen_toZModPow_fiber (n : ℕ) (a : ZMod (p ^ n)) :
    IsClopen {x : ℤ_[p] | toZModPow n x = a} := sorry

theorem toZModPow_eq_iff_sub_dvd (n : ℕ) (x b : ℤ_[p]) :
    toZModPow n x = toZModPow n b ↔ (p : ℤ_[p]) ^ n ∣ x - b := sorry
end PadicInt

namespace AbstractMeasure
section ResidueRestriction
variable (p : ℕ) [Fact p.Prime] (R : Type*) [NormedCommRing R]
local notation "Z" => ℤ_[p]
local notation "ρ" => PadicInt.toZModPow (p := p)
local notation "χ" => (fun (n : ℕ) (a : ZMod (p ^ n)) =>
  LocallyConstant.toContinuousMap (LocallyConstant.charFn R (PadicInt.isClopen_toZModPow_fiber n a)))

/-- Ambient restriction; intrinsic measures on the fiber use the existing restrictClopen. -/
def restrictResidue (n : ℕ) (a : ZMod (p ^ n)) : D(Z, R) →ₗ[R] D(Z, R) :=
  weight (χ n a)

theorem restrictResidue_apply (n : ℕ) (a : ZMod (p ^ n))
    (μ : D(Z, R)) (f : C(Z, R)) : restrictResidue p R n a μ f = μ (χ n a * f) := sorry

theorem restrictResidue_dirac (n : ℕ) (a : ZMod (p ^ n)) (x : Z) :
    restrictResidue p R n a (dirac R x) = if ρ n x = a then dirac R x else 0 := sorry

theorem restrictResidue_comp (n : ℕ) (a b : ZMod (p ^ n)) (μ : D(Z, R)) :
    restrictResidue p R n a (restrictResidue p R n b μ) =
      if a = b then restrictResidue p R n a μ else 0 := sorry

theorem sum_restrictResidue (n : ℕ) (μ : D(Z, R)) :
    ∑ a : ZMod (p ^ n), restrictResidue p R n a μ = μ := sorry

theorem restrictResidue_zero_depth (a : ZMod (p ^ 0)) (μ : D(Z, R)) :
    restrictResidue p R 0 a μ = μ := sorry

theorem restrictResidue_refinement (m n : ℕ) (h : m ≤ n)
    (a : ZMod (p ^ m)) (μ : D(Z, R)) :
    restrictResidue p R m a μ =
      ∑ b : ZMod (p ^ n), if ZMod.castHom (pow_dvd_pow p h) (ZMod (p ^ m)) b = a
        then restrictResidue p R n b μ else 0 := sorry

theorem restrictResidue_mass (n : ℕ) (a : ZMod (p ^ n)) (μ : D(Z, R)) :
    restrictResidue p R n a μ 1 =
      finiteProjection ⟨ρ n, PadicInt.continuous_toZModPow (p := p) n⟩ μ a := sorry

theorem finiteProjection_restrictResidue (n : ℕ) (a : ZMod (p ^ n)) (μ : D(Z, R)) :
    finiteProjection ⟨ρ n, PadicInt.continuous_toZModPow (p := p) n⟩ (restrictResidue p R n a μ) =
      Finsupp.single a (finiteProjection ⟨ρ n, PadicInt.continuous_toZModPow (p := p) n⟩ μ a) := sorry

theorem restrictResidue_map_add (n : ℕ) (a : ZMod (p ^ n)) (b : Z) (μ : D(Z, R)) :
    restrictResidue p R n a (map ⟨fun x : Z => x + b, by fun_prop⟩ μ) =
      map ⟨fun x : Z => x + b, by fun_prop⟩ (restrictResidue p R n (a - ρ n b) μ) := sorry

theorem restrictResidue_eq_map_restrictClopen (n : ℕ) (a : ZMod (p ^ n)) (μ : D(Z, R)) :
    let s : TopologicalSpace.Clopens Z := ⟨{x | ρ n x = a}, PadicInt.isClopen_toZModPow_fiber n a⟩
    restrictResidue p R n a μ = map (ContinuousMap.subtypeVal s) (restrictClopen s R μ) := sorry

theorem continuous_restrictResidue_weak (n : ℕ) (a : ZMod (p ^ n)) :
    letI : TopologicalSpace D(Z, R) := WeakTopology
    Continuous (restrictResidue p R n a) := sorry

theorem restrictResidue_one_zero (μ : D(Z, R)) :
    restrictResidue p R 1 0 μ = restrictMultiples p R μ := sorry

variable [Algebra ℤ_[p] R] [ContinuousSMul ℤ_[p] R]
theorem coeff_amiceTransform_restrictResidue (n : ℕ) (a : ZMod (p ^ n))
    (μ : D(Z, R)) (k : ℕ) :
    PowerSeries.coeff k (restrictResidue p R n a μ).amiceTransform =
      μ (χ n a * ((mahler k : C(Z, Z)) • (1 : C(Z, R)))) := sorry
end ResidueRestriction

section ResidueRestrictionTests
-- ResidueRestrictionTests.depth_zero
example (μ : D(ℤ_[2], ℤ)) : restrictResidue 2 ℤ 0 0 μ = μ := sorry
-- ResidueRestrictionTests.dyadic_inside
example : restrictResidue 2 ℤ 2 1 (dirac ℤ (5 : ℤ_[2])) = dirac ℤ 5 := sorry
-- ResidueRestrictionTests.dyadic_outside
example : restrictResidue 2 ℤ 2 1 (dirac ℤ (3 : ℤ_[2])) = 0 := sorry
-- ResidueRestrictionTests.signed_atoms
example : restrictResidue 3 ℤ 2 1
    ((2 : ℤ) • dirac ℤ (1 : ℤ_[3]) - (3 : ℤ) • dirac ℤ 10 + dirac ℤ 2) =
      (2 : ℤ) • dirac ℤ 1 - (3 : ℤ) • dirac ℤ 10 := sorry
-- ResidueRestrictionTests.two_distinct_fibers
example (μ : D(ℤ_[2], ℤ)) :
    restrictResidue 2 ℤ 2 1 (restrictResidue 2 ℤ 2 3 μ) = 0 := sorry
-- ResidueRestrictionTests.refine_odd
example (μ : D(ℤ_[2], ℤ)) : restrictResidue 2 ℤ 1 1 μ =
    restrictResidue 2 ℤ 2 1 μ + restrictResidue 2 ℤ 2 3 μ := sorry
-- ResidueRestrictionTests.translation_sign
example : restrictResidue 3 ℤ 1 0
    (map ⟨fun x : ℤ_[3] => x + 2, by fun_prop⟩ (dirac ℤ 1)) = dirac ℤ 3 := sorry
-- ResidueRestrictionTests.first_moment
example : PowerSeries.coeff 1 (restrictResidue 2 ℤ_[2] 2 1 (dirac ℤ_[2] 5)).amiceTransform = 5 := sorry
end ResidueRestrictionTests
end AbstractMeasure

/-! ## L4: Weierstrass theory and the structure of Iwasawa modules

Signatures for NSW V §§1, 3 and RJW §13.1. Mathlib already supplies Weierstrass division and preparation
(`PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.IsWeierstrassFactorization.unique`), noetherianity of
`R⟦X⟧` and factoriality of `R⟦X⟧` for a principal ideal domain `R`; nothing here restates them. -/

namespace TauCeti.Iwasawa

open Polynomial
open scoped TensorProduct Pointwise

/-- §4.6: integral projector; orthogonality requires unit group order.
The definition is on Mathlib's finite group algebra, shared with the L6 consumers. -/
def charIdempotent {O H : Type*} [CommRing O] [CommGroup H] [Finite H]
    (χ : H →* Oˣ) : MonoidAlgebra O H :=
  Ring.inverse (Nat.card H : O) • ∑ᶠ a : H,
    (((χ a)⁻¹ : Oˣ) : O) • MonoidAlgebra.of O H a


section PseudoNull

variable (A : Type*) [CommRing A] (M : Type*) [AddCommGroup M] [Module A M]

/-- §4.1: a finitely generated module is pseudo-null if it vanishes at every prime of height at most
one (NSW (5.1.4)). -/
def IsPseudoNull : Prop :=
  Module.Finite A M ∧
    ∀ 𝔭 : PrimeSpectrum A, 𝔭.asIdeal.height ≤ 1 → Subsingleton (LocalizedModule 𝔭.asIdeal.primeCompl M)

/-- §4.1: pseudo-null modules are torsion (NSW (5.1.4), Remark 2). -/
theorem IsPseudoNull.isTorsion [IsDomain A] (h : IsPseudoNull A M) : Module.IsTorsion A M := sorry

/-- §4.1: over a two-dimensional noetherian integrally closed local domain with finite residue field,
pseudo-null means finite (NSW (5.1.4), Remark 4). -/
theorem isPseudoNull_iff_finite [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A] [IsLocalRing A]
    [Finite (IsLocalRing.ResidueField A)] (hdim : ringKrullDim A = 2) [Module.Finite A M] :
    IsPseudoNull A M ↔ Finite M := sorry

variable {A M} {N : Type*} [AddCommGroup N] [Module A N]

/-- §4.1: kernel and cokernel are pseudo-null (NSW (5.1.5)). -/
def IsPseudoIsomorphism (f : M →ₗ[A] N) : Prop :=
  IsPseudoNull A (LinearMap.ker f) ∧ IsPseudoNull A (N ⧸ LinearMap.range f)

end PseudoNull

section CharacteristicIdeal

variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A]
  (M : Type*) [AddCommGroup M] [Module A M]

/-- §4.6: the divisor of a finitely generated torsion module, `𝔭 ↦ length_{A_𝔭} M_𝔭` at the
height-one primes (zero elsewhere). -/
noncomputable def charDivisor [Module.Finite A M]
    (hM : Module.IsTorsion A M) : PrimeSpectrum A →₀ ℕ := sorry

/-- The finite-support and finite-length inputs are proof obligations, not consequences of a name search. -/
theorem charDivisor_spec [Module.Finite A M] (hM : Module.IsTorsion A M)
    (𝔭 : PrimeSpectrum A) :
    charDivisor A M hM 𝔭 =
      if 𝔭.asIdeal.height = 1 then
        (Module.length (Localization.AtPrime 𝔭.asIdeal)
          (LocalizedModule 𝔭.asIdeal.primeCompl M)).toNat
      else 0 := sorry

/-- §4.6: over a unique factorisation domain the divisor is principal; `charIdeal` is the
ideal it generates. -/
noncomputable def charIdeal [UniqueFactorizationMonoid A] (M : Type*) [AddCommGroup M]
    [Module A M] [Module.Finite A M] (hM : Module.IsTorsion A M) : Ideal A :=
  (charDivisor A M hM).prod (fun 𝔭 n => 𝔭.asIdeal ^ n)

/-- §4.6: the value on a cyclic module. -/
theorem charIdeal_quotient_span [UniqueFactorizationMonoid A] (f : A) (hf : f ≠ 0) :
    charIdeal A (A ⧸ Ideal.span {f}) (by sorry) = Ideal.span {f} := sorry

/-- §4.6: finite modules over a two-dimensional local ring have unit characteristic ideal. -/
theorem charIdeal_eq_top_of_isPseudoNull [UniqueFactorizationMonoid A]
    [Module.Finite A M] (h : IsPseudoNull A M) :
    charIdeal A M (h.isTorsion) = ⊤ := sorry

end CharacteristicIdeal

section IwasawaInvariants

variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
  [Finite (IsLocalRing.ResidueField O)]

/-- §4.4: the monic horizontal factor of the torsion submodule.
No fraction-field dimension formula is asserted for a module of positive Λ-rank. -/
def charPoly (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)] (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M]
    [Module.Finite (PowerSeries O) M] : O[X] := sorry

/-- §4.4: reduced degree of the horizontal characteristic factor. -/
def lambdaInvariant (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)] (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M]
    [Module.Finite (PowerSeries O) M] : ℕ := (charPoly O M).natDegree

/-- §4.4: local length of the torsion submodule at the vertical prime.
The prime assertion and finite length must be proved; ENat.toNat alone does not prove them. -/
def muInvariant (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)] (ϖ : O) (hϖ : Irreducible ϖ) (M : Type*) [AddCommGroup M]
    [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M] : ℕ := by
  let P : Ideal (PowerSeries O) := Ideal.span {PowerSeries.C ϖ}
  letI : P.IsPrime := by sorry
  exact (Module.length (Localization.AtPrime P)
    (LocalizedModule P.primeCompl (Submodule.torsion (PowerSeries O) M))).toNat

variable (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M]
  [Module.Finite (PowerSeries O) M]

theorem charPoly_isDistinguishedAt :
    (charPoly O M).IsDistinguishedAt (IsLocalRing.maximalIdeal O) := sorry

theorem lambdaInvariant_spec : lambdaInvariant O M = (charPoly O M).natDegree := by sorry

theorem charPoly_spec {ι : Type*} [Fintype ι] (F : ι → O[X]) (e : ι → ℕ)
    (hF : ∀ i, (F i).IsDistinguishedAt (IsLocalRing.maximalIdeal O))
    (hprime : ∀ i, Irreducible (F i))
    (hdecomp : ∃ f : Submodule.torsion (PowerSeries O) M →ₗ[PowerSeries O]
      (∀ i, PowerSeries O ⧸ Ideal.span {((F i ^ e i : O[X]) : PowerSeries O)}),
      IsPseudoIsomorphism f) :
    charPoly O M = ∏ i, F i ^ e i := sorry

-- The complete elementary specification, including vertical factors, is the structure-theorem
-- contract. The zero-vertical special case above does not define F from an arbitrary list.
theorem charPoly_zero : charPoly O PUnit = 1 := sorry
theorem lambdaInvariant_zero : lambdaInvariant O PUnit = 0 := sorry
theorem muInvariant_zero (ϖ : O) (hϖ : Irreducible ϖ) :
    muInvariant O ϖ hϖ PUnit = 0 := sorry

variable {M} {N : Type*} [AddCommGroup N] [Module (PowerSeries O) N]
  [Module.Finite (PowerSeries O) N]
theorem charPoly_equiv (e : M ≃ₗ[PowerSeries O] N) : charPoly O M = charPoly O N := sorry
theorem lambdaInvariant_equiv (e : M ≃ₗ[PowerSeries O] N) :
    lambdaInvariant O M = lambdaInvariant O N := sorry
theorem muInvariant_equiv (ϖ : O) (hϖ : Irreducible ϖ) (e : M ≃ₗ[PowerSeries O] N) :
    muInvariant O ϖ hϖ M = muInvariant O ϖ hϖ N := sorry

theorem finite_iff_mu_lambda (ϖ : O) (hϖ : Irreducible ϖ)
    (hM : Module.IsTorsion (PowerSeries O) M) :
    Finite M ↔ muInvariant O ϖ hϖ M = 0 ∧ lambdaInvariant O M = 0 := sorry

variable (M) [Module O M] [IsScalarTower O (PowerSeries O) M]
-- Finite-dimensionality after inverting the uniformizer is a hypothesis of this statement,
-- not a consequence of Λ-finite generation alone.
theorem lambdaInvariant_eq_finrank (hM : Module.IsTorsion (PowerSeries O) M) :
    lambdaInvariant O M = Module.finrank (FractionRing O) (FractionRing O ⊗[O] M) := sorry

theorem charPoly_eq_charpoly (hM : Module.IsTorsion (PowerSeries O) M)
    [Module.Finite (FractionRing O) (FractionRing O ⊗[O] M)] :
    (charPoly O M).map (algebraMap O (FractionRing O)) =
      ((Algebra.lsmul O O M (PowerSeries.X : PowerSeries O)).baseChange (FractionRing O)).charpoly :=
  sorry

end IwasawaInvariants


section PseudoNullAPI
variable {A : Type*} [CommRing A] [IsDomain A] [IsNoetherianRing A]
  [IsIntegrallyClosed A] {M N P : Type*}
  [AddCommGroup M] [Module A M] [Module.Finite A M]
  [AddCommGroup N] [Module A N] [Module.Finite A N]
  [AddCommGroup P] [Module A P] [Module.Finite A P]

theorem isPseudoNull_iff_annihilator : IsPseudoNull A M ↔
    ∀ 𝔭 : PrimeSpectrum A, Module.annihilator A M ≤ 𝔭.asIdeal → 2 ≤ 𝔭.asIdeal.height := sorry

omit [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A] in
theorem isPseudoNull_iff_eq_zero [IsDedekindDomain A] :
    IsPseudoNull A M ↔ Subsingleton M := sorry

theorem IsPseudoNull.of_exact (f : M →ₗ[A] N) (g : N →ₗ[A] P)
    (hf : Function.Injective f) (hg : Function.Surjective g)
    (hex : Function.Exact f g) : IsPseudoNull A N ↔ IsPseudoNull A M ∧ IsPseudoNull A P := sorry

theorem isPseudoIsomorphism_iff_localization (f : M →ₗ[A] N) :
    IsPseudoIsomorphism f ↔ ∀ 𝔭 : PrimeSpectrum A, 𝔭.asIdeal.height ≤ 1 →
      Function.Bijective (IsLocalizedModule.map 𝔭.asIdeal.primeCompl
        (LocalizedModule.mkLinearMap 𝔭.asIdeal.primeCompl M)
        (LocalizedModule.mkLinearMap 𝔭.asIdeal.primeCompl N) f) := sorry

theorem isPseudoIsomorphism_mul (a : A) (ha : a ≠ 0) (hM : Module.IsTorsion A M)
    (hsupp : ∀ 𝔭 : PrimeSpectrum A, 𝔭.asIdeal.height = 1 → a ∈ 𝔭.asIdeal →
      Subsingleton (LocalizedModule 𝔭.asIdeal.primeCompl M)) :
    IsPseudoIsomorphism (Algebra.lsmul A A M a) := sorry

theorem IsPseudoIsomorphism.comp {f : M →ₗ[A] N} {g : N →ₗ[A] P}
    (hf : IsPseudoIsomorphism f) (hg : IsPseudoIsomorphism g) :
    IsPseudoIsomorphism (g.comp f) := sorry

theorem IsPseudoIsomorphism.exists_symm {f : M →ₗ[A] N}
    (hf : IsPseudoIsomorphism f) (hM : Module.IsTorsion A M) (hN : Module.IsTorsion A N) :
    ∃ g : N →ₗ[A] M, IsPseudoIsomorphism g := sorry

end PseudoNullAPI

section DivisorAPI
variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A]
  {M N P : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]
  [AddCommGroup N] [Module A N] [Module.Finite A N]
  [AddCommGroup P] [Module A P] [Module.Finite A P]

theorem charDivisor_zero : charDivisor A PUnit (by sorry) = 0 := sorry

theorem charDivisor_equiv (hM : Module.IsTorsion A M) (hN : Module.IsTorsion A N)
    (e : M ≃ₗ[A] N) : charDivisor A M hM = charDivisor A N hN := sorry

variable [UniqueFactorizationMonoid A]
theorem charIdeal_mul_of_exact (f : M →ₗ[A] N) (g : N →ₗ[A] P)
    (hf : Function.Injective f) (hg : Function.Surjective g) (hex : Function.Exact f g)
    (hM : Module.IsTorsion A M) (hN : Module.IsTorsion A N) (hP : Module.IsTorsion A P) :
    charIdeal A N hN = charIdeal A M hM * charIdeal A P hP := sorry

theorem charIdeal_eq_of_pseudoIso (f : M →ₗ[A] N) (hf : IsPseudoIsomorphism f)
    (hM : Module.IsTorsion A M) (hN : Module.IsTorsion A N) :
    charIdeal A M hM = charIdeal A N hN := sorry

theorem charIdeal_eq_top_iff (hM : Module.IsTorsion A M) :
    charIdeal A M hM = ⊤ ↔ IsPseudoNull A M := sorry

end DivisorAPI

section InvariantExactness
variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
  {M N P : Type*} [AddCommGroup M] [Module (PowerSeries O) M]
  [Module.Finite (PowerSeries O) M] [AddCommGroup N] [Module (PowerSeries O) N]
  [Module.Finite (PowerSeries O) N] [AddCommGroup P] [Module (PowerSeries O) P]
  [Module.Finite (PowerSeries O) P]

theorem muInvariant_add (ϖ : O) (hϖ : Irreducible ϖ)
    (f : M →ₗ[PowerSeries O] N) (g : N →ₗ[PowerSeries O] P)
    (hf : Function.Injective f) (hg : Function.Surjective g) (hex : Function.Exact f g)
    (hM : Module.IsTorsion (PowerSeries O) M) (hN : Module.IsTorsion (PowerSeries O) N)
    (hP : Module.IsTorsion (PowerSeries O) P) :
    muInvariant O ϖ hϖ N = muInvariant O ϖ hϖ M + muInvariant O ϖ hϖ P := sorry

theorem lambdaInvariant_add (f : M →ₗ[PowerSeries O] N) (g : N →ₗ[PowerSeries O] P)
    (hf : Function.Injective f) (hg : Function.Surjective g) (hex : Function.Exact f g)
    (hM : Module.IsTorsion (PowerSeries O) M) (hN : Module.IsTorsion (PowerSeries O) N)
    (hP : Module.IsTorsion (PowerSeries O) P) :
    lambdaInvariant O N = lambdaInvariant O M + lambdaInvariant O P := sorry

theorem charPoly_mul (f : M →ₗ[PowerSeries O] N) (g : N →ₗ[PowerSeries O] P)
    (hf : Function.Injective f) (hg : Function.Surjective g) (hex : Function.Exact f g)
    (hM : Module.IsTorsion (PowerSeries O) M) (hN : Module.IsTorsion (PowerSeries O) N)
    (hP : Module.IsTorsion (PowerSeries O) P) :
    charPoly O N = charPoly O M * charPoly O P := sorry

theorem charIdeal_eq_span_mu_charPoly (ϖ : O) (hϖ : Irreducible ϖ)
    (hM : Module.IsTorsion (PowerSeries O) M) :
    charIdeal (PowerSeries O) M hM =
      Ideal.span {PowerSeries.C (ϖ ^ muInvariant O ϖ hϖ M) * (charPoly O M : PowerSeries O)} := sorry

end InvariantExactness

section MonicRoot
variable {O : Type*} [CommRing O]
/-- §4.3: calculate the determinant in the existing monic power basis.
This is valid over a commutative ring and includes the zero-rank quotient F=1.
Transport through Polynomial.IsDistinguishedAt.algEquivQuotient gives the series statement. -/
theorem charpoly_mulT_quotient (F : O[X]) (hF : F.Monic) :
    (LinearMap.toMatrix (AdjoinRoot.powerBasis' hF).basis (AdjoinRoot.powerBasis' hF).basis
      (LinearMap.mulLeft O (AdjoinRoot.root F))).charpoly = F := sorry
end MonicRoot

section SplitCharacters
variable {O H : Type*} [CommRing O] [IsDomain O] [CommGroup H] [Finite H]
  (hH : IsUnit (Nat.card H : O))

include hH in
theorem charIdempotent_mul [DecidableEq (H →* Oˣ)] (χ ψ : H →* Oˣ) :
    charIdempotent χ * charIdempotent ψ = if χ = ψ then charIdempotent χ else 0 := sorry

include hH in
theorem sum_charIdempotent [HasEnoughRootsOfUnity O (Monoid.exponent H)] :
    ∑ᶠ χ : H →* Oˣ, charIdempotent χ = 1 := sorry

variable (M : Type*) [AddCommGroup M] [Module O M] [Module (MonoidAlgebra O H) M]
  [IsScalarTower O (MonoidAlgebra O H) M]
/-- §4.6: image of the integral projector. -/
def isotypicComponent (χ : H →* Oˣ) : Submodule O M :=
  LinearMap.range (Algebra.lsmul O O M (charIdempotent χ))

include hH in
/-- §4.6: the eigencharacter criterion. With `#H` a unit, the range of
the projector `e_χ` is the set of vectors on which every `h` acts by `χ(h)`. -/
theorem isotypicComponent_spec (χ : H →* Oˣ) (m : M) :
    m ∈ isotypicComponent M χ ↔ ∀ h : H, MonoidAlgebra.of O H h • m = ((χ h : Oˣ) : O) • m := sorry

include hH in
/-- The fixed-point form of the criterion, equivalent to `isotypicComponent_spec` because
`h · e_χ = χ(h) e_χ` in `O[H]`. -/
theorem mem_isotypicComponent_iff_smul_eq (χ : H →* Oˣ) (m : M) :
    m ∈ isotypicComponent M χ ↔ charIdempotent χ • m = m := sorry

theorem isotypicComponent_zero (χ : H →* Oˣ) :
    isotypicComponent PUnit χ = ⊥ := sorry

theorem isotypicComponent_equiv {N : Type*} [AddCommGroup N] [Module O N]
    [Module (MonoidAlgebra O H) N] [IsScalarTower O (MonoidAlgebra O H) N]
    (e : M ≃ₗ[MonoidAlgebra O H] N) (χ : H →* Oˣ) :
    (isotypicComponent M χ).map (e.toLinearMap.restrictScalars O) = isotypicComponent N χ := sorry

/-- §4.6: a finite product is the finite direct sum here.
The inverse is the sum of inclusions; the forward map consists of the e_χ projections. -/
def isotypicDecomposition (hH : IsUnit (Nat.card H : O)) [HasEnoughRootsOfUnity O (Monoid.exponent H)] :
    M ≃ₗ[O] (∀ χ : H →* Oˣ, isotypicComponent M χ) := sorry

end SplitCharacters

section ProductCharacteristic
variable {ι : Type*} [Finite ι] (A : Type*) [CommRing A] [IsDomain A]
  [IsNoetherianRing A] [IsIntegrallyClosed A] [UniqueFactorizationMonoid A]
  (M : ι → Type*) [∀ i, AddCommGroup (M i)] [∀ i, Module A (M i)]
  [∀ i, Module.Finite A (M i)]
/-- §4.6: ideal on the product ring, by its components.
A completed-algebra result pulls this ideal back along the owner's split ring equivalence. -/
def charIdealProduct (hM : ∀ i, Module.IsTorsion A (M i)) : Ideal (ι → A) :=
  ⨅ i, (charIdeal A (M i) (hM i)).comap (Pi.evalRingHom (fun _ : ι => A) i)

theorem charIdealProduct_spec (hM : ∀ i, Module.IsTorsion A (M i)) (x : ι → A) :
    x ∈ charIdealProduct A M hM ↔ ∀ i, x i ∈ charIdeal A (M i) (hM i) := sorry

theorem charIdealProduct_zero :
    charIdealProduct A (fun _ : ι => PUnit) (by sorry) = ⊤ := sorry

theorem charIdealProduct_equiv (N : ι → Type*) [∀ i, AddCommGroup (N i)]
    [∀ i, Module A (N i)] [∀ i, Module.Finite A (N i)]
    (hM : ∀ i, Module.IsTorsion A (M i)) (hN : ∀ i, Module.IsTorsion A (N i))
    (e : ∀ i, M i ≃ₗ[A] N i) : charIdealProduct A M hM = charIdealProduct A N hN := sorry
end ProductCharacteristic

section Delta
variable (p : ℕ) [Fact p.Prime]
variable (M : Type*) [AddCommGroup M] [Module (PowerSeries (PadicInt p)) M]

/-- §4.7: union of the increasing cyclotomic kernels on the existing module. -/
def delta_submodule (p : ℕ) [Fact p.Prime] (M : Type*) [AddCommGroup M]
    [Module (PowerSeries (PadicInt p)) M] : Submodule (PowerSeries (PadicInt p)) M where
  carrier := {m | ∃ n : ℕ, (((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries (PadicInt p)) • m) = 0}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

theorem mem_delta (m : M) : m ∈ delta_submodule p M ↔
    ∃ n : ℕ, (((1 + PowerSeries.X) ^ (p ^ n) - 1 : (PowerSeries (PadicInt p))) • m) = 0 := Iff.rfl

theorem delta_submodule_zero : delta_submodule p PUnit = ⊥ := sorry

theorem delta_map {N : Type*} [AddCommGroup N] [Module (PowerSeries (PadicInt p)) N] (f : M →ₗ[(PowerSeries (PadicInt p))] N) :
    (delta_submodule p M).map f ≤ delta_submodule p N := sorry

theorem delta_submodule_equiv {N : Type*} [AddCommGroup N] [Module (PowerSeries (PadicInt p)) N] (e : M ≃ₗ[(PowerSeries (PadicInt p))] N) :
    (delta_submodule p M).map e.toLinearMap = delta_submodule p N := sorry

theorem delta_monotone (N : Submodule (PowerSeries (PadicInt p)) M) :
    (delta_submodule p N).map N.subtype ≤ delta_submodule p M := sorry

variable [Module.Finite (PowerSeries (PadicInt p)) M]
theorem delta_finite_control [Module (PadicInt p) M]
    [IsScalarTower (PadicInt p) (PowerSeries (PadicInt p)) M] : Module.IsTorsion (PowerSeries (PadicInt p)) (delta_submodule p M) ∧
    Module.Finite (PadicInt p) (delta_submodule p M) := sorry

/-- A concrete reduced-degree gate; order toNat is used only after the nonzero-residue hypothesis. -/
theorem finite_of_smul_eq_zero_distinguished (k g : ℕ) (f : (PowerSeries (PadicInt p)))
    (hf : f.map (IsLocalRing.residue (PadicInt p)) ≠ 0)
    (hpk : ∀ m : M, (PowerSeries.C (p ^ k : (PadicInt p))) • m = 0)
    (hfm : ∀ m : M, f • m = 0) (gen : Fin g → M)
    (hgen : Submodule.span (PowerSeries (PadicInt p)) (Set.range gen) = ⊤) :
    Finite M ∧ Nat.card M ≤ p ^ (k * g * (f.map (IsLocalRing.residue (PadicInt p))).order.toNat) := sorry

end Delta

namespace L4Tests

variable (p : ℕ) [Fact p.Prime]
local instance : Finite (IsLocalRing.ResidueField (PadicInt p)) :=
  Finite.of_equiv (ZMod p) PadicInt.residueField.symm.toEquiv

-- test L4Tests.residue_field (computation) [§4.1]
example : IsPseudoNull (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ (Ideal.span ({PowerSeries.C (p : PadicInt p), PowerSeries.X} : Set (PowerSeries (PadicInt p))))) := sorry
-- test L4Tests.mu_part (non-example) [§4.1]
example : ¬ IsPseudoNull (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {PowerSeries.C (p : (PadicInt p))}) := sorry
-- test L4Tests.dedekind (degenerate) [§4.1]
example : ¬ IsPseudoNull (PadicInt p) ((PadicInt p) ⧸ Ideal.span {(p : (PadicInt p))}) := sorry

-- test L4Tests.mul_p_on_cyclic (computation) [§4.1]
example : IsPseudoIsomorphism
    (Algebra.lsmul (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p))}) (PowerSeries.C (p : (PadicInt p)))) := sorry
-- test L4Tests.dedekind (degenerate) [§4.1]
example {M N : Type*} [AddCommGroup M] [Module (PadicInt p) M] [Module.Finite (PadicInt p) M]
    [AddCommGroup N] [Module (PadicInt p) N] [Module.Finite (PadicInt p) N] (f : M →ₗ[(PadicInt p)] N) :
    IsPseudoIsomorphism f ↔ Function.Bijective f := sorry
-- test L4Tests.rjw_agreement (compatibility) [§4.1]
example {M N : Type*} [AddCommGroup M] [Module (PowerSeries (PadicInt p)) M] [Module.Finite (PowerSeries (PadicInt p)) M]
    [AddCommGroup N] [Module (PowerSeries (PadicInt p)) N] [Module.Finite (PowerSeries (PadicInt p)) N] (f : M →ₗ[(PowerSeries (PadicInt p))] N) :
    IsPseudoIsomorphism f ↔ Finite (LinearMap.ker f) ∧ Finite (N ⧸ LinearMap.range f) := sorry

-- test L4Tests.eisenstein (computation) [§4.4]
example : let F : (PadicInt p)[X] := X ^ 2 + C (p : (PadicInt p)) * X + C (p : (PadicInt p))
    let M := (PowerSeries (PadicInt p)) ⧸ Ideal.span {(F : (PowerSeries (PadicInt p)))}
    muInvariant (PadicInt p) (p : (PadicInt p)) (by sorry) M = 0 ∧ lambdaInvariant (PadicInt p) M = 2 ∧ charPoly (PadicInt p) M = F := sorry
-- test L4Tests.finite (degenerate) [§4.4]
example : muInvariant (PadicInt p) (p : (PadicInt p)) (by sorry) ((PowerSeries (PadicInt p)) ⧸ (Ideal.span ({PowerSeries.C (p : PadicInt p), PowerSeries.X} : Set (PowerSeries (PadicInt p))))) = 0 ∧
    lambdaInvariant (PadicInt p) ((PowerSeries (PadicInt p)) ⧸ (Ideal.span ({PowerSeries.C (p : PadicInt p), PowerSeries.X} : Set (PowerSeries (PadicInt p))))) = 0 ∧ charPoly (PadicInt p) ((PowerSeries (PadicInt p)) ⧸ (Ideal.span ({PowerSeries.C (p : PadicInt p), PowerSeries.X} : Set (PowerSeries (PadicInt p))))) = 1 := sorry
-- test L4Tests.mu_part (computation) [§4.4]
example : muInvariant (PadicInt p) (p : (PadicInt p)) (by sorry) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {PowerSeries.C (p : (PadicInt p))}) = 1 ∧
    lambdaInvariant (PadicInt p) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {PowerSeries.C (p : (PadicInt p))}) = 0 ∧
    charPoly (PadicInt p) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {PowerSeries.C (p : (PadicInt p))}) = 1 := sorry
-- test Lambda.free (non-example) [§4.4]
example : lambdaInvariant (PadicInt p) (PowerSeries (PadicInt p)) = 0 := sorry
-- test CharacteristicPolynomial.free (non-example) [§4.4]
example : charPoly (PadicInt p) (PowerSeries (PadicInt p)) = 1 := sorry

-- test Divisor.zero (degenerate) [§4.6]
example : charDivisor (PowerSeries (PadicInt p)) PUnit (by sorry) = 0 := sorry
-- test Divisor.cyclic (computation) [§4.6]
example : let P : PrimeSpectrum (PowerSeries (PadicInt p)) := ⟨Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p))}, by sorry⟩
    charDivisor (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p)) ^ 2}) (by sorry) = Finsupp.single P 2 := sorry
-- test Divisor.finite (non-example) [§4.6]
example : charDivisor (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ (Ideal.span ({PowerSeries.C (p : PadicInt p), PowerSeries.X} : Set (PowerSeries (PadicInt p))))) (by sorry) = 0 := sorry
-- test L4Tests.cyclic (computation) [§4.6]
example : charIdeal (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p)) ^ 2}) (by sorry) = Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p)) ^ 2} := sorry
-- test L4Tests.finite (non-example) [§4.6]
example : charIdeal (PowerSeries (PadicInt p)) ((PowerSeries (PadicInt p)) ⧸ (Ideal.span ({PowerSeries.C (p : PadicInt p), PowerSeries.X} : Set (PowerSeries (PadicInt p))))) (by sorry) = ⊤ := sorry
-- test L4Tests.unit (degenerate) [§4.6]
example : charIdeal (PowerSeries (PadicInt p)) PUnit (by sorry) = ⊤ := sorry

-- test Delta.zero (degenerate) [§4.7]
example : delta_submodule p PUnit = ⊥ := sorry
-- test Delta.free (non-example) [§4.7]
example : delta_submodule p (PowerSeries (PadicInt p)) = ⊥ := sorry
-- test Delta.trivial_action (computation) [§4.7]
example : delta_submodule p ((PowerSeries (PadicInt p)) ⧸ Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p))}) = ⊤ := sorry

-- test MonicRoot.one (degenerate) [§4.3]
example : (LinearMap.toMatrix (AdjoinRoot.powerBasis' (monic_one : (1 : (PadicInt p)[X]).Monic)).basis
    (AdjoinRoot.powerBasis' (monic_one : (1 : (PadicInt p)[X]).Monic)).basis
    (LinearMap.mulLeft (PadicInt p) (AdjoinRoot.root (1 : (PadicInt p)[X])))).charpoly = 1 := sorry
-- test MonicRoot.degree_two (computation) [§4.3]
example : (LinearMap.toMatrix (AdjoinRoot.powerBasis' (monic_X_pow 2 : (X ^ 2 : (PadicInt p)[X]).Monic)).basis
    (AdjoinRoot.powerBasis' (monic_X_pow 2 : (X ^ 2 : (PadicInt p)[X]).Monic)).basis
    (LinearMap.mulLeft (PadicInt p) (AdjoinRoot.root (X ^ 2 : (PadicInt p)[X])))).charpoly = X ^ 2 := sorry

section CharacterTests
variable {R H : Type*} [CommRing R] [IsDomain R] [CommGroup H] [Finite H]
-- test Character.trivial (degenerate) [§4.6]
example [Subsingleton H] : charIdempotent (1 : H →* Rˣ) = 1 := sorry
-- test Character.orthogonal (compatibility) [§4.6]
example (hH : IsUnit (Nat.card H : R)) (χ ψ : H →* Rˣ) (hne : χ ≠ ψ) :
    charIdempotent χ * charIdempotent ψ = 0 := sorry
-- test Character.dyadic (non-example) [§4.6]
example : ¬ IsUnit (Nat.card (Multiplicative (ZMod 2)) : ℤ_[2]) := sorry

variable (M : Type*) [AddCommGroup M] [Module R M] [Module (MonoidAlgebra R H) M]
  [IsScalarTower R (MonoidAlgebra R H) M]
-- test Isotypic.trivial (degenerate) [§4.6]
example [Subsingleton H] : isotypicComponent M (1 : H →* Rˣ) = ⊤ := sorry
-- test Isotypic.plus (computation) [§4.6]
example (hH : IsUnit (Nat.card H : R)) (h : H) (hc : Nat.card H = 2)
    (hgen : ∀ a : H, a = 1 ∨ a = h) (m : M) :
    m ∈ isotypicComponent M (1 : H →* Rˣ) ↔ MonoidAlgebra.of R H h • m = m := sorry
-- test Isotypic.sign (non-example) [§4.6]
example (hH : IsUnit (Nat.card H : R)) (h : H) (hc : Nat.card H = 2)
    (hgen : ∀ a : H, a = 1 ∨ a = h) (χ : H →* Rˣ) (hχ : (χ h : R) = -1) (m : M) :
    m ∈ isotypicComponent M χ ↔ MonoidAlgebra.of R H h • m = -m := sorry
end CharacterTests

-- test Product.zero (degenerate) [§4.6]
example : charIdealProduct (PowerSeries (PadicInt p)) (fun _ : Fin 2 => PUnit) (by sorry) = ⊤ := sorry
-- test Product.trivial (computation) [§4.6]
example : (fun _ : Fin 1 => (PowerSeries.X : PowerSeries (PadicInt p)) ^ 2) ∈
    charIdealProduct (PowerSeries (PadicInt p)) (fun _ : Fin 1 => (PowerSeries (PadicInt p)) ⧸ Ideal.span {(PowerSeries.X : PowerSeries (PadicInt p)) ^ 2}) (by sorry) := sorry
-- test Product.residue (non-example) [§4.6]
example : (1 : Fin 2 → (PowerSeries (PadicInt p))) ∉ charIdealProduct (PowerSeries (PadicInt p))
    (fun i : Fin 2 => (PowerSeries (PadicInt p)) ⧸ Ideal.span {if i = 0 then (PowerSeries.X : PowerSeries (PadicInt p)) else 1}) (by sorry) := sorry
-- test Product.not_restriction_of_scalars (non-example) [§4.6]
-- Two components `Λ/(T)`: the product-ring ideal is `((T), (T))`, which contains `(T, T)` and not
-- `(T², 1)`, whereas the characteristic ideal of `Λ/(T) ⊕ Λ/(T)` over the single ring `Λ` is `(T²)`.
example : let Λ := PowerSeries (PadicInt p)
    let M : Fin 2 → Type _ := fun _ => Λ ⧸ Ideal.span {(PowerSeries.X : Λ)}
    charIdealProduct Λ M (by sorry) = Ideal.pi (fun _ : Fin 2 => Ideal.span {(PowerSeries.X : Λ)}) ∧
    (fun _ : Fin 2 => (PowerSeries.X : Λ)) ∈ charIdealProduct Λ M (by sorry) ∧
    (fun i : Fin 2 => if i = 0 then (PowerSeries.X : Λ) ^ 2 else 1) ∉ charIdealProduct Λ M (by sorry) ∧
    charIdeal Λ ((Λ ⧸ Ideal.span {(PowerSeries.X : Λ)}) × (Λ ⧸ Ideal.span {(PowerSeries.X : Λ)}))
      (by sorry) = Ideal.span {(PowerSeries.X : Λ) ^ 2} := sorry

end L4Tests


section NativeResolutionAndGrowth
variable (p : ℕ) [Fact p.Prime]
local instance : Finite (IsLocalRing.ResidueField (PadicInt p)) :=
  Finite.of_equiv (ZMod p) PadicInt.residueField.symm.toEquiv
variable (M : Type*) [AddCommGroup M] [Module (PowerSeries (PadicInt p)) M] [Module.Finite (PowerSeries (PadicInt p)) M]
  [Module (PadicInt p) M] [IsScalarTower (PadicInt p) (PowerSeries (PadicInt p)) M]

theorem iwasawa_free_criterion : Module.Free (PowerSeries (PadicInt p)) M ↔
    Subsingleton (Submodule.torsionBy (PowerSeries (PadicInt p)) M (PowerSeries.X : PowerSeries (PadicInt p))) ∧
      Module.Free (PadicInt p) (M ⧸ ((PowerSeries.X : PowerSeries (PadicInt p)) • (⊤ : Submodule (PowerSeries (PadicInt p)) M))) := sorry

/-- §4.2: genuine exact maps between existing finite free modules.
The (PadicInt p)-lengths of the p-killed modules are the corresponding F_p dimensions. -/
theorem exists_minimal_resolution :
    let H₀ := M ⧸ ((PowerSeries.X : PowerSeries (PadicInt p)) • (⊤ : Submodule (PowerSeries (PadicInt p)) M))
    let H₁ := Submodule.torsionBy (PowerSeries (PadicInt p)) M (PowerSeries.X : PowerSeries (PadicInt p))
    let d₀ := (Module.length (PadicInt p) (H₀ ⧸ ((p : (PadicInt p)) • (⊤ : Submodule (PadicInt p) H₀)))).toNat
    let d₁ := (Module.length (PadicInt p) (Submodule.torsionBy (PadicInt p) H₀ (p : (PadicInt p)))).toNat +
      (Module.length (PadicInt p) (H₁ ⧸ ((p : (PadicInt p)) • (⊤ : Submodule (PadicInt p) H₁)))).toNat
    let d₂ := (Module.length (PadicInt p) (Submodule.torsionBy (PadicInt p) H₁ (p : (PadicInt p)))).toNat
    ∃ (d₂₁ : (Fin d₂ → (PowerSeries (PadicInt p))) →ₗ[(PowerSeries (PadicInt p))] (Fin d₁ → (PowerSeries (PadicInt p))))
      (d₁₀ : (Fin d₁ → (PowerSeries (PadicInt p))) →ₗ[(PowerSeries (PadicInt p))] (Fin d₀ → (PowerSeries (PadicInt p)))) (ε : (Fin d₀ → (PowerSeries (PadicInt p))) →ₗ[(PowerSeries (PadicInt p))] M),
      Function.Injective d₂₁ ∧ Function.Exact d₂₁ d₁₀ ∧ Function.Exact d₁₀ ε ∧
      Function.Surjective ε ∧
      (∀ v i, d₂₁ v i ∈ IsLocalRing.maximalIdeal (PowerSeries (PadicInt p))) ∧
      (∀ v i, d₁₀ v i ∈ IsLocalRing.maximalIdeal (PowerSeries (PadicInt p))) := sorry

/-- §4.2: the minimal resolution over a general complete
discrete valuation ring `O` with uniformizer `ϖ` and finite residue field `k`, with the Betti
numbers `d₀ = dim_k(H₀/ϖH₀)`, `d₁ = dim_k H₀[ϖ] + dim_k(H₁/ϖH₁)`, `d₂ = dim_k H₁[ϖ]` for
`H₀ = M/TM` and `H₁ = M[T]`; the `k`-dimensions are the `O`-lengths. The `ℤ_p` statement above is
the case `O = ℤ_p`, `ϖ = p`; the `𝔽_p`-dimension formula is wrong for `O ≠ ℤ_p` (for `M = O⟦T⟧`,
`d₀ = 1` but `dim_{𝔽_p} O/pO = [Frac O : ℚ_p]`). -/
theorem exists_minimal_resolution_general (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)] (ϖ : O) (hϖ : Irreducible ϖ)
    (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    [Module O M] [IsScalarTower O (PowerSeries O) M] :
    let H₀ := M ⧸ ((PowerSeries.X : PowerSeries O) • (⊤ : Submodule (PowerSeries O) M))
    let H₁ := Submodule.torsionBy (PowerSeries O) M (PowerSeries.X : PowerSeries O)
    let d₀ := (Module.length O (H₀ ⧸ (ϖ • (⊤ : Submodule O H₀)))).toNat
    let d₁ := (Module.length O (Submodule.torsionBy O H₀ ϖ)).toNat +
      (Module.length O (H₁ ⧸ (ϖ • (⊤ : Submodule O H₁)))).toNat
    let d₂ := (Module.length O (Submodule.torsionBy O H₁ ϖ)).toNat
    ∃ (d₂₁ : (Fin d₂ → PowerSeries O) →ₗ[PowerSeries O] (Fin d₁ → PowerSeries O))
      (d₁₀ : (Fin d₁ → PowerSeries O) →ₗ[PowerSeries O] (Fin d₀ → PowerSeries O))
      (ε : (Fin d₀ → PowerSeries O) →ₗ[PowerSeries O] M),
      Function.Injective d₂₁ ∧ Function.Exact d₂₁ d₁₀ ∧ Function.Exact d₁₀ ε ∧
      Function.Surjective ε ∧
      (∀ v i, d₂₁ v i ∈ IsLocalRing.maximalIdeal (PowerSeries O)) ∧
      (∀ v i, d₁₀ v i ∈ IsLocalRing.maximalIdeal (PowerSeries O)) := sorry

/-- The existing projective-dimension carrier is the existing categorical one. -/
theorem iwasawa_projective_dimension_criterion :
    CategoryTheory.projectiveDimension (ModuleCat.of (PowerSeries (PadicInt p)) M) ≤ 1 ↔
      ∀ N : Submodule (PowerSeries (PadicInt p)) M, Finite N → N = ⊥ := sorry

theorem iwasawa_invariants_free_criterion :
    (∀ N : Submodule (PowerSeries (PadicInt p)) M, Finite N → N = ⊥) ↔
      ∃ n : ℕ, Module.Free (PadicInt p) (Submodule.torsionBy (PowerSeries (PadicInt p)) M
        ((1 + (PowerSeries.X : PowerSeries (PadicInt p))) ^ (p ^ n) - 1)) := sorry

theorem iwasawa_rank_euler :
    Module.finrank (FractionRing (PowerSeries (PadicInt p))) (FractionRing (PowerSeries (PadicInt p)) ⊗[(PowerSeries (PadicInt p))] M) +
      Module.finrank (PadicInt p) (Submodule.torsionBy (PowerSeries (PadicInt p)) M (PowerSeries.X : PowerSeries (PadicInt p))) =
      Module.finrank (PadicInt p) (M ⧸ ((PowerSeries.X : PowerSeries (PadicInt p)) • (⊤ : Submodule (PowerSeries (PadicInt p)) M))) := sorry

/-- The δ-submodule of the quotient has no coefficient torsion. -/
theorem quotient_delta_torsion_free :
    Module.IsTorsionFree (PadicInt p) (delta_submodule p (M ⧸ delta_submodule p M)) := sorry

/-- The maximal finite module is coefficient torsion inside δ, not all (PowerSeries (PadicInt p))-torsion. -/
theorem delta_maximal_finite_submodule : ∃ F : Submodule (PowerSeries (PadicInt p)) M,
    (∀ m : M, m ∈ F ↔ m ∈ delta_submodule p M ∧
      ∃ k : ℕ, PowerSeries.C (p ^ k : (PadicInt p)) • m = 0) ∧
    Finite F ∧ (∀ N : Submodule (PowerSeries (PadicInt p)) M, Finite N → N ≤ F) := sorry

/-- §4.7 retains the source's Z_p normalization and rank bound. -/
theorem cyclotomic_growth_step [Module.Free (PadicInt p) M] [Module.Finite (PadicInt p) M]
    (n : ℕ) (hn : Module.finrank (PadicInt p) M * (Module.finrank (PadicInt p) M - 1) / 2 < n) :
    (∑ i ∈ Finset.range p, ((1 + (PowerSeries.X : PowerSeries (PadicInt p))) ^ (i * p ^ n))) • (⊤ : Submodule (PowerSeries (PadicInt p)) M) =
      PowerSeries.C (p : (PadicInt p)) • (⊤ : Submodule (PowerSeries (PadicInt p)) M) := sorry

end NativeResolutionAndGrowth

section CyclotomicPrimary
/-- §4.7: saturate by taking δ of successive quotients.
Noetherian stabilization and the elementary classification are separate proof obligations. -/
def cyclotomic_primary_submodule (p : ℕ) [Fact p.Prime]
    (M : Type*) [AddCommGroup M] [Module (PowerSeries (PadicInt p)) M] :
    Submodule (PowerSeries (PadicInt p)) M :=
  ⨆ n : ℕ, Nat.rec (⊥ : Submodule (PowerSeries (PadicInt p)) M)
    (fun _ N => Submodule.comap N.mkQ (delta_submodule p (M ⧸ N))) n

namespace L4Tests
variable (p : ℕ) [Fact p.Prime]
-- test CyclotomicPrimary.zero (degenerate) [§4.7]
example : cyclotomic_primary_submodule p PUnit = ⊥ := sorry
-- test CyclotomicPrimary.free (non-example) [§4.7]
example : cyclotomic_primary_submodule p (PowerSeries (PadicInt p)) = ⊥ := sorry
-- test CyclotomicPrimary.square (computation) [§4.7]
example : let M := (PowerSeries (PadicInt p)) ⧸ Ideal.span {(PowerSeries.X : (PowerSeries (PadicInt p))) ^ 2}
    cyclotomic_primary_submodule p M = ⊤ ∧ delta_submodule p M ≠ ⊤ := sorry
end L4Tests

variable (p : ℕ) [Fact p.Prime] (M : Type*) [AddCommGroup M]
  [Module (PowerSeries (PadicInt p)) M]

theorem mem_cyclotomic_primary_submodule (m : M) :
    m ∈ cyclotomic_primary_submodule p M ↔
      ∃ n : ℕ, m ∈ Nat.rec (motive := fun _ => Submodule (PowerSeries (PadicInt p)) M)
        (⊥ : Submodule (PowerSeries (PadicInt p)) M)
        (fun _ N => Submodule.comap N.mkQ (delta_submodule p (M ⧸ N))) n := sorry

theorem cyclotomic_primary_submodule_finite [Module.Finite (PowerSeries (PadicInt p)) M]
    [Module (PadicInt p) M] [IsScalarTower (PadicInt p) (PowerSeries (PadicInt p)) M] :
    Module.Finite (PadicInt p) (cyclotomic_primary_submodule p M) := sorry

theorem delta_quotient_cyclotomic_primary [Module.Finite (PowerSeries (PadicInt p)) M] :
    delta_submodule p (M ⧸ cyclotomic_primary_submodule p M) = ⊥ := sorry
end CyclotomicPrimary

namespace L4Tests
variable (p : ℕ) [Fact p.Prime]
local instance : Finite (IsLocalRing.ResidueField (PadicInt p)) :=
  Finite.of_equiv (ZMod p) PadicInt.residueField.symm.toEquiv
-- test Resolution.free (computation) [§4.2]
-- ε=id gives the exact minimal resolution with ranks (1,0,0); lengths test the source convention.
example : let H₀ := (PowerSeries (PadicInt p)) ⧸ ((PowerSeries.X : PowerSeries (PadicInt p)) • (⊤ : Submodule (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p))))
    let H₁ := Submodule.torsionBy (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p)) (PowerSeries.X : PowerSeries (PadicInt p))
    (Module.length (PadicInt p) (H₀ ⧸ ((p : (PadicInt p)) • (⊤ : Submodule (PadicInt p) H₀)))).toNat = 1 ∧
      (Module.length (PadicInt p) (Submodule.torsionBy (PadicInt p) H₀ (p : (PadicInt p)))).toNat = 0 ∧
      Subsingleton H₁ := sorry
-- test Resolution.residue (non-example) [§4.2]
-- Both H₀ and H₁ are the residue field, giving (d₀,d₁,d₂)=(1,2,1).
example : let M := (PowerSeries (PadicInt p)) ⧸ Ideal.span ({PowerSeries.C (p : (PadicInt p)), (PowerSeries.X : PowerSeries (PadicInt p))} : Set (PowerSeries (PadicInt p)))
    let H₀ := M ⧸ ((PowerSeries.X : PowerSeries (PadicInt p)) • (⊤ : Submodule (PowerSeries (PadicInt p)) M))
    let H₁ := Submodule.torsionBy (PowerSeries (PadicInt p)) M (PowerSeries.X : PowerSeries (PadicInt p))
    (Module.length (PadicInt p) (H₀ ⧸ ((p : (PadicInt p)) • (⊤ : Submodule (PadicInt p) H₀)))).toNat = 1 ∧
      (Module.length (PadicInt p) (Submodule.torsionBy (PadicInt p) H₀ (p : (PadicInt p)))).toNat +
        (Module.length (PadicInt p) (H₁ ⧸ ((p : (PadicInt p)) • (⊤ : Submodule (PadicInt p) H₁)))).toNat = 2 ∧
      (Module.length (PadicInt p) (Submodule.torsionBy (PadicInt p) H₁ (p : (PadicInt p)))).toNat = 1 := sorry
end L4Tests


section NormalDomain
variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A] [IsIntegrallyClosed A]
  (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M]

-- A proof-local abbreviation for the image of a existing localisation in one fraction space.
-- The same lift occurs in each intersection contract; it is not a second localisation carrier.
private abbrev fractionLattice (A : Type*) [CommRing A] [IsDomain A]
    (M : Type*) [AddCommGroup M] [Module A M] (𝔭 : PrimeSpectrum A) :
    Submodule A (FractionRing A ⊗[A] M) :=
  LinearMap.range (LocalizedModule.lift 𝔭.asIdeal.primeCompl
    (TensorProduct.mk A (FractionRing A) M 1) (by sorry))

/-- §4.1: a canonical embedding characterized by evaluation on M. -/
theorem bidual_eq_iInf_localization [Module.IsTorsionFree A M] :
    ∃ j : Module.Dual A (Module.Dual A M) →ₗ[A] (FractionRing A ⊗[A] M),
      Function.Injective j ∧
      j.comp (Module.Dual.eval A M) = TensorProduct.mk A (FractionRing A) M 1 ∧
      LinearMap.range j = ⨅ (𝔭 : PrimeSpectrum A) (_ : 𝔭.asIdeal.height = 1),
        fractionLattice A M 𝔭 := sorry

/-- §4.1: integrality of a K-linear functional on every height-one lattice.
The right side spells out membership in A_𝔭 using numerator/denominator pairs. -/
theorem dual_intersection [Module.IsTorsionFree A M] :
    ∃ j : Module.Dual A M →ₗ[A]
      ((FractionRing A ⊗[A] M) →ₗ[FractionRing A] FractionRing A),
      Function.Injective j ∧
      (∀ (φ : Module.Dual A M) (m : M),
        j φ (TensorProduct.tmul A (1 : FractionRing A) m) = algebraMap A (FractionRing A) (φ m)) ∧
      (∀ φ, φ ∈ LinearMap.range j ↔
        ∀ (𝔭 : PrimeSpectrum A), 𝔭.asIdeal.height = 1 →
          ∀ x ∈ fractionLattice A M 𝔭, ∃ a : A, ∃ b : 𝔭.asIdeal.primeCompl,
            φ x = algebraMap A (FractionRing A) a / algebraMap A (FractionRing A) b) := sorry

theorem reflexive_intersection_criterion [Module.IsTorsionFree A M] :
    Module.IsReflexive A M ↔
      LinearMap.range (TensorProduct.mk A (FractionRing A) M 1) =
        ⨅ (𝔭 : PrimeSpectrum A) (_ : 𝔭.asIdeal.height = 1), fractionLattice A M 𝔭 := sorry

theorem dual_reflexive : Module.IsReflexive A (Module.Dual A M) := sorry

-- That reflexive modules are torsion-free is Mathlib's instance `Module.IsReflexive.to_isTorsionFree`.

theorem isPseudoIsomorphism_bidual [Module.IsTorsionFree A M] :
    IsPseudoIsomorphism (Module.Dual.eval A M) := sorry

omit [IsNoetherianRing A] in
theorem free_of_reflexive_of_regularLocal [IsRegularLocalRing A]
    (hdim : ringKrullDim A = 2) [Module.IsReflexive A M] : Module.Free A M := sorry

theorem exists_pseudoIso_torsion_sum :
    ∃ f : M →ₗ[A] (Submodule.torsion A M × (M ⧸ Submodule.torsion A M)),
      IsPseudoIsomorphism f := sorry

/-- The multiset of (prime, exponent) pairs retains repeated factors, not just total lengths. -/
theorem torsion_elementary_divisors (hM : Module.IsTorsion A M) :
    ∃ (n : ℕ) (P : Fin n → PrimeSpectrum A) (e : Fin n → ℕ),
      (∀ i, (P i).asIdeal.height = 1 ∧ 0 < e i) ∧
      (∃ f : M →ₗ[A] (∀ i, A ⧸ ((P i).asIdeal ^ e i)), IsPseudoIsomorphism f) ∧
      ∀ (n' : ℕ) (P' : Fin n' → PrimeSpectrum A) (e' : Fin n' → ℕ),
        (∀ i, (P' i).asIdeal.height = 1 ∧ 0 < e' i) →
        (∃ f' : M →ₗ[A] (∀ i, A ⧸ ((P' i).asIdeal ^ e' i)), IsPseudoIsomorphism f') →
        (Finset.univ.val.map (fun i => (P i, e i))) =
          (Finset.univ.val.map (fun i => (P' i, e' i))) := sorry

omit [IsNoetherianRing A] in
theorem exists_pseudoIso_regularLocal_two [IsRegularLocalRing A] (hdim : ringKrullDim A = 2) :
    ∃ (r n : ℕ) (P : Fin n → PrimeSpectrum A) (e : Fin n → ℕ),
      r = Module.finrank (FractionRing A) (FractionRing A ⊗[A] M) ∧
      (∀ i, (P i).asIdeal.height = 1 ∧ 0 < e i) ∧
      ∃ f : M →ₗ[A] ((Fin r → A) × (∀ i, A ⧸ ((P i).asIdeal ^ e i))),
        IsPseudoIsomorphism f := sorry
end NormalDomain

section CoefficientDVR
variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]

theorem iwasawa_maximal_ideal (ϖ : O) (hϖ : Irreducible ϖ) :
    IsLocalRing.maximalIdeal (PowerSeries O) =
      Ideal.span ({PowerSeries.C ϖ, PowerSeries.X} : Set (PowerSeries O)) := sorry

theorem iwasawa_residue_field :
    Nonempty (IsLocalRing.ResidueField (PowerSeries O) ≃+* IsLocalRing.ResidueField O) := sorry

theorem powerSeries_isRegularLocalRing :
    IsRegularLocalRing (PowerSeries O) ∧ ringKrullDim (PowerSeries O) = 2 := sorry

theorem distinguished_irreducibility (F : O[X])
    (hF : F.IsDistinguishedAt (IsLocalRing.maximalIdeal O)) :
    Irreducible F ↔ Irreducible (F : PowerSeries O) := sorry

theorem height_one_prime_iff (ϖ : O) (hϖ : Irreducible ϖ)
    (P : PrimeSpectrum (PowerSeries O)) : P.asIdeal.height = 1 ↔
      P.asIdeal = Ideal.span {PowerSeries.C ϖ} ∨
        ∃ F : O[X], F.IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧ Irreducible F ∧
          P.asIdeal = Ideal.span {(F : PowerSeries O)} := sorry

theorem exists_pow_mul_distinguished_mul_unit (ϖ : O) (hϖ : Irreducible ϖ)
    (f : PowerSeries O) (hf : f ≠ 0) :
    ∃ (μ : ℕ) (F : O[X]) (u : (PowerSeries O)ˣ),
      F.IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧
        f = PowerSeries.C (ϖ ^ μ) * (F : PowerSeries O) * u := sorry

theorem exists_pseudoIso_elementary (ϖ : O) (hϖ : Irreducible ϖ)
    (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M]
    [Module.Finite (PowerSeries O) M] :
    ∃ (r a b : ℕ) (m : Fin a → ℕ) (F : Fin b → O[X]) (n : Fin b → ℕ),
      (∀ i, 0 < m i) ∧
      (∀ j, (F j).IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧
        Irreducible (F j) ∧ 0 < n j) ∧
      ∃ f : M →ₗ[PowerSeries O]
        ((Fin r → PowerSeries O) ×
          (∀ i, PowerSeries O ⧸ Ideal.span {PowerSeries.C (ϖ ^ m i)}) ×
          (∀ j, PowerSeries O ⧸ Ideal.span {((F j ^ n j : O[X]) : PowerSeries O)})),
        IsPseudoIsomorphism f := sorry

end CoefficientDVR

section CyclotomicPolynomials
variable (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O] [IsDomain O]
  [IsDiscreteValuationRing O] [CharP (IsLocalRing.ResidueField O) p]
/-- Corollary at `𝔪_O` of Tau Ceti's `TauCeti.Polynomial.isDistinguishedAt_one_add_X_pow_sub_one`
(distinguished at the ideal `(p)`, which lies in `𝔪_O`) and `natDegree_one_add_X_pow_sub_one`.
`ω_{-1}` is the empty product `1`; the natural-index `ω_n` is defined without integer division. -/
theorem omega_isDistinguishedAt (n : ℕ) :
    (((1 + X) ^ (p ^ n) - 1 : O[X]).IsDistinguishedAt (IsLocalRing.maximalIdeal O)) ∧
      ((1 + X) ^ (p ^ n) - 1 : O[X]).natDegree = p ^ n := sorry

theorem xi_isDistinguishedAt (n : ℕ) :
    let ξ : O[X] := if n = 0 then X else ∑ i ∈ Finset.range p, (1 + X) ^ (i * p ^ (n - 1))
    ξ.IsDistinguishedAt (IsLocalRing.maximalIdeal O) ∧
      ξ.natDegree = if n = 0 then 1 else p ^ (n - 1) * (p - 1) := sorry

theorem cyclotomic_product (n : ℕ) :
    ((1 + X) ^ (p ^ n) - 1 : O[X]) =
      ∏ j ∈ Finset.range (n + 1),
        (if j = 0 then X else ∑ i ∈ Finset.range p, (1 + X) ^ (i * p ^ (j - 1))) := sorry

theorem cyclotomic_joint_ideal_bound (ϖ : O) (hϖ : Irreducible ϖ) (n : ℕ) :
    ((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O) ∈
      (Ideal.span ({PowerSeries.C ϖ, PowerSeries.X} : Set (PowerSeries O))) ^ (n + 1) := sorry

end CyclotomicPolynomials


section JointAdic
variable (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O] [IsDomain O]
  [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
  [Finite (IsLocalRing.ResidueField O)] [CharP (IsLocalRing.ResidueField O) p]

/-- The coefficient-product topology is the joint maximal-ideal topology, not T-adic topology. -/
theorem iwasawa_joint_adic_completeness :
    letI : TopologicalSpace O := (IsLocalRing.maximalIdeal O).adicTopology
    letI : TopologicalSpace (PowerSeries O) :=
      (TopologicalSpace.induced (fun f : PowerSeries O => fun n : ℕ => f.coeff n) inferInstance)
    IsAdic (IsLocalRing.maximalIdeal (PowerSeries O)) ∧
      IsAdicComplete (IsLocalRing.maximalIdeal (PowerSeries O)) (PowerSeries O) := sorry

-- This separation uses the cyclotomic ideals, rather than powers of T.
theorem cyclotomic_separation :
    (⨅ n : ℕ, Ideal.span {((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)}) = ⊥ := sorry

/-- A compatible family in the existing quotient rings has a unique series lift.
This does not introduce or identify a second completed-group-algebra carrier. -/
theorem cyclotomic_quotient_limit
    (x : ∀ n : ℕ, PowerSeries O ⧸
      Ideal.span {((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)})
    (hcompat : ∀ m n : ℕ, ∀ h : m ≤ n,
      Ideal.Quotient.factor (show
        Ideal.span {((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)} ≤
          Ideal.span {((1 + PowerSeries.X) ^ (p ^ m) - 1 : PowerSeries O)} from by sorry)
        (x n) = x m) :
    ∃! f : PowerSeries O, ∀ n : ℕ,
      Ideal.Quotient.mk
        (Ideal.span {((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)}) f = x n := sorry
end JointAdic

section AnalyticZeros
variable (O : Type*) [NormedCommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
  [Finite (IsLocalRing.ResidueField O)]
  (E : Type*) [NormedField E] [CompleteSpace E]
  (φ : O →+* E) (hφ : Continuous φ) (hinj : Function.Injective φ)
  (hbound : ∀ a : O, ‖φ a‖ ≤ 1) (ϖ : O) (hϖ : Irreducible ϖ)
  (hsmall : ‖φ ϖ‖ < 1)
  (hultra : ∀ a b : E, ‖a + b‖ ≤ max ‖a‖ ‖b‖)
include hφ hinj hbound hϖ hsmall hultra

-- A direct tsum avoids imposing the false linear-topology condition on a normed field.
theorem power_series_finite_zeros (f : PowerSeries O) (hf : f ≠ 0) :
    {z : E | ‖z‖ < 1 ∧ (∑' n : ℕ, φ (f.coeff n) * z ^ n) = 0}.Finite := sorry

theorem power_series_identity (f g : PowerSeries O)
    (Z : Set E) (hZ : Z.Infinite) (hdisc : ∀ z ∈ Z, ‖z‖ < 1)
    (heq : ∀ z ∈ Z,
      (∑' n : ℕ, φ (f.coeff n) * z ^ n) = (∑' n : ℕ, φ (g.coeff n) * z ^ n)) :
    f = g := sorry
end AnalyticZeros

section CharacteristicTransport
variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A]
  [IsIntegrallyClosed A] [UniqueFactorizationMonoid A]
  (M N : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M]
  [AddCommGroup N] [Module A N] [Module.Finite A N]

variable (σ : A ≃+* A)
local instance : RingHomInvPair σ.toRingHom σ.symm.toRingHom := RingHomInvPair.of_ringEquiv σ
local instance : RingHomInvPair σ.symm.toRingHom σ.toRingHom := RingHomInvPair.of_ringEquiv_symm σ
theorem charIdeal_comap_ringEquiv (e : LinearEquiv (σ' := σ.symm.toRingHom) σ.toRingHom N M)
    (hM : Module.IsTorsion A M) (hN : Module.IsTorsion A N) :
    charIdeal A N hN = (charIdeal A M hM).comap σ.toRingHom := sorry
end CharacteristicTransport

section InvariantElementarySpecification
variable (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
  (ϖ : O) (hϖ : Irreducible ϖ)
  (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]

theorem muInvariant_spec {ι κ : Type*} [Fintype ι] [Fintype κ]
    (m : ι → ℕ) (F : κ → O[X]) (e : κ → ℕ)
    (hF : ∀ i, (F i).IsDistinguishedAt (IsLocalRing.maximalIdeal O))
    (hprime : ∀ i, Irreducible (F i))
    (hdecomp : ∃ f : Submodule.torsion (PowerSeries O) M →ₗ[PowerSeries O]
      ((∀ i, PowerSeries O ⧸ Ideal.span {PowerSeries.C (ϖ ^ m i)}) ×
        (∀ i, PowerSeries O ⧸ Ideal.span {((F i ^ e i : O[X]) : PowerSeries O)})),
      IsPseudoIsomorphism f) :
    muInvariant O ϖ hϖ M = ∑ i, m i := sorry

theorem charPoly_elementary_spec {ι κ : Type*} [Fintype ι] [Fintype κ]
    (m : ι → ℕ) (F : κ → O[X]) (e : κ → ℕ)
    (hF : ∀ i, (F i).IsDistinguishedAt (IsLocalRing.maximalIdeal O))
    (hprime : ∀ i, Irreducible (F i))
    (hdecomp : ∃ f : Submodule.torsion (PowerSeries O) M →ₗ[PowerSeries O]
      ((∀ i, PowerSeries O ⧸ Ideal.span {PowerSeries.C (ϖ ^ m i)}) ×
        (∀ i, PowerSeries O ⧸ Ideal.span {((F i ^ e i : O[X]) : PowerSeries O)})),
      IsPseudoIsomorphism f) : charPoly O M = ∏ i, F i ^ e i := sorry

namespace L4Tests
-- test Ramification.uniformizer (computation) [§4.4]
example : muInvariant O ϖ hϖ
    (PowerSeries O ⧸ Ideal.span {PowerSeries.C ϖ}) = 1 := sorry
-- test L4Tests.mu_part (computation) [§4.4]
example : muInvariant O ϖ hϖ (PowerSeries O ⧸ Ideal.span {PowerSeries.C ϖ}) = 1 ∧
    lambdaInvariant O (PowerSeries O ⧸ Ideal.span {PowerSeries.C ϖ}) = 0 ∧ charPoly O (PowerSeries O ⧸ Ideal.span {PowerSeries.C ϖ}) = 1 := sorry
-- test Ramification.ramified_p (non-example) [§4.4]
example (a : O) (r : ℕ) (u : Oˣ) (ha : a = u * ϖ ^ r) :
    muInvariant O ϖ hϖ (PowerSeries O ⧸ Ideal.span {PowerSeries.C a}) = r := sorry
end L4Tests
end InvariantElementarySpecification


section FinitePseudoIsomorphism
variable (A : Type*) [CommRing A] [IsDomain A] [IsNoetherianRing A]
  [IsIntegrallyClosed A] [IsLocalRing A] [Finite (IsLocalRing.ResidueField A)]
  (M N : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M]
  [AddCommGroup N] [Module A N] [Module.Finite A N]
theorem isPseudoIsomorphism_iff_finite (hdim : ringKrullDim A = 2) (f : M →ₗ[A] N) :
    IsPseudoIsomorphism f ↔ Finite (LinearMap.ker f) ∧ Finite (N ⧸ LinearMap.range f) := sorry
end FinitePseudoIsomorphism

namespace L4Tests
variable (p : ℕ) [Fact p.Prime]
-- test L4Tests.two_variables (non-example) [§4.1]
example : let A := MvPowerSeries (Fin 2) (PadicInt p)
    let I : Ideal A := Ideal.span {MvPowerSeries.X 0, MvPowerSeries.X 1}
    IsPseudoNull A (A ⧸ I) ∧ Infinite (A ⧸ I) := sorry
-- test L4Tests.maximal_ideal (non-example) [§4.1]
example : let A := PowerSeries (PadicInt p)
    let I : Ideal A := Ideal.span {PowerSeries.C (p : PadicInt p), PowerSeries.X}
    IsPseudoIsomorphism I.subtype ∧
      ¬ ∃ f : A →ₗ[A] I, IsPseudoIsomorphism f := sorry
-- test L4Tests.not_complete_invariant (non-example) [§4.6]
-- `Λ/(T²)` and `Λ/(T) ⊕ Λ/(T)` have the same characteristic ideal `(T²)` but no pseudo-isomorphism
-- exists in either direction (a fortiori no linear equivalence): a map `Λ/(T²) → Λ/(T)²` kills
-- `T·Λ/(T²) ≅ ℤ_p`, and a map `Λ/(T)² → Λ/(T²)` has image killed by `T`, of infinite index.
example : let A := PowerSeries (PadicInt p)
    let M := A ⧸ Ideal.span {(PowerSeries.X : A) ^ 2}
    let N := (A ⧸ Ideal.span {(PowerSeries.X : A)}) × (A ⧸ Ideal.span {(PowerSeries.X : A)})
    charIdeal A M (by sorry) = charIdeal A N (by sorry) ∧
      (¬ ∃ f : M →ₗ[A] N, IsPseudoIsomorphism f) ∧
      (¬ ∃ g : N →ₗ[A] M, IsPseudoIsomorphism g) := sorry
end L4Tests

/-! ### L4 arithmetic controls

These examples test the displayed identities; they do not test the module interfaces that the
roadmap leaves to implementation. -/

namespace L4Tests

/-- §4.3: `ξ₁ = 1 + (1+T) + (1+T)² = T² + 3T + 3` for `p = 3`, a distinguished
polynomial. -/
example : (1 + (1 + X) + (1 + X) ^ 2 : ℤ[X]) = X ^ 2 + 3 * X + 3 := by ring

/-- §4.3: `ω₁ = (1+T)² − 1 = T² + 2T` for `p = 2`. -/
example : ((1 + X) ^ 2 - 1 : ℤ[X]) = X ^ 2 + 2 * X := by ring

/-- §4.3: modulo `p`, `ω_n ≡ T^{p^n}` (here `p = 2`, `n = 2`). -/
example : ((1 + X) ^ 4 - 1 : (ZMod 2)[X]) = X ^ 4 := by
  have h := add_pow_char_pow (R := (ZMod 2)[X]) (p := 2) (n := 2) (1 : (ZMod 2)[X]) X
  norm_num at h
  rw [h]
  ring

/-- §4.7 (Lemma 5.3.18, `λ = 1`): on `Λ/(T − 3)` (γ acting by `4`), `ξ₂ = Σ_{i<3} γ^{3i}` acts by
`1 + 4³ + 4⁶ = 3 · 1387` with `3 ∤ 1387`, so `ξ₂ M = 3M`. -/
example : (1 + 4 ^ 3 + 4 ^ 6 : ℤ) = 3 * 1387 ∧ ¬ (3 : ℤ) ∣ 1387 := by decide

/-- §4.7: for `M = Λ/(T − p)` and `n = 0`, `#M_Γ = p` and `M^Γ = 0`, and the
formula's right side is `|F(0)|_p = |−p|_p = 1/p` (here `p = 3`). -/
example : padicNorm 3 (-3 : ℚ) = 1 / 3 := by
  have h := padicNorm.padicNorm_p (p := 3) (by norm_num)
  rw [padicNorm.neg]
  norm_num at h ⊢
  exact h

/-- §4.4 (non-example): the characteristic polynomial depends on γ. For `M = Λ/(T − p)`
(γ acting by `1 + p`), for odd prime p the generator `γ²` acts by `(1 + p)² = 1 + (2p + p²)`, so `F_{M,γ²} = T − (2p + p²)`. -/
example (p : ℤ) : (1 + p) ^ 2 - 1 = 2 * p + p ^ 2 := by ring

/-- §4.6 (`|H| = 2`, `p` odd): `e_± = (1 ± h)/2` are orthogonal idempotents. -/
example (h : ℚ) (hh : h ^ 2 = 1) :
    ((1 + h) / 2) ^ 2 = (1 + h) / 2 ∧ ((1 + h) / 2) * ((1 - h) / 2) = 0 ∧ (1 + h) / 2 + (1 - h) / 2 = 1 := by
  refine ⟨?_, ?_, ?_⟩
  · linear_combination (1 / 4 : ℚ) * hh
  · linear_combination (-1 / 4 : ℚ) * hh
  · ring

/-- §4.3: Mathlib's preparation theorem is the adapter's source. -/
example {A : Type*} [CommRing A] [IsLocalRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    {g : PowerSeries A} (hg : g.map (IsLocalRing.residue A) ≠ 0) :
    ∃ f h, g.IsWeierstrassFactorization f h :=
  PowerSeries.exists_isWeierstrassFactorization hg

end L4Tests

/-! ### Further L4 interfaces

The remaining L4 declaration names and unit tests of the roadmap. Signatures only; every proof is
`sorry`. -/

section FurtherInterfaces
variable (p : ℕ) [Fact p.Prime]
local instance : Finite (IsLocalRing.ResidueField (PadicInt p)) :=
  Finite.of_equiv (ZMod p) PadicInt.residueField.symm.toEquiv
local notation "Λ" => PowerSeries (PadicInt p)
local notation "ω[" n "]" => ((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries (PadicInt p))
-- ξ_j is written out as `if j = 0 then T else ∑_{i<p} (1+T)^{i p^{j-1}}` (NSW (5.3.13)).

/-- §4.7 (NSW (5.3.11)): the snake lemma for multiplication by `T`
on a short exact sequence gives the six-term exact sequence of invariants `M^Γ = ker T` and
coinvariants `M_Γ = M/TM`. -/
theorem invariants_coinvariants_six_term_exact
    {M N P : Type*} [AddCommGroup M] [Module Λ M] [AddCommGroup N] [Module Λ N]
    [AddCommGroup P] [Module Λ P]
    (f : M →ₗ[Λ] N) (g : N →ₗ[Λ] P) (hf : Function.Injective f) (hg : Function.Surjective g)
    (hex : Function.Exact f g) :
    ∃ (fΓ : Submodule.torsionBy Λ M (PowerSeries.X : Λ) →ₗ[Λ]
        Submodule.torsionBy Λ N (PowerSeries.X : Λ))
      (gΓ : Submodule.torsionBy Λ N (PowerSeries.X : Λ) →ₗ[Λ]
        Submodule.torsionBy Λ P (PowerSeries.X : Λ))
      (δ : Submodule.torsionBy Λ P (PowerSeries.X : Λ) →ₗ[Λ]
        M ⧸ ((PowerSeries.X : Λ) • (⊤ : Submodule Λ M)))
      (fΓ' : M ⧸ ((PowerSeries.X : Λ) • (⊤ : Submodule Λ M)) →ₗ[Λ]
        N ⧸ ((PowerSeries.X : Λ) • (⊤ : Submodule Λ N)))
      (gΓ' : N ⧸ ((PowerSeries.X : Λ) • (⊤ : Submodule Λ N)) →ₗ[Λ]
        P ⧸ ((PowerSeries.X : Λ) • (⊤ : Submodule Λ P))),
      (∀ m, (fΓ m).1 = f m.1) ∧ (∀ n, (gΓ n).1 = g n.1) ∧
      (∀ m : M, fΓ' (Submodule.Quotient.mk m) = Submodule.Quotient.mk (f m)) ∧
      (∀ n : N, gΓ' (Submodule.Quotient.mk n) = Submodule.Quotient.mk (g n)) ∧
      Function.Injective fΓ ∧ Function.Exact fΓ gΓ ∧ Function.Exact gΓ δ ∧
      Function.Exact δ fΓ' ∧ Function.Exact fΓ' gΓ' ∧ Function.Surjective gΓ' := sorry

/-- §4.7 (NSW (5.3.17)). The index `n₀` here is the source's `n₀ + 1`:
`∏_{j < n₀} ξ_j = ω_{n₀-1}` (the empty product is `ω_{-1} = 1`) and
`∏_{n₀ ≤ j ≤ n} ξ_j = ω_n / ω_{n₀-1}`. The hypothesis says that `ω_{n₀-1}` carries `M_δ` into the
maximal finite submodule (the coefficient torsion of `M_δ`), that is `d(M) ≤ n₀ - 1`. -/
theorem card_quotient_omega_eq (M : Type*) [AddCommGroup M] [Module Λ M] [Module.Finite Λ M]
    (hM : Module.IsTorsion Λ M) (hp : Irreducible (p : PadicInt p)) (n₀ : ℕ)
    (hn₀ : ∀ m ∈ delta_submodule p M, ∃ k : ℕ,
      PowerSeries.C (p ^ k : PadicInt p) • ((∏ j ∈ Finset.range n₀, (if j = 0 then (PowerSeries.X : PowerSeries (PadicInt p))
          else ∑ i ∈ Finset.range p, (1 + PowerSeries.X) ^ (i * p ^ (j - 1)))) • m) = 0) :
    ∃ (ν : ℤ) (N : ℕ), ∀ n, N ≤ n → n₀ ≤ n →
      (Nat.card (M ⧸ ((∏ j ∈ Finset.Ico n₀ (n + 1), (if j = 0 then (PowerSeries.X : PowerSeries (PadicInt p))
          else ∑ i ∈ Finset.range p, (1 + PowerSeries.X) ^ (i * p ^ (j - 1)))) • (⊤ : Submodule Λ M))) : ℚ) =
        (p : ℚ) ^ ((muInvariant (PadicInt p) (p : PadicInt p) hp M * p ^ n +
          lambdaInvariant (PadicInt p) M * n : ℕ) : ℤ) * (p : ℚ) ^ ν := sorry

/-- §4.7: the growth formula over a mixed-characteristic coefficient
ring `O` with `p = u ϖ^e` (`e ≥ 1`, so `O` has characteristic zero and residue characteristic `p`)
and residue field of cardinality `p^f`, with the `ϖ`-normalised `μ`:
`#(M/(ω_n/ω_{n₀-1})M) = p^{f μ p^n + e f λ n + ν}`. The hypothesis on `n₀` is that of
`card_quotient_omega_eq`, with the `δ`-submodule written out. The statement is registered
separately from the `ℤ_p` one because the exponents differ; `e = f = 1` recovers it. It is false in
equal characteristic (`L4Tests.growth_formula_fails_equal_characteristic`). -/
theorem card_quotient_omega_eq_general (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)] (ϖ : O) (hϖ : Irreducible ϖ)
    (e f : ℕ) (he : 0 < e) (u : Oˣ) (hpe : (p : O) = u * ϖ ^ e)
    (hf : Nat.card (IsLocalRing.ResidueField O) = p ^ f)
    (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (hM : Module.IsTorsion (PowerSeries O) M) (n₀ : ℕ)
    (hn₀ : ∀ m : M, (∃ n : ℕ, (((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)) • m = 0) →
      ∃ k : ℕ, PowerSeries.C (ϖ ^ k) • ((∏ j ∈ Finset.range n₀,
        (if j = 0 then (PowerSeries.X : PowerSeries O)
          else ∑ i ∈ Finset.range p, (1 + PowerSeries.X) ^ (i * p ^ (j - 1)))) • m) = 0) :
    ∃ (ν : ℤ) (N : ℕ), ∀ n, N ≤ n → n₀ ≤ n →
      (Nat.card (M ⧸ ((∏ j ∈ Finset.Ico n₀ (n + 1), (if j = 0 then (PowerSeries.X : PowerSeries O)
          else ∑ i ∈ Finset.range p, (1 + PowerSeries.X) ^ (i * p ^ (j - 1)))) •
            (⊤ : Submodule (PowerSeries O) M))) : ℚ) =
        (p : ℚ) ^ ((f * muInvariant O ϖ hϖ M * p ^ n + e * f * lambdaInvariant O M * n : ℕ) : ℤ) *
          (p : ℚ) ^ ν := sorry

namespace L4Tests
-- test L4Tests.growth_formula_fails_equal_characteristic (non-example) [§4.7]
-- `O = 𝔽_p⟦ϖ⟧`, `M = O⟦T⟧/(T − ϖ) ≅ O` with `T` acting by `ϖ`: `μ = 0`, `λ = 1`, but
-- `ω_n = (1 + ϖ)^{p^n} − 1 = ϖ^{p^n}` in characteristic `p`, so `#M/ω_nM = p^{p^n}`, not `p^{n + ν}`.
example [IsAdicComplete (IsLocalRing.maximalIdeal (PowerSeries (ZMod p))) (PowerSeries (ZMod p))]
    [Finite (IsLocalRing.ResidueField (PowerSeries (ZMod p)))]
    (hX : Irreducible (PowerSeries.X : PowerSeries (ZMod p))) :
    let O := PowerSeries (ZMod p)
    let M := PowerSeries O ⧸ Ideal.span {(PowerSeries.X - PowerSeries.C (PowerSeries.X : O) : PowerSeries O)}
    muInvariant O PowerSeries.X hX M = 0 ∧ lambdaInvariant O M = 1 ∧
    ∀ n : ℕ, Nat.card (M ⧸ ((((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)) •
      (⊤ : Submodule (PowerSeries O) M))) = p ^ (p ^ n) := sorry
-- test L4Tests.growth_formula_unramified_quadratic (computation) [§4.7]
-- `O` unramified quadratic over `ℤ_p` (`f = 2`, `e = 1`), `M = O⟦T⟧/(p)`: `μ = 1`, `λ = 0` and
-- `#M/ω_nM = #𝔽_{p²}[T]/(T^{p^n}) = p^{2 p^n}`, which the `ℤ_p`-normalised formula `p^{p^n}` misses.
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    (hp : Irreducible (p : O)) (hf : Nat.card (IsLocalRing.ResidueField O) = p ^ 2) :
    let M := PowerSeries O ⧸ Ideal.span {(PowerSeries.C (p : O) : PowerSeries O)}
    muInvariant O (p : O) hp M = 1 ∧ lambdaInvariant O M = 0 ∧
    ∀ n : ℕ, Nat.card (M ⧸ ((((1 + PowerSeries.X) ^ (p ^ n) - 1 : PowerSeries O)) •
      (⊤ : Submodule (PowerSeries O) M))) = p ^ (2 * p ^ n) := sorry
end L4Tests

/-- §4.7 (NSW §3, Exercise 3): finiteness of the
coinvariants and of the invariants at level `n` are equivalent, and equivalent to
`F_M(ζ - 1) ≠ 0` for every `p^n`-th root of unity `ζ`, which is the coprimality of `F_M` and
`ω_n` in `ℚ_p[X]`. -/
theorem finite_coinvariants_iff (M : Type*) [AddCommGroup M] [Module Λ M] [Module.Finite Λ M]
    (hM : Module.IsTorsion Λ M) (n : ℕ) :
    (Finite (M ⧸ (ω[n] • (⊤ : Submodule Λ M))) ↔ Finite (Submodule.torsionBy Λ M ω[n])) ∧
    (Finite (M ⧸ (ω[n] • (⊤ : Submodule Λ M))) ↔
      IsCoprime ((charPoly (PadicInt p) M).map (algebraMap (PadicInt p) ℚ_[p]))
        ((1 + X) ^ (p ^ n) - 1 : ℚ_[p][X])) := sorry

/-- §4.7 (NSW §3, Exercise 3): under the finiteness conditions,
`#M^{Γ_n} / #M_{Γ_n} = p^{-μ p^n} ∏_{ζ^{p^n} = 1} |F_M(ζ - 1)|_p`, the product over the
`p^n`-th roots of unity in `ℂ_p`. -/
theorem coinvariants_euler_product (M : Type*) [AddCommGroup M] [Module Λ M] [Module.Finite Λ M]
    (hM : Module.IsTorsion Λ M) (hp : Irreducible (p : PadicInt p)) (n : ℕ)
    (hfin : Finite (M ⧸ (ω[n] • (⊤ : Submodule Λ M)))) :
    (Nat.card (Submodule.torsionBy Λ M ω[n]) : ℝ) /
        Nat.card (M ⧸ (ω[n] • (⊤ : Submodule Λ M))) =
      (p : ℝ) ^ (-((muInvariant (PadicInt p) (p : PadicInt p) hp M * p ^ n : ℕ) : ℤ)) *
        ((Polynomial.nthRoots (p ^ n) (1 : ℂ_[p])).map fun ζ =>
          ‖Polynomial.aeval (ζ - 1)
            ((charPoly (PadicInt p) M).map (algebraMap (PadicInt p) ℚ_[p]))‖).prod := sorry

/-- §4.1 (NSW §3, Exercise 1): the inclusion of the maximal ideal
is a pseudo-isomorphism, and no map in the other direction is one. -/
theorem pseudoiso_maximal_ideal_control :
    let I : Ideal Λ := Ideal.span {PowerSeries.C (p : PadicInt p), PowerSeries.X}
    IsPseudoIsomorphism I.subtype ∧ ¬ ∃ f : Λ →ₗ[Λ] I, IsPseudoIsomorphism f := sorry

/-- §4.2 (NSW (5.1.7)): an extension of torsion modules with disjoint
height-one supports is pseudo-isomorphic to the direct sum. -/
theorem disjoint_torsion_extension {A : Type*} [CommRing A] [IsDomain A] [IsNoetherianRing A]
    [IsIntegrallyClosed A] {M N P : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]
    [AddCommGroup N] [Module A N] [Module.Finite A N]
    [AddCommGroup P] [Module A P] [Module.Finite A P]
    (f : M →ₗ[A] N) (g : N →ₗ[A] P) (hf : Function.Injective f) (hg : Function.Surjective g)
    (hex : Function.Exact f g) (hM : Module.IsTorsion A M) (hP : Module.IsTorsion A P)
    (hdisj : ∀ 𝔭 : PrimeSpectrum A, 𝔭.asIdeal.height = 1 →
      Subsingleton (LocalizedModule 𝔭.asIdeal.primeCompl M) ∨
        Subsingleton (LocalizedModule 𝔭.asIdeal.primeCompl P)) :
    ∃ h : N →ₗ[A] M × P, IsPseudoIsomorphism h := sorry

/-- §4.2 (NSW (5.1.9)): for a regular local ring of
dimension `n ≥ 2` with regular system of parameters `x`, a finitely generated module is free iff
`M/(x_0, …, x_{i-1})M` is reflexive over `A/(x_0, …, x_{i-1})` for every `i ≤ n - 2`. The quotient
module is written as the base change `(A/I) ⊗[A] M`. -/
theorem regular_parameter_reflexivity_criterion {A : Type*} [CommRing A] [IsRegularLocalRing A]
    {M : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M]
    (n : ℕ) (hn : ringKrullDim A = n) (h2 : 2 ≤ n) (x : Fin n → A)
    (hx : Ideal.span (Set.range x) = IsLocalRing.maximalIdeal A) :
    Module.Free A M ↔ ∀ i : ℕ, i + 2 ≤ n →
      Module.IsReflexive (A ⧸ Ideal.span (x '' {j | (j : ℕ) < i}))
        ((A ⧸ Ideal.span (x '' {j | (j : ℕ) < i})) ⊗[A] M) := sorry

/-- §4.1: submodules agreeing after inverting `ϖ` and differing by a
series of finite reduced degree have finite index; the inclusion is a pseudo-isomorphism. -/
theorem finite_index_inclusion (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    (ϖ : O) (hϖ : Irreducible ϖ)
    (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (N : Submodule (PowerSeries O) M)
    (hK : ∀ m : M, ∃ k : ℕ, PowerSeries.C (ϖ ^ k) • m ∈ N)
    (f : PowerSeries O) (hf : f.map (IsLocalRing.residue O) ≠ 0) (hfM : ∀ m : M, f • m ∈ N) :
    Finite (M ⧸ N) ∧ IsPseudoIsomorphism N.subtype := sorry

/-- §4.7 (NSW (5.3.16)): the elementary factors of `M_δ` are
`Λ/(ξ_m)` with exponent one; there are no vertical factors and no higher cyclotomic powers. -/
theorem delta_cyclotomic_elementary_factors (M : Type*) [AddCommGroup M] [Module Λ M]
    [Module.Finite Λ M] :
    ∃ (n : ℕ) (e : Fin n → ℕ)
      (f : delta_submodule p M →ₗ[Λ] (∀ i : Fin n, Λ ⧸ Ideal.span
        {(if e i = 0 then (PowerSeries.X : PowerSeries (PadicInt p))
          else ∑ k ∈ Finset.range p, (1 + PowerSeries.X) ^ (k * p ^ (e i - 1)))})),
      IsPseudoIsomorphism f := sorry

/-- §4.6: the Galois-orbit relation on the characters `H →* O'ˣ` of a
finite abelian group with values in an `O`-algebra `O'`: `χ ~ χ'` when `χ' = σ ∘ χ` for an
`O`-algebra automorphism `σ` of `O'`. -/
def characterGaloisOrbit (O O' H : Type*) [CommRing O] [CommRing O'] [Algebra O O']
    [CommGroup H] : Setoid (H →* O'ˣ) where
  r χ χ' := ∃ σ : O' ≃ₐ[O] O', ∀ h, σ (χ h) = χ' h
  iseqv := by sorry

/-- §4.6 (nonsplit coefficients): for `#H` a unit in `O` and `O'` a
domain over `O` containing the values of all characters of `H`, evaluation at one representative
per Galois orbit of characters identifies `O[H]` with `∏_{[χ]} O[χ(H)]`, the product over the
orbits of the `O`-subalgebras of `O'` generated by the character values; each factor is a discrete
valuation ring, finite free and unramified over `O` (a uniformizer of `O` stays irreducible), with
finite residue field. The index set is the set of orbits and the factors are the `O[χ(H)]`, not an
unspecified product decomposition; for split `O` every orbit is a singleton
(§4.6). -/
theorem character_orbit_coefficients (O : Type*) [CommRing O] [IsDomain O]
    [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [Finite (IsLocalRing.ResidueField O)]
    (H : Type*) [CommGroup H] [Finite H] (hH : IsUnit (Nat.card H : O))
    (O' : Type*) [CommRing O'] [IsDomain O'] [Algebra O O']
    [HasEnoughRootsOfUnity O' (Monoid.exponent H)] :
    let rep : Quotient (characterGaloisOrbit O O' H) → (H →* O'ˣ) := Quotient.out
    let R : Quotient (characterGaloisOrbit O O' H) → Subalgebra O O' :=
      fun c => Algebra.adjoin O (Set.range fun h => ((rep c h : O'ˣ) : O'))
    let ev : MonoidAlgebra O H → Quotient (characterGaloisOrbit O O' H) → O' :=
      fun x c => MonoidAlgebra.lift O O' H ((Units.coeHom O').comp (rep c)) x
    Function.Injective ev ∧
    Set.range ev = {v | ∀ c, v c ∈ R c} ∧
    ∀ c, ∃ (_ : IsDomain (R c)) (_ : IsDiscreteValuationRing (R c)),
      Module.Finite O (R c) ∧ Module.Free O (R c) ∧
      Finite (IsLocalRing.ResidueField (R c)) ∧
      ∀ ϖ : O, Irreducible ϖ → Irreducible (algebraMap O (R c) ϖ) := sorry

section GeneratorChange
variable (σ : PowerSeries (PadicInt p) ≃ₐ[PadicInt p] PowerSeries (PadicInt p))
local instance : RingHomInvPair σ.toRingEquiv.toRingHom σ.toRingEquiv.symm.toRingHom :=
  RingHomInvPair.of_ringEquiv σ.toRingEquiv
local instance : RingHomInvPair σ.toRingEquiv.symm.toRingHom σ.toRingEquiv.toRingHom :=
  RingHomInvPair.of_ringEquiv_symm σ.toRingEquiv

/-- §4.4: `r`, `μ` and `λ` do not depend on the topological generator.
A change of generator `T ↦ (1 + T)^a - 1`, `a ∈ ℤ_pˣ`, is a `ℤ_p`-algebra automorphism `σ` of `Λ`,
and the module for the new generator is the restriction of scalars along `σ`, written here as a
`σ`-semilinear equivalence `N ≃ M`. -/
theorem invariants_generator_indep (hp : Irreducible (p : PadicInt p))
    {M N : Type*} [AddCommGroup M] [Module Λ M] [Module.Finite Λ M]
    [AddCommGroup N] [Module Λ N] [Module.Finite Λ N]
    (e : LinearEquiv (σ' := σ.toRingEquiv.symm.toRingHom) σ.toRingEquiv.toRingHom N M) :
    muInvariant (PadicInt p) (p : PadicInt p) hp N = muInvariant (PadicInt p) (p : PadicInt p) hp M ∧
    lambdaInvariant (PadicInt p) N = lambdaInvariant (PadicInt p) M ∧
    Module.finrank (FractionRing Λ) (FractionRing Λ ⊗[Λ] N) =
      Module.finrank (FractionRing Λ) (FractionRing Λ ⊗[Λ] M) := sorry
end GeneratorChange

/-- §4.6: `char_{Λ'}(Λ' ⊗_Λ M) = char_Λ(M) Λ'` for a finite flat
(equivalently, over a discrete valuation ring, finite free) coefficient extension `O → O'`. -/
theorem charIdeal_baseChange (O O' : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    [CommRing O'] [IsDomain O'] [IsDiscreteValuationRing O']
    [IsAdicComplete (IsLocalRing.maximalIdeal O') O'] [Finite (IsLocalRing.ResidueField O')]
    [Algebra O O'] [Module.Finite O O'] [Module.Free O O']
    (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (hM : Module.IsTorsion (PowerSeries O) M) :
    letI : Algebra (PowerSeries O) (PowerSeries O') :=
      (PowerSeries.map (algebraMap O O')).toAlgebra
    haveI : Module.Finite (PowerSeries O') (PowerSeries O' ⊗[PowerSeries O] M) := by sorry
    charIdeal (PowerSeries O') (PowerSeries O' ⊗[PowerSeries O] M) (by sorry) =
      (charIdeal (PowerSeries O) M hM).map (PowerSeries.map (algebraMap O O')) := sorry

/-- §4.6: for `O` finite free over `ℤ_p` and `char_{Λ_O}(M) = (f)`,
the characteristic ideal of `M` as a `ℤ_p⟦T⟧`-module is generated by the norm of `f`, the
determinant of multiplication by `f` on the finite free `ℤ_p⟦T⟧`-module `O⟦T⟧`. -/
theorem charIdeal_restrictScalars (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    [Algebra (PadicInt p) O] [Module.Finite (PadicInt p) O] [Module.Free (PadicInt p) O]
    (M : Type*) [AddCommGroup M] [Module (PowerSeries O) M] [Module.Finite (PowerSeries O) M]
    (hM : Module.IsTorsion (PowerSeries O) M) (f : PowerSeries O)
    (hf : charIdeal (PowerSeries O) M hM = Ideal.span {f}) :
    letI : Algebra Λ (PowerSeries O) := (PowerSeries.map (algebraMap (PadicInt p) O)).toAlgebra
    letI : Module Λ M := Module.compHom M (PowerSeries.map (algebraMap (PadicInt p) O))
    haveI : Module.Finite Λ M := by sorry
    charIdeal Λ M (by sorry) =
      Ideal.span {LinearMap.det (Algebra.lsmul Λ Λ (PowerSeries O) f)} := sorry

namespace L4Tests

-- test L4Tests.generator_dependence (non-example) [§4.4]
-- With γ ↦ γ², the module Λ/(T − p) becomes Λ/(T − (2p + p²)): F changes, λ does not.
example (hp2 : p ≠ 2) :
    charPoly (PadicInt p) (Λ ⧸ Ideal.span {(PowerSeries.X - PowerSeries.C (p : PadicInt p) : Λ)}) =
      X - C (p : PadicInt p) ∧
    charPoly (PadicInt p)
      (Λ ⧸ Ideal.span {(PowerSeries.X - PowerSeries.C (2 * p + p ^ 2 : PadicInt p) : Λ)}) =
      X - C (2 * p + p ^ 2 : PadicInt p) ∧
    lambdaInvariant (PadicInt p)
      (Λ ⧸ Ideal.span {(PowerSeries.X - PowerSeries.C (p : PadicInt p) : Λ)}) = 1 ∧
    lambdaInvariant (PadicInt p)
      (Λ ⧸ Ideal.span {(PowerSeries.X - PowerSeries.C (2 * p + p ^ 2 : PadicInt p) : Λ)}) = 1 ∧
    ∃ σ : Λ ≃ₐ[PadicInt p] Λ, σ PowerSeries.X = (1 + PowerSeries.X) ^ 2 - 1 ∧
      σ (PowerSeries.X - PowerSeries.C (2 * p + p ^ 2 : PadicInt p)) ∈
        Ideal.span {(PowerSeries.X - PowerSeries.C (p : PadicInt p) : Λ)} := sorry

-- test L4Tests.ramified_normalisation (compatibility) [§4.4]
-- O = ℤ_p[√p], ϖ = √p: μ(Λ/(ϖ)) = 1 in the ϖ-normalisation (not ½), and μ(Λ/(p)) = 2.
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    (ϖ : O) (hϖ : Irreducible ϖ) (u : Oˣ) (hpO : (p : O) = u * ϖ ^ 2) :
    muInvariant O ϖ hϖ (PowerSeries O ⧸ Ideal.span {PowerSeries.C ϖ}) = 1 ∧
    muInvariant O ϖ hϖ (PowerSeries O ⧸ Ideal.span {PowerSeries.C (p : O)}) = 2 := sorry

-- test L4Tests.norm_formula (computation) [§4.6]
-- p ≡ 3 mod 4, O = ℤ_p[i], M = O⟦T⟧/(T − ip): as a ℤ_p⟦T⟧-module, char(M) = (T² + p²).
example (O : Type*) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [Finite (IsLocalRing.ResidueField O)]
    [Algebra (PadicInt p) O] [Module.Finite (PadicInt p) O] [Module.Free (PadicInt p) O]
    (hrank : Module.finrank (PadicInt p) O = 2) (i : O) (hi : i ^ 2 = -1) (hp4 : p % 4 = 3) :
    let M := PowerSeries O ⧸
      Ideal.span {PowerSeries.X - PowerSeries.C (i * algebraMap (PadicInt p) O p)}
    letI : Module Λ M := Module.compHom M (PowerSeries.map (algebraMap (PadicInt p) O))
    haveI : Module.Finite Λ M := by sorry
    charIdeal Λ M (by sorry) =
      Ideal.span {(PowerSeries.X ^ 2 + PowerSeries.C (p ^ 2 : PadicInt p) : Λ)} := sorry

-- test L4Tests.order_two (computation) [§4.6]
-- H = {1, h}, p odd: e_± = (1 ± h)/2 are orthogonal idempotents summing to 1.
example (hp2 : p ≠ 2) (χ : Multiplicative (ZMod 2) →* (PadicInt p)ˣ)
    (hχ : (χ (Multiplicative.ofAdd 1) : PadicInt p) = -1) :
    charIdempotent (1 : Multiplicative (ZMod 2) →* (PadicInt p)ˣ) * charIdempotent χ = 0 ∧
    charIdempotent (1 : Multiplicative (ZMod 2) →* (PadicInt p)ˣ) + charIdempotent χ = 1 ∧
    charIdempotent (1 : Multiplicative (ZMod 2) →* (PadicInt p)ˣ) =
      Ring.inverse (2 : PadicInt p) •
        (1 + MonoidAlgebra.of (PadicInt p) (Multiplicative (ZMod 2)) (Multiplicative.ofAdd 1)) ∧
    charIdempotent χ =
      Ring.inverse (2 : PadicInt p) •
        (1 - MonoidAlgebra.of (PadicInt p) (Multiplicative (ZMod 2)) (Multiplicative.ofAdd 1)) :=
  sorry

-- test L4Tests.teichmuller (computation) [§4.6]
-- H = μ_{p-1} ≅ (ℤ/p)ˣ, p odd: #H is a unit in ℤ_p and ℤ_p has the Teichmüller roots of unity,
-- so O = ℤ_p suffices for the split decomposition.
example (hp2 : p ≠ 2) :
    IsUnit ((Nat.card (ZMod p)ˣ : ℕ) : PadicInt p) ∧
    (∃ ζ : PadicInt p, IsPrimitiveRoot ζ (p - 1)) ∧
    HasEnoughRootsOfUnity (PadicInt p) (Monoid.exponent (ZMod p)ˣ) := sorry

-- test L4Tests.p_divides (non-example) [§4.6]
-- H = C_p: 1/p ∉ ℤ_p, and ℤ_p[C_p] is local with no nontrivial idempotent.
example : ¬ IsUnit ((Nat.card (Multiplicative (ZMod p)) : ℕ) : PadicInt p) ∧
    IsLocalRing (MonoidAlgebra (PadicInt p) (Multiplicative (ZMod p))) ∧
    ∀ e : MonoidAlgebra (PadicInt p) (Multiplicative (ZMod p)),
      IsIdempotentElem e → e = 0 ∨ e = 1 := sorry

-- test L4Tests.trivial_group (degenerate) [§4.6]
example {R : Type*} [CommRing R] [IsDomain R] {H : Type*} [CommGroup H] [Finite H]
    [Subsingleton H] (M : Type*) [AddCommGroup M] [Module R M] [Module (MonoidAlgebra R H) M]
    [IsScalarTower R (MonoidAlgebra R H) M] :
    charIdempotent (1 : H →* Rˣ) = 1 ∧ isotypicComponent M (1 : H →* Rˣ) = ⊤ := sorry

end L4Tests

end FurtherInterfaces

end TauCeti.Iwasawa

/-!
# PadicMeasuresIwasawaAlgebras L6: character group rings, quadratic presentations, Fitting ideals,
# compound matrices and transposes

These declarations suggest Lean forms for the Dasgupta–Kakde ring theory that L6 owns
(arXiv:2010.00657v3, §§2.2–2.3, Lemma 3.9, §6.1, Remark A.7, Appendix B.2 and (171)). They are
signatures and tests: proofs are `sorry`, except where a statement is a line or two from the
pinned libraries, and nothing is claimed formalised. Every definition, API item and unit test of
the L6 targets of the roadmap appears under the name the roadmap gives it; a test is an `example`
preceded by a line `-- test <name> (<kind>) [<target>]`.

Conventions.
* Characters are group homomorphisms `G →* Oˣ`; `ψ(x)` for `x ∈ O[G]` is `charEval ψ x`. The
  coefficient hypotheses of Dasgupta–Kakde (odd `p`, `O` the valuation ring of a finite extension
  of `ℚ_p` containing all character values, `G = G_p × G'`) are not bundled: each statement
  carries the hypotheses the roadmap records as used. These are `[IsDomain O]`; `[Finite G]`
  (`[Fintype G]` where a sum over `G` is written); Mathlib's
  `[HasEnoughRootsOfUnity O (Monoid.exponent G)]` for "`O` contains the values of all characters
  of `G`" (with `O` a domain it gives `#G ≠ 0` in `O`); `(Nat.card G : O) ≠ 0` where only that is
  used; `IsUnit (Nat.card G' : O)` for a subgroup `G'` of order prime to `p`; complementary
  subgroups `G'.IsComplement' Gp` for `G = G_p × G'`; a local ring `O` with
  `[CharP (IsLocalRing.ResidueField O) p]`; and Mathlib's `[Ring.HasFiniteQuotients O]` for the
  finite quotients `O/(a)`, `a ≠ 0`. A set of characters "belonging to one `χ`" is a set whose
  pairwise quotients have `p`-power order.
* `Fitt⁰`: `TauCeti.fittingIdeal R M 0` is the initial Fitting ideal of a finitely
  presented module, §4.5, declared with its API after the
  contragredient block below because L6 is its main consumer. `Fittⁱ` for every `i` is L6's
  `TauCeti.fittingIdeal R M i` (§6.5), the same declaration at
  `i = 0`. Both take `[Module.FinitePresentation R M]`; where
  a statement concludes that a module is finitely presented, that instance is an argument,
  because the ideal cannot be written without it.
* `e_χ`: `TauCeti.Iwasawa.charIdempotent χ` stands for the character idempotent
  `#H⁻¹ Σ_{a ∈ H} χ(a)⁻¹ a ∈ O[H]` of §4.6, declared in the L4 block and reused here. L6 does not own it. In `O[G]`, for a subgroup `G'` and a character `χ` of `G'`,
  `e_χ` is `MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)`.

Tau Ceti declarations that the block reuses instead of restating:
* `TauCeti.DiagonalizableGroup.point`, `point_single`, `point_single_one`
  (`TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Basic.lean`): `charEval` is `point`;
* `TauCeti.MonoidAlgebra.augmentation` (`TauCeti/Algebra/MonoidAlgebra/Exactness.lean`): `ev_1`;
* `Representation.ofLinearCharacter` (`TauCeti/RepresentationTheory/LinearCharacter.lean`): the
  source's `O_ψ`;
* `TauCeti.subgroupCharSum` (`TauCeti/Algebra/MonoidAlgebra/SubgroupCharSum.lean`): the norm
  element `N_I` is `subgroupCharSum 1 I`;
* `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, `instFintypeMonoidHomUnits`
  (`TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean`): column orthogonality, from
  which injectivity of the joint evaluation is proved;
* `TauCeti.HopfAlgebra.antipodeAlgEquiv`, `antipode_antipode`
  (`TauCeti/Algebra/HopfAlgebra/Antipode.lean`): the involution `#`;
* `Matrix.pairMinor` (`TauCeti/LinearAlgebra/Matrix/Minor.lean`): the `2 × 2` minors, compared
  with `Matrix.compound 2`; `exteriorPower.map_top_eq_det_smul`
  (`TauCeti/LinearAlgebra/ExteriorPower.lean`) is the top-degree case of `Matrix.compound_card`;
* `TauCeti.AuslanderReitenTranspose` with `mk`, `mk_eq_zero_iff`, `mk_surjective`,
  `op_algebraMap_smul`, `subsingleton_of_comp_eq_id`, `linearEquiv`
  (`TauCeti/Algebra/Module/AuslanderReiten/Transpose.lean`): the carrier of the transpose.
A quadratic presentation is compared with Mathlib's `Module.Presentation`.
-/

section L6

noncomputable section

open scoped Pointwise

namespace TauCeti

/-! ## Character evaluation and the joint evaluation (§6.1) -/

section CharacterEvaluation

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- §6.1: the evaluation `ev_ψ : O[G] → O`, `Σ a_g g ↦ Σ a_g ψ(g)`, of the
group ring at a character `ψ : G →* Oˣ`. It is an abbreviation of the pinned
`TauCeti.DiagonalizableGroup.point ψ` with `R = A = O` and is not defined again. -/
abbrev charEval (ψ : G →* Oˣ) : MonoidAlgebra O G →ₐ[O] O :=
  DiagonalizableGroup.point (R := O) (A := O) ψ

/-- `ev_ψ(a • g) = a ψ(g)`: `TauCeti.DiagonalizableGroup.point_single` for `A = O`. -/
theorem charEval_single (ψ : G →* Oˣ) (g : G) (a : O) :
    charEval ψ (MonoidAlgebra.single g a) = a * ψ g :=
  DiagonalizableGroup.point_single (R := O) ψ g a

/-- `ev_ψ(g) = ψ(g)`: `TauCeti.DiagonalizableGroup.point_single_one` for `A = O`. -/
theorem charEval_of (ψ : G →* Oˣ) (g : G) :
    charEval ψ (MonoidAlgebra.of O G g) = ψ g :=
  DiagonalizableGroup.point_single_one (R := O) ψ g

/-- The trivial character evaluates by the augmentation `Σ a_g g ↦ Σ a_g`. -/
theorem charEval_one (g : G) (a : O) :
    charEval (1 : G →* Oˣ) (MonoidAlgebra.single g a) = a := by
  simp

/-- As a ring homomorphism, `ev_1` is the pinned coefficient-sum augmentation
`TauCeti.MonoidAlgebra.augmentation O G`. -/
theorem charEval_one_eq_augmentation :
    (charEval (1 : G →* Oˣ) : MonoidAlgebra O G →+* O) = MonoidAlgebra.augmentation O G := by
  apply _root_.MonoidAlgebra.ringHom_ext <;> intro <;> simp

/-- Row orthogonality: over a domain, a nontrivial character sums to zero over a finite group, so
`ev_ψ(N_G) = 0` (`sum_hom_units_eq_zero`). -/
theorem charEval_sum_eq_zero [IsDomain O] [Fintype G] (ψ : G →* Oˣ) (hψ : ψ ≠ 1) :
    charEval ψ (∑ g : G, MonoidAlgebra.of O G g) = 0 := by
  rw [map_sum]
  have h := sum_hom_units_eq_zero ((Units.coeHom O).comp ψ)
    (fun h => hψ (by ext g; simpa using DFunLike.congr_fun h g))
  simpa [charEval_of] using h

/-- `ev_ψ` is the `MonoidAlgebra.lift` of `ψ` followed by the inclusion of units. -/
theorem charEval_eq_lift (ψ : G →* Oˣ) :
    charEval ψ = MonoidAlgebra.lift O O G ((Units.coeHom O).comp ψ) := rfl

/-- `ev_ψ` is the pinned `TauCeti.DiagonalizableGroup.point ψ` for `R = A = O`, by definition. -/
theorem charEval_eq_point (ψ : G →* Oˣ) :
    charEval ψ = DiagonalizableGroup.point (R := O) (A := O) ψ := rfl

/-- On the one-dimensional representation `Representation.ofLinearCharacter ψ` (the source's
`O_ψ`: `O` with `g` acting by multiplication by `ψ(g)`), `x ∈ O[G]` acts through
`Representation.asAlgebraHom` as multiplication by `ev_ψ(x)`. -/
theorem asAlgebraHom_ofLinearCharacter (ψ : G →* Oˣ) (x : MonoidAlgebra O G) (y : O) :
    Representation.asAlgebraHom (Representation.ofLinearCharacter ψ) x y = charEval ψ x * y :=
  sorry

/-- §6.1: the joint evaluation `ev_Ψ : O[G] → ∏_{ψ ∈ Ψ} O`. -/
def jointEval (Ψ : Set (G →* Oˣ)) : MonoidAlgebra O G →ₐ[O] (Ψ → O) :=
  AlgHom.pi (fun ψ : Ψ => charEval ψ.1)

@[simp] theorem jointEval_apply (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) (ψ : Ψ) :
    jointEval Ψ x ψ = charEval ψ.1 x := rfl

/-- §6.1: for `G` finite and `O` a domain with enough roots of unity
for the exponent of `G`, the joint evaluation at all characters is injective. The proof is column
orthogonality, the pinned `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`:
`Σ_ψ ψ(g)⁻¹ ψ(x) = #G · a_g` for `x = Σ a_h h`. No hypothesis `#G ≠ 0` is needed: the exponent
`e` of `G` is nonzero in `O` (`IsPrimitiveRoot.neZero'`) and `#G` divides a power of `e`
(`card_dvd_exponent_pow_rank`). -/
theorem jointEval_injective [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)] :
    Function.Injective (jointEval (Set.univ : Set (G →* Oˣ))) := by
  classical
  have hG : (Nat.card G : O) ≠ 0 := by
    have : NeZero (Monoid.exponent G) := ⟨Monoid.exponent_ne_zero_of_finite⟩
    obtain ⟨ζ, hζ⟩ := HasEnoughRootsOfUnity.exists_primitiveRoot O (Monoid.exponent G)
    have h1 : ((Monoid.exponent G : ℕ) : O) ≠ 0 := (hζ.neZero').out
    obtain ⟨c, hc⟩ := card_dvd_exponent_pow_rank G
    intro h0
    have h3 : ((Monoid.exponent G ^ Group.rank G : ℕ) : O) = 0 := by
      rw [hc, Nat.cast_mul, h0, zero_mul]
    rw [Nat.cast_pow] at h3
    exact h1 (pow_eq_zero_iff (M₀ := O) (by
      intro hr
      rw [hr, pow_zero] at h3
      exact one_ne_zero h3) |>.mp h3)
  rw [injective_iff_map_eq_zero]
  intro x hx
  have h0 : ∀ ψ : G →* Oˣ, charEval ψ x = 0 := fun ψ => congrFun hx ⟨ψ, Set.mem_univ ψ⟩
  have key : ∀ (y : MonoidAlgebra O G) (g : G),
      ∑ ψ : G →* Oˣ, (((ψ g)⁻¹ : Oˣ) : O) * charEval ψ y = (Nat.card G : O) * y.coeff g := by
    intro y g
    induction y using MonoidAlgebra.induction_on with
    | of h =>
      simp only [MonoidAlgebra.of_apply, charEval_single, one_mul, MonoidAlgebra.coeff_single,
        Finsupp.single_apply]
      rw [CommGroup.sum_inv_mul_monoidHom_apply_eq_ite g h]
      split_ifs <;> simp
    | add a b ha hb =>
      simp only [map_add, mul_add, Finset.sum_add_distrib, ha, hb, MonoidAlgebra.coeff_add,
        Finsupp.add_apply]
    | smul r a ha =>
      simp only [map_smul, smul_eq_mul, MonoidAlgebra.coeff_smul, Finsupp.smul_apply]
      rw [← mul_left_comm, ← ha, Finset.mul_sum]
      exact Finset.sum_congr rfl fun ψ _ => by ring
  ext g
  have := key x g
  simp only [h0, mul_zero, Finset.sum_const_zero] at this
  simpa using (mul_eq_zero.mp this.symm).resolve_left hG

-- test charEval_sign (computation) [§6.1]
example [IsDomain O] (h : G) (hh : h ≠ 1) (hh2 : h * h = 1) (ψ : G →* Oˣ)
    (hψ : (ψ h : O) = -1) :
    charEval ψ (MonoidAlgebra.of O G 1 + MonoidAlgebra.of O G h) = 0 ∧
      charEval ψ (MonoidAlgebra.of O G 1 - MonoidAlgebra.of O G h) = 2 := sorry

-- test charEval_trivialGroup (degenerate) [§6.1]
example [Subsingleton G] : Function.Bijective (charEval (1 : G →* Oˣ)) := sorry

-- test charEval_not_injective (non-example) [§6.1]
example [Nontrivial O] (h : G) (hh : h ≠ 1) (ψ : G →* Oˣ) :
    ¬ Function.Injective (charEval ψ) := sorry

-- test charEval_lift (compatibility) [§6.1]
example (ψ : G →* Oˣ) (g : G) :
    charEval ψ (MonoidAlgebra.of O G g) =
      MonoidAlgebra.lift O O G ((Units.coeHom O).comp ψ) (MonoidAlgebra.of O G g) := rfl

-- test jointEval_two (computation) [§6.1]
example (h : G) (ψ₁ ψ₂ : G →* Oˣ) (h₁ : (ψ₁ h : O) = 1) (h₂ : (ψ₂ h : O) = -1) (a b : O) :
    jointEval {ψ₁, ψ₂} (MonoidAlgebra.single 1 a + MonoidAlgebra.single h b) ⟨ψ₁, by simp⟩ =
        a + b ∧
      jointEval {ψ₁, ψ₂} (MonoidAlgebra.single 1 a + MonoidAlgebra.single h b) ⟨ψ₂, by simp⟩ =
        a - b := sorry

end CharacterEvaluation

/-! ## Character group rings and the scaled idempotent (§6.1) -/

section CharacterGroupRing

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- §6.1: the character group ring `R_Ψ`, the image of
`ev_Ψ : O[G] → ∏_{ψ ∈ Ψ} O` (Dasgupta–Kakde §2.2). It is in general a proper, non-maximal
order in the product and is never replaced by it. -/
def charGroupRing (Ψ : Set (G →* Oˣ)) : Subalgebra O (Ψ → O) := (jointEval Ψ).range

namespace charGroupRing

/-- The canonical surjection `α_Ψ : O[G] ↠ R_Ψ`. -/
def proj (Ψ : Set (G →* Oˣ)) : MonoidAlgebra O G →ₐ[O] charGroupRing Ψ :=
  (jointEval Ψ).rangeRestrict

theorem proj_surjective (Ψ : Set (G →* Oˣ)) : Function.Surjective (proj Ψ) :=
  AlgHom.rangeRestrict_surjective _

/-- `ker α_Ψ = ⋂_{ψ ∈ Ψ} ker ev_ψ`. -/
theorem ker_proj (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) :
    proj Ψ x = 0 ↔ ∀ ψ ∈ Ψ, charEval ψ x = 0 := by
  rw [Subtype.ext_iff]
  exact ⟨fun h ψ hψ => congrFun h ⟨ψ, hψ⟩, fun h => funext fun ψ => h ψ.1 ψ.2⟩

/-- The `ψ`-coordinate of `α_Ψ(x)` is `ψ(x)`. -/
@[simp] theorem coord_proj (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) (ψ : Ψ) :
    ((proj Ψ x : charGroupRing Ψ) : Ψ → O) ψ = charEval ψ.1 x := rfl

/-- Elements of `R_Ψ` are equal when all their character values are. -/
theorem ext {Ψ : Set (G →* Oˣ)} {y z : charGroupRing Ψ}
    (h : ∀ ψ : Ψ, (y : Ψ → O) ψ = (z : Ψ → O) ψ) : y = z := Subtype.ext (funext h)

/-- For `ψ ∈ Ψ`, the `ψ`-coordinate `ev_ψ : R_Ψ → O` as an `O`-algebra homomorphism: the map
`R_Ψ → O` "induced by the character `ψ`" of the source. -/
def eval {Ψ : Set (G →* Oˣ)} (ψ : Ψ) : charGroupRing Ψ →ₐ[O] O :=
  (Pi.evalAlgHom O (fun _ : Ψ => O) ψ).comp (charGroupRing Ψ).val

@[simp] theorem eval_proj {Ψ : Set (G →* Oˣ)} (ψ : Ψ) (x : MonoidAlgebra O G) :
    eval ψ (proj Ψ x) = charEval ψ.1 x := rfl

theorem eval_surjective {Ψ : Set (G →* Oˣ)} (ψ : Ψ) : Function.Surjective (eval ψ) :=
  fun a => ⟨algebraMap O (charGroupRing Ψ) a, by simp⟩

/-- Universal property of `R_Ψ` as a quotient of `O[G]`: an algebra homomorphism that vanishes on
every `x` with `ψ(x) = 0` for all `ψ ∈ Ψ` factors through `α_Ψ`, uniquely because `α_Ψ` is
surjective. -/
def lift {A : Type*} [Semiring A] [Algebra O A] (Ψ : Set (G →* Oˣ))
    (f : MonoidAlgebra O G →ₐ[O] A) (hf : ∀ x, (∀ ψ ∈ Ψ, charEval ψ x = 0) → f x = 0) :
    charGroupRing Ψ →ₐ[O] A := sorry

@[simp] theorem lift_proj {A : Type*} [Semiring A] [Algebra O A] (Ψ : Set (G →* Oˣ))
    (f : MonoidAlgebra O G →ₐ[O] A) (hf : ∀ x, (∀ ψ ∈ Ψ, charEval ψ x = 0) → f x = 0)
    (x : MonoidAlgebra O G) : lift Ψ f hf (proj Ψ x) = f x := sorry

/-- `O[G]/ker α_Ψ ≃ R_Ψ`, the class of `x` going to `α_Ψ(x)`; this is the sense of
"`O[G]/N_I ≅ R_Ψ`" and "`R_χ/N_I ≅ R_Ψ`". -/
def quotientKerEquiv (Ψ : Set (G →* Oˣ)) :
    (MonoidAlgebra O G ⧸ RingHom.ker (proj Ψ)) ≃ₐ[O] charGroupRing Ψ :=
  Ideal.quotientKerAlgEquivOfSurjective (proj_surjective Ψ)

/-- For `Ψ ⊆ Ψ'`, restriction of coordinates `R_{Ψ'} ↠ R_Ψ`. -/
def restrict {Ψ Ψ' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') : charGroupRing Ψ' →ₐ[O] charGroupRing Ψ :=
  sorry

@[simp] theorem restrict_proj {Ψ Ψ' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') (x : MonoidAlgebra O G) :
    restrict h (proj Ψ' x) = proj Ψ x := sorry

/-- For `Ψ ⊆ Ψ'` the restriction `R_{Ψ'} → R_Ψ` is surjective, because it sends `α_{Ψ'}(x)` to
`α_Ψ(x)` and `α_Ψ` is surjective: the lifting of elements of `R_Ψ` used in the proof of
Dasgupta–Kakde Lemma 7.1. -/
theorem restrict_surjective {Ψ Ψ' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') :
    Function.Surjective (restrict h) := fun y =>
  let ⟨x, hx⟩ := proj_surjective Ψ y
  ⟨proj Ψ' x, by rw [restrict_proj, hx]⟩

theorem restrict_id (Ψ : Set (G →* Oˣ)) :
    restrict (subset_refl Ψ) = AlgHom.id O (charGroupRing Ψ) := sorry

theorem restrict_comp {Ψ Ψ' Ψ'' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ') (h' : Ψ' ⊆ Ψ'') :
    (restrict h).comp (restrict h') = restrict (h.trans h') := sorry

/-- If `Ψ = Ψ₁ ∪ Ψ₂`, then `R_Ψ → R_{Ψ₁} × R_{Ψ₂}` is injective (the injection `ι` of
Dasgupta–Kakde, proof of Lemma 7.1). -/
theorem restrict_prod_injective {Ψ₁ Ψ₂ Ψ : Set (G →* Oˣ)} (h₁ : Ψ₁ ⊆ Ψ) (h₂ : Ψ₂ ⊆ Ψ)
    (h : Ψ ⊆ Ψ₁ ∪ Ψ₂) :
    Function.Injective (fun y : charGroupRing Ψ => (restrict h₁ y, restrict h₂ y)) := sorry

/-- `α_Ĝ` as an equivalence `O[G] ≅ R_Ĝ`, for `G` finite and `O` a domain with enough roots of
unity for the exponent of `G`; its underlying map is `α_Ĝ`, by definition. -/
def equivGroupRing [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)] :
    MonoidAlgebra O G ≃ₐ[O] charGroupRing (Set.univ : Set (G →* Oˣ)) :=
  AlgEquiv.ofBijective (proj Set.univ)
    ⟨fun _ _ h => jointEval_injective (congrArg Subtype.val h), proj_surjective _⟩

/-- `R_∅` is the zero ring. -/
theorem subsingleton_empty : Subsingleton (charGroupRing (∅ : Set (G →* Oˣ))) :=
  ⟨fun _ _ => Subtype.ext (funext fun ψ => (ψ.2).elim)⟩

/-- `R_{1} ≅ O` through the augmentation: the coordinate at the trivial character, which sends
`α_{1}(a • g)` to `a`. -/
def equivOfSingletonOne : charGroupRing ({1} : Set (G →* Oˣ)) ≃ₐ[O] O :=
  AlgEquiv.ofBijective (eval (⟨1, Set.mem_singleton 1⟩ : ({1} : Set (G →* Oˣ)))) sorry

/-- §6.1: for `G` finite, `O` a domain and `ψ ∈ Ψ`,
`α_Ψ(Σ_g ψ(g)⁻¹ g) = #G · δ_ψ`; hence `#G · δ_ψ ∈ R_Ψ`, and `#G · ∏_{ψ ∈ Ψ} O ⊆ R_Ψ`. No
hypothesis on roots of unity is needed. -/
theorem card_smul_single_mem [IsDomain O] [Fintype G] [DecidableEq (G →* Oˣ)]
    (Ψ : Set (G →* Oˣ)) (ψ : Ψ) :
    ((proj Ψ (∑ g : G, (((ψ.1 g)⁻¹ : Oˣ) : O) • MonoidAlgebra.of O G g) : charGroupRing Ψ) :
        Ψ → O) = (Fintype.card G : O) • (Pi.single ψ 1 : Ψ → O) ∧
      (Fintype.card G : O) • (Pi.single ψ 1 : Ψ → O) ∈ charGroupRing Ψ ∧
      ∀ v : Ψ → O, (Fintype.card G : O) • v ∈ charGroupRing Ψ := sorry

end charGroupRing

-- test charGroupRing_cyclic_proper (non-example) [§6.1]
example [IsDomain O] [Fintype G] [DecidableEq (G →* Oˣ)] (p : ℕ) [Fact p.Prime]
    (hG : Fintype.card G = p) (hp : ¬ IsUnit (p : O)) [HasEnoughRootsOfUnity O p]
    (ψ : G →* Oˣ) :
    (Pi.single ⟨ψ, Set.mem_univ ψ⟩ 1 : ↥(Set.univ : Set (G →* Oˣ)) → O) ∉
      charGroupRing (Set.univ : Set (G →* Oˣ)) := sorry

/- Next test: for `G = ⟨g⟩ × ⟨h⟩ ≅ C_p × C_p`, `O = ℤ_p[ζ_p]`, `λ = ζ_p - 1` and
`Ψ = {1, ψ₁, ψ₂}` with `ψ₁(g) = ζ_p, ψ₁(h) = 1, ψ₂(g) = 1, ψ₂(h) = ζ_p`: `R_Ψ` is the ring of
triples that are pairwise congruent modulo `λ`, and the ring `R_Ψ/λR_Ψ` is local and its maximal
ideal squares to zero and is not principal (so its socle is two-dimensional and `R_Ψ` is not
Gorenstein); stated for any local domain `O` with a primitive `p`-th root of unity `ζ` and
maximal ideal `(ζ - 1)`. -/
-- test charGroupRing_not_gorenstein (non-example) [§6.1]
example [IsDomain O] [IsLocalRing O] (p : ℕ) [Fact p.Prime] (ζ : O) (hζ : IsPrimitiveRoot ζ p)
    (hlam : IsLocalRing.maximalIdeal O = Ideal.span {ζ - 1}) (g h : G) (ψ₁ ψ₂ : G →* Oˣ)
    (h₁g : (ψ₁ g : O) = ζ) (h₁h : (ψ₁ h : O) = 1) (h₂g : (ψ₂ g : O) = 1) (h₂h : (ψ₂ h : O) = ζ)
    (hgen : ∀ x : G, ∃ i j : ℕ, x = g ^ i * h ^ j) :
    let Ψ : Set (G →* Oˣ) := {1, ψ₁, ψ₂}
    let I : Ideal (charGroupRing Ψ) := Ideal.span {algebraMap O (charGroupRing Ψ) (ζ - 1)}
    (∀ v : Ψ → O, v ∈ charGroupRing Ψ ↔ ∀ ψ ψ' : Ψ, v ψ - v ψ' ∈ Ideal.span {ζ - 1}) ∧
      IsLocalRing (charGroupRing Ψ ⧸ I) ∧
      ∀ 𝔪 : Ideal (charGroupRing Ψ ⧸ I), 𝔪.IsMaximal → 𝔪 ^ 2 = ⊥ ∧ ¬ 𝔪.IsPrincipal := sorry

-- test charGroupRing_empty (degenerate) [§6.1]
example : Subsingleton (charGroupRing (∅ : Set (G →* Oˣ))) := charGroupRing.subsingleton_empty

-- test charGroupRing_trivial (degenerate) [§6.1]
example (g : G) (a : O) :
    charGroupRing.equivOfSingletonOne (charGroupRing.proj {1} (MonoidAlgebra.single g a)) = a := by
  simp [charGroupRing.equivOfSingletonOne]

-- test charGroupRing_full (compatibility) [§6.1]
example [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)] :
    Function.Bijective (charGroupRing.proj (Set.univ : Set (G →* Oˣ))) :=
  (charGroupRing.equivGroupRing (O := O) (G := G)).bijective

end CharacterGroupRing

/-! ## Theorems on character group rings: lattice, norm quotients and components (§6.1) -/

section CharacterGroupRingTheory

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- §6.1: `R_Ψ` is free over `O` of rank `#Ψ`, a full-rank
`O`-lattice in `∏_{ψ ∈ Ψ} O`. What is used: `O` is a principal ideal domain, `G` is finite and
`#G ≠ 0` in `O`. -/
theorem charGroupRing.free [IsDomain O] [IsPrincipalIdealRing O] [Finite G]
    (hG : (Nat.card G : O) ≠ 0) (Ψ : Set (G →* Oˣ)) :
    Module.Free O (charGroupRing Ψ) ∧ Module.finrank O (charGroupRing Ψ) = Nat.card Ψ := sorry

/-- §6.1: the quotient `(∏_{ψ ∈ Ψ} O)/R_Ψ` is finite; more
precisely it is a quotient of `(O/#G)^Ψ`: the class of `v` depends only on `v` modulo `#G`. What
is used: `G` is finite, `O` is a domain with `#G ≠ 0`, and `O/(#G)` is finite, which holds when
`O` has finite quotients. -/
theorem charGroupRing.finite_quotient [IsDomain O] [Ring.HasFiniteQuotients O] [Finite G]
    (hG : (Nat.card G : O) ≠ 0) (Ψ : Set (G →* Oˣ)) :
    Finite ((Ψ → O) ⧸ Subalgebra.toSubmodule (charGroupRing Ψ)) ∧
      ∀ v w : Ψ → O, (∀ ψ, v ψ - w ψ ∈ Ideal.span {(Nat.card G : O)}) →
        (Submodule.Quotient.mk v : (Ψ → O) ⧸ Subalgebra.toSubmodule (charGroupRing Ψ)) =
          Submodule.Quotient.mk w := sorry

/-- §6.1: for `x ∈ R_Ψ` the following are equivalent: `x` is
a non-zerodivisor of `R_Ψ`; every value `ψ(x)` is nonzero; `x` is a non-zerodivisor of
`∏_{ψ ∈ Ψ} O`. Multiplication by such `x` is injective on `∏_{ψ ∈ Ψ} O` and induces an
isomorphism of `O`-modules `(∏ O)/R_Ψ → x(∏ O)/xR_Ψ`, as used in Lemma 2.5. What is used: `G` is
finite and `O` is a domain with `#G ≠ 0`. -/
theorem charGroupRing.mem_nonZeroDivisors_iff [IsDomain O] [Finite G]
    (hG : (Nat.card G : O) ≠ 0) (Ψ : Set (G →* Oˣ)) (x : charGroupRing Ψ) :
    List.TFAE [x ∈ nonZeroDivisors (charGroupRing Ψ), ∀ ψ : Ψ, (x : Ψ → O) ψ ≠ 0,
      (x : Ψ → O) ∈ nonZeroDivisors (Ψ → O)] ∧
    (x ∈ nonZeroDivisors (charGroupRing Ψ) →
      let L : (Ψ → O) →ₗ[O] (Ψ → O) := LinearMap.mulLeft O (x : Ψ → O)
      Function.Injective L ∧
      ∃ e : ((Ψ → O) ⧸ Subalgebra.toSubmodule (charGroupRing Ψ)) ≃ₗ[O]
          (↥(LinearMap.range L) ⧸
            (Submodule.map L (Subalgebra.toSubmodule (charGroupRing Ψ))).comap
              (LinearMap.range L).subtype),
        ∀ v : Ψ → O, e (Submodule.Quotient.mk v) =
          Submodule.Quotient.mk ⟨L v, LinearMap.mem_range_self L v⟩) := sorry

/-- §6.1 (Dasgupta–Kakde Lemma 2.2): for a subgroup `I` and
`Ψ = {ψ : ψ(I) ≠ 1}`, the kernel of `α_Ψ` is the principal ideal generated by the norm element
`N_I = Σ_{σ ∈ I} σ`, the pinned `TauCeti.subgroupCharSum` of the trivial character over `I`.
What is used: `G` is finite and `O` is a domain with enough roots of unity for the exponent of
`G`, through the injectivity of the joint evaluation. -/
theorem charGroupRing.ker_proj_eq_span_norm [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] (I : Subgroup G) [Fintype I] :
    RingHom.ker (charGroupRing.proj {ψ : G →* Oˣ | ¬ ∀ σ ∈ I, ψ σ = 1}) =
      Ideal.span {subgroupCharSum (1 : G →* O) I} := sorry

/-- §6.1: for a finite subgroup `G'` of `G` whose order is a unit
of the domain `O`, a character `χ` of `G'` and its idempotent `e_χ ∈ O[G'] ⊆ O[G]`, every
character `ψ` of `G` has `ψ(e_χ) = 1` if `ψ|_{G'} = χ` and `ψ(e_χ) = 0` otherwise. Neither a
complement of `G'` nor a hypothesis on roots of unity is used. -/
theorem charEval_charIdempotent [IsDomain O] (G' : Subgroup G) [Finite G']
    [DecidableEq (G' →* Oˣ)] (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ) (ψ : G →* Oˣ) :
    charEval ψ (MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)) =
      if ψ.comp G'.subtype = χ then 1 else 0 := sorry

/-- §6.1: for a subgroup `G'` of order invertible in `O`, a
character `χ` of `G'` and `Ψ_χ` the characters of `G` restricting to `χ`, the kernel of
`α_{Ψ_χ}` is generated by `1 - e_χ`, so `R_{Ψ_χ} ≅ O[G]/(1 - e_χ) ≅ e_χ O[G] = R_χ`
(`charGroupRing.quotientKerEquiv`). The complement of `G'` plays no part. -/
theorem charGroupRing.ker_proj_component [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] (G' : Subgroup G)
    (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ) :
    RingHom.ker (charGroupRing.proj {ψ : G →* Oˣ | ψ.comp G'.subtype = χ}) =
      Ideal.span
        {1 - MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)} := sorry

/-- §6.1: for a subgroup `G'` of order invertible in `O`, the
idempotents `e_χ ∈ O[G]`, `χ ∈ Ĝ'`, are pairwise orthogonal with sum `1` (the images in `O[G]` of
the L4 relations of the idempotents; the sum is over the finite type of characters of `G'`, the
pinned `instFintypeMonoidHomUnits`), every character of `G` lies in exactly one `Ψ_χ`, and
`O[G] → ∏_{χ ∈ Ĝ'} R_{Ψ_χ}`, `x ↦ (α_{Ψ_χ}(x))_χ`, is bijective. -/
theorem charGroupRing.bijective_proj_components [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] (G' : Subgroup G) [DecidableEq (G' →* Oˣ)]
    (hG' : IsUnit (Nat.card G' : O)) :
    let e : (G' →* Oˣ) → MonoidAlgebra O G := fun χ =>
      MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)
    (∀ χ ω : G' →* Oˣ, e χ * e ω = if χ = ω then e χ else 0) ∧ ∑ χ : G' →* Oˣ, e χ = 1 ∧
      (∀ ψ : G →* Oˣ, ∃! χ : G' →* Oˣ, ψ ∈ {ψ : G →* Oˣ | ψ.comp G'.subtype = χ}) ∧
      Function.Bijective (fun (x : MonoidAlgebra O G) (χ : G' →* Oˣ) =>
        charGroupRing.proj {ψ : G →* Oˣ | ψ.comp G'.subtype = χ} x) := sorry

/-- §6.1 (Dasgupta–Kakde Corollary 2.3): with `e_χ` and `Ψ_χ` as above
and any subgroup `I` of `G` (the source takes `I ⊆ G_p`), the kernel of `α_Ψ` for
`Ψ = {ψ ∈ Ψ_χ : ψ(I) ≠ 1}` is generated by `1 - e_χ` and `N_I`, so `R_χ/N_I R_χ ≅ R_Ψ`. -/
theorem charGroupRing.ker_proj_component_norm [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] (G' : Subgroup G)
    (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ) (I : Subgroup G) [Fintype I] :
    RingHom.ker (charGroupRing.proj
        {ψ : G →* Oˣ | ψ.comp G'.subtype = χ ∧ ¬ ∀ σ ∈ I, ψ σ = 1}) =
      Ideal.span
        {1 - MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ),
          subgroupCharSum (1 : G →* O) I} := sorry

end CharacterGroupRingTheory

/-! ## The component R_χ as the twisted group ring O[G_p]_χ (§6.1) -/

section ComponentGroupRing

variable {O G : Type*} [CommRing O] [CommGroup G]

namespace charGroupRing

/-- §6.1: for complementary subgroups `G'` and `Gp` of `G`
(`G = Gp × G'`) and a character `χ` of `G'`, the `O`-algebra homomorphism
`π_χ : O[G] → O[Gp]`, `g' gp ↦ χ(g') gp`: the lift (`MonoidAlgebra.lift`) of the monoid
homomorphism `G → O[Gp]`, `g' gp ↦ χ(g') • gp`. -/
def componentProj {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp) (χ : G' →* Oˣ) :
    MonoidAlgebra O G →ₐ[O] MonoidAlgebra O Gp := sorry

/-- `π_χ(a • g' gp) = a χ(g') • gp`. -/
@[simp] theorem componentProj_single {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp)
    (χ : G' →* Oˣ) (a : O) (g' : G') (gp : Gp) :
    componentProj hcompl χ (MonoidAlgebra.single ((g' : G) * (gp : G)) a) =
      MonoidAlgebra.single gp (a * ((χ g' : Oˣ) : O)) := sorry

/-- `π_χ` is surjective; it restricts to the identity on `O[Gp] ⊆ O[G]`. -/
theorem componentProj_surjective {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp)
    (χ : G' →* Oˣ) :
    Function.Surjective (componentProj hcompl χ) ∧
      ∀ y : MonoidAlgebra O Gp,
        componentProj hcompl χ (MonoidAlgebra.mapDomainAlgHom O O Gp.subtype y) = y := sorry

/-- `π_χ(e_χ) = 1`, and `π_χ(e_ω) = 0` for a character `ω ≠ χ` of `G'`. -/
theorem componentProj_charIdempotent [IsDomain O] {G' Gp : Subgroup G} [Finite G']
    [DecidableEq (G' →* Oˣ)] (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O))
    (χ ω : G' →* Oˣ) :
    componentProj hcompl χ
        (MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent ω)) =
      if ω = χ then 1 else 0 := sorry

/-- `ker π_χ = (1 - e_χ) O[G] = ker α_{Ψ_χ}`. -/
theorem ker_componentProj [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)]
    {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O))
    (χ : G' →* Oˣ) :
    RingHom.ker (componentProj hcompl χ) =
        Ideal.span
          {1 - MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)} ∧
      RingHom.ker (componentProj hcompl χ) =
        RingHom.ker (proj {ψ : G →* Oˣ | ψ.comp G'.subtype = χ}) := sorry

/-- §6.1: `R_{Ψ_χ} ≅ O[Gp]`, induced by the two surjections
`α_{Ψ_χ}` and `π_χ` from `O[G]`, which have the same kernel. With `G` acting on `O[Gp]` through
`π_χ` this is the source's `O[G_p]_χ`, so `R_χ ≅ O[G_p]_χ`. That `Gp` is the `p`-Sylow subgroup
is not used. -/
def componentEquiv [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)]
    {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O))
    (χ : G' →* Oˣ) :
    charGroupRing {ψ : G →* Oˣ | ψ.comp G'.subtype = χ} ≃ₐ[O] MonoidAlgebra O Gp :=
  (quotientKerEquiv {ψ : G →* Oˣ | ψ.comp G'.subtype = χ}).symm.trans
    ((Ideal.quotientEquivAlgOfEq O (ker_componentProj hcompl hG' χ).2.symm).trans
      (Ideal.quotientKerAlgEquivOfSurjective (componentProj_surjective hcompl χ).1))

/-- `componentEquiv(α_{Ψ_χ}(x)) = π_χ(x)`; in particular `α_{Ψ_χ}(g' gp) ↦ χ(g') • gp`. -/
@[simp] theorem componentEquiv_proj [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] {G' Gp : Subgroup G}
    (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ)
    (x : MonoidAlgebra O G) :
    componentEquiv hcompl hG' χ (proj _ x) = componentProj hcompl χ x := sorry

/-- The inverse of `componentEquiv` sends `gp ∈ Gp` to `α_{Ψ_χ}(gp)`. -/
@[simp] theorem componentEquiv_symm_of [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] {G' Gp : Subgroup G}
    (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ) (gp : Gp) :
    (componentEquiv hcompl hG' χ).symm (MonoidAlgebra.of O Gp gp) =
      proj _ (MonoidAlgebra.of O G (gp : G)) := sorry

/-- An `O`-algebra homomorphism `R_{Ψ_χ} → O[Gp]` sending `α_{Ψ_χ}(g' gp)` to `χ(g') • gp` for
all `g' ∈ G'` and `gp ∈ Gp` is `componentEquiv`. -/
theorem componentEquiv_unique [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] {G' Gp : Subgroup G}
    (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ)
    (f : charGroupRing {ψ : G →* Oˣ | ψ.comp G'.subtype = χ} →ₐ[O] MonoidAlgebra O Gp)
    (hf : ∀ (g' : G') (gp : Gp), f (proj _ (MonoidAlgebra.of O G ((g' : G) * (gp : G)))) =
      ((χ g' : Oˣ) : O) • MonoidAlgebra.of O Gp gp) :
    f = (componentEquiv hcompl hG' χ : _ →ₐ[O] _) := sorry

/-- For a character `ψp` of `Gp` and `ψ = (g' gp ↦ χ(g') ψp(gp)) ∈ Ψ_χ`, the character of `G`
restricting to `χ` on `G'` and to `ψp` on `Gp`: `ev_{ψp}(componentEquiv(y)) = ev_ψ(y)`. -/
theorem charEval_componentEquiv [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)] {G' Gp : Subgroup G}
    (hcompl : G'.IsComplement' Gp) (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ)
    (ψp : Gp →* Oˣ) (ψ : G →* Oˣ) (hψ : ψ.comp G'.subtype = χ) (hψp : ψ.comp Gp.subtype = ψp)
    (y : charGroupRing {ψ : G →* Oˣ | ψ.comp G'.subtype = χ}) :
    charEval ψp (componentEquiv hcompl hG' χ y) = eval ⟨ψ, hψ⟩ y := sorry

/-- `G'` trivial (`G = Gp`, `χ = 1`): `π_1` is the identity of `O[G]`, read in `O[⊤]` through
`Subgroup.topEquiv`, and `componentEquiv` is the inverse of `equivGroupRing` (`Ψ_1` is the set of
all characters, and `R_Ĝ → R_{Ψ_1}` is the restriction along `Ψ_1 ⊆ Ĝ`). -/
theorem componentEquiv_of_trivial_complement [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)]
    (h1 : IsUnit (Nat.card (⊥ : Subgroup G) : O)) (x : MonoidAlgebra O G) :
    componentProj Subgroup.isComplement'_bot_top (1 : (⊥ : Subgroup G) →* Oˣ) x =
        MonoidAlgebra.mapDomainAlgHom O O (Subgroup.topEquiv (G := G)).symm x ∧
      componentEquiv Subgroup.isComplement'_bot_top h1 (1 : (⊥ : Subgroup G) →* Oˣ)
          (restrict (Set.subset_univ _) (equivGroupRing x)) =
        MonoidAlgebra.mapDomainAlgHom O O (Subgroup.topEquiv (G := G)).symm x := sorry

/-- `Gp` trivial (`G = G'`): `O[⊥] = O`, `Ψ_χ = {χ}`, `π_χ = ev_χ` and
`componentEquiv(α_{Ψ_χ}(g')) = χ(g')`. -/
theorem componentEquiv_of_trivial_sylow [IsDomain O] [Finite G]
    [HasEnoughRootsOfUnity O (Monoid.exponent G)]
    (hG : IsUnit (Nat.card (⊤ : Subgroup G) : O)) (χ : (⊤ : Subgroup G) →* Oˣ) :
    {ψ : G →* Oˣ | ψ.comp (⊤ : Subgroup G).subtype = χ} =
        {χ.comp (Subgroup.topEquiv (G := G)).symm.toMonoidHom} ∧
      (∀ x : MonoidAlgebra O G, componentProj Subgroup.isComplement'_top_bot χ x =
        algebraMap O (MonoidAlgebra O (⊥ : Subgroup G))
          (charEval (χ.comp (Subgroup.topEquiv (G := G)).symm.toMonoidHom) x)) ∧
      ∀ g : G, componentEquiv Subgroup.isComplement'_top_bot hG χ
          (proj _ (MonoidAlgebra.of O G g)) =
        algebraMap O (MonoidAlgebra O (⊥ : Subgroup G))
          ((χ ⟨g, Subgroup.mem_top g⟩ : Oˣ) : O) := sorry

end charGroupRing

-- test componentProj_sign (computation) [§6.1]
example {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp) (hcard : Nat.card G' = 2) (h : G')
    (hh : h ≠ 1) (χ : G' →* Oˣ) (hχ : ((χ h : Oˣ) : O) = -1) [Invertible (2 : O)] (gp : Gp) :
    charGroupRing.componentProj hcompl χ (MonoidAlgebra.of O G ((h : G) * (gp : G))) =
        -MonoidAlgebra.of O Gp gp ∧
      charGroupRing.componentProj hcompl χ (⅟(2 : O) • (1 - MonoidAlgebra.of O G (h : G))) = 1 ∧
      charGroupRing.componentProj hcompl χ (⅟(2 : O) • (1 + MonoidAlgebra.of O G (h : G))) = 0 :=
  sorry

-- test componentEquiv_trivialComplement (degenerate) [§6.1]
example [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)]
    (h1 : IsUnit (Nat.card (⊥ : Subgroup G) : O)) (x : MonoidAlgebra O G) :
    charGroupRing.componentEquiv Subgroup.isComplement'_bot_top h1 (1 : (⊥ : Subgroup G) →* Oˣ)
        (charGroupRing.restrict (Set.subset_univ _) (charGroupRing.proj Set.univ x)) =
      MonoidAlgebra.mapDomainAlgHom O O (Subgroup.topEquiv (G := G)).symm x := sorry

-- test componentEquiv_trivialSylow (degenerate) [§6.1]
example [IsDomain O] [Finite G] [HasEnoughRootsOfUnity O (Monoid.exponent G)]
    (hG : IsUnit (Nat.card (⊤ : Subgroup G) : O)) (χ : (⊤ : Subgroup G) →* Oˣ) (g : G) :
    charGroupRing.componentEquiv Subgroup.isComplement'_top_bot hG χ
        (charGroupRing.proj _ (MonoidAlgebra.of O G g)) =
      algebraMap O (MonoidAlgebra O (⊥ : Subgroup G)) ((χ ⟨g, Subgroup.mem_top g⟩ : Oˣ) : O) :=
  ((charGroupRing.componentEquiv_of_trivial_sylow hG χ).2.2 g)

-- test componentProj_eval (compatibility) [§6.1]
example {G' Gp : Subgroup G} (hcompl : G'.IsComplement' Gp) (χ : G' →* Oˣ) (ψp : Gp →* Oˣ)
    (ψ : G →* Oˣ) (hψ : ψ.comp G'.subtype = χ) (hψp : ψ.comp Gp.subtype = ψp)
    (x : MonoidAlgebra O G) :
    charEval ψp (charGroupRing.componentProj hcompl χ x) = charEval ψ x := sorry

/- Next test: the twist is by `χ` and not by `χ⁻¹`: if `χ² ≠ 1` then `π_{χ⁻¹}(e_χ) = 0`, whereas
`π_χ(e_χ) = 1`. And `π_χ` is not injective when `G' ≠ 1`: it kills `1 - e_χ ≠ 0`. -/
-- test componentProj_twist (non-example) [§6.1]
example [IsDomain O] {G' Gp : Subgroup G} [Finite G'] (hcompl : G'.IsComplement' Gp)
    (hG' : IsUnit (Nat.card G' : O)) (χ : G' →* Oˣ) :
    (χ ^ 2 ≠ 1 → charGroupRing.componentProj hcompl χ⁻¹
        (MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)) = 0) ∧
      charGroupRing.componentProj hcompl χ
        (MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)) = 1 ∧
      (Nontrivial G' →
        1 - MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ) ≠ 0 ∧
        charGroupRing.componentProj hcompl χ
          (1 - MonoidAlgebra.mapDomainAlgHom O O G'.subtype (Iwasawa.charIdempotent χ)) = 0 ∧
        ¬ Function.Injective (charGroupRing.componentProj hcompl χ)) := sorry

end ComponentGroupRing

/-! ## Units, locality and completeness of character group rings (§6.1) -/

section CharacterGroupRingLocal

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- §6.1: `x ∈ R_Ψ` is a unit iff every value `ψ(x)` is a
unit of `O`, and iff the product of its values is a unit of `O` (`R_Ψ ⊆ ∏ O` is an integral
extension). Only that `O` is a commutative ring and that `Ψ` is finite is used; no locality is
assumed. -/
theorem charGroupRing.isUnit_iff (Ψ : Set (G →* Oˣ)) [Fintype Ψ] (x : charGroupRing Ψ) :
    (IsUnit x ↔ ∀ ψ : Ψ, IsUnit ((x : Ψ → O) ψ)) ∧
      (IsUnit x ↔ IsUnit (∏ ψ : Ψ, (x : Ψ → O) ψ)) := sorry

/-- §6.1: for a nonempty set of characters that belong
to one `χ` (pairwise quotients of `p`-power order, `O` local with residue characteristic `p`),
the following are equivalent for `x ∈ R_Ψ`: `x` is a unit; some value `ψ(x)` is a unit of `O`;
every value `ψ(x)` is a unit of `O`. For `Ψ = ∅` the statement would be false: `R_∅` is the zero
ring, in which `0` is a unit, and there is no character. -/
theorem charGroupRing.isUnit_iff_exists [IsLocalRing O] (p : ℕ)
    [Fact p.Prime] [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ]
    (hne : Ψ.Nonempty)
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) (x : charGroupRing Ψ) :
    List.TFAE [IsUnit x, ∃ ψ : Ψ, IsUnit ((x : Ψ → O) ψ), ∀ ψ : Ψ, IsUnit ((x : Ψ → O) ψ)] :=
  sorry

/-- §6.1: for nonempty `Ψ` belonging to one `χ`, `R_Ψ` is local, and
its maximal ideal (its set of non-units) is `𝔪_Ψ = {x : ψ(x) ∈ 𝔪_O}`, for any `ψ ∈ Ψ`. -/
theorem charGroupRing.isLocalRing [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ] (hne : Ψ.Nonempty)
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) :
    IsLocalRing (charGroupRing Ψ) ∧
      ∀ (ψ : Ψ) (x : charGroupRing Ψ), x ∈ nonunits (charGroupRing Ψ) ↔
        charGroupRing.eval ψ x ∈ IsLocalRing.maximalIdeal O := sorry

/-- §6.1: `𝔪_O R_Ψ ⊆ 𝔪_Ψ`, and `𝔪_Ψ^N ⊆ 𝔪_O R_Ψ` for
some `N ≥ 1`, so the two ideals define the same topology on `R_Ψ`. What is used: `O` is a local
ring, and `R_Ψ` is a local ring (`charGroupRing.isLocalRing`) and a finite `O`-module (it is one
when `G` is finite). Completeness of `O` is not used. -/
theorem charGroupRing.exists_maximalIdeal_pow_le [IsLocalRing O] (Ψ : Set (G →* Oˣ))
    [IsLocalRing (charGroupRing Ψ)] [Module.Finite O (charGroupRing Ψ)] :
    (IsLocalRing.maximalIdeal O).map (algebraMap O (charGroupRing Ψ)) ≤
        IsLocalRing.maximalIdeal (charGroupRing Ψ) ∧
      ∃ N : ℕ, 1 ≤ N ∧ IsLocalRing.maximalIdeal (charGroupRing Ψ) ^ N ≤
        (IsLocalRing.maximalIdeal O).map (algebraMap O (charGroupRing Ψ)) := sorry

/-- §6.1: for `Ψ` belonging to one `χ` and `ψ ∈ Ψ`, the
evaluation `ev_ψ : R_Ψ → O` is a local homomorphism: if `ev_ψ(x)` is a unit of `O`, then `x` is
a unit of `R_Ψ`. The locality of `R_Ψ` is not used. -/
theorem charGroupRing.isLocalHom_eval [IsLocalRing O] (p : ℕ) [Fact p.Prime]
    [CharP (IsLocalRing.ResidueField O) p] (Ψ : Set (G →* Oˣ)) [Finite Ψ]
    (hΨ : ∀ ψ ∈ Ψ, ∀ ψ' ∈ Ψ, ∃ n : ℕ, (ψ' / ψ) ^ (p ^ n) = 1) (ψ : Ψ) :
    IsLocalHom (charGroupRing.eval ψ) := sorry

/-- §6.1: the homomorphism of residue fields
`R_Ψ/𝔪_Ψ → O/𝔪_O = k` induced by the local homomorphism `ev_ψ` is bijective, so the residue
field of `R_Ψ` is `k`. That `R_Ψ` is local is `charGroupRing.isLocalRing` and that `ev_ψ` is
local is `charGroupRing.isLocalHom_eval`; they are instance arguments because
`IsLocalRing.ResidueField.map` needs them to be stated. -/
theorem charGroupRing.bijective_residueFieldMap_eval [IsLocalRing O] (Ψ : Set (G →* Oˣ))
    [IsLocalRing (charGroupRing Ψ)] (ψ : Ψ)
    [IsLocalHom (charGroupRing.eval ψ : charGroupRing Ψ →+* O)] :
    Function.Bijective
      (IsLocalRing.ResidueField.map (charGroupRing.eval ψ : charGroupRing Ψ →+* O)) := sorry

/-- §6.1: the local ring `R_Ψ` is noetherian, and it is
complete and separated for the `𝔪_Ψ`-adic topology, which is its `𝔪_O`-adic topology
(`charGroupRing.exists_maximalIdeal_pow_le`). What is used beyond locality
(`charGroupRing.isLocalRing`): `O` is a noetherian local ring that is `𝔪_O`-adically complete
and separated, and `R_Ψ` is a finite `O`-module. -/
theorem charGroupRing.isAdicComplete [IsLocalRing O] [IsNoetherianRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] (Ψ : Set (G →* Oˣ))
    [IsLocalRing (charGroupRing Ψ)] [Module.Finite O (charGroupRing Ψ)] :
    IsNoetherianRing (charGroupRing Ψ) ∧
      IsAdicComplete (IsLocalRing.maximalIdeal (charGroupRing Ψ)) (charGroupRing Ψ) := sorry

/-- §6.1 (Dasgupta–Kakde Lemma 2.5): for a non-zerodivisor `x` of
`R_Ψ`, the quotient `R_Ψ/(x)` is finite and `#(R_Ψ/(x)) = #(O/(∏_{ψ ∈ Ψ} ψ(x)))`. What is used:
`O` is an infinite Dedekind domain with `#G ≠ 0` and with `O/(a)` finite for every `a ≠ 0`
(`Ring.HasFiniteQuotients O`), and `G` is finite. -/
theorem charGroupRing.card_quotient_span [IsDedekindDomain O] [Infinite O]
    [Ring.HasFiniteQuotients O] [Finite G] (hG : (Nat.card G : O) ≠ 0) (Ψ : Set (G →* Oˣ))
    [Fintype Ψ] (x : charGroupRing Ψ) (hx : x ∈ nonZeroDivisors (charGroupRing Ψ)) :
    Finite (charGroupRing Ψ ⧸ Ideal.span {x}) ∧
      Nat.card (charGroupRing Ψ ⧸ Ideal.span {x}) =
        Nat.card (O ⧸ Ideal.span {∏ ψ : Ψ, (x : Ψ → O) ψ}) := sorry

end CharacterGroupRingLocal

/-! ## PadicMeasuresIwasawaAlgebras:§6.1 (construction) -/

section Sharp

variable {O G : Type*} [CommRing O] [CommGroup G]

/-- §6.1: the involution `#` of `O[G]`, `g ↦ g⁻¹`: an abbreviation of
Mathlib's `HopfAlgebra.antipodeAlgHom O (MonoidAlgebra O G)`, the antipode of the commutative
Hopf algebra `O[G]`. -/
abbrev sharp : MonoidAlgebra O G →ₐ[O] MonoidAlgebra O G :=
  HopfAlgebra.antipodeAlgHom O (MonoidAlgebra O G)

/-- `(a • g)^# = a • g⁻¹`. This is the simp-normal form: `MonoidAlgebra.of_apply` rewrites
`of g` to `single g 1` before `sharp_of` can fire. -/
@[simp] theorem sharp_single (g : G) (a : O) :
    sharp (MonoidAlgebra.single g a) = MonoidAlgebra.single g⁻¹ a := by
  simp

@[simp] theorem sharp_of (g : G) : sharp (MonoidAlgebra.of O G g) = MonoidAlgebra.of O G g⁻¹ := by
  simp [MonoidAlgebra.of_apply]

/-- `(x^#)^# = x`: the pinned `TauCeti.HopfAlgebra.antipode_antipode`. -/
@[simp] theorem sharp_sharp (x : MonoidAlgebra O G) : sharp (sharp x) = x :=
  TauCeti.HopfAlgebra.antipode_antipode (R := O) x

/-- `#` as a self-inverse `O`-algebra automorphism of `O[G]`: an abbreviation of the pinned
`TauCeti.HopfAlgebra.antipodeAlgEquiv` of the commutative Hopf algebra `O[G]`, so that its
lemmas `antipodeAlgEquiv_apply`, `antipodeAlgEquiv_toAlgHom`, `antipodeAlgEquiv_symm` apply. -/
abbrev sharpAlgEquiv : MonoidAlgebra O G ≃ₐ[O] MonoidAlgebra O G :=
  TauCeti.HopfAlgebra.antipodeAlgEquiv (R := O) (A := MonoidAlgebra O G)

/-- `ψ(x^#) = ψ⁻¹(x)`. -/
theorem charEval_sharp (ψ : G →* Oˣ) (x : MonoidAlgebra O G) :
    charEval ψ (sharp x) = charEval ψ⁻¹ x := sorry

/-- `#` is also the map of group rings induced by inversion. -/
theorem sharp_eq_mapDomain :
    (sharp : MonoidAlgebra O G →ₐ[O] MonoidAlgebra O G) =
      MonoidAlgebra.mapDomainAlgHom O O (invMonoidHom : G →* G) := by
  ext g; simp

/-- §6.1: `#` induces `R_Ψ ≅ R_{Ψ⁻¹}` (`R^# = R_{Ψ^#}`). -/
def charGroupRing.sharpEquiv (Ψ : Set (G →* Oˣ)) :
    charGroupRing Ψ ≃ₐ[O] charGroupRing (Ψ⁻¹) := sorry

@[simp] theorem charGroupRing.sharpEquiv_proj (Ψ : Set (G →* Oˣ)) (x : MonoidAlgebra O G) :
    charGroupRing.sharpEquiv Ψ (charGroupRing.proj Ψ x) = charGroupRing.proj (Ψ⁻¹) (sharp x) :=
  sorry

/-- The inverse of `# : R_Ψ → R_{Ψ⁻¹}` is induced by `#` as well. -/
@[simp] theorem charGroupRing.sharpEquiv_symm_proj (Ψ : Set (G →* Oˣ))
    (x : MonoidAlgebra O G) :
    (charGroupRing.sharpEquiv Ψ).symm (charGroupRing.proj (Ψ⁻¹) x) =
      charGroupRing.proj Ψ (sharp x) := sorry

/-- On coordinates, `(# y)(ψ⁻¹) = y(ψ)`. -/
@[simp] theorem charGroupRing.coord_sharpEquiv (Ψ : Set (G →* Oˣ)) (y : charGroupRing Ψ)
    (ψ : Ψ) :
    ((charGroupRing.sharpEquiv Ψ y : charGroupRing (Ψ⁻¹)) : ↥(Ψ⁻¹) → O)
        ⟨ψ.1⁻¹, Set.inv_mem_inv.mpr ψ.2⟩ = (y : Ψ → O) ψ := sorry

/-- Principal ideals transport: `#(x R) = x^# R^#`. -/
theorem charGroupRing.map_sharp_span (Ψ : Set (G →* Oˣ)) (x : charGroupRing Ψ) :
    Ideal.map (charGroupRing.sharpEquiv Ψ) (Ideal.span {x}) =
      Ideal.span {charGroupRing.sharpEquiv Ψ x} := sorry

/-- For `Ψ ⊆ Ψ'` (so `Ψ⁻¹ ⊆ Ψ'⁻¹`) and `y ∈ R_{Ψ'}`: the restriction of `# y ∈ R_{Ψ'⁻¹}` to
`Ψ⁻¹` is `#(y|_Ψ)`. -/
theorem charGroupRing.sharpEquiv_restrict {Ψ Ψ' : Set (G →* Oˣ)} (h : Ψ ⊆ Ψ')
    (y : charGroupRing Ψ') :
    charGroupRing.restrict (Set.inv_subset_inv.mpr h) (charGroupRing.sharpEquiv Ψ' y) =
      charGroupRing.sharpEquiv Ψ (charGroupRing.restrict h y) := sorry

/-- If `Ψ⁻¹ = Ψ`, the `O`-algebra automorphism `#` of `R_Ψ`: `sharpEquiv` followed by the
identification `R_{Ψ⁻¹} = R_Ψ`, the restriction along `Ψ ⊆ Ψ⁻¹`. It is its own inverse
(`# ∘ # = id`, the two proof obligations). Its values are given by `sharpAut_proj` and
`coord_sharpAut` below; for `Ψ = Ĝ` it corresponds under `α_Ĝ` to the involution `#` of `O[G]`. -/
def charGroupRing.sharpAut (Ψ : Set (G →* Oˣ)) (h : Ψ⁻¹ = Ψ) :
    charGroupRing Ψ ≃ₐ[O] charGroupRing Ψ :=
  AlgEquiv.ofAlgHom
    ((charGroupRing.restrict h.superset).comp (charGroupRing.sharpEquiv Ψ : _ →ₐ[O] _))
    ((charGroupRing.restrict h.superset).comp (charGroupRing.sharpEquiv Ψ : _ →ₐ[O] _))
    sorry sorry

/-- §6.1 (API `sharpAut_proj`): for `Ψ⁻¹ = Ψ`, `#(α_Ψ(x)) = α_Ψ(x^#)`. -/
theorem charGroupRing.sharpAut_proj (Ψ : Set (G →* Oˣ)) (h : Ψ⁻¹ = Ψ)
    (x : MonoidAlgebra O G) :
    charGroupRing.sharpAut Ψ h (charGroupRing.proj Ψ x) = charGroupRing.proj Ψ (sharp x) := sorry

/-- §6.1 (API `coord_sharpAut`): for `Ψ⁻¹ = Ψ`, `(# y)(ψ) = y(ψ⁻¹)`. -/
theorem charGroupRing.coord_sharpAut (Ψ : Set (G →* Oˣ)) (h : Ψ⁻¹ = Ψ) (y : charGroupRing Ψ)
    (ψ : Ψ) :
    ((charGroupRing.sharpAut Ψ h y : charGroupRing Ψ) : Ψ → O) ψ =
      (y : Ψ → O) ⟨ψ.1⁻¹, Set.mem_inv.mp (h.superset ψ.2)⟩ := sorry

-- test sharp_component (computation) [§6.1]
example [IsDomain O] (τ : G) (ψ : G →* Oˣ) (ζ : O) (hζ : IsPrimitiveRoot ζ 3)
    (hψ : (ψ τ : O) = ζ) :
    charEval ψ (sharp (MonoidAlgebra.of O G τ)) = ζ ^ 2 := sorry

-- test sharp_not_endomorphism (non-example) [§6.1]
example [IsDomain O] [CharZero O] (τ : G) (ψ : G →* Oˣ) (ζ : O) (hζ : IsPrimitiveRoot ζ 3)
    (hψ : (ψ τ : O) = ζ) :
    charGroupRing.proj {ψ} (MonoidAlgebra.of O G τ - algebraMap O _ ζ) = 0 ∧
      charGroupRing.proj {ψ} (sharp (MonoidAlgebra.of O G τ - algebraMap O _ ζ)) ≠ 0 := sorry

-- test sharp_trivialGroup (degenerate) [§6.1]
example [Subsingleton G] (x : MonoidAlgebra O G) : sharp x = x := sorry

-- test sharp_full (compatibility) [§6.1]
example (x : MonoidAlgebra O G) (ψ : G →* Oˣ) :
    (Set.univ : Set (G →* Oˣ))⁻¹ = Set.univ ∧
      ((charGroupRing.sharpEquiv (Set.univ : Set (G →* Oˣ)) (charGroupRing.proj Set.univ x) :
          charGroupRing ((Set.univ : Set (G →* Oˣ))⁻¹)) :
          ↥((Set.univ : Set (G →* Oˣ))⁻¹) → O) ⟨ψ⁻¹, by simp⟩ = charEval ψ x ∧
      charEval ψ x = charEval ψ⁻¹ (sharp x) := sorry

end Sharp

/-! ## PadicMeasuresIwasawaAlgebras:§6.2 (construction) -/

section Contragredient

variable {R S M N P : Type*} [CommRing R] [CommRing S] [AddCommGroup M] [Module R M]
  [AddCommGroup N] [Module R N] [AddCommGroup P] [Module R P]

/-- §6.2: `M^* = Hom_R(M, R)` as an `S`-module along a ring isomorphism
`σ : S ≃+* R`, `(s · φ)(x) = φ(σ(s) · x)`. For `R = R_Ψ`, `S = R^#` and `σ = #`, this is
Dasgupta–Kakde (80). -/
def ContragredientDual (_σ : S ≃+* R) (M : Type*) [AddCommGroup M] [Module R M] : Type _ :=
  Module.Dual R M

namespace ContragredientDual

variable (σ : S ≃+* R)

instance : AddCommGroup (ContragredientDual σ M) := inferInstanceAs (AddCommGroup (Module.Dual R M))

instance : Module S (ContragredientDual σ M) :=
  Module.compHom (Module.Dual R M) σ.toRingHom

/-- The underlying functional. -/
def toDual : ContragredientDual σ M ≃+ Module.Dual R M := AddEquiv.refl _

@[simp] theorem smul_apply (s : S) (φ : ContragredientDual σ M) (x : M) :
    toDual σ (s • φ) x = toDual σ φ (σ s • x) := by
  change σ s • (toDual σ φ) x = _
  rw [map_smul]

/-- The element of `M^*` with underlying functional `φ`; `ofDual` and `toDual` are mutually
inverse additive bijections between `Module.Dual R M` and `M^*`. -/
def ofDual : Module.Dual R M ≃+ ContragredientDual σ M := (toDual σ).symm

/-- Two elements of `M^*` are equal when their underlying functionals agree at every `x`. -/
theorem ext {σ : S ≃+* R} {φ ψ : ContragredientDual σ M}
    (h : ∀ x, toDual σ φ x = toDual σ ψ x) : φ = ψ :=
  (toDual σ).injective (LinearMap.ext h)

/-- `toDual (s • φ) = σ(s) • toDual φ` in `Module.Dual R M`: `toDual` is a `σ`-semilinear
bijection from `M^*` onto Mathlib's dual, the identity on functionals. -/
theorem toDual_smul (s : S) (φ : ContragredientDual σ M) :
    toDual σ (s • φ) = σ s • toDual σ φ := rfl

/-- A linear map induces the `S`-linear precomposition `f^* : N^* → M^*`, `φ ↦ φ ∘ f`
(`LinearMap.dualMap f` on the underlying functionals). -/
def map (f : M →ₗ[R] N) : ContragredientDual σ N →ₗ[S] ContragredientDual σ M where
  toFun φ := (toDual σ).symm (f.dualMap (toDual σ φ))
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

@[simp] theorem map_apply (f : M →ₗ[R] N) (φ : ContragredientDual σ N) :
    toDual σ (map σ f φ) = f.dualMap (toDual σ φ) := rfl

theorem map_id : map σ (LinearMap.id : M →ₗ[R] M) = LinearMap.id := rfl

theorem map_comp (f : M →ₗ[R] N) (g : N →ₗ[R] P) :
    map σ (g ∘ₗ f) = map σ f ∘ₗ map σ g := rfl

/-- For `M = R^m` the contragredient dual is free over `S` on the dual basis. -/
def equivPi (m : ℕ) : ContragredientDual σ (Fin m → R) ≃ₗ[S] (Fin m → S) := sorry

/-- The `i`-th coordinate of `equivPi` is `σ⁻¹` of the value on the `i`-th basis vector. -/
@[simp] theorem equivPi_apply (m : ℕ) (φ : ContragredientDual σ (Fin m → R)) (i : Fin m) :
    equivPi σ m φ i = σ.symm (toDual σ φ (Pi.single i 1)) := sorry

/-- The dual of an `m × n` matrix `A` (acting on column vectors `R^n → R^m`) is, under `equivPi`,
the `n × m` matrix over `S` with `(j, i)` entry `σ⁻¹(A i j)`: the transpose with `σ⁻¹` applied to
the entries. -/
theorem equivPi_map_toLin' {m n : ℕ} (A : Matrix (Fin m) (Fin n) R)
    (φ : ContragredientDual σ (Fin m → R)) :
    equivPi σ n (map σ (Matrix.toLin' A) φ) =
      Matrix.toLin' ((A.map σ.symm).transpose) (equivPi σ m φ) := sorry

/-- `(M × N)^* ≃ₗ[S] M^* × N^*`, `φ ↦ (φ ∘ inl, φ ∘ inr)`: the inverse of Mathlib's
`Module.dualProdDualEquivDual`, which is `S`-linear for the contragredient structures. -/
def prodEquiv :
    ContragredientDual σ (M × N) ≃ₗ[S] ContragredientDual σ M × ContragredientDual σ N :=
  LinearEquiv.ofBijective
    ((map σ (LinearMap.inl R M N)).prod (map σ (LinearMap.inr R M N))) sorry

/-- If `M` is a finitely generated projective `R`-module, then `M^*` is a projective `S`-module:
`Module.Dual R M` is projective over `R` (`Module.dual_projective`), and projectivity passes
along the `σ`-semilinear bijection `toDual` (`Module.Projective.of_equiv`). -/
instance projective [Module.Finite R M] [Module.Projective R M] :
    Module.Projective S (ContragredientDual σ M) := sorry

/-- If `M` is a finitely generated projective `R`-module, then `M^*` is a finite `S`-module:
`Module.Dual R M` is finite over `R` (`Module.dual_finite`), and a generating set over `R`
generates over `S` because `σ` is surjective. -/
instance finite [Module.Finite R M] [Module.Projective R M] :
    Module.Finite S (ContragredientDual σ M) := sorry

/-- `φ ↦ σ⁻¹ ∘ φ`: the contragredient dual is Mathlib's `S`-module of `σ⁻¹`-semilinear maps
`M → S`. -/
def equivSemilinear : ContragredientDual σ M ≃ₗ[S] (M →ₛₗ[(σ.symm : R →+* S)] S) := sorry

@[simp] theorem equivSemilinear_apply (φ : ContragredientDual σ M) (x : M) :
    equivSemilinear σ φ x = σ.symm (toDual σ φ x) := sorry

end ContragredientDual

section GroupRing

variable {O G : Type*} [CommRing O] [CommGroup G] [Fintype G]

/-- For a finite commutative group `G`, `R = S = O[G]`, `σ = #` and an `O[G]`-module `M`:
`Hom_O(M, O) ≅ M^*`, `f ↦ (m ↦ Σ_g f(g • m) • g⁻¹)`, an isomorphism of abelian groups whose
inverse takes the coefficient of `1` (Dasgupta–Kakde, proof of Lemma A.8). -/
def ContragredientDual.equivDualOfGroupRing (M : Type*) [AddCommGroup M]
    [Module (MonoidAlgebra O G) M] :
    Module.Dual O (RestrictScalars O (MonoidAlgebra O G) M) ≃+
      ContragredientDual (sharpAlgEquiv (O := O) (G := G)).toRingEquiv M := sorry

/-- The formula for `equivDualOfGroupRing`: `Ψ_f(x) = Σ_g f(g • x) • g⁻¹`. -/
theorem ContragredientDual.equivDualOfGroupRing_apply (M : Type*) [AddCommGroup M]
    [Module (MonoidAlgebra O G) M]
    (f : Module.Dual O (RestrictScalars O (MonoidAlgebra O G) M)) (x : M) :
    ContragredientDual.toDual _ (ContragredientDual.equivDualOfGroupRing M f) x =
      ∑ g : G, MonoidAlgebra.single g⁻¹
        (f ((RestrictScalars.addEquiv O (MonoidAlgebra O G) M).symm
          (MonoidAlgebra.of O G g • x))) := sorry

/-- `equivDualOfGroupRing` carries Mathlib's dual representation `Representation.dual` of the
representation of `G` on `M`, `(g • f)(m) = f(g⁻¹ • m)`, to the action of `g ∈ G ⊆ O[G]` on
`M^*`. -/
theorem ContragredientDual.equivDualOfGroupRing_dual (M : Type*) [AddCommGroup M]
    [Module (MonoidAlgebra O G) M] (g : G)
    (f : Module.Dual O (RestrictScalars O (MonoidAlgebra O G) M)) :
    ContragredientDual.equivDualOfGroupRing M
        ((Representation.ofModule (k := O) (G := G) M).dual g f) =
      MonoidAlgebra.of O G g • ContragredientDual.equivDualOfGroupRing M f := sorry

end GroupRing

-- test contragredient_smul_group (computation) [§6.2]
example {O G : Type*} [CommRing O] [CommGroup G] (g : G) :
    let σ : MonoidAlgebra O G ≃+* MonoidAlgebra O G := (sharpAlgEquiv (O := O) (G := G)).toRingEquiv
    ContragredientDual.toDual σ (MonoidAlgebra.of O G g •
        (ContragredientDual.toDual σ).symm LinearMap.id) 1 = MonoidAlgebra.of O G g⁻¹ := sorry

-- test contragredient_trivial (degenerate) [§6.2]
example (s : R) (φ : ContragredientDual (RingEquiv.refl R) M) (x : M) :
    ContragredientDual.toDual _ (s • φ) x = s • ContragredientDual.toDual _ φ x := sorry

-- test contragredient_not_ordinary (non-example) [§6.2]
example {O G : Type*} [CommRing O] [Nontrivial O] [CommGroup G] (g : G) (hg : g⁻¹ ≠ g) :
    let σ : MonoidAlgebra O G ≃+* MonoidAlgebra O G := (sharpAlgEquiv (O := O) (G := G)).toRingEquiv
    ContragredientDual.toDual σ (MonoidAlgebra.of O G g •
        (ContragredientDual.toDual σ).symm LinearMap.id) 1 ≠ MonoidAlgebra.of O G g := sorry

-- test contragredient_semilinear (compatibility) [§6.2]
example (σ : S ≃+* R) (s : S) (x : R) :
    ContragredientDual.equivSemilinear σ
        ((ContragredientDual.toDual σ).symm (LinearMap.id : R →ₗ[R] R)) x = σ.symm x ∧
      ContragredientDual.equivSemilinear σ
        (s • (ContragredientDual.toDual σ).symm (LinearMap.id : R →ₗ[R] R)) x = s * σ.symm x :=
  sorry

-- test contragredient_dual_representation (compatibility) [§6.2]
example {O G : Type*} [CommRing O] [CommGroup G] [Fintype G] (g : G)
    (f : Module.Dual O (RestrictScalars O (MonoidAlgebra O G) (MonoidAlgebra O G))) :
    ContragredientDual.equivDualOfGroupRing (MonoidAlgebra O G)
        ((Representation.ofModule (k := O) (G := G) (MonoidAlgebra O G)).dual g f) =
      MonoidAlgebra.of O G g • ContragredientDual.equivDualOfGroupRing (MonoidAlgebra O G) f :=
  ContragredientDual.equivDualOfGroupRing_dual _ g f

-- test contragredient_matrix (computation) [§6.2]
example {O G : Type*} [CommRing O] [CommGroup G] (g h : G)
    (φ : ContragredientDual (sharpAlgEquiv (O := O) (G := G)).toRingEquiv
      (Fin 2 → MonoidAlgebra O G)) :
    let σ : MonoidAlgebra O G ≃+* MonoidAlgebra O G := (sharpAlgEquiv (O := O) (G := G)).toRingEquiv
    ContragredientDual.equivPi σ 2 (ContragredientDual.map σ
        (Matrix.toLin' (!![MonoidAlgebra.of O G g, 0; MonoidAlgebra.of O G h, 1] :
          Matrix (Fin 2) (Fin 2) (MonoidAlgebra O G))) φ) =
      Matrix.toLin' (!![MonoidAlgebra.of O G g⁻¹, MonoidAlgebra.of O G h⁻¹; 0, 1] :
          Matrix (Fin 2) (Fin 2) (MonoidAlgebra O G)) (ContragredientDual.equivPi σ 2 φ) := sorry

end Contragredient

/-! ## The initial Fitting ideal (§4.5), declared here because Layer 6 is its main consumer -/

/- §4.5: the initial Fitting ideal `Fitt⁰_A(M)` is Tau Ceti's
`TauCeti.fittingIdeal A M 0` (`TauCeti.RingTheory.FittingIdeal.Basic`); presentation
independence in the form `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_quotient_zero`,
`fittingIdeal_congr` and `fittingIdeal_baseChange` (`TauCeti.RingTheory.FittingIdeal.BaseChange`)
are library facts and are not restated. The API below is what the roadmap still asks for on
that carrier. -/

section FittingIdealAPI
open scoped TensorProduct
variable {A M N : Type*} [CommRing A] [AddCommGroup M] [Module A M] [Module.FinitePresentation A M]
  [AddCommGroup N] [Module A N] [Module.FinitePresentation A N]

theorem Module.fittingIdeal_le_annihilator : TauCeti.fittingIdeal A M 0 ≤ Module.annihilator A M :=
  sorry
theorem Module.fittingIdeal_prod [Module.FinitePresentation A (M × N)] :
    TauCeti.fittingIdeal A (M × N) 0 = TauCeti.fittingIdeal A M 0 * TauCeti.fittingIdeal A N 0 := sorry
theorem Module.fittingIdeal_eq_top_iff : TauCeti.fittingIdeal A M 0 = ⊤ ↔ Subsingleton M := sorry

-- test fitting_cyclic (computation) [§4.5]
example (a : A) [Module.FinitePresentation A (A ⧸ Ideal.span {a})] :
    TauCeti.fittingIdeal A (A ⧸ Ideal.span {a}) 0 = Ideal.span {a} := sorry
-- test fitting_free_and_zero (degenerate) [§4.5]
example [Nontrivial A] (n : ℕ) [Module.FinitePresentation A (Fin (n + 1) → A)]
    [Module.FinitePresentation A (Fin 0 → A)] :
    TauCeti.fittingIdeal A (Fin (n + 1) → A) 0 = ⊥ ∧ TauCeti.fittingIdeal A (Fin 0 → A) 0 = ⊤ := sorry
-- test fitting_not_annihilator (non-example) [§4.5]
example [Module.FinitePresentation ℤ (ZMod 2 × ZMod 2)] :
    TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 2) 0 = Ideal.span {4} ∧
      Module.annihilator ℤ (ZMod 2 × ZMod 2) = Ideal.span {2} := sorry
end FittingIdealAPI

/-! ## Quadratic presentations and their Fitting ideal (§6.3) -/

section Quadratic

variable {R R' N N' N'' : Type*} [CommRing R] [CommRing R'] [Algebra R R'] [AddCommGroup N]
  [Module R N] [AddCommGroup N'] [Module R N'] [AddCommGroup N''] [Module R N'']

/-- §6.3: a quadratic presentation `R^m →φ R^m → N → 0`, `m ≥ 1`
(Dasgupta–Kakde §2.3). -/
structure QuadraticPresentation (R N : Type*) [CommRing R] [AddCommGroup N] [Module R N] where
  /-- the common number `m ≥ 1` of generators and relations -/
  size : ℕ
  size_pos : 0 < size
  /-- the square relation matrix `φ` -/
  rel : Matrix (Fin size) (Fin size) R
  /-- the generators `π : R^m ↠ N` -/
  gen : (Fin size → R) →ₗ[R] N
  gen_surjective : Function.Surjective gen
  range_rel_eq_ker : LinearMap.range (Matrix.toLin' rel) = LinearMap.ker gen

/-- `N` is quadratically presented over `R`. -/
def IsQuadraticallyPresented (R N : Type*) [CommRing R] [AddCommGroup N] [Module R N] : Prop :=
  Nonempty (QuadraticPresentation R N)

namespace QuadraticPresentation

/-- Two quadratic presentations of `N` with the same size, the same matrix and the same map are
equal. -/
theorem ext {P Q : QuadraticPresentation R N} (h : P.size = Q.size)
    (hrel : P.rel = Q.rel.submatrix (Fin.cast h) (Fin.cast h))
    (hgen : ∀ v, P.gen v = Q.gen (v ∘ Fin.cast h.symm)) : P = Q := by
  obtain ⟨m, hm, φ, π, h1, h2⟩ := P
  obtain ⟨m', hm', φ', π', h1', h2'⟩ := Q
  obtain rfl : m = m' := h
  have e1 : φ = φ' := by simpa using hrel
  have e2 : π = π' := by ext v; simpa using hgen (Pi.single v 1)
  subst e1 e2
  rfl

/-- For a quadratic presentation `(m, φ, π)` of `N`: the isomorphism `R^m/φR^m ≅ N` induced by
`π`. -/
def quotientEquiv (P : QuadraticPresentation R N) :
    ((Fin P.size → R) ⧸ LinearMap.range (Matrix.toLin' P.rel)) ≃ₗ[R] N :=
  (Submodule.quotEquivOfEq _ _ P.range_rel_eq_ker).trans
    (LinearMap.quotKerEquivOfSurjective P.gen P.gen_surjective)

/-- `quotientEquiv` sends the class of `v ∈ R^m` to `π(v)`. -/
@[simp] theorem quotientEquiv_mk (P : QuadraticPresentation R N) (v : Fin P.size → R) :
    P.quotientEquiv (Submodule.Quotient.mk v) = P.gen v := by
  simp [quotientEquiv]

/-- A quadratic presentation is a Mathlib `Module.Presentation` with generators and relations
both indexed by `Fin m`: the `j`-th relation is the `j`-th column of `φ` and the `i`-th generator
is `π(e_i)`. -/
def toPresentation (P : QuadraticPresentation R N) : Module.Presentation R N where
  G := Fin P.size
  R := Fin P.size
  relation j := Finsupp.equivFunOnFinite.symm fun i => P.rel i j
  var i := P.gen (Pi.single i 1)
  linearCombination_var_relation := sorry
  bijective := sorry

/-- A quadratically presented module is finitely presented
(`Module.Presentation.finitePresentation`). -/
theorem finitePresentation (P : QuadraticPresentation R N) : Module.FinitePresentation R N :=
  haveI : Finite P.toPresentation.G := inferInstanceAs (Finite (Fin P.size))
  haveI : Finite P.toPresentation.R := inferInstanceAs (Finite (Fin P.size))
  P.toPresentation.finitePresentation

/-- Transport along `N ≅ N'`: same matrix, generators composed with the isomorphism. -/
def ofLinearEquiv (P : QuadraticPresentation R N) (e : N ≃ₗ[R] N') :
    QuadraticPresentation R N' where
  size := P.size
  size_pos := P.size_pos
  rel := P.rel
  gen := e.toLinearMap ∘ₗ P.gen
  gen_surjective := e.surjective.comp P.gen_surjective
  range_rel_eq_ker := by rw [LinearEquiv.ker_comp]; exact P.range_rel_eq_ker

/-- Transport along the identity of `N` returns the presentation. -/
theorem ofLinearEquiv_refl (P : QuadraticPresentation R N) :
    P.ofLinearEquiv (LinearEquiv.refl R N) = P := by
  cases P; rfl

/-- Transport along `e : N ≅ N'` and then along `e' : N' ≅ N''` is transport along `e' ∘ e`. -/
theorem ofLinearEquiv_trans (P : QuadraticPresentation R N) (e : N ≃ₗ[R] N')
    (e' : N' ≃ₗ[R] N'') :
    (P.ofLinearEquiv e).ofLinearEquiv e' = P.ofLinearEquiv (e.trans e') := by
  cases P; rfl

/-- The cokernel of a square matrix of size `m ≥ 1` is quadratically presented, by that matrix
and the quotient map. -/
def cokernel {m : ℕ} (hm : 0 < m) (φ : Matrix (Fin m) (Fin m) R) :
    QuadraticPresentation R ((Fin m → R) ⧸ LinearMap.range (Matrix.toLin' φ)) where
  size := m
  size_pos := hm
  rel := φ
  gen := (LinearMap.range (Matrix.toLin' φ)).mkQ
  gen_surjective := Submodule.mkQ_surjective _
  range_rel_eq_ker := (Submodule.ker_mkQ _).symm

/-- Base change `N ⊗_R R'` is presented by the image of the matrix. -/
def baseChange (P : QuadraticPresentation R N) :
    QuadraticPresentation R' (TensorProduct R R' N) := sorry

@[simp] theorem baseChange_size (P : QuadraticPresentation R N) :
    (P.baseChange (R' := R')).size = P.size := sorry

theorem baseChange_rel (P : QuadraticPresentation R N) :
    (P.baseChange (R' := R')).rel = (P.rel.map (algebraMap R R')).submatrix
      (Fin.cast P.baseChange_size) (Fin.cast P.baseChange_size) := sorry

/-- Direct sums: block-diagonal relation matrix. -/
def prod (P : QuadraticPresentation R N) (P' : QuadraticPresentation R N') :
    QuadraticPresentation R (N × N') := sorry

@[simp] theorem prod_size (P : QuadraticPresentation R N) (P' : QuadraticPresentation R N') :
    (P.prod P').size = P.size + P'.size := sorry

/-- The determinant of the block-diagonal matrix. -/
@[simp] theorem prod_det (P : QuadraticPresentation R N) (P' : QuadraticPresentation R N') :
    (P.prod P').rel.det = P.rel.det * P'.rel.det := sorry

/-- The zero module, presented by `R →(1) R`. -/
def zero : QuadraticPresentation R PUnit := sorry

@[simp] theorem zero_size : (zero (R := R)).size = 1 := sorry

@[simp] theorem zero_rel : (zero (R := R)).rel = 1 := sorry

/-- `R/(a)`, presented by `R →(a) R`. -/
def cyclic (a : R) : QuadraticPresentation R (R ⧸ Ideal.span {a}) := sorry

@[simp] theorem cyclic_size (a : R) : (cyclic a).size = 1 := sorry

@[simp] theorem cyclic_det (a : R) : (cyclic a).rel.det = a := sorry

/-- A Mathlib `Module.Presentation R N` whose generator type and relation type are both in
bijection with `Fin m`, `m ≥ 1`, gives a quadratic presentation of size `m`: `φ i j` is the
`i`-th coefficient of the `j`-th relation and `π(e_i)` is the `i`-th variable. -/
def ofPresentation (pres : Module.Presentation R N) {m : ℕ} (hm : 0 < m) (eG : pres.G ≃ Fin m)
    (eR : pres.R ≃ Fin m) : QuadraticPresentation R N where
  size := m
  size_pos := hm
  rel := Matrix.of fun i j => pres.relation (eR.symm j) (eG.symm i)
  gen := Fintype.linearCombination R fun i => pres.var (eG.symm i)
  gen_surjective := sorry
  range_rel_eq_ker := sorry

/-- §6.3: `Fitt_R(N) = (det φ)` (Dasgupta–Kakde §2.3). The instance is
`P.finitePresentation`. -/
theorem fittingIdeal_eq (P : QuadraticPresentation R N) [Module.FinitePresentation R N] :
    TauCeti.fittingIdeal R N 0 = Ideal.span {P.rel.det} := sorry

end QuadraticPresentation

/-- `N` is quadratically presented iff it has a Mathlib presentation whose generator and relation
types are finite of the same cardinality (cardinality `0` gives `N = 0`, presented by
`R →(1) R`). -/
theorem isQuadraticallyPresented_iff_exists_presentation :
    IsQuadraticallyPresented R N ↔ ∃ pres : Module.Presentation.{0, 0} R N,
      Finite pres.G ∧ Finite pres.R ∧ Nat.card pres.G = Nat.card pres.R := sorry

-- test quadratic_cyclic (computation) [§6.3]
example (a : R) : (QuadraticPresentation.cyclic a).size = 1 ∧
    (QuadraticPresentation.cyclic a).rel.det = a :=
  ⟨QuadraticPresentation.cyclic_size a, QuadraticPresentation.cyclic_det a⟩

-- test quadratic_zero (degenerate) [§6.3]
example : IsQuadraticallyPresented R PUnit ∧ (QuadraticPresentation.zero (R := R)).size = 1 ∧
    (QuadraticPresentation.zero (R := R)).rel = 1 ∧
    ∀ P : QuadraticPresentation R PUnit, P.size ≠ 0 :=
  ⟨⟨QuadraticPresentation.zero⟩, QuadraticPresentation.zero_size,
    QuadraticPresentation.zero_rel, fun P => P.size_pos.ne'⟩

-- test quadratic_free (degenerate) [§6.3]
example (m : ℕ) (hm : 0 < m) :
    ∃ P : QuadraticPresentation R (Fin m → R), P.size = m ∧ P.rel = 0 :=
  ⟨⟨m, hm, 0, LinearMap.id, Function.surjective_id, by simp⟩, rfl, rfl⟩

-- test not_quadratic_residue_field (non-example) [§6.3]
example (p : ℕ) [Fact p.Prime] :
    ¬ IsQuadraticallyPresented (PowerSeries (PadicInt p))
      (PowerSeries (PadicInt p) ⧸ (Ideal.span {(p : PowerSeries (PadicInt p)),
        PowerSeries.X})) := sorry

/- Next test: the base change of the presentation `R →(a) R` of `R/(a)` along `R → R'` is a
quadratic presentation of `R' ⊗_R R/(a)` over `R'` of size 1 whose matrix is `(a')`, `a'` the
image of `a` (a `1 × 1` matrix is determined by its determinant). -/
-- test quadratic_baseChange (computation) [§6.3]
example (a : R) : ((QuadraticPresentation.cyclic a).baseChange (R' := R')).size = 1 ∧
    ((QuadraticPresentation.cyclic a).baseChange (R' := R')).rel.det = algebraMap R R' a := sorry

-- test quadratic_toPresentation (compatibility) [§6.3]
example (P : QuadraticPresentation R N) (i j : Fin P.size) :
    P.toPresentation.var i = P.gen (Pi.single i 1) ∧
      P.toPresentation.relation j i = P.rel i j := ⟨rfl, rfl⟩

-- test quadratic_columns (computation) [§6.3]
example [Nontrivial R] :
    (Pi.single 0 1 : Fin 2 → R) ∈
        LinearMap.range (Matrix.toLin' (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) R)) ∧
      (Pi.single 1 1 : Fin 2 → R) ∉
        LinearMap.range (Matrix.toLin' (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) R)) := sorry

end Quadratic

/-! ## Higher Fitting ideals (§6.5) -/

section HigherFitting

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]


/-- Fitting ideals in matrix form (§6.5): for a presentation `R^m →A R^n →π M → 0`, `Fittⁱ_R(M)` is
generated by the minors of `A` of size `n - i` (all of `R` when `i ≥ n`, zero when `n - i > m`).
This is a translation of Tau Ceti's `fittingIdeal_eq_minorsIdeal_ker` and
`fittingIdeal_eq_minorsIdealOfSet` (stated there with `Submodule.minorsIdeal`); monotonicity,
invariance under equivalence, base change, localisation, the free-module and cyclic values are
`TauCeti.fittingIdeal_le_of_surjective`, `fittingIdeal_congr`, `fittingIdeal_baseChange`,
`fittingIdeal_eq_map`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_eq_top_iff_finrank_le`,
`fittingIdeal_eq_top_of_surjective` and `fittingIdeal_quotient_zero`, and are not restated. -/
theorem Module.higherFittingIdeal_eq_span_minors [Module.FinitePresentation R M] {n m : ℕ}
    (A : Matrix (Fin n) (Fin m) R) (π : (Fin n → R) →ₗ[R] M) (hπ : Function.Surjective π)
    (hA : LinearMap.range (Matrix.toLin' A) = LinearMap.ker π) (i : ℕ) :
    TauCeti.fittingIdeal R M i =
      Ideal.span {a | ∃ (f : Fin (n - i) → Fin n) (g : Fin (n - i) → Fin m),
        a = (A.submatrix f g).det} := sorry

end HigherFitting

section HigherFittingTests

attribute [local instance] Module.finitePresentation_of_finite

-- test higherFitting_free (computation) [§6.5]
example {R : Type*} [CommRing R] [Nontrivial R] :
    TauCeti.fittingIdeal R (Fin 3 → R) 2 = ⊥ ∧
      TauCeti.fittingIdeal R (Fin 3 → R) 3 = ⊤ ∧
      TauCeti.fittingIdeal R (Fin 3 → R) 2 ≠ TauCeti.fittingIdeal R (Fin 3 → R) 3 :=
  sorry

-- test higherFitting_two_cyclic (computation) [§6.5]
example : TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 4) 0 = Ideal.span {8} ∧
    TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 4) 1 = Ideal.span {2} ∧
    TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 4) 2 = ⊤ := sorry

-- test higherFitting_not_initial (non-example) [§6.5]
example : TauCeti.fittingIdeal ℤ (ℤ × ZMod 2) 0 = ⊥ ∧
    TauCeti.fittingIdeal ℤ (ℤ × ZMod 2) 1 = Ideal.span {2} ∧
    TauCeti.fittingIdeal ℤ (ℤ × ZMod 2) 2 = ⊤ ∧
    TauCeti.fittingIdeal ℤ (ℤ × ZMod 2) 1 ≠ TauCeti.fittingIdeal ℤ (ℤ × ZMod 2) 0 :=
  sorry

/- Next test: `R/(a)` presented by one generator with the two relations `a, a²` and by two
generators with relation matrix `[[a, 0], [0, 1]]`. The minors of size 1 of the first and of
size 2 of the second both generate `(a)`, both cokernels have `Fitt⁰ = (a)`, and `Fitt¹ = R`
from either. -/
-- test higherFitting_presentation_independent (characterisation) [§6.5]
example {R : Type*} [CommRing R] (a : R)
    [Module.FinitePresentation R ((Fin 1 → R) ⧸
      LinearMap.range (Matrix.toLin' (!![a, a ^ 2] : Matrix (Fin 1) (Fin 2) R)))]
    [Module.FinitePresentation R ((Fin 2 → R) ⧸
      LinearMap.range (Matrix.toLin' (!![a, 0; 0, 1] : Matrix (Fin 2) (Fin 2) R)))] :
    Ideal.span {d | ∃ (f : Fin 1 → Fin 1) (g : Fin 1 → Fin 2),
        d = ((!![a, a ^ 2] : Matrix (Fin 1) (Fin 2) R).submatrix f g).det} = Ideal.span {a} ∧
      Ideal.span {d | ∃ (f : Fin 2 → Fin 2) (g : Fin 2 → Fin 2),
        d = ((!![a, 0; 0, 1] : Matrix (Fin 2) (Fin 2) R).submatrix f g).det} = Ideal.span {a} ∧
      TauCeti.fittingIdeal R ((Fin 1 → R) ⧸
        LinearMap.range (Matrix.toLin' (!![a, a ^ 2] : Matrix (Fin 1) (Fin 2) R))) 0 =
          Ideal.span {a} ∧
      TauCeti.fittingIdeal R ((Fin 2 → R) ⧸
        LinearMap.range (Matrix.toLin' (!![a, 0; 0, 1] : Matrix (Fin 2) (Fin 2) R))) 0 =
          Ideal.span {a} ∧
      TauCeti.fittingIdeal R ((Fin 1 → R) ⧸
        LinearMap.range (Matrix.toLin' (!![a, a ^ 2] : Matrix (Fin 1) (Fin 2) R))) 1 = ⊤ ∧
      TauCeti.fittingIdeal R ((Fin 2 → R) ⧸
        LinearMap.range (Matrix.toLin' (!![a, 0; 0, 1] : Matrix (Fin 2) (Fin 2) R))) 1 = ⊤ :=
  sorry

-- test higherFitting_nonprincipal (computation) [§6.5]
example :
    TauCeti.fittingIdeal (Polynomial ℤ)  
        ((Polynomial ℤ ⧸ Ideal.span {(2 : Polynomial ℤ)}) ×
          (Polynomial ℤ ⧸ Ideal.span {(Polynomial.X : Polynomial ℤ)})) 0 =
      Ideal.span {2 * Polynomial.X} ∧
    TauCeti.fittingIdeal (Polynomial ℤ)  
        ((Polynomial ℤ ⧸ Ideal.span {(2 : Polynomial ℤ)}) ×
          (Polynomial ℤ ⧸ Ideal.span {(Polynomial.X : Polynomial ℤ)})) 1 =
      Ideal.span {2, Polynomial.X} ∧
    ¬ (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}).IsPrincipal ∧
    TauCeti.fittingIdeal (Polynomial ℤ)  
        ((Polynomial ℤ ⧸ Ideal.span {(2 : Polynomial ℤ)}) ×
          (Polynomial ℤ ⧸ Ideal.span {(Polynomial.X : Polynomial ℤ)})) 2 = ⊤ := sorry

-- test higherFitting_zero_compat (compatibility) [§6.5]
example {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.FinitePresentation R M]
    (a b : R) [Module.FinitePresentation R (R ⧸ Ideal.span {a})]
    [Module.FinitePresentation R (R ⧸ Ideal.span {b})] :
    TauCeti.fittingIdeal R M 0 = TauCeti.fittingIdeal R M 0 ∧
      TauCeti.fittingIdeal R ((R ⧸ Ideal.span {a}) × (R ⧸ Ideal.span {b})) 0 = Ideal.span {a * b} ∧
      TauCeti.fittingIdeal R ((R ⧸ Ideal.span {a}) × (R ⧸ Ideal.span {b})) 0 =
        Ideal.span {a * b} := sorry

-- test higherFitting_baseChange (computation) [§6.5]
example :
    TauCeti.fittingIdeal (ZMod 2) (TensorProduct ℤ (ZMod 2) (ZMod 2 × ZMod 4)) 1 = ⊥ ∧
      TauCeti.fittingIdeal ℤ (ZMod 2 × ZMod 4) 1 = Ideal.span {2} ∧
      (Ideal.span {(2 : ℤ)}).map (algebraMap ℤ (ZMod 2)) = ⊥ := sorry

end HigherFittingTests

/-! ## Locally quadratic presentations (§6.3) -/

section LocallyQuadratic

variable {R M P₀ P₁ : Type*} [CommRing R] [AddCommGroup M] [Module R M]
  [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]

/-- §6.3: `P₁ →f P₀ →π M → 0` exact, with `P₀, P₁` finitely
generated projective of the same constant rank (Dasgupta–Kakde Lemma A.5, Remark A.7). -/
structure IsLocallyQuadraticPresentation (f : P₁ →ₗ[R] P₀) (π : P₀ →ₗ[R] M) : Prop where
  projective₀ : Module.Projective R P₀
  projective₁ : Module.Projective R P₁
  finite₀ : Module.Finite R P₀
  finite₁ : Module.Finite R P₁
  surjective : Function.Surjective π
  exact : LinearMap.range f = LinearMap.ker π
  rank_eq : ∃ r : ℕ, ∀ 𝔭 : PrimeSpectrum R,
    Module.rankAtStalk P₀ 𝔭 = r ∧ Module.rankAtStalk P₁ 𝔭 = r

/-- A quadratic presentation is locally quadratic. -/
theorem QuadraticPresentation.isLocallyQuadraticPresentation (P : QuadraticPresentation R M) :
    IsLocallyQuadraticPresentation (Matrix.toLin' P.rel) P.gen := sorry

/-- Over a local ring a locally quadratic presentation gives a quadratic one (finitely generated
projective modules over a local ring are free; rank `0` gives the zero module, presented by
`R →(1) R`). -/
theorem IsLocallyQuadraticPresentation.isQuadraticallyPresented [IsLocalRing R]
    {f : P₁ →ₗ[R] P₀} {π : P₀ →ₗ[R] M} (h : IsLocallyQuadraticPresentation f π) :
    IsQuadraticallyPresented R M := sorry

/-- Over a finite product of local rings a locally quadratic presentation gives a quadratic
one. -/
theorem IsLocallyQuadraticPresentation.isQuadraticallyPresented_pi {ι : Type*} [Fintype ι]
    {A : ι → Type*} [∀ i, CommRing (A i)] [∀ i, IsLocalRing (A i)] {M P₀ P₁ : Type*}
    [AddCommGroup M] [Module (∀ i, A i) M] [AddCommGroup P₀] [Module (∀ i, A i) P₀]
    [AddCommGroup P₁] [Module (∀ i, A i) P₁]
    {f : P₁ →ₗ[∀ i, A i] P₀} {π : P₀ →ₗ[∀ i, A i] M} (h : IsLocallyQuadraticPresentation f π) :
    IsQuadraticallyPresented (∀ i, A i) M := sorry

/-- Over a ring with finitely many maximal ideals a locally quadratic presentation gives a
quadratic one (finitely generated projective modules of constant rank over a semilocal ring are
free); the two statements above are instances. Over a general ring this fails (test
`lq_not_quadratic`). -/
theorem IsLocallyQuadraticPresentation.isQuadraticallyPresented_of_finite_maximalSpectrum
    [Finite (MaximalSpectrum R)] {f : P₁ →ₗ[R] P₀} {π : P₀ →ₗ[R] M}
    (h : IsLocallyQuadraticPresentation f π) : IsQuadraticallyPresented R M := sorry

/-- The base change of a locally quadratic presentation along `R → R'` is a locally quadratic
presentation, of the same rank. -/
theorem IsLocallyQuadraticPresentation.baseChange (R' : Type*) [CommRing R'] [Algebra R R']
    {f : P₁ →ₗ[R] P₀} {π : P₀ →ₗ[R] M} (h : IsLocallyQuadraticPresentation f π) :
    IsLocallyQuadraticPresentation (f.baseChange R') (π.baseChange R') := sorry

-- test lq_quadratic (compatibility) [§6.3]
example (P : QuadraticPresentation R M) :
    IsLocallyQuadraticPresentation (Matrix.toLin' P.rel) P.gen :=
  P.isLocallyQuadraticPresentation

/- Next test: over `R = ℤ_p × ℤ_p`, the inclusion of the ideal `I = ℤ_p × 0` presents
`R/I ≅ 0 × ℤ_p` by projectives of ranks `(1, 0)` and `(1, 1)` on the two components: not locally
quadratic. -/
-- test lq_unequal_rank (non-example) [§6.3]
example (p : ℕ) [Fact p.Prime] :
    let I : Ideal (PadicInt p × PadicInt p) := Ideal.span {((1 : PadicInt p), (0 : PadicInt p))}
    ¬ IsLocallyQuadraticPresentation I.subtype I.mkQ := sorry

-- test lq_rank_zero (degenerate) [§6.3]
example : IsLocallyQuadraticPresentation (0 : PUnit →ₗ[R] PUnit) (0 : PUnit →ₗ[R] PUnit) := sorry

/- Next test: `R = ℤ[√-5]`, `I = (2, 1 + √-5)`. The presentation `I ↪ R ↠ R/I` is locally
quadratic of rank 1 (`I` is invertible), but `R/I` is not quadratically presented: a square
presentation `φ` would give `(det φ) = I`, and `I` is not principal. -/
-- test lq_not_quadratic (non-example) [§6.3]
example :
    let I : Ideal (Zsqrtd (-5)) := Ideal.span {(2 : Zsqrtd (-5)), ⟨1, 1⟩}
    IsLocallyQuadraticPresentation I.subtype I.mkQ ∧
      ¬ IsQuadraticallyPresented (Zsqrtd (-5)) (Zsqrtd (-5) ⧸ I) := sorry

end LocallyQuadratic

/-! ## Extensions and cardinalities (§6.3, §6.6) -/

section FittingExtension

variable {R A B C A' B' : Type*} [CommRing R] [AddCommGroup A] [Module R A] [AddCommGroup B]
  [Module R B] [AddCommGroup C] [Module R C] [AddCommGroup A'] [Module R A'] [AddCommGroup B']
  [Module R B']

/-- §6.6, the relations of an extension `0 → A → B → C → 0`: for
generators `a` of `A` with relation matrix `Ψ` (any number of columns; `A` need not be
quadratically presented), a square presentation `(Φ, c)` of `C`, lifts `c'` of its generators and
`X` with `c' ∘ Φ = i ∘ a ∘ X`, the family `(i ∘ a, c')` generates `B` and its relations are
generated by the columns of the block upper-triangular matrix `[[Ψ, -X], [0, Φ]]`. -/
theorem range_toLin'_fromBlocks_eq_ker_of_exact {n p m : Type*} [Fintype n] [Fintype p]
    [Fintype m] [DecidableEq n] [DecidableEq p] [DecidableEq m]
    {i : A →ₗ[R] B} {q : B →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q)
    (a : (n → R) →ₗ[R] A) (ha : Function.Surjective a) (Ψ : Matrix n p R)
    (hΨ : LinearMap.range (Matrix.toLin' Ψ) = LinearMap.ker a)
    (c : (m → R) →ₗ[R] C) (hc : Function.Surjective c) (Φ : Matrix m m R)
    (hΦ : LinearMap.range (Matrix.toLin' Φ) = LinearMap.ker c)
    (c' : (m → R) →ₗ[R] B) (hc' : q ∘ₗ c' = c) (X : Matrix n m R)
    (hX : c' ∘ₗ Matrix.toLin' Φ = i ∘ₗ a ∘ₗ Matrix.toLin' X) :
    let g : (n ⊕ m → R) →ₗ[R] B :=
      ((i ∘ₗ a).coprod c') ∘ₗ (LinearEquiv.sumArrowLequivProdArrow n m R R).toLinearMap
    Function.Surjective g ∧
      LinearMap.range (Matrix.toLin' (Matrix.fromBlocks Ψ (-X) 0 Φ)) = LinearMap.ker g := sorry

/-- §6.6, as data (an API item of §6.3):
from quadratic presentations of `A` (size `n`) and `C` (size `m`), the presentation of `B` of
size `n + m` with the block upper-triangular matrix `[[ψ_A, -X], [0, φ_C]]` of
§6.6. It depends on the choice of the lifts and of `X`; its size and
its determinant do not. -/
def QuadraticPresentation.ofExact (PA : QuadraticPresentation R A)
    (PC : QuadraticPresentation R C) {i : A →ₗ[R] B} {q : B →ₗ[R] C}
    (hi : Function.Injective i) (hq : Function.Surjective q) (hex : Function.Exact i q) :
    QuadraticPresentation R B := sorry

theorem QuadraticPresentation.ofExact_size (PA : QuadraticPresentation R A)
    (PC : QuadraticPresentation R C) {i : A →ₗ[R] B} {q : B →ₗ[R] C} (hi : Function.Injective i)
    (hq : Function.Surjective q) (hex : Function.Exact i q) :
    (PA.ofExact PC hi hq hex).size = PA.size + PC.size := sorry

/-- The determinant of the block upper-triangular matrix is `det ψ_A · det φ_C`. -/
theorem QuadraticPresentation.ofExact_det (PA : QuadraticPresentation R A)
    (PC : QuadraticPresentation R C) {i : A →ₗ[R] B} {q : B →ₗ[R] C} (hi : Function.Injective i)
    (hq : Function.Surjective q) (hex : Function.Exact i q) :
    (PA.ofExact PC hi hq hex).rel.det = PA.rel.det * PC.rel.det := sorry

/-- §6.6 (Dasgupta–Kakde Lemma 2.6, second assertion): an
extension of quadratically presented modules is quadratically presented (by
`QuadraticPresentation.ofExact`, of size `n + m` and determinant `det ψ_A · det φ_C`). -/
theorem isQuadraticallyPresented_of_exact {i : A →ₗ[R] B} {q : B →ₗ[R] C}
    (hi : Function.Injective i) (hq : Function.Surjective q) (hex : Function.Exact i q)
    (hA : IsQuadraticallyPresented R A) (hC : IsQuadraticallyPresented R C) :
    IsQuadraticallyPresented R B :=
  hA.elim fun PA => hC.elim fun PC => ⟨PA.ofExact PC hi hq hex⟩

/-- §6.6 (Dasgupta–Kakde Lemma 2.6, first assertion): for `0 → A → B → C → 0`
exact with `C` quadratically presented and `A` finitely presented (then `B` is finitely
presented, by `Module.finitePresentation_of_ker`), `Fitt(B) = Fitt(A) Fitt(C)`. -/
theorem fittingIdeal_eq_mul_of_exact [Module.FinitePresentation R A]
    [Module.FinitePresentation R B] [Module.FinitePresentation R C]
    {i : A →ₗ[R] B} {q : B →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q) (hC : IsQuadraticallyPresented R C) :
    TauCeti.fittingIdeal R B 0 = TauCeti.fittingIdeal R A 0 * TauCeti.fittingIdeal R C 0 := sorry

/-- §6.6 (Dasgupta–Kakde Lemma 2.7), with `A` and `A'` finitely
presented. -/
theorem fittingIdeal_mul_comm_of_exact [Module.FinitePresentation R A]
    [Module.FinitePresentation R B] [Module.FinitePresentation R A']
    [Module.FinitePresentation R B'] {i : A →ₗ[R] B} {q : B →ₗ[R] C} {i' : A' →ₗ[R] B'}
    {q' : B' →ₗ[R] C} (hi : Function.Injective i) (hq : Function.Surjective q)
    (hex : Function.Exact i q) (hi' : Function.Injective i') (hq' : Function.Surjective q')
    (hex' : Function.Exact i' q') (hB : IsQuadraticallyPresented R B)
    (hB' : IsQuadraticallyPresented R B') :
    TauCeti.fittingIdeal R A 0 * TauCeti.fittingIdeal R B' 0 =
      TauCeti.fittingIdeal R A' 0 * TauCeti.fittingIdeal R B 0 := sorry

/-- §6.3: over a principal ideal domain (possibly a field),
`#(D^m/AD^m) = #(D/(det A))` when `det A ≠ 0`. `Nat.card` is `0` for infinite quotients, so the
two quotients are finite together. -/
theorem natCard_quotient_range_toLin'_of_det_ne_zero {D : Type*} [CommRing D] [IsDomain D]
    [IsPrincipalIdealRing D] {m : ℕ} (A : Matrix (Fin m) (Fin m) D) (hA : A.det ≠ 0) :
    Nat.card ((Fin m → D) ⧸ LinearMap.range (Matrix.toLin' A)) =
      Nat.card (D ⧸ Ideal.span {A.det}) := sorry

/-- §6.3 (Dasgupta–Kakde (27), (28)): for a subring `B` of finite
additive index of `B'` and a square matrix `A` over `B` whose determinant is a non-zerodivisor
of `B'` (not only of `B`), `#(B^m/AB^m) = #(B'^m/AB'^m)`. -/
theorem natCard_quotient_range_toLin'_subring {B' : Type*} [CommRing B'] (B : Subring B')
    [B.toAddSubgroup.FiniteIndex] {m : ℕ} (A : Matrix (Fin m) (Fin m) B)
    (hA : ((A.det : B) : B') ∈ nonZeroDivisors B') :
    Nat.card ((Fin m → B) ⧸ LinearMap.range (Matrix.toLin' A)) =
      Nat.card ((Fin m → B') ⧸ LinearMap.range (Matrix.toLin' (A.map B.subtype))) := sorry

/-- §6.3: for an ideal `K` of `B` that is finite as a set and a
square matrix `A` over `B` whose determinant is a non-zerodivisor of `B`: (a) the projection
`B^m → (B/K)^m` induces a bijection between the cokernels of `A` over `B` and over `B/K`, so the
two are finite together and have the same cardinality; (b) the image of `det A` is a
non-zerodivisor of `B/K`. -/
theorem natCard_quotient_range_toLin'_quotient_of_finite {B : Type*} [CommRing B] (K : Ideal B)
    [Finite K] {m : ℕ} (A : Matrix (Fin m) (Fin m) B) (hA : A.det ∈ nonZeroDivisors B) :
    (∃ e : ((Fin m → B) ⧸ LinearMap.range (Matrix.toLin' A)) ≃+
        ((Fin m → B ⧸ K) ⧸ LinearMap.range (Matrix.toLin' (A.map (Ideal.Quotient.mk K)))),
      ∀ v : Fin m → B, e (Submodule.Quotient.mk v) =
        Submodule.Quotient.mk (fun i => Ideal.Quotient.mk K (v i))) ∧
    Nat.card ((Fin m → B) ⧸ LinearMap.range (Matrix.toLin' A)) =
        Nat.card ((Fin m → B ⧸ K) ⧸
          LinearMap.range (Matrix.toLin' (A.map (Ideal.Quotient.mk K)))) ∧
      Ideal.Quotient.mk K A.det ∈ nonZeroDivisors (B ⧸ K) := sorry

/-- §6.3: for a subring `B` of finite additive index of a
product of infinite domains and `x ∈ B`, the following are equivalent: `x` is a non-zerodivisor
of `B`; every component of `x` is nonzero; `x` is a non-zerodivisor of the product. -/
theorem mem_nonZeroDivisors_tfae_of_finiteIndex_pi {ι : Type*} {D : ι → Type*}
    [∀ i, CommRing (D i)] [∀ i, IsDomain (D i)] [∀ i, Infinite (D i)]
    (B : Subring (∀ i, D i)) [B.toAddSubgroup.FiniteIndex] (x : B) :
    List.TFAE [x ∈ nonZeroDivisors B, ∀ i, (x : ∀ i, D i) i ≠ 0,
      (x : ∀ i, D i) ∈ nonZeroDivisors (∀ i, D i)] := sorry

/-- §6.3 (Dasgupta–Kakde Lemma 2.4), in the source's generality: `B` a
subring of finite index of a finite product of principal ideal domains (fields allowed, no
hypothesis on the characteristic), `N` quadratically presented with `Fitt(N) = (x)`, `x` a
non-zerodivisor of `B` and `B/(x)` finite: `N` is finite and `#N = #(B/(x))`. -/
theorem QuadraticPresentation.card_eq {ι : Type*} [Fintype ι] {D : ι → Type*}
    [∀ i, CommRing (D i)] [∀ i, IsDomain (D i)] [∀ i, IsPrincipalIdealRing (D i)]
    (S : Subring (∀ i, D i)) [S.toAddSubgroup.FiniteIndex]
    {N : Type*} [AddCommGroup N] [Module S N] [Module.FinitePresentation S N]
    (P : QuadraticPresentation S N) (x : S) (hx : x ∈ nonZeroDivisors S)
    (hfitt : TauCeti.fittingIdeal S N 0 = Ideal.span {x}) (hfin : Finite (S ⧸ Ideal.span {x})) :
    Finite N ∧ Nat.card N = Nat.card (S ⧸ Ideal.span {x}) := sorry

end FittingExtension

end TauCeti

/-! ## Compound matrices and higher adjugates (§6.4) -/

section Compound

open Set.powersetCard

variable {R : Type*} [CommRing R]

namespace Matrix

/-- §6.4: the `r`-th compound matrix `C_r(A)`, whose `(S, T)` entry is the minor of
`A` on the rows `S` and columns `T` (both in increasing order). -/
def compound {ι κ : Type*} [LinearOrder ι] [LinearOrder κ] (A : Matrix ι κ R) (r : ℕ) :
    Matrix (Set.powersetCard ι r) (Set.powersetCard κ r) R :=
  fun S T => (A.submatrix (ofFinEmbEquiv.symm S) (ofFinEmbEquiv.symm T)).det

variable {ι κ ν : Type*} [LinearOrder ι] [LinearOrder κ] [LinearOrder ν]
  [Fintype ι] [Fintype κ] [Fintype ν] [DecidableEq κ] [DecidableEq ν]

/-- `C_r(A)` is the matrix of `⋀^r A` in the exterior-power bases of the standard bases. -/
theorem compound_eq_toMatrix (A : Matrix ι κ R) (r : ℕ) :
    LinearMap.toMatrix (Module.Basis.exteriorPower r (Pi.basisFun R κ))
      (Module.Basis.exteriorPower r (Pi.basisFun R ι)) (exteriorPower.map r (Matrix.toLin' A)) =
      A.compound r := sorry

/-- Cauchy–Binet: `C_r(AB) = C_r(A) C_r(B)`. -/
theorem compound_mul (A : Matrix ι κ R) (B : Matrix κ ν R) (r : ℕ) :
    (A * B).compound r = A.compound r * B.compound r := sorry

theorem compound_one [DecidableEq ι] (r : ℕ) : (1 : Matrix ι ι R).compound r = 1 := sorry

/-- `C_1(A)` is `A` under `ι ≃ powersetCard ι 1`. -/
@[simp] theorem compound_one_eq (A : Matrix ι κ R) (i : ι) (k : κ) :
    A.compound 1 (ofSingleton i) (ofSingleton k) = A i k := sorry

/-- For an order embedding `e : J → κ` and `A·e = A.submatrix id e`:
`C_r(A·e)_{S,T} = C_r(A)_{S,e(T)}`; that is, `C_r(A·e) = C_r(A) ∘ ι_e`, with `ι_e` the extension
by zero along `T ↦ e(T)`. -/
theorem compound_submatrix_col (A : Matrix ι κ R) {J : Type*} [LinearOrder J] (e : J ↪o κ)
    (r : ℕ) (S : Set.powersetCard ι r) (T : Set.powersetCard J r) :
    (A.submatrix id e).compound r S T = A.compound r S (Set.powersetCard.map r e.toEmbedding T) :=
  sorry

/-- For square `A` of size `m`, `C_m(A)` is the `1 × 1` matrix `(det A)`; the matrix form of the
pinned `exteriorPower.map_top_eq_det_smul`. -/
theorem compound_card {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (S T : Set.powersetCard (Fin m) m) :
    A.compound m S T = A.det := by
  have hS : (S : Finset (Fin m)) = Finset.univ :=
    Finset.eq_univ_of_card _ ((Set.powersetCard.card_eq S).trans (Fintype.card_fin m).symm)
  have hT : (T : Finset (Fin m)) = Finset.univ :=
    Finset.eq_univ_of_card _ ((Set.powersetCard.card_eq T).trans (Fintype.card_fin m).symm)
  have hST : S = T := Subtype.ext (hS.trans hT.symm)
  subst hST
  rw [← Matrix.compound_eq_toMatrix,
    exteriorPower.map_top_eq_det_smul (Pi.basisFun R (Fin m)) (Matrix.toLin' A),
    LinearMap.det_toLin', map_smul, LinearMap.toMatrix_id, Matrix.smul_apply, Matrix.one_apply_eq,
    smul_eq_mul, mul_one]

/-- `C_r(Aᵀ) = C_r(A)ᵀ`. -/
@[simp] theorem compound_transpose {ι κ : Type*} [LinearOrder ι] [LinearOrder κ]
    (A : Matrix ι κ R) (r : ℕ) : A.transpose.compound r = (A.compound r).transpose := by
  ext S T
  simp only [Matrix.compound, Matrix.transpose_apply]
  rw [← Matrix.det_transpose]
  rfl

/-- For increasing pairs `p 0 < p 1` of rows and `q 0 < q 1` of columns, the entry of `C_2(A)` is
the pinned `2 × 2` minor `Matrix.pairMinor`; for `r = 2`, `compound_mul` is its Cauchy–Binet
formula `Matrix.pairMinor_mul`. -/
theorem compound_two_eq_pairMinor {ι κ : Type*} [LinearOrder ι] [LinearOrder κ]
    (A : Matrix ι κ R) (p : Fin 2 ↪o ι) (q : Fin 2 ↪o κ) :
    A.compound 2 (ofFinEmbEquiv p) (ofFinEmbEquiv q) = A.pairMinor (p 0, p 1) (q 0, q 1) :=
  sorry

/-- §6.4: the `r`-th higher adjugate of a square matrix, with
`adj_r(A)_{T,S} = (-1)^{ΣS + ΣT} det A[Sᶜ, Tᶜ]`. -/
def higherAdjugate {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ) (hr : r ≤ m) :
    Matrix (Set.powersetCard (Fin m) r) (Set.powersetCard (Fin m) r) R :=
  fun T S => (-1) ^ (∑ i ∈ (S : Finset (Fin m)), (i : ℕ) + ∑ j ∈ (T : Finset (Fin m)), (j : ℕ)) *
    (A.submatrix (ofFinEmbEquiv.symm (compl (m := m - r) (by simp; omega) S))
      (ofFinEmbEquiv.symm (compl (m := m - r) (by simp; omega) T))).det

/-- §6.4: for an `r`-subset `T` of `Fin m`, the shuffle that sorts `T`
followed by `Tᶜ` (`Set.powersetCard.permOfDisjoint`) has sign `(-1)^{ΣT - r(r-1)/2}`, `ΣT` the
sum of the elements of `T` as natural numbers `0, …, m - 1` (so `ΣT ≥ r(r-1)/2`). -/
theorem _root_.Set.powersetCard.sign_permOfDisjoint_compl {m r : ℕ} (hr : r ≤ m)
    (T : Set.powersetCard (Fin m) r) :
    ((permOfDisjoint (s := T) (t := compl (m := m - r) (by simp; omega) T)
        (by simp [Finset.disjoint_left]) : Equiv.Perm (Fin (r + (m - r)))).sign : ℤ) =
      (-1) ^ (∑ j ∈ (T : Finset (Fin m)), (j : ℕ) - r * (r - 1) / 2) := sorry

/-- §6.4: for `r`-subsets `S, S'` of `Fin m`,
`Σ_T (-1)^{ΣS' + ΣT} det A[S, T] det A[S'ᶜ, Tᶜ]` is `det A` if `S' = S` and `0` if `S' ≠ S`, the
sum over the `r`-subsets `T`. -/
theorem sum_compound_mul_compound_compl {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ)
    (hr : r ≤ m) (S S' : Set.powersetCard (Fin m) r) :
    ∑ T : Set.powersetCard (Fin m) r,
      (-1) ^ (∑ i ∈ (S' : Finset (Fin m)), (i : ℕ) + ∑ j ∈ (T : Finset (Fin m)), (j : ℕ)) *
        (A.compound r S T * A.compound (m - r) (compl (m := m - r) (by simp; omega) S')
          (compl (m := m - r) (by simp; omega) T)) = if S = S' then A.det else 0 := sorry

/-- Generalised Laplace expansion along the rows `S`, the case `S' = S` of
`Matrix.sum_compound_mul_compound_compl`:
`det A = Σ_T (-1)^{ΣS + ΣT} det A[S, T] det A[Sᶜ, Tᶜ]`, the sum over the `r`-subsets `T`. -/
theorem det_eq_sum_compound_mul_compound_compl {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ)
    (hr : r ≤ m) (S : Set.powersetCard (Fin m) r) :
    A.det = ∑ T : Set.powersetCard (Fin m) r,
      (-1) ^ (∑ i ∈ (S : Finset (Fin m)), (i : ℕ) + ∑ j ∈ (T : Finset (Fin m)), (j : ℕ)) *
        (A.compound r S T * A.compound (m - r) (compl (m := m - r) (by simp; omega) S)
          (compl (m := m - r) (by simp; omega) T)) := by
  rw [sum_compound_mul_compound_compl A r hr S S, ite_eq_left rfl]

/-- The case `S' ≠ S` of `Matrix.sum_compound_mul_compound_compl`: for `r`-subsets `S ≠ S'`,
`Σ_T (-1)^{ΣS' + ΣT} det A[S, T] det A[S'ᶜ, Tᶜ] = 0` (the expansion of a determinant with a
repeated row). -/
theorem sum_compound_mul_compound_compl_eq_zero {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ)
    (hr : r ≤ m) {S S' : Set.powersetCard (Fin m) r} (h : S ≠ S') :
    ∑ T : Set.powersetCard (Fin m) r,
      (-1) ^ (∑ i ∈ (S' : Finset (Fin m)), (i : ℕ) + ∑ j ∈ (T : Finset (Fin m)), (j : ℕ)) *
        (A.compound r S T * A.compound (m - r) (compl (m := m - r) (by simp; omega) S')
          (compl (m := m - r) (by simp; omega) T)) = 0 := by
  rw [sum_compound_mul_compound_compl A r hr S S', ite_eq_right h]

/-- The right-sided identity used for Lemma 3.9: `C_r(A) adj_r(A) = det(A) I`. -/
theorem compound_mul_higherAdjugate {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ) (hr : r ≤ m) :
    A.compound r * A.higherAdjugate r hr = A.det • (1 : Matrix _ _ R) := sorry

/-- The left-sided identity: `adj_r(A) C_r(A) = det(A) I`. -/
theorem higherAdjugate_mul_compound {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ)
    (hr : r ≤ m) : A.higherAdjugate r hr * A.compound r = A.det • (1 : Matrix _ _ R) := sorry

/-- `adj_1` is the adjugate. -/
theorem higherAdjugate_one_eq {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (hm : 1 ≤ m) (i j : Fin m) :
    A.higherAdjugate 1 hm (ofSingleton j) (ofSingleton i) = A.adjugate j i := sorry

/-- `adj_m(A) = (1)`. -/
theorem higherAdjugate_self {m : ℕ} (A : Matrix (Fin m) (Fin m) R)
    (S T : Set.powersetCard (Fin m) m) : A.higherAdjugate m le_rfl T S = 1 := sorry

/-- `adj_r(Aᵀ) = adj_r(A)ᵀ`. -/
theorem higherAdjugate_transpose {m : ℕ} (A : Matrix (Fin m) (Fin m) R) (r : ℕ) (hr : r ≤ m) :
    A.transpose.higherAdjugate r hr = (A.higherAdjugate r hr).transpose := sorry

/-- `adj_0(A) = (det A)`, the `1 × 1` matrix indexed by the empty subset. -/
theorem higherAdjugate_zero {m : ℕ} (A : Matrix (Fin m) (Fin m) R)
    (S T : Set.powersetCard (Fin m) 0) : A.higherAdjugate 0 (Nat.zero_le m) T S = A.det := sorry

/-- §6.4: for an `m × n` matrix `A` and the `m × m` submatrix `A_J`
on the columns `J = e(Fin m)`, `det(A_J) x = C_r(A)(ι_J(adj_r(A_J) x))` for every `x`, where
`ι_J` extends a vector indexed by the `r`-subsets of `Fin m` by zero along `T ↦ e(T)`; hence
`det(A_J) x` lies in the image of `C_r(A)`. -/
theorem det_smul_mem_range_compound {m n : ℕ} (A : Matrix (Fin m) (Fin n) R)
    (e : Fin m ↪o Fin n) (r : ℕ) (hr : r ≤ m) (x : Set.powersetCard (Fin m) r → R) :
    (A.submatrix id e).det • x =
        Matrix.toLin' (A.compound r)
          (Function.extend (Set.powersetCard.map r e.toEmbedding)
            (Matrix.toLin' ((A.submatrix id e).higherAdjugate r hr) x) 0) ∧
      (A.submatrix id e).det • x ∈ LinearMap.range (Matrix.toLin' (A.compound r)) := sorry

end Matrix

-- test compound_one_by_one (degenerate) [§6.4]
example (A : Matrix (Fin 2) (Fin 3) R) (i : Fin 2) (k : Fin 3) :
    A.compound 1 (Set.powersetCard.ofSingleton i) (Set.powersetCard.ofSingleton k) = A i k :=
  Matrix.compound_one_eq A i k

-- test compound_two_by_two (computation) [§6.4]
example (a b c d : R) (S T : Set.powersetCard (Fin 2) 2) :
    (!![a, b; c, d] : Matrix (Fin 2) (Fin 2) R).compound 2 S T = a * d - b * c := sorry

-- test compound_too_large (degenerate) [§6.4]
example (A : Matrix (Fin 2) (Fin 3) R) : IsEmpty (Set.powersetCard (Fin 2) 3) := sorry

-- test compound_two_pairMinor (compatibility) [§6.4]
example (A : Matrix (Fin 3) (Fin 3) R) (S T : Set.powersetCard (Fin 3) 2)
    (hS : (S : Finset (Fin 3)) = {0, 1}) (hT : (T : Finset (Fin 3)) = {1, 2}) :
    A.compound 2 S T = A.pairMinor (0, 1) (1, 2) ∧
      A.pairMinor (0, 1) (1, 2) = A 0 1 * A 1 2 - A 0 2 * A 1 1 := sorry

-- test compound_not_additive (non-example) [§6.4]
example : ((1 : Matrix (Fin 2) (Fin 2) ℤ) + 1).compound 2 ≠
    (1 : Matrix (Fin 2) (Fin 2) ℤ).compound 2 + (1 : Matrix (Fin 2) (Fin 2) ℤ).compound 2 := sorry

-- test higherAdjugate_one (compatibility) [§6.4]
example (A : Matrix (Fin 3) (Fin 3) R) (i j : Fin 3) :
    A.higherAdjugate 1 (by omega) (Set.powersetCard.ofSingleton j)
      (Set.powersetCard.ofSingleton i) = A.adjugate j i := A.higherAdjugate_one_eq (by omega) i j

-- test higherAdjugate_top (degenerate) [§6.4]
example (A : Matrix (Fin 3) (Fin 3) R) (S T : Set.powersetCard (Fin 3) 3) :
    A.higherAdjugate 3 le_rfl T S = 1 := A.higherAdjugate_self S T

-- test higherAdjugate_identity (computation) [§6.4]
example (r : ℕ) (hr : r ≤ 3) :
    (1 : Matrix (Fin 3) (Fin 3) R).higherAdjugate r hr = 1 := sorry

-- test higherAdjugate_not_compound (non-example) [§6.4]
example : (Matrix.diagonal ![2, 1, 1] : Matrix (Fin 3) (Fin 3) ℤ).higherAdjugate 1 (by omega) ≠
    (Matrix.diagonal ![2, 1, 1] : Matrix (Fin 3) (Fin 3) ℤ).compound 1 := sorry

/- Next test: for a `3 × 3` matrix `A` (indices 0, 1, 2), `adj_2(A)_{{0,1},{0,2}} = -A_{12}` and
`adj_2(A)_{{0,1},{1,2}} = A_{02}` (row index `T` first, as in `higherAdjugate`); for
`A = (1 2 3; 4 5 6; 7 8 10)` these are `-6` and `3`. -/
-- test higherAdjugate_two_of_three (computation) [§6.4]
example (A : Matrix (Fin 3) (Fin 3) R) (S S' T : Set.powersetCard (Fin 3) 2)
    (hT : (T : Finset (Fin 3)) = {0, 1}) (hS : (S : Finset (Fin 3)) = {0, 2})
    (hS' : (S' : Finset (Fin 3)) = {1, 2}) :
    A.higherAdjugate 2 (by omega) T S = -A 1 2 ∧ A.higherAdjugate 2 (by omega) T S' = A 0 2 :=
  sorry

end Compound

namespace TauCeti

/-! ## Fitting ideals annihilate exterior-power cokernels (§6.7) -/

section ExteriorCokernel

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- §6.7 (Dasgupta–Kakde Lemma 3.9, proof corrected by
`PadicMeasuresIwasawaAlgebras/E17`): for `N ⊆ M` with `N` finitely generated and `M` finitely
presented, `Fitt(M/N)` annihilates the cokernel of `⋀^r N → ⋀^r M` for every `r ≥ 1`. The
quotient `M/N` is finitely presented (`Module.finitePresentation_of_surjective`); that instance
is an argument because `TauCeti.fittingIdeal` needs it to be stated. The free case is
`Matrix.det_smul_mem_range_compound`. -/
theorem fittingIdeal_le_annihilator_exteriorPower_cokernel (N : Submodule R M)
    [Module.FinitePresentation R M] [Module.Finite R N] [Module.FinitePresentation R (M ⧸ N)]
    (r : ℕ) (hr : 1 ≤ r) :
    TauCeti.fittingIdeal R (M ⧸ N) 0 ≤
      Module.annihilator R (↥(⋀[R]^r M) ⧸ LinearMap.range (exteriorPower.map r N.subtype)) :=
  sorry

end ExteriorCokernel

/-! ## The presentation transpose and its Fitting ideals (§6.2) -/

section Transpose

variable {R S M P₀ P₁ : Type*} [CommRing R] [CommRing S] [AddCommGroup M] [Module R M]
  [AddCommGroup P₀] [Module R P₀] [AddCommGroup P₁] [Module R P₁]

/-- §6.2: the transpose `coker(f^* : P₀^* → P₁^*)` of a presentation
`P₁ →f P₀ → M → 0`, as an `S`-module along `σ : S ≃+* R` (for `R = R_Ψ`, `S = R^#`, `σ = #`).
The carrier is the pinned `TauCeti.AuslanderReitenTranspose f`. -/
def PresentationTranspose (_σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) : Type _ :=
  AuslanderReitenTranspose f

namespace PresentationTranspose

variable (σ : S ≃+* R) (f : P₁ →ₗ[R] P₀)

instance : AddCommGroup (PresentationTranspose σ f) :=
  inferInstanceAs (AddCommGroup (AuslanderReitenTranspose f))

instance : Module S (PresentationTranspose σ f) :=
  Module.compHom (AuslanderReitenTranspose f)
    ((RingEquiv.toOpposite R).toRingHom.comp σ.toRingHom)

/-- The underlying additive group is the Auslander–Reiten transpose. -/
def toARTranspose : PresentationTranspose σ f ≃+ AuslanderReitenTranspose f := AddEquiv.refl _

/-- The quotient map from `P₁^*`: the pinned `AuslanderReitenTranspose.mk f` on the underlying
functional, which is `S`-linear for the contragredient structures. -/
def mk : ContragredientDual σ P₁ →ₗ[S] PresentationTranspose σ f where
  toFun φ :=
    (toARTranspose σ f).symm (AuslanderReitenTranspose.mk f (ContragredientDual.toDual σ φ))
  map_add' φ ψ := by rw [map_add, map_add, map_add]
  map_smul' s φ := by
    have h : ContragredientDual.toDual σ (s • φ) =
        MulOpposite.op (σ s) • ContragredientDual.toDual σ φ := by
      ext x
      rw [ContragredientDual.smul_apply, map_smul, LinearMap.smul_apply, op_smul_eq_mul,
        smul_eq_mul, mul_comm]
    change AuslanderReitenTranspose.mk f (ContragredientDual.toDual σ (s • φ)) =
      MulOpposite.op (σ s) • AuslanderReitenTranspose.mk f (ContragredientDual.toDual σ φ)
    rw [h, map_smul]

@[simp] theorem toARTranspose_mk (φ : ContragredientDual σ P₁) :
    toARTranspose σ f (mk σ f φ) =
      AuslanderReitenTranspose.mk f (ContragredientDual.toDual σ φ) := rfl

theorem mk_eq_zero_iff (φ : Module.Dual R P₁) :
    mk σ f ((ContragredientDual.toDual σ).symm φ) = 0 ↔
      φ ∈ LinearMap.range (f.lcomp Rᵐᵒᵖ R) :=
  AuslanderReitenTranspose.mk_eq_zero_iff f φ

/-- The quotient map is surjective: the pinned `AuslanderReitenTranspose.mk_surjective`. -/
theorem mk_surjective : Function.Surjective (mk σ f) :=
  AuslanderReitenTranspose.mk_surjective f

/-- `S` acts through `σ` on the pinned `R`-module structure of `AuslanderReitenTranspose f`
(equivalently through `op (σ s)` for its `Rᵐᵒᵖ`-module structure). -/
theorem toARTranspose_smul (s : S) (x : PresentationTranspose σ f) :
    toARTranspose σ f (s • x) = σ s • toARTranspose σ f x :=
  AuslanderReitenTranspose.op_algebraMap_smul f R (σ s) (toARTranspose σ f x)

/-- Universal property of the transpose over `S`: an `S`-linear map `g : P₁^* → N` with
`g(φ ∘ f) = 0` for every `φ ∈ P₀^*` factors through `mk`, uniquely because `mk` is surjective
(the pinned `AuslanderReitenTranspose.lift`, `lift_mk`, `hom_ext`). -/
def lift {N : Type*} [AddCommGroup N] [Module S N] (g : ContragredientDual σ P₁ →ₗ[S] N)
    (hg : ∀ φ : Module.Dual R P₀, g ((ContragredientDual.toDual σ).symm (φ ∘ₗ f)) = 0) :
    PresentationTranspose σ f →ₗ[S] N := sorry

@[simp] theorem lift_mk {N : Type*} [AddCommGroup N] [Module S N]
    (g : ContragredientDual σ P₁ →ₗ[S] N)
    (hg : ∀ φ : Module.Dual R P₀, g ((ContragredientDual.toDual σ).symm (φ ∘ₗ f)) = 0)
    (φ : ContragredientDual σ P₁) : lift σ f g hg (mk σ f φ) = g φ := sorry

/-- Isomorphic presentations have isomorphic transposes: the pinned
`AuslanderReitenTranspose.linearEquiv`, which is `S`-linear for the structures along `σ`. -/
def equivOfIso {Q₀ Q₁ : Type*} [AddCommGroup Q₀] [Module R Q₀] [AddCommGroup Q₁] [Module R Q₁]
    {g : Q₁ →ₗ[R] Q₀} (e₀ : P₀ ≃ₗ[R] Q₀) (e₁ : P₁ ≃ₗ[R] Q₁)
    (hsq : e₀.toLinearMap ∘ₗ f = g ∘ₗ e₁.toLinearMap) :
    PresentationTranspose σ f ≃ₗ[S] PresentationTranspose σ g :=
  { (AuslanderReitenTranspose.linearEquiv e₀ e₁ hsq).toAddEquiv with
    map_smul' := fun s x =>
      (AuslanderReitenTranspose.linearEquiv e₀ e₁ hsq).map_smul (MulOpposite.op (σ s)) x }

/-- Adding an identity summand `Q →id Q` does not change the transpose. -/
def equivAddId (Q : Type*) [AddCommGroup Q] [Module R Q] :
    PresentationTranspose σ (f.prodMap (LinearMap.id : Q →ₗ[R] Q)) ≃ₗ[S]
      PresentationTranspose σ f := sorry

/-- Adding a summand `Q → 0` to the relations adds `Q^*` to the transpose. -/
def equivAddZero (Q : Type*) [AddCommGroup Q] [Module R Q] :
    PresentationTranspose σ (f.coprod (0 : Q →ₗ[R] P₀)) ≃ₗ[S]
      PresentationTranspose σ f × ContragredientDual σ Q := sorry

/-- Base change: for `P₁`, `P₀` finitely generated projective, ring maps `R → R'`, `S → S'` and
a ring isomorphism `σ' : S' ≃ R'` compatible with `σ`, `S' ⊗_S tr_σ(f) ≅ tr_{σ'}(f ⊗_R R')`. -/
def baseChangeEquiv (R' S' : Type*) [CommRing R'] [CommRing S'] [Algebra R R'] [Algebra S S']
    (σ' : S' ≃+* R') (hσ : ∀ s : S, σ' (algebraMap S S' s) = algebraMap R R' (σ s))
    [Module.Finite R P₀] [Module.Projective R P₀] [Module.Finite R P₁] [Module.Projective R P₁] :
    TensorProduct S S' (PresentationTranspose σ f) ≃ₗ[S']
      PresentationTranspose σ' (f.baseChange R') := sorry

/-- For a square matrix presentation, the transpose is the cokernel of the `#`-transposed
matrix over `S`. -/
def quadraticPresentation (P : QuadraticPresentation R M) :
    QuadraticPresentation S (PresentationTranspose σ (Matrix.toLin' P.rel)) := sorry

@[simp] theorem quadraticPresentation_size (P : QuadraticPresentation R M) :
    (quadraticPresentation σ P).size = P.size := sorry

/-- The relation matrix of the transpose is `(a_ji^#)`. -/
theorem quadraticPresentation_rel (P : QuadraticPresentation R M) :
    (quadraticPresentation σ P).rel = (Matrix.transpose (P.rel.map σ.symm)).submatrix
      (Fin.cast (quadraticPresentation_size σ P)) (Fin.cast (quadraticPresentation_size σ P)) :=
  sorry

end PresentationTranspose

/- That transposes are unique up to projective summands is Tau Ceti's
`TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual`
(`TauCeti.Algebra.Module.AuslanderReiten.StableTranspose`), for any ring and any two projective
presentations; restricting scalars along `σ` is all that remains and it is not restated. -/

/-- §6.2 (Dasgupta–Kakde Lemma 6.1): for the transpose attached to a quadratic
presentation, which is quadratically presented over `S = R^#` by
`PresentationTranspose.quadraticPresentation`, `Fitt_S(M^tr) = σ⁻¹(Fitt_R(M))`. -/
theorem PresentationTranspose.fittingIdeal_eq (σ : S ≃+* R) (P : QuadraticPresentation R M)
    [Module.FinitePresentation R M]
    [Module.FinitePresentation S (PresentationTranspose σ (Matrix.toLin' P.rel))] :
    TauCeti.fittingIdeal S (PresentationTranspose σ (Matrix.toLin' P.rel)) 0 =
      Ideal.map σ.symm (TauCeti.fittingIdeal R M 0) := sorry

/-- §6.2: for a free presentation `R^t →A R^{t+s} → M → 0`
(`t` relations, `t + s` generators), `Fitt⁰_S(M^tr) = σ⁻¹(Fitt^s_R(M))`; both are generated by
the `t × t` minors of `A`, resp. of `(σ⁻¹(a_ji))`. -/
theorem PresentationTranspose.fittingIdeal_eq_excess (σ : S ≃+* R) {t s : ℕ}
    (A : Matrix (Fin (t + s)) (Fin t) R) (π : (Fin (t + s) → R) →ₗ[R] M)
    (hπ : Function.Surjective π) (hA : LinearMap.range (Matrix.toLin' A) = LinearMap.ker π)
    [Module.FinitePresentation R M]
    [Module.FinitePresentation S (PresentationTranspose σ (Matrix.toLin' A))] :
    TauCeti.fittingIdeal S (PresentationTranspose σ (Matrix.toLin' A)) 0 =
      Ideal.map σ.symm (TauCeti.fittingIdeal R M s) := sorry

/-- §6.2 (Dasgupta–Kakde (171)): for a presentation
`P₁ →f P₀ → M → 0` by finitely generated projective modules of constant ranks `t` and `t + s`,
`Fitt⁰_S(M^tr) = σ⁻¹(Fitt^s_R(M))`, by localisation from the free case. -/
theorem PresentationTranspose.fittingIdeal_eq_excess_of_projective (σ : S ≃+* R) {t s : ℕ}
    [Module.Finite R P₀] [Module.Projective R P₀] [Module.Finite R P₁] [Module.Projective R P₁]
    (f : P₁ →ₗ[R] P₀) (π : P₀ →ₗ[R] M) (hπ : Function.Surjective π)
    (hf : LinearMap.range f = LinearMap.ker π)
    (h₁ : ∀ 𝔭 : PrimeSpectrum R, Module.rankAtStalk P₁ 𝔭 = t)
    (h₀ : ∀ 𝔭 : PrimeSpectrum R, Module.rankAtStalk P₀ 𝔭 = t + s)
    [Module.FinitePresentation R M] [Module.FinitePresentation S (PresentationTranspose σ f)] :
    TauCeti.fittingIdeal S (PresentationTranspose σ f) 0 =
      Ideal.map σ.symm (TauCeti.fittingIdeal R M s) := sorry

-- test transpose_iso_presentation (degenerate) [§6.2]
example (σ : S ≃+* R) : Subsingleton
    (PresentationTranspose σ (LinearMap.id : (Fin 1 → R) →ₗ[R] (Fin 1 → R))) :=
  AuslanderReitenTranspose.subsingleton_of_comp_eq_id (r := LinearMap.id) _ (by simp)

-- test transpose_depends_on_presentation (non-example) [§6.2]
example [Nontrivial R] (σ : S ≃+* R) :
    Nonempty (PresentationTranspose σ (LinearMap.fst R R R) ≃ₗ[S] S) ∧
      ¬ Subsingleton (PresentationTranspose σ (LinearMap.fst R R R)) := sorry

-- test transpose_cyclic (computation) [§6.2]
example (σ : S ≃+* R) (a : R) :
    Nonempty (PresentationTranspose σ (Matrix.toLin' (!![a] : Matrix (Fin 1) (Fin 1) R)) ≃ₗ[S]
      S ⧸ Ideal.span {σ.symm a}) := sorry

-- test transpose_reuses_AR (compatibility) [§6.2]
example (σ : S ≃+* R) (f : P₁ →ₗ[R] P₀) (φ : Module.Dual R P₁) (s : S) :
    PresentationTranspose.toARTranspose σ f
        (PresentationTranspose.mk σ f ((ContragredientDual.toDual σ).symm φ)) =
      AuslanderReitenTranspose.mk f φ ∧
    ∀ x : PresentationTranspose σ f, PresentationTranspose.toARTranspose σ f (s • x) =
      σ s • PresentationTranspose.toARTranspose σ f x :=
  ⟨rfl, fun x => PresentationTranspose.toARTranspose_smul σ f s x⟩

end Transpose

end TauCeti

end

end L6

/-! ### §4.6, stated after the imported Fitting carrier -/
namespace TauCeti.Iwasawa
section FittingControl
variable (p : ℕ) [Fact p.Prime]

/-- §4.6: for `Λ = ℤ_p⟦T⟧`, the finite module `Λ/(p, T)` has
unit characteristic ideal, whereas its initial Fitting ideal (the imported carrier) is `(p, T)`. -/
theorem characteristic_finite_fitting_control :
    let I : Ideal (PowerSeries (PadicInt p)) :=
      Ideal.span {PowerSeries.C (p : PadicInt p), PowerSeries.X}
    haveI : Module.FinitePresentation (PowerSeries (PadicInt p))
      (PowerSeries (PadicInt p) ⧸ I) := by sorry
    charIdeal (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p) ⧸ I) (by sorry) = ⊤ ∧
      TauCeti.fittingIdeal (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p) ⧸ I) 0 = I :=
  sorry

namespace L4Tests
-- test L4Tests.finite_vs_fitting (degenerate) [§4.6]
example : let I : Ideal (PowerSeries (PadicInt p)) :=
      Ideal.span {PowerSeries.C (p : PadicInt p), PowerSeries.X}
    haveI : Module.FinitePresentation (PowerSeries (PadicInt p))
      (PowerSeries (PadicInt p) ⧸ I) := by sorry
    charIdeal (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p) ⧸ I) (by sorry) = ⊤ ∧
      TauCeti.fittingIdeal (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p) ⧸ I) 0 ≠
        charIdeal (PowerSeries (PadicInt p)) (PowerSeries (PadicInt p) ⧸ I) (by sorry) := sorry
end L4Tests

end FittingControl
end TauCeti.Iwasawa

/-! ### §4.5: `O⟦T⟧ ≅ lim_n O[ℤ/pⁿ]` for a complete noetherian local `O` -/
noncomputable section
namespace TauCeti.Iwasawa
section Coordinate
variable (p : ℕ) [Fact p.Prime] (O : Type*) [CommRing O]
/- NSW (5.3.5) takes `O` to be the integers of a finite extension of `ℚ_p`. The level maps need
`p` in the Jacobson radical and `p`-adic completeness: for `O = ℚ` one has `(ω_n) = (T)` and no
ring map `O⟦T⟧ → O[ℤ/pⁿ]` sends `T` to `[1] − 1`. A local noetherian ring complete for its
maximal ideal with residue characteristic `p` covers the source's case and ℤ_p-algebras such as
`ℤ_p⟦X⟧`; the same hypotheses give the injectivity and the image description below. -/
variable [IsLocalRing O] [IsNoetherianRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
  [CharP (IsLocalRing.ResidueField O) p]

/-- §4.5, level `n`: `O⟦T⟧ → O[ℤ/pⁿ]`, `T ↦ [1] − 1`. -/
def levelCoordinate (n : ℕ) :
    PowerSeries O →+* MonoidAlgebra O (Multiplicative (ZMod (p ^ n))) := sorry
theorem levelCoordinate_X (n : ℕ) :
    levelCoordinate p O n PowerSeries.X =
      MonoidAlgebra.single (Multiplicative.ofAdd (1 : ZMod (p ^ n))) 1 - 1 := sorry
theorem levelCoordinate_surjective (n : ℕ) : Function.Surjective (levelCoordinate p O n) := sorry
theorem ker_levelCoordinate (n : ℕ) :
    RingHom.ker (levelCoordinate p O n) =
      Ideal.span {(1 + PowerSeries.X : PowerSeries O) ^ (p ^ n) - 1} := sorry

/-- The transition map `ℤ/pⁿ → ℤ/pᵐ` for `m ≤ n`, written multiplicatively. -/
def transition {m n : ℕ} (h : m ≤ n) :
    Multiplicative (ZMod (p ^ n)) →* Multiplicative (ZMod (p ^ m)) :=
  AddMonoidHom.toMultiplicative (ZMod.castHom (pow_dvd_pow p h) (ZMod (p ^ m))).toAddMonoidHom
theorem levelCoordinate_transition {m n : ℕ} (h : m ≤ n) (F : PowerSeries O) :
    MonoidAlgebra.mapDomainRingHom O (transition p h) (levelCoordinate p O n F) =
      levelCoordinate p O m F := sorry

/-- §4.5: `O⟦T⟧ → lim_n O[ℤ/pⁿ]`, the coordinate `γ ↦ 1 + T`. -/
def iwasawaCoordinate : PowerSeries O →+* ∀ n, MonoidAlgebra O (Multiplicative (ZMod (p ^ n))) :=
  sorry
theorem iwasawaCoordinate_apply (F : PowerSeries O) (n : ℕ) :
    iwasawaCoordinate p O F n = levelCoordinate p O n F := sorry

-- test coordinate_level_zero (degenerate) [§4.5]
example (F : PowerSeries O) :
    levelCoordinate p O 0 F = MonoidAlgebra.single 1 (PowerSeries.constantCoeff F) := sorry
-- test coordinate_group_element (computation) [§4.5]
example (n k : ℕ) :
    levelCoordinate p O n ((1 + PowerSeries.X) ^ k) =
      MonoidAlgebra.single (Multiplicative.ofAdd (k : ZMod (p ^ n))) 1 := sorry
-- test coordinate_omega_not_power_of_T (non-example) [§4.5]
example (n : ℕ) :
    levelCoordinate p O n ((1 + PowerSeries.X) ^ (p ^ n) - 1) = 0 ∧
      levelCoordinate p O (n + 1) ((1 + PowerSeries.X) ^ (p ^ n) - 1) ≠ 0 ∧
      levelCoordinate p O (n + 1) (PowerSeries.X ^ (p ^ n)) ≠ 0 := sorry


theorem iwasawaCoordinate_injective : Function.Injective (iwasawaCoordinate p O) := sorry
theorem range_iwasawaCoordinate :
    Set.range (iwasawaCoordinate p O) =
      {c | ∀ {m n : ℕ} (h : m ≤ n),
        MonoidAlgebra.mapDomainRingHom O (transition p h) (c n) = c m} := sorry
theorem iInf_span_cyclotomic_eq_bot :
    ⨅ n : ℕ, Ideal.span {(1 + PowerSeries.X : PowerSeries O) ^ (p ^ n) - 1} = ⊥ := sorry
end Coordinate
end TauCeti.Iwasawa
end

/-! ## §3a.1: the universal character of `ℤ_p` and its evaluation

The universal character `κ : ℤ_p → (ℤ_p⟦X⟧)ˣ`, `a ↦ (1 + X)^a = binomialSeries ℤ_p a`, and its
universal property in the adic case through Mathlib's topological evaluation `PowerSeries.aeval`
(a linearly topologized complete Hausdorff `ℤ_p`-algebra `S` and a topologically nilpotent `z`,
`PowerSeries.HasEval z`). The normed case (a complete normed `ℚ_p`-algebra, whose topology is not
linear, with `‖z‖ < 1`) is stated in the README with its own convergent-sum evaluation and is not
typed here. -/
namespace TauCetiRoadmap.PadicMeasuresIwasawaAlgebras.UniversalCharacter
noncomputable section
open PowerSeries

variable (p : ℕ) [Fact p.Prime]

/-- §3a.1: `κ(a) = (1 + X)^a`, the binomial series with coefficients
`binom(a, n)`, a unit with inverse `(1 + X)^{-a}` (`binomialSeries_add`). -/
def universalCharacter : Multiplicative ℤ_[p] →* (ℤ_[p]⟦X⟧)ˣ where
  toFun a := ⟨binomialSeries ℤ_[p] (Multiplicative.toAdd a),
    binomialSeries ℤ_[p] (-Multiplicative.toAdd a), by sorry, by sorry⟩
  map_one' := by sorry
  map_mul' := by sorry

theorem universalCharacter_apply_coe (a : Multiplicative ℤ_[p]) :
    (universalCharacter p a : ℤ_[p]⟦X⟧) = binomialSeries ℤ_[p] (Multiplicative.toAdd a) := sorry
theorem universalCharacter_natCast (n : ℕ) :
    (universalCharacter p (Multiplicative.ofAdd (n : ℤ_[p])) : ℤ_[p]⟦X⟧) = (1 + X) ^ n := sorry
theorem universalCharacter_one :
    (universalCharacter p (Multiplicative.ofAdd (1 : ℤ_[p])) : ℤ_[p]⟦X⟧) = 1 + X := sorry

section Adic
variable {S : Type*} [CommRing S] [UniformSpace S] [IsUniformAddGroup S] [IsTopologicalRing S]
  [IsLinearTopology S S] [CompleteSpace S] [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]

/-- The character `a ↦ (1 + z)^a` of `ℤ_p` attached to a topologically nilpotent `z`: the composite
of `κ` with `PowerSeries.aeval z`. -/
def characterOfHasEval {z : S} (hz : HasEval z) : Multiplicative ℤ_[p] →* Sˣ :=
  (Units.map (aeval (R := ℤ_[p]) hz).toMonoidHom).comp (universalCharacter p)

theorem characterOfHasEval_apply_coe {z : S} (hz : HasEval z) (a : Multiplicative ℤ_[p]) :
    (characterOfHasEval p hz a : S) = aeval hz (universalCharacter p a : ℤ_[p]⟦X⟧) := sorry

/-- Universal property, adic case: a character `χ` of `ℤ_p` with values in `Sˣ`, continuous as a
map into `S`, with `χ(1) − 1` topologically nilpotent, is the character attached to `χ(1) − 1`;
with `PowerSeries.aeval_unique` (uniqueness of the continuous `ℤ_p`-algebra map `X ↦ z`) this is
the bijection between such characters and topologically nilpotent elements. -/
theorem characterOfHasEval_eq (χ : Multiplicative ℤ_[p] →* Sˣ)
    (hχ : Continuous fun a => (χ a : S))
    (hz : HasEval ((χ (Multiplicative.ofAdd (1 : ℤ_[p])) : S) - 1)) :
    χ = characterOfHasEval p hz := sorry

/-- The character attached to `z` is continuous. -/
theorem continuous_characterOfHasEval {z : S} (hz : HasEval z) :
    Continuous fun a => (characterOfHasEval p hz a : S) := sorry

end Adic

-- test universalCharacter_nat (computation) [§3a.1]
example (n : ℕ) : coeff 1 (universalCharacter p (Multiplicative.ofAdd (n : ℤ_[p])) : ℤ_[p]⟦X⟧) = n :=
  sorry
-- test universalCharacter_neg_one (computation) [§3a.1]
-- `κ(−1) = (1 + X)⁻¹ = Σ (−X)^k`, not `1 − X`.
example : (universalCharacter p (Multiplicative.ofAdd (-1 : ℤ_[p])) : ℤ_[p]⟦X⟧) =
      PowerSeries.mk (fun k => (-1) ^ k) ∧
    (universalCharacter p (Multiplicative.ofAdd (-1 : ℤ_[p])) : ℤ_[p]⟦X⟧) ≠ 1 - X := sorry
-- test universalCharacter_trivial (degenerate) [§3a.1]
-- `z = 0` gives the trivial character, `aeval 0` being the constant coefficient.
example [IsLinearTopology ℤ_[p] ℤ_[p]] (a : Multiplicative ℤ_[p]) :
    (characterOfHasEval p (S := ℤ_[p]) HasEval.zero a : ℤ_[p]) = 1 := sorry
-- test universalCharacter_one_add_p (computation) [§3a.1]
-- `z = p` gives `1 ↦ 1 + p` and `n ↦ (1 + p)^n`.
example [IsLinearTopology ℤ_[p] ℤ_[p]] (hp : HasEval (p : ℤ_[p])) (n : ℕ) :
    (characterOfHasEval p hp (Multiplicative.ofAdd (n : ℤ_[p])) : ℤ_[p]) = (1 + p) ^ n := sorry
-- test universalCharacter_not_topologically_nilpotent (non-example) [§3a.1]
-- `p − 1` is not topologically nilpotent in `ℚ_p` (its powers have norm `1`), so the hypothesis on
-- `χ(1) − 1` is not redundant; `p` is, but `ℚ_p` is not linearly topologized, which is why the
-- normed case is stated separately in the README.
example : ¬ HasEval ((p : ℚ_[p]) - 1) ∧ HasEval (p : ℚ_[p]) ∧ ¬ IsLinearTopology ℚ_[p] ℚ_[p] := sorry

end
end TauCetiRoadmap.PadicMeasuresIwasawaAlgebras.UniversalCharacter

/-!
## L3a and L5: statements this file does not type

L3a (rigid character and weight spaces): the character space `W(A) = Hom_cts(ℤ_pˣ, Aˣ)` with its
decomposition over the torsion characters, the identification of the characters of the principal
units with the open unit disc of `ℂ_p`, the bounded functions `F_μ` of measures (through the
extension map `extendCoefficients` above) and the functions `F_λ` of pseudo-measures with their
character-dependent clearing element, and the normed case of the universal property of the
universal character. Mathlib has no rigid analytic spaces; the roadmap states these targets on
`ContinuousMonoidHom`, `PadicComplex` and `completedGroupAlgebra`.

L5 (determinants, specialization and exactness): the ring-level line-module foundation, the
determinant line of a bounded complex of finite projective modules with its quasi-isomorphism
invariance, short-exact multiplicativity, base change and duality; its rational trivialization
and the comparison with characteristic ideals (image `∏ char(Hⁱ)^{(-1)^{i+1}}` for the
trivialization `det P ⊗ Q → Q`); specialization with the universal-coefficient sequences and the
perfectness hypothesis; topological Nakayama. These need a graded-invertible-module carrier that
Mathlib does not have.
-/
