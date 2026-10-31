import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Jones
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These use actual native braid words and Laurent coefficients. Scaling the
exponents by2 gives the native Jones half-variable. The signed code/plane
comparisons and source-label corrections are required geometric targets.
-/
namespace TauCetiRoadmap.GeometricTopology.JonesTable109
open TauCeti LaurentPolynomial
abbrev LCoeff := LaurentPolynomial ℤ

def word41 : BraidWord 5 :=
  [(0,-1),(0,-1),(1,-1),(0,1),(2,1),(1,1),
   (1,1),(3,-1),(2,-1),(1,1),(2,-1),(3,-1)]

def negativeNine : BraidWord 2 := List.replicate 9 (0,-1)

theorem word41_permutation : ∀ i : Fin 5,
    BraidGroup.permHom 5 word41.toBraid i = (![2,4,3,1,0] : Fin 5 → Fin 5) i := by
  simp only [word41, BraidWord.toBraid, List.map_cons, List.map_nil, List.prod_cons,
    List.prod_nil, map_mul, map_zpow, BraidGroup.permHom_sigma]
  decide +kernel

theorem word41_length : word41.length = 12 := rfl

theorem word41_exponent_sum :
    (word41.map fun x => (x.2 : ℤ)).sum = -2 := by decide +kernel

/-- Scale1 is the ordinary knot variable; scale2 is native s=t^(1/2). -/
noncomputable def actual41 (k : ℤ) : LCoeff :=
  -T (3*k) + 3*T (2*k) - 5*T k + 8 - 8*T (-k) + 8*T (-2*k) -
    7*T (-3*k) + 5*T (-4*k) - 3*T (-5*k) + T (-6*k)

noncomputable def literal41 (k : ℤ) : LCoeff :=
  -T (-13*k) + T (-12*k) - T (-11*k) + T (-10*k) - T (-9*k) +
    T (-8*k) - T (-7*k) + T (-6*k) + T (-4*k)

noncomputable def literal42 (c k : ℤ) : LCoeff :=
  -T (-5*k) + 2*T (-4*k) - 2*T (-3*k) + 3*T (-2*k) - 3*T (-k) +
    3 + C c*T k + T (2*k)

noncomputable def actual42 (k : ℤ) : LCoeff :=
  T (3*k) - T (2*k) + T k - 1 + T (-k) - T (-2*k) + T (-3*k)

noncomputable def atOne : LCoeff →+* ℤ := eval₂ (RingHom.id ℤ) (1 : ℤˣ)
noncomputable def atMinusOne : LCoeff →+* ℤ := eval₂ (RingHom.id ℤ) (-1 : ℤˣ)

theorem actual41_at_minus_one : atMinusOne (actual41 1) = 49 := by
  norm_num [atMinusOne, actual41, eval₂_T, map_ofNat]

theorem literal41_at_minus_one : atMinusOne (literal41 1) = 9 := by
  norm_num [atMinusOne, literal41, eval₂_T, map_ofNat]

theorem literal42_at_one (c : ℤ) : atOne (literal42 c 1) = 3 + c := by
  norm_num [atOne, literal42, eval₂_T, eval₂_C, map_ofNat]
  ring

theorem literal42_at_minus_one (c : ℤ) : atMinusOne (literal42 c 1) = 15 - c := by
  norm_num [atMinusOne, literal42, eval₂_T, eval₂_C, map_ofNat]
  ring

theorem actual42_at_minus_one : atMinusOne (actual42 1) = -7 := by
  norm_num [atMinusOne, actual42, eval₂_T, map_ofNat]

theorem literal42_normalization (c : ℤ) (h : atOne (literal42 c 1) = 1) :
    c = -2 := by
  rw [literal42_at_one] at h
  omega

theorem literal41_ne_actual41 : literal41 1 ≠ actual41 1 := by
  intro h
  have hval := congrArg atMinusOne h
  rw [literal41_at_minus_one, actual41_at_minus_one] at hval
  omega

/-- The invariant of the declared native word, independently of the literal source row. -/
theorem native_word41_jones : word41.closure.jonesPolynomial = actual41 2 := by
  sorry

/-- This comparison does not relabel the source's9₄₁ row. -/
theorem negativeNine_jones : negativeNine.closure.jonesPolynomial = literal41 2 := by
  sorry

end TauCetiRoadmap.GeometricTopology.JonesTable109
