import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import Mathlib.Algebra.Algebra.Subalgebra.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.SpecialFunctions.Sqrt
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.Group.Subgroup.Basic

/-!
# Cubic Gaussian Jones model: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The carrier is the native twisted monoid algebra, with its actual basis and lift.
Admissions specify the cocycle, fixed algebra, TL comparison and finite image;
they are not completed proofs. No analytic star instance is assumed here.
-/

noncomputable section

namespace TauCetiRoadmap.TemperleyLiebOperatorAlgebras.CubicJones

open TauCeti
open scoped BigOperators

abbrev Exponents (N : ℕ) := Multiplicative (Fin N → ZMod 3)

def chainForm (N : ℕ) (a b : Exponents N) : ZMod 3 :=
  ∑ i : Fin N, ∑ j : Fin N,
    if i.val + 1 = j.val then a.toAdd i * b.toAdd j - b.toAdd i * a.toAdd j else 0

def omega : ℂˣ :=
  Units.mk0 (Complex.exp ((2 * Real.pi / 3 : ℝ) * Complex.I)) (Complex.exp_ne_zero _)

def factor (N : ℕ) (a b : Exponents N) : ℂˣ :=
  omega ^ (2 * chainForm N a b).val

instance factorSet (N : ℕ) : IsFactorSet (factor N) := by
  sorry

abbrev Cubic (N : ℕ) := twistedMonoidAlgebra ℂ (Exponents N) (factor N)

def weyl (N : ℕ) (a : Exponents N) : Cubic N := TwistedMonoidAlgebra.of a

def scalarTrace (N : ℕ) (x : Cubic N) : ℂ :=
  (TwistedMonoidAlgebra.basis ℂ (Exponents N) (factor N)).repr x 1

def site (N : ℕ) (j : Fin N) : Cubic N :=
  weyl N (Multiplicative.ofAdd (Pi.single j 1))

/-- Inversion of exponents is an algebra automorphism, not an antiautomorphism. -/
def inversion (N : ℕ) : Cubic N ≃ₐ[ℂ] Cubic N := by
  sorry

theorem inversion_weyl (N : ℕ) (a : Exponents N) :
    inversion N (weyl N a) = weyl N a⁻¹ := by
  sorry

def fixed (N : ℕ) : Subalgebra ℂ (Cubic N) :=
  AlgHom.equalizer (inversion N).toAlgHom (AlgHom.id ℂ (Cubic N))

def projection (N : ℕ) (j : Fin N) : Cubic N :=
  (3 : ℂ)⁻¹ • (1 + site N j + site N j ^ 2)

theorem projection_mem_fixed (N : ℕ) (j : Fin N) : projection N j ∈ fixed N := by
  sorry

def fixedGenerator (m : ℕ) (j : Fin (m - 1)) : fixed (m - 1) :=
  (Real.sqrt 3 : ℂ) • ⟨projection (m - 1) j, projection_mem_fixed _ _⟩

theorem generator_square (m : ℕ) (j : Fin (m - 1)) :
    fixedGenerator m j * fixedGenerator m j = (Real.sqrt 3 : ℂ) • fixedGenerator m j := by
  sorry

theorem generator_adjacent (m : ℕ) (i j : Fin (m - 1))
    (h : i.val + 1 = j.val ∨ j.val + 1 = i.val) :
    fixedGenerator m i * fixedGenerator m j * fixedGenerator m i = fixedGenerator m i := by
  sorry

theorem generator_distant (m : ℕ) (i j : Fin (m - 1))
    (h : i.val + 2 ≤ j.val ∨ j.val + 2 ≤ i.val) :
    fixedGenerator m i * fixedGenerator m j = fixedGenerator m j * fixedGenerator m i := by
  sorry

def model (m : ℕ) : TemperleyLieb ℂ (Real.sqrt 3 : ℂ) m →ₐ[ℂ] fixed (m - 1) :=
  TemperleyLieb.lift (fixedGenerator m) (generator_square m)
    (fun {_ _} h ↦ generator_adjacent m _ _ h)
    (fun {_ _} h ↦ generator_distant m _ _ h)

theorem native_trace (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 3 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (x : TemperleyLieb ℂ (Real.sqrt 3 : ℂ) m) :
    TemperleyLieb.markovTrace q hq x =
      (Real.sqrt 3 : ℂ) ^ m * scalarTrace (m - 1) (model m x) := by
  sorry

theorem kernel_trace_radical (m : ℕ) (q : ℂˣ)
    (hq : (Real.sqrt 3 : ℂ) = -((q : ℂ) + ((q⁻¹ : ℂˣ) : ℂ)))
    (x : TemperleyLieb ℂ (Real.sqrt 3 : ℂ) m) :
    model m x = 0 ↔ ∀ y, TemperleyLieb.markovTrace q hq (x * y) = 0 := by
  sorry

theorem model_surjective (m : ℕ) : Function.Surjective (model m) := by
  sorry

theorem fixed_dimension (N : ℕ) : Module.finrank ℂ (fixed N) = (3 ^ N + 1) / 2 := by
  sorry

def halfRoot : ℂ := Complex.exp ((Real.pi / 6 : ℝ) * Complex.I)

def braidGenerator (N : ℕ) (j : Fin N) : Cubic N :=
  halfRoot • ((1 + halfRoot ^ 2) • projection N j - 1)

theorem braid_phase (N : ℕ) (j : Fin N) :
    braidGenerator N j = -((Real.sqrt 3 : ℂ)⁻¹ •
      (1 + ((omega : ℂˣ) : ℂ) ^ 2 • (site N j + site N j ^ 2))) ∧
    braidGenerator N j ^ 3 = (-Complex.I) • (1 : Cubic N) ∧
    braidGenerator N j ^ 12 = 1 := by
  sorry

def braidUnit (N : ℕ) (j : Fin N) : (Cubic N)ˣ :=
  ⟨braidGenerator N j, braidGenerator N j ^ 11,
    by simpa only [← pow_succ'] using (braid_phase N j).2.2,
    by simpa only [← pow_succ] using (braid_phase N j).2.2⟩

/-- The full image in the faithful ambient algebra, not a projective or single-block image. -/
theorem finite_braid_image (N : ℕ) :
    Finite (Subgroup.closure (Set.range (braidUnit N))) := by
  sorry

end TauCetiRoadmap.TemperleyLiebOperatorAlgebras.CubicJones
