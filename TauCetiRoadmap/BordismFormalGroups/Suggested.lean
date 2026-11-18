import Mathlib.RingTheory.FormalGroup.Basic
import Mathlib.Algebra.Ring.GeomSum
import Mathlib.Algebra.Regular.SMul
import Mathlib.Algebra.Module.Basic

/-!
These are suggested forms, not an exhaustive checklist. README.md is definitive.
Use the native FormalGroup and power-series carriers. Missing spectral and
universal-ring interfaces are specified there, without empty Prop placeholders.
-/

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups
variable {R : Type*} [CommRing R]

/-- F1: the nonnegative n-series is an actual substitution recursion. -/
def formalNSeries (F : FormalGroup R) : ℕ → PowerSeries R
  | 0 => 0
  | n + 1 => F.toPowerSeries.subst ![formalNSeries F n, PowerSeries.X]

/-- The univariate coordinate is a point on the native formal-group carrier. -/
def formalVariable (F : FormalGroup R) : F.Point Unit :=
  ⟨PowerSeries.X, PowerSeries.HasSubst.X ()⟩

/-- The substitution recursion agrees with native natural-number multiplication. -/
theorem formalNSeries_eq_nsmul (F : FormalGroup R) (n : ℕ) :
    formalNSeries F n = (n • formalVariable F).val := by
  induction n with
  | zero => rfl
  | succ n ih =>
      change F.toPowerSeries.subst ![formalNSeries F n, PowerSeries.X] =
        F.toPowerSeries.subst ![(n • formalVariable F).val, PowerSeries.X]
      rw [ih]

/-- F1: the recursion stays in the substitution domain. -/
theorem formalNSeries_constantCoeff (F : FormalGroup R) (n : ℕ) :
    (formalNSeries F n).constantCoeff = 0 := by
  sorry

/-- F1: normalization agrees with the native unit laws. -/
theorem formalNSeries_one (F : FormalGroup R) :
    formalNSeries F 1 = PowerSeries.X := by
  sorry

/-- F1: the linear term pins height and derivative conventions. -/
theorem formalNSeries_coeff_one (F : FormalGroup R) (n : ℕ) :
    (formalNSeries F n).coeff 1 = (n : R) := by
  sorry

section ExponentTwo

/-- F1: the normalization applies to arbitrary coefficient rings with 2=0. -/
theorem exists_unique_normalized_exponentTwo_logarithm
    (F : FormalGroup R) [F.IsComm]
    (hexponent : formalNSeries F 2 = 0) :
    ∃! g : PowerSeries R,
      g.constantCoeff = 0 ∧ g.coeff 1 = 1 ∧
      (∀ k : ℕ, 0 < k → g.coeff (2 ^ k) = 0) ∧
      g.subst F.toPowerSeries =
        g.subst (MvPowerSeries.X (0 : Fin 2)) +
          g.subst (MvPowerSeries.X (1 : Fin 2)) := by
  sorry

end ExponentTwo

section EulerNilpotentRegularity

open Finset
variable {S N : Type*} [Ring S] [AddCommGroup N] [Module S N]

/-- F6.6: a commuting nilpotent perturbation preserves regular scalar action. -/
theorem isSMulRegular_sub_of_pow_eq_zero {a b : S}
    (hab : Commute a b) (ha : IsSMulRegular N a)
    (q : ℕ) (hb : b ^ q = 0) : IsSMulRegular N (a - b) := by
  apply IsSMulRegular.of_mul
    (a := ∑ i ∈ range q, a ^ i * b ^ (q - 1 - i))
  rw [hab.geom_sum₂_mul q, hb, sub_zero]
  exact IsSMulRegular.pow q ha

end EulerNilpotentRegularity

end TauCetiRoadmap.BordismFormalGroups
