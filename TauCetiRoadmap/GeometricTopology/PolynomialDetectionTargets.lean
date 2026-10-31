import Mathlib
import TauCeti.KnotTheory.PDCode.Planar
import TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence
import TauCeti.KnotTheory.BraidWord.PDCode

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
The Jones detector below is a proposition, not an asserted theorem. The HOMFLY
diagonal is an actual coefficient map, not a second invariant construction.
The torus formula uses native braid closures and the half-variable u=t^(1/2).
Its one theorem admission is intentional; it does not admit a detection conjecture.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.PolynomialDetection
open TauCeti LaurentPolynomial

abbrev Laurent := LaurentPolynomial ℤ
abbrev TwoVariable := LaurentPolynomial Laurent

/-- The outer variable is l and the inner variable is m. -/
def ell : TwoVariable := T 1
def em : TwoVariable := C (T 1)

def parameter : Laurentˣ :=
  ⟨T 1, T (-1), by rw [← T_add]; norm_num, by rw [← T_add]; norm_num⟩

/-- Source rho(l,m) becomes rho(s,s); both variables remain units. -/
def diagonal : TwoVariable →+* Laurent :=
  eval₂ (RingHom.id Laurent) parameter

@[simp] theorem diagonal_ell : diagonal ell = T 1 := by
  simp [diagonal, ell, parameter]

@[simp] theorem diagonal_em : diagonal em = T 1 := by
  simp [diagonal, em]

theorem diagonal_surjective : Function.Surjective diagonal := by
  intro f
  exact ⟨C f, by simp [diagonal]⟩

theorem diagonal_kernel : diagonal (ell - em) = 0 := by simp

theorem ell_ne_em : ell ≠ em := by
  intro h
  have hc := congrArg (fun p : TwoVariable => p.coeff 1) h
  norm_num [ell, em] at hc

theorem diagonal_not_injective : ¬ Function.Injective diagonal := by
  intro h
  exact ell_ne_em (h (diagonal_ell.trans diagonal_em.symm))

/-- This polynomial is not asserted to be a knot polynomial. -/
theorem artificial_collision : diagonal (1 + ell - em) = 1 ∧ 1 + ell - em ≠ 1 := by
  constructor
  · simp
  · intro h
    apply ell_ne_em
    linear_combination h

/-- This is the classical question on planar one-component native codes.
Its equivalence with the geometric question consumes the README's realization theorem. -/
def JonesDetectsUnknot : Prop :=
  ∀ (n : ℕ) (D : OrientedPDCode n), D.toPDCode.IsPlanar →
    D.componentCount = 1 → D.jonesPolynomial = 1 →
    ∃ o : Bool, D.ReidemeisterEquiv (OrientedPDCode.unknot o)

theorem jones_one_of_unknot_equiv {n : ℕ} (D : OrientedPDCode n)
    (h : ∃ o : Bool, D.ReidemeisterEquiv (OrientedPDCode.unknot o)) :
    D.jonesPolynomial = 1 := by
  obtain ⟨o, ho⟩ := h
  exact ho.jonesPolynomial_eq.trans (OrientedPDCode.jonesPolynomial_unknot o)

/-- The positive p-strand torus braid, with q copies of sigma_1 ... sigma_(p-1). -/
def torusWord (p q : ℕ) : BraidWord p :=
  (List.replicate q ((List.finRange (p - 1)).map fun i => (i, (1 : ℤˣ)))).flatten

/-- Denominator-free identity for positive coprime parameters, including p=1 or q=1. -/
theorem torus_jones_formula (p q : ℕ) (hp : 0 < p) (hq : 0 < q)
    (hcop : p.Coprime q) :
    (1 - T 4) * (torusWord p q).closure.jonesPolynomial =
      T (((p : ℤ) - 1) * ((q : ℤ) - 1)) *
        (1 - T (2 * ((p : ℤ) + 1)) - T (2 * ((q : ℤ) + 1)) +
          T (2 * ((p : ℤ) + q))) := by
  sorry

/-- A proved consequence of the formula; it does not resolve general Jones detection. -/
theorem torus_jones_ne_one (p q : ℕ) (hp : 1 < p) (hq : 1 < q)
    (hcop : p.Coprime q) : (torusWord p q).closure.jonesPolynomial ≠ 1 := by
  intro h
  have hf := torus_jones_formula p q (by omega) (by omega) hcop
  rw [h, mul_one] at hf
  have epos : 0 < ((p : ℤ) - 1) * ((q : ℤ) - 1) := mul_pos (by omega) (by omega)
  have he1 : ((p : ℤ) - 1) * ((q : ℤ) - 1) ≠ 0 := by omega
  have he2 : ((p : ℤ) - 1) * ((q : ℤ) - 1) + 2 * ((p : ℤ) + 1) ≠ 0 := by omega
  have he3 : ((p : ℤ) - 1) * ((q : ℤ) - 1) + 2 * ((q : ℤ) + 1) ≠ 0 := by omega
  have he4 : ((p : ℤ) - 1) * ((q : ℤ) - 1) + 2 * ((p : ℤ) + q) ≠ 0 := by omega
  have expand (a b c d : Laurent) : a * (1 - b - c + d) = a - a*b - a*c + a*d := by ring
  rw [expand, ← T_add, ← T_add, ← T_add] at hf
  have hc := congrArg (fun f : Laurent => f.coeff 0) hf
  simp [he1, he2, he3, he4] at hc

end TauCetiRoadmap.GeometricTopology.PolynomialDetection
