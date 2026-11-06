import Mathlib
import TauCeti.NumberTheory.Multiquadratic.Quadratic.GenusCharacter.OrdinaryTwoRank
import TauCeti.NumberTheory.BinaryQuadraticForm.Basic

/-!
# MultiquadraticPartII: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: the exact quadratic
narrow kernel, unique character descent, genus-fibre cardinality, the prime-divisor
and two-square criteria, the norm-unit obstruction, the form-character extension's
represented-value and content laws, and its comparison with the narrow ideal character.

The restriction agreements with MetaplecticAutomorphicForms §§7.20a, 7.32-trace
are not statable at the pins: neither the nonsquare form-character function in
`quadraticTraceData` nor Biró's positive-discriminant character in
`biroArithmeticTraceData` is present in Mathlib or Tau Ceti. The latter agreement
includes square discriminants. No substitute for either comparison is declared.
`binaryFormGenusChar` is the common total extension of these characters to integral forms,
including negative definite forms and square and zero discriminants. The composite
sign identity is supplied by AutomorphicSpectralTheory §4.17a.

The baseline is Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
-/

open Polynomial NumberField TauCeti.Multiquadratic
open scoped MatrixGroups
open scoped NumberField nonZeroDivisors

namespace TauCetiRoadmap.MultiquadraticPartII

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}

/-! ## Layer 0: the quadratic narrow defect -/

/-- The quadratic narrow-to-wide kernel is the displayed pair, with coincident
entries allowed. The quadratic presentation suffices for either signature.
(Duke–Imamoḡlu–Tóth, §2, pp.950–951.) -/
theorem ker_toClassGroup_eq_pair
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (A : NarrowClassGroup K) :
    NarrowClassGroup.toClassGroup A = 1 ↔
      A = 1 ∨ A = NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) := by
  sorry

/-- A real class character has a unique wide descent exactly when it kills
the distinguished principal class. Both quantified maps are homomorphisms.
(Duke–Imamoḡlu–Tóth, §7, p.971, after (7.7).) -/
theorem existsUnique_wideCharacter_iff
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (χ : NarrowClassGroup K →* ℤˣ) :
    (∃! ψ : ClassGroup (𝓞 K) →* ℤˣ,
      ψ.comp (NarrowClassGroup.toClassGroup (K := K)) = χ) ↔
      χ (NarrowClassGroup.mkPrincipal
        (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) = 1 := by
  sorry

/-! ## Layer 1: the number of classes in a narrow genus -/

/-- Every narrow genus has the narrow class number divided by the genus
quotient cardinality. The integral identity avoids negative natural exponents
and also holds for imaginary quadratic presentations.
(Duke–Imamoḡlu–Tóth, §4, p.959, (4.1)–(4.2).) -/
theorem card_genusFiber_mul_twoPow {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (g : NarrowClassGroup.ElementaryTwoQuotient K) :
    2 ^ (s.card - 1) *
      Nat.card {A : NarrowClassGroup K // TauCeti.elementaryTwoQuotientMk A = g} =
        Nat.card (NarrowClassGroup K) := by
  sorry

/-! ## Layer 2: signs, principal genera and arithmetic criteria -/

/-- A positive signed prime-discriminant product has all factors positive
exactly when no prime of residue three modulo four divides it. This includes
the empty factorization of one. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem primeDiscriminants_positive_iff {D : ℤ} {s : Finset ℤ}
    (hD : 0 < D) (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = D) :
    (∀ P ∈ s, 0 < P) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

/-- For a positive fundamental discriminant, the general two-square
valuation criterion becomes a no-prime-divisor criterion. Zero coordinates and
nonprimitive representations are allowed. (Duke–Imamoḡlu–Tóth, §4, p.960.) -/
theorem fundamental_sumTwoSquares_iff {D : ℤ}
    (hD : 0 < D) (hfund : IsFundamentalDiscriminant D) :
    (∃ x y : ℤ, D = x ^ 2 + y ^ 2) ↔
      ∀ p : ℕ, p.Prime → (p : ℤ) ∣ D → p % 4 ≠ 3 := by
  sorry

/-- The different class is square exactly when the positive fundamental
discriminant has no prime divisor of residue three, or is a sum of two squares.
This does not assert that the class is trivial.
(Duke–Imamoḡlu–Tóth, §4, p.960; §7, p.971.) -/
theorem J_square_iff_sumTwoSquares {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) :
    (IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ↔
        ∀ p : ℕ, p.Prime → (p : ℤ) ∣ fundamentalDiscriminant d → p % 4 ≠ 3) ∧
    (IsSquare (NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin))) ↔
        ∃ x y : ℤ, fundamentalDiscriminant d = x ^ 2 + y ^ 2) := by
  sorry

/-- A prime divisor of residue three obstructs a trivial different class
and a norm minus one integral unit, and forces the narrow/wide class-number
ratio to be two. (Duke–Imamoḡlu–Tóth, §2, p.951.) -/
theorem J_ne_one_of_prime_threeModFour {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) {p : ℕ} (hp : p.Prime)
    (hpD : (p : ℤ) ∣ fundamentalDiscriminant d) (hp4 : p % 4 = 3) :
    NarrowClassGroup.mkPrincipal
      (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) ≠ 1 ∧
    ¬ (∃ u : (𝓞 K)ˣ, Algebra.norm ℚ (((u : 𝓞 K) : K)) = -1) ∧
    Nat.card (NarrowClassGroup K) = 2 * Nat.card (ClassGroup (𝓞 K)) := by
  sorry

/-! ## Layer 3: genus characters of binary forms -/

/-- The common total extension of the form characters supplied by
MetaplecticAutomorphicForms §§7.20a, 7.32-trace: evaluate `genusCharFun t` at a chosen integer
represented by `Q` and coprime to `δ = ∏ P ∈ t, P`, or return zero if none exists.
For a fundamental divisor of the discriminant, the represented-value law makes
this independent of choice, including at square and zero discriminants.
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509, with the local argument extended to zero.) -/
noncomputable def binaryFormGenusChar (t : Finset ℤ) (Q : TauCeti.BinaryQuadraticForm ℤ) : ℤ := by
  classical
  exact if h : ∃ m : ℤ, IsCoprime m (∏ P ∈ t, P) ∧
      ∃ x y : ℤ, Q.eval x y = m then
    genusCharFun t h.choose
  else 0

/-- Represented-value law for the extension, including square and zero discriminants: if `δ = ∏ P ∈ t, P` is a fundamental divisor of `Q.discrim`, the form
character is the Kronecker character at any represented integer coprime to `δ`, of either sign.
The congruence condition on the cofactor cannot be dropped: `x² + 2y²` has discriminant
`(-4) · 2` and represents `1` and `3`. (Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_eq_of_represents {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ t, ∀ P' ∈ t,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    {Q : TauCeti.BinaryQuadraticForm ℤ} {δ' : ℤ} (hδ' : δ' % 4 = 0 ∨ δ' % 4 = 1)
    (hdisc : Q.discrim = (∏ P ∈ t, P) * δ') {x y : ℤ}
    (hcop : IsCoprime (Q.eval x y) (∏ P ∈ t, P)) :
    binaryFormGenusChar t Q = genusCharFun t (Q.eval x y) := by
  sorry

/-- Content law for the total extension on all integral forms: the form character vanishes exactly when the content of the form is not coprime
to `δ`. A form whose content is coprime to `δ` represents an integer coprime to `δ`.
(Gross–Kohnen–Zagier, Ch. I §2, pp.508–509.) -/
theorem binaryFormGenusChar_eq_zero_iff {t : Finset ℤ}
    (ht : ∀ P ∈ t, IsPrimeDiscriminant P) (Q : TauCeti.BinaryQuadraticForm ℤ) :
    binaryFormGenusChar t Q = 0 ↔
      ¬ IsCoprime (Int.gcd Q.a (Int.gcd Q.b Q.c) : ℤ) (∏ P ∈ t, P) := by
  sorry

/-- The form character at a positive fundamental discriminant is the narrow ideal genus
character of the oriented class of the form's coefficient ideal `a ℤ + ((-b + ω) / 2) ℤ`,
`ω² = D`: the class of that ideal when `a > 0`, and `J` times it when `a < 0`. Either square
root `ω` may be used. (Duke–Imamoḡlu–Tóth, §2, p.952, and §9, p.978, before Proposition 5.) -/
theorem formCharacter_eq_idealCharacter {s t : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s,
      IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d)
    (hd : 0 < d) (hts : t ⊆ s)
    (ω : K) (hω : ω ^ 2 = (fundamentalDiscriminant d : K))
    (Q : TauCeti.BinaryQuadraticForm ℤ) (hdisc : Q.discrim = fundamentalDiscriminant d)
    (𝔞 : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (h𝔞 : ∀ z : K, z ∈ (𝔞 : FractionalIdeal (𝓞 K)⁰ K) ↔
      ∃ u v : ℤ, z = u * Q.a + v * ((-Q.b + ω) / 2)) :
    binaryFormGenusChar t Q =
      ((genusCharFunNarrowClassGroupHom hs heven hprod hmin hgen hsf hts
        (if 0 < Q.a then NarrowClassGroup.mk 𝔞
          else NarrowClassGroup.mkPrincipal
              (Units.mk0 (θ : K) (NumberField.coe_gen_ne_zero hmin)) *
            NarrowClassGroup.mk 𝔞) : ℤˣ) : ℤ) := by
  sorry

/-- Content divisible by two forces the imprimitive discriminant-48 value to zero. -/
example : binaryFormGenusChar {-4} ⟨2, 0, -6⟩ = 0 := by
  unfold binaryFormGenusChar
  split_ifs with h
  · obtain ⟨m, hm, x, y, rfl⟩ := h
    have h2 : (2 : ℤ) ∣ (⟨2, 0, -6⟩ : TauCeti.BinaryQuadraticForm ℤ).eval x y :=
      ⟨x ^ 2 - 3 * y ^ 2, by simp [TauCeti.BinaryQuadraticForm.eval]; ring⟩
    have h4 : (2 : ℤ) ∣ ∏ P ∈ ({-4} : Finset ℤ), P := by simp
    have := IsCoprime.isUnit_of_dvd' hm h2 h4
    norm_num [Int.isUnit_iff] at this
  · rfl

end TauCetiRoadmap.MultiquadraticPartII
