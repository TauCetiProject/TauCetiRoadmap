module

import Mathlib
import TauCeti.LinearAlgebra.SymplecticGroup.BlockSucc
import TauCeti.NumberTheory.ClassFieldTheory.ClassFields.RayClassField

/-!
# Arithmetic K-theory of number fields and S-integers, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

Stated here: the cyclotomic split-prime theorem with prescribed signs and the CM
ideal-product realization (README §§2.3–2.4), on native number fields and fractional
ideals, with native semilinear conjugation and the trace-dual ideal and without a CM
realization functor; the Vandiver criterion for conjugation-fixed primes at one
cyclotomic level, on Tau Ceti's Hilbert class field (README §7.7); and integral homology
stability of the symplectic groups `Sp_{2g}(ℤ)` (README §8.4), on Mathlib's
`Matrix.symplecticGroup` and `groupHomology` with Tau Ceti's block inclusion.

The following headlines are not statable at the pins:
* The cyclotomic Picard–Bott and Artin–transfer comparisons lack higher algebraic
  K-groups and Bott-localized K-theory.
* Betti–Hodge splitting, the height-one comparison and CM generation lack the
  symplectic K-spectrum, its comparison maps and stable homotopy of its sources.
* The coherent arithmetic action and finite-genus detection lack the realization of
  the moduli of principally polarized abelian varieties and the symplectic K-spectrum.
* Groupoid CM reciprocity with stable Bott-linearity lacks those CM groupoids and their
  stable suspension spectra.
* The universal relative extension lacks relative group homology with its extension
  category; absolute `groupHomology` alone does not supply it.
* The finite, p-adic, locally split and all-integer-twist universal arithmetic
  extensions lack KSp, higher K-groups, their arithmetic action and completed relative
  homology.
* Triviality of the arithmetic action in degree 4k-1 lacks KSp and that action.
* The integral indecomposable product and low-range Hurewicz theorems lack a Pontryagin
  product for H-spaces (the pinned one covers strict monoid objects of `TopCat`) and the
  Künneth identification of the homology Bockstein; the Hurewicz theorem also lacks
  spectra.
* The equivariant stable symplectic Hurewicz comparison and the rational Hodge
  generators lack the stable arithmetic symplectic realization and its Hodge
  characteristic classes.
* Bernoulli divisibility of Hodge characteristic numbers lacks principally polarized
  abelian schemes and the Chern characters of their Hodge bundles; the pinned cap
  product and integral fundamental class do not supply them.

The form of the Vandiver criterion at all levels is the Iwasawa-theoretic equivalence
with Vandiver's conjecture, which this roadmap consumes and does not state.
-/

namespace TauCetiRoadmap.ArithmeticKTheoryPartII

/-! ## Layer 2: CM coefficient lines and prescribed signs -/

open NumberField

/-- In an odd prime-power cyclotomic field, every choice of real signatures
on its maximal real subfield is realized by a generator of a prime away from p
that splits into two distinct conjugate primes in the CM field.
FGV, Lemma 4.8, author copy pp. 28–29. -/
theorem exists_split_prime_with_signs
    (p n : ℕ) (hp : p.Prime) (hodd : p ≠ 2) (hn : 0 < n)
    (K : Type*) [Field K] [NumberField K]
    [IsCyclotomicExtension ({p ^ n} : Set ℕ) ℚ K] [IsCMField K]
    (ε : (maximalRealSubfield K →+* ℝ) → ℤˣ) :
    ∃ t : 𝓞 (maximalRealSubfield K),
      t ≠ 0 ∧
      (∀ τ : maximalRealSubfield K →+* ℝ,
        0 < ((ε τ : ℤ) : ℝ) * τ (t : maximalRealSubfield K)) ∧
      (Ideal.span ({t} : Set (𝓞 (maximalRealSubfield K)))).IsPrime ∧
      (p : 𝓞 (maximalRealSubfield K)) ∉ Ideal.span {t} ∧
      ∃ P : Ideal (𝓞 K), P ≠ ⊥ ∧ P.IsPrime ∧
        P ≠ P.map (IsCMField.ringOfIntegersComplexConj K).toRingHom ∧
        (Ideal.span ({t} : Set (𝓞 (maximalRealSubfield K)))).map
            (algebraMap (𝓞 (maximalRealSubfield K)) (𝓞 K)) =
          P * P.map (IsCMField.ringOfIntegersComplexConj K).toRingHom := by
  sorry

/-- Complex conjugation of a fractional ideal in a CM field, using the native
semilinear transport of fractional ideals induced by conjugation on its integers. -/
noncomputable def conjugateFractionalIdeal
    (K : Type*) [Field K] [NumberField K] [IsCMField K]
    (B : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) :
    FractionalIdeal (nonZeroDivisors (𝓞 K)) K :=
  FractionalIdeal.ringEquivOfRingEquiv K K
    (IsCMField.ringOfIntegersComplexConj K).toRingEquiv B

/-- A nonzero fractional ideal with scalar skew-Hermitian pairing valued perfectly
in the inverse different and with the specified positive-imaginary CM type.
The inverse different is the trace dual of the unit ideal over ℤ ⊂ ℚ. -/
def IsSkewCMLine
    (K : Type*) [Field K] [NumberField K] [IsCMField K]
    (Φ : Set (K →+* ℂ))
    (B : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) (δ : K) : Prop :=
  B ≠ 0 ∧ δ ≠ 0 ∧ IsCMField.complexConj K δ = -δ ∧
    FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K)) δ * B *
        conjugateFractionalIdeal K B = FractionalIdeal.dual ℤ ℚ 1 ∧
    ∀ τ : K →+* ℂ, τ ∈ Φ ↔ 0 < (τ δ).im

/-- In an odd prime-power cyclotomic field, every CM type admits two perfect
rank-one skew-Hermitian lines whose ideal-class product is the prescribed
anti-conjugate class. The scalar a records equality modulo principal ideals.
FGV, Proposition 4.7(i)–(ii), author copy pp. 27–29. -/
theorem exists_cm_lines_with_ideal_product
    (p n : ℕ) (hp : p.Prime) (hodd : p ≠ 2) (hn : 0 < n)
    (K : Type*) [Field K] [NumberField K]
    [IsCyclotomicExtension ({p ^ n} : Set ℕ) ℚ K] [IsCMField K]
    (Φ : Set (K →+* ℂ))
    (hΦ : ∀ τ : K →+* ℂ,
      τ ∈ Φ ↔ τ.comp (IsCMField.complexConj K).toRingHom ∉ Φ)
    (L : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) (hL : L ≠ 0) :
    ∃ (B₁ B₂ : FractionalIdeal (nonZeroDivisors (𝓞 K)) K) (δ₁ δ₂ a : K),
      IsSkewCMLine K Φ B₁ δ₁ ∧ IsSkewCMLine K Φ B₂ δ₂ ∧ a ≠ 0 ∧
      B₁ * B₂ = FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K)) a *
        (L * (conjugateFractionalIdeal K L)⁻¹) := by
  sorry

/-! ## Layer 7: Continuous and locally split universal extensions -/

/-- The p-Hilbert class field of a number field: the intermediate field of its
Hilbert class field fixed by the subgroup generated by the Galois elements of
order prime to p. For a prime p its Galois group over K is the p-Sylow subgroup
of the class group; for K = ℚ(ζ_q) it is the field H_q of FGV §1.4, p. 6. -/
noncomputable def pHilbertClassField (p : ℕ) (K : Type) [Field K] [NumberField K] :
    IntermediateField K (TauCeti.ClassFieldTheory.hilbertClassField K) :=
  IntermediateField.fixedField (Subgroup.closure
    {σ : Gal(TauCeti.ClassFieldTheory.hilbertClassField K/K) | (orderOf σ).Coprime p})

/-- In an odd prime-power cyclotomic field K, for every involution σ of the
p-Hilbert class field restricting to complex conjugation on K, exactly one prime
above p is mapped to itself by σ if and only if p does not divide the class
number of the maximal real subfield. The σ-fixed primes form a torsor under the
plus part of the p-class group.
FGV, Remark 7.9, read for conjugation-fixed primes, author copy p. 44. -/
theorem existsUnique_conj_fixed_prime_iff_not_dvd_classNumber
    (p n : ℕ) (hp : p.Prime) (hodd : p ≠ 2) (hn : 0 < n)
    (K : Type) [Field K] [NumberField K]
    [IsCyclotomicExtension ({p ^ n} : Set ℕ) ℚ K] [IsCMField K]
    (σ : pHilbertClassField p K ≃+* pHilbertClassField p K)
    (hσ : ∀ x, σ (σ x) = x)
    (hK : ∀ x : K, σ (algebraMap K (pHilbertClassField p K) x) =
      algebraMap K (pHilbertClassField p K) (IsCMField.complexConj K x)) :
    (∃! P : Ideal (𝓞 (pHilbertClassField p K)), P.IsPrime ∧
        (p : 𝓞 (pHilbertClassField p K)) ∈ P ∧
        P.map (RingOfIntegers.mapRingEquiv σ) = P) ↔
      ¬ p ∣ classNumber (maximalRealSubfield K) := by
  sorry

/-! ## Layer 8: Integral indecomposables and Hodge characteristic numbers -/

open CategoryTheory in
/-- **Integral homology stability for `Sp_{2g}(ℤ)`.** For every abelian group `L` with
trivial action, the block inclusion `Sp_{2g}(ℤ) → Sp_{2g+2}(ℤ)` that fixes the last
hyperbolic plane induces a surjection `H_i(Sp_{2g}(ℤ); L) → H_i(Sp_{2g+2}(ℤ); L)` when
`g ≥ 2i + 5` and a bijection when `g ≥ 2i + 6`.
Mirzaii–van der Kallen, Theorem 4.1 at unitary stable rank 2, whose proof is
Charney §4; FGV §1.1, author copy p. 1. -/
theorem groupHomology_map_symplecticBlockSucc_stable
    (L : Type) [AddCommGroup L] (i g : ℕ) :
    (2 * i + 5 ≤ g → Function.Surjective
      (groupHomology.map (TauCeti.symplecticBlockSucc g ℤ)
        (B := Rep.trivial ℤ (Matrix.symplecticGroup (Fin (g + 1)) ℤ) L)
        (𝟙 (Rep.trivial ℤ (Matrix.symplecticGroup (Fin g) ℤ) L)) i).hom) ∧
    (2 * i + 6 ≤ g → Function.Bijective
      (groupHomology.map (TauCeti.symplecticBlockSucc g ℤ)
        (B := Rep.trivial ℤ (Matrix.symplecticGroup (Fin (g + 1)) ℤ) L)
        (𝟙 (Rep.trivial ℤ (Matrix.symplecticGroup (Fin g) ℤ) L)) i).hom) := by
  sorry

end TauCetiRoadmap.ArithmeticKTheoryPartII
