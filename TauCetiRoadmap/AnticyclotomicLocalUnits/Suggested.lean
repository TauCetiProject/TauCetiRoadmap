module

public import Mathlib

/-!
# Anticyclotomic local units: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems that can be expressed against the
pinned APIs: the auxiliary imaginary quadratic field existence theorem of §4.1,
stated for every odd prime.

The following headline theorems are not statable at the pins:

* Layer 0: rank-two freeness of the omega local-unit limit and its anticyclotomic
  quotient, and general nonexceptional finite coinvariant freeness. The arithmetic
  Lubin–Tate division tower, general norm-compatible multiplicative-group limit,
  local-unit limit and its inverse Tate twist are missing.
* Layer 1: height-two Lubin–Tate Coleman interpolation. The formal O-module,
  its compatible division points and the analytic interpolation carrier are missing.
* Layer 2: universal formal-norm vanishing and perfect arithmetic Kummer duality.
  The actual formal O-module point towers and their Kummer comparison are missing.
* Layer 2: Wiles trace reciprocity with parameter pi = -p. Those carriers and
  the native Coates–Wiles derivatives are missing.
* Layer 3: the signed annihilator theorem and signed rank bounds. The arithmetic
  character derivatives, Fourier logarithms and signed submodules are missing.
* Layer 4: assembly of the auxiliary field with its canonical Hecke character, CM
  realization and period. These marked Hecke-character and CM-period carriers are missing.
* Layer 4: existence of an optimal plus unit with unit derivative. The actual
  anticyclotomic local-unit module and its Coates–Wiles derivative are missing.
* Layers 5–6: a primitive modular formal CM point and the optimal local trace
  system, including its parity and initial trace. The integral modular
  parametrization and the Lubin–Tate/quasi-canonical point carriers are missing.
* Layer 7: minus-point first-cohomology vanishing and the exact divisible-point
  invariant formula. The signed arithmetic point modules with their actions
  are missing; general continuous cohomology alone does not specify them.
* Layer 7: freeness of the minus quotient and kernel. The actual signed
  local-unit submodule and its ambient anticyclotomic module are missing.
* Layer 8: Rubin's integral signed decomposition. The arithmetic rank-two
  anticyclotomic local-unit module and its signed submodules are missing.
* Layer 8: nonzero derivatives at every finite character and on every
  matching-parity signed generator. The same carriers and derivatives are missing.
* Layer 8: compatible injective finite signed Kummer images. The signed point
  modules and their actual Lubin–Tate torsion coefficients are missing.

The pinned power-series, completed-group-algebra, elliptic formal-point and
continuous-cohomology carriers do not by themselves provide these arithmetic
objects. No abstract decomposition on arbitrary submodules, scalar identity,
assumed pairing or proposition-valued replacement states these headlines.
-/

public section

namespace TauCetiRoadmap.AnticyclotomicLocalUnits

/-! ## Layer 4: An optimal plus unit from early CM values -/

/-- For every odd prime p there is an imaginary quadratic number field in which 2
splits into distinct prime ideals, p is inert, and p does not divide its class
number (BKO21, Lemma 3.1, pp.950–951, stated there for p at least five; at p = 3
the field of discriminant −7 is a witness). At p = 2 the splitting and inertness
clauses are incompatible. -/
theorem exists_auxiliaryQuadraticField (p : ℕ) (hp : p.Prime) (hp2 : p ≠ 2) :
    ∃ (K : Type) (hK : Field K),
      letI := hK
      ∃ hNF : NumberField K,
        letI := hNF
        Module.finrank ℚ K = 2 ∧ NumberField.IsTotallyComplex K ∧
          ∃ P Q : Ideal (NumberField.RingOfIntegers K),
            P.IsPrime ∧ Q.IsPrime ∧ P ≠ Q ∧
            Ideal.span ({2} : Set (NumberField.RingOfIntegers K)) = P * Q ∧
            (Ideal.span ({(p : NumberField.RingOfIntegers K)} :
              Set (NumberField.RingOfIntegers K))).IsPrime ∧
            ¬ p ∣ NumberField.classNumber K := by
  sorry

end TauCetiRoadmap.AnticyclotomicLocalUnits
