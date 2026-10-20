import Mathlib

/-!
# HermitianKTheoryOfPoincareCategories: representative target signatures

The roadmap is README.md. This file records representative definitions and
theorem signatures expressible with the pinned Mathlib and Tau Ceti APIs; it is
not an exhaustive specification. Complexes are homologically indexed and modules
are left modules. A global-dimension bound is written using Mathlib's projective
dimension, consistently with the supplier's opposite-ring convention.
-/

namespace TauCetiRoadmap.HermitianKTheoryOfPoincareCategories

open CategoryTheory

universe u

/-! ## Layer 2: connectivity and projective width -/

section ProjectiveWidth

variable {R : Type u} [Ring R]

/-- A bounded complex of finite projectives with no homology below `k` has a
homotopy-equivalent finite-projective model with no terms below `k`.
This is the one-sided assertion of Paper III, Lemma 1.1.6, p. 13.
The dual upper-bound assertion and the two-sided width criterion are in README.md.
-/
theorem exists_homotopyEquiv_concentrated_ge
    (C : ChainComplex (ModuleCat.{u} R) ℤ)
    (hproj : ∀ i, Module.Projective R (C.X i))
    (hfinite : ∀ i, Module.Finite R (C.X i))
    (hbounded : ∃ a b : ℤ, ∀ i, i < a ∨ b < i → Limits.IsZero (C.X i))
    (k : ℤ) (hconn : ∀ i, i < k → Limits.IsZero (C.homology i)) :
    ∃ C' : ChainComplex (ModuleCat.{u} R) ℤ,
      (∀ i, Module.Projective R (C'.X i)) ∧
      (∀ i, Module.Finite R (C'.X i)) ∧
      (∃ b : ℤ, ∀ i, i < k ∨ b < i → Limits.IsZero (C'.X i)) ∧
      Nonempty (HomotopyEquiv C C') := by
  sorry

/-- A finite projective in degree `k` has finite-projective terms, support `{k}`
and homology equal to that module in degree `k` and zero elsewhere.
Paper III, Lemma 1.1.6, p. 13.
-/
theorem width_single_projective
    (P : ModuleCat.{u} R) [Module.Projective R P] [Module.Finite R P] (k : ℤ) :
    let C := (HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.down ℤ) k).obj P
    (∀ i, Module.Projective R (C.X i) ∧ Module.Finite R (C.X i)) ∧
    (∀ i, i ≠ k → Limits.IsZero (C.X i)) ∧
    Nonempty (C.homology k ≅ P) ∧
    (∀ i, i ≠ k → Limits.IsZero (C.homology i)) := by
  sorry

/-- A zero complex admits a finite-projective model supported in every interval.
Paper III, Lemma 1.1.6, p. 13, including its zero-object case.
-/
theorem width_zero_complex
    (C : ChainComplex (ModuleCat.{u} R) ℤ) (hC : Limits.IsZero C)
    (k l : ℤ) (hkl : k ≤ l) :
    ∃ C' : ChainComplex (ModuleCat.{u} R) ℤ,
      (∀ i, Module.Projective R (C'.X i) ∧ Module.Finite R (C'.X i)) ∧
      (∀ i, i < k ∨ l < i → Limits.IsZero (C'.X i)) ∧
      Nonempty (HomotopyEquiv C C') := by
  sorry

/-- The complex `ℤ →² ℤ` has finite-projective width `[0,1]` and only homology
`ℤ/2` in degree zero. It has no projective model supported in degree zero,
as detected by `zmod_two_not_projectiveDimension_le_zero`.
Paper III, Lemma 1.1.6 and Remark 1.1.7, p. 13.
-/
theorem intTwoTerm_projective_width :
    let A := ModuleCat.of ℤ ℤ
    let C : ChainComplex (ModuleCat ℤ) ℤ :=
      HomologicalComplex.double (2 • (𝟙 A))
        (by decide : (ComplexShape.down ℤ).Rel 1 0)
    (∀ i, Module.Projective ℤ (C.X i) ∧ Module.Finite ℤ (C.X i)) ∧
    (∀ i, i < 0 ∨ 1 < i → Limits.IsZero (C.X i)) ∧
    Nonempty (C.homology 0 ≅ ModuleCat.of ℤ (ZMod 2)) ∧
    (∀ i, i ≠ 0 → Limits.IsZero (C.homology i)) ∧
    ¬ (∃ C' : ChainComplex (ModuleCat ℤ) ℤ,
      (∀ i, Module.Projective ℤ (C'.X i)) ∧
      (∀ i, i ≠ 0 → Limits.IsZero (C'.X i)) ∧
      Nonempty (HomotopyEquiv C C')) := by
  sorry

end ProjectiveWidth

/-! ## Layer 6: coherent rings and finite projective resolutions -/

section Coherence

variable (R : Type u) [Ring R]

/-- Coherence and a uniform projective-dimension bound give a resolution of
every finitely presented module by finite projectives of length at most `d`.
Coherence is expressed by finite presentation of finitely generated left ideals.
The augmentation and its quasi-isomorphism are part of Mathlib's
`ProjectiveResolution`, rather than additional unbundled hypotheses.
Paper III, discussion at the start of §1.3, p. 27.
-/
theorem finitePresentation_finiteProjectiveResolution
    (hcoherent : ∀ I : Ideal R, I.FG → Module.FinitePresentation R I) (d : ℕ)
    (hd : ∀ M : ModuleCat.{u} R, HasProjectiveDimensionLE M d)
    (M : ModuleCat.{u} R) [Module.FinitePresentation R M] :
    ∃ P : ProjectiveResolution M,
      (∀ i, Module.Finite R (P.complex.X i)) ∧
      (∀ i, d < i → Limits.IsZero (P.complex.X i)) := by
  sorry

/-- Global dimension zero characterizes semisimple rings; the bound quantifies
over all modules, rather than only finitely presented modules.
Paper III, Remark 1.3.5, p. 28.
-/
theorem globalDimension_zero_iff_semisimple :
    (∀ M : ModuleCat.{u} R, HasProjectiveDimensionLE M 0) ↔ IsSemisimpleRing R := by
  sorry

end Coherence

/-- Dedekind domains, including fields in Mathlib's convention, have left global
dimension at most one. Paper III, Corollary 1.3.14 and its preceding discussion,
p. 31.
-/
theorem dedekind_projectiveDimension_le_one
    (R : Type u) [CommRing R] [IsDedekindDomain R]
    (M : ModuleCat.{u} R) : HasProjectiveDimensionLE M 1 := by
  sorry

/-- The integral coefficient ring has global dimension one, not zero:
the module `ℤ/2` is not projective. This is the negative control in README §6.1.
-/
theorem zmod_two_not_projectiveDimension_le_zero :
    ¬ HasProjectiveDimensionLE (ModuleCat.of ℤ (ZMod 2)) 0 := by
  sorry

/-- Every module over a field has projective dimension zero.
Paper III, Remark 1.3.5, p. 28, applied to a field.
-/
theorem field_projectiveDimension_le_zero
    (K : Type u) [Field K] (M : ModuleCat.{u} K) : HasProjectiveDimensionLE M 0 := by
  sorry

/-- The order `ℤ[√−3]` has no finite uniform projective-dimension bound.
Its localization at `(2,X−1)` has dimension one and embedding dimension two;
Stacks, Tag 00OC, excludes finite global dimension there.
-/
theorem nonmaximalOrder_infinite_globalDimension :
    let A := Polynomial ℤ ⧸
      Ideal.span ({Polynomial.X ^ 2 + 3} : Set (Polynomial ℤ))
    ∀ d : ℕ, ∃ M : ModuleCat.{0} A, ¬ HasProjectiveDimensionLE M d := by
  sorry

/-- The residue field of `K[ε]/(ε²)` has infinite projective dimension.
The periodic free resolution with differential multiplication by `ε` yields
nonzero Tor in every degree after tensoring with the residue field.
Stacks, Tag 00OC, Proposition 10.110.5: this Noetherian local ring has Krull
dimension zero and cotangent dimension one, so it is not regular and its residue
field has infinite projective dimension.
-/
theorem dualNumbers_residue_infinite_projectiveDimension (K : Type u) [Field K] :
    let I : Ideal (Polynomial K) := Ideal.span {Polynomial.X ^ 2}
    let A := Polynomial K ⧸ I
    let ε : A := Ideal.Quotient.mk I Polynomial.X
    ∀ d : ℕ, ¬ HasProjectiveDimensionLE
      (ModuleCat.of A (A ⧸ Ideal.span {ε})) d := by
  sorry

/-- The ring `K[x₀,x₁,…]/(x₀xᵢ : i ∈ ℕ)` is not coherent.
The annihilator of `x₀` is not finitely generated, contradicting the kernel
finiteness of Stacks, Tag 05CW, for coherent rings.
-/
theorem noncoherent_squareZero_polynomial_ring (K : Type u) [Field K] :
    let I : Ideal (MvPolynomial ℕ K) :=
      Ideal.span (Set.range fun i : ℕ => MvPolynomial.X 0 * MvPolynomial.X i)
    let A := MvPolynomial ℕ K ⧸ I
    ¬ (∀ J : Ideal A, J.FG → Module.FinitePresentation A J) := by
  sorry

/-!
The coefficient-line operations, flavour spectra, opposite-duality transport,
metabolic Poincaré category, symmetry and quadraticity bounds, bounded L-monoids,
Lagrangian surgery, Ranicki's complexes and Wu classes, connective ring-spectrum
projectives, enhanced Postnikov t-structure, and form parameters are specified in
README.md. Their carriers and the GW/L comparison theorems remain there.
The multiplicative L-to-Tate comparison of §§7.10–7.11, including its E∞ ring,
module and base-change structures, is also specified there on the shared
Poincaré and spectrum carriers.
-/

end TauCetiRoadmap.HermitianKTheoryOfPoincareCategories
