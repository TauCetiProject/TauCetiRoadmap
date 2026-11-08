import Mathlib
import TauCeti.NumberTheory.Multiquadratic.FundamentalDiscriminant.Realization

/-!
# Quadratic characters and reduction: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
one definition a headline needs: the reduction map `ℤ[ω]/(m) → (ℤ/m)[ω̄]` induced by
`QuadraticAlgebra.mapRingHom`, which has a real body. Every headline of the roadmap is statable
at the pins: the conductor classifications of quadratic Dirichlet characters at odd prime-power
and at two-power levels, the primitive discriminant of a real character at any level, the kernel
and bijectivity of reduction modulo `m` with the cardinality of the quotient, the Frobenius
identities on `QuadraticAlgebra F r 0` over a finite field in the inert and in the split case,
the integral Frobenius congruence in `ℤ[√r]`, and the coordinate bound for every complex
embedding of `ℚ(√r)`. Nothing is stated in place of a headline that is not statable, since there
is none.
-/

noncomputable section

namespace TauCetiRoadmap.QuadraticCharactersAndReduction

open QuadraticAlgebra

/-! ## Layer 1: quadratic characters, local conductors and the primitive discriminant -/

/-- **Quadratic characters at an odd prime-power level.** A quadratic Dirichlet character modulo
`p ^ k`, `p` an odd prime and `k ≥ 1`, is principal or induced from the Legendre character
modulo `p`: its conductor is `1` or `p` (Montgomery–Vaughan, §9.3, pp. 295–296). -/
theorem odd_prime_power_conductor {p k : ℕ} (hp : p.Prime) (hp2 : p ≠ 2)
    (hk : 0 < k) (χ : DirichletCharacter ℂ (p ^ k)) (hχ : χ.IsQuadratic) :
    χ.conductor = 1 ∨ χ.conductor = p := by
  sorry

/-- **Quadratic characters at a two-power level.** A quadratic Dirichlet character modulo `2 ^ k`
is the lift of the principal character, of `χ₄`, of `χ₈` or of `χ₈'`: its conductor is `1`, `4`
or `8` (Montgomery–Vaughan, §9.3, p. 296). -/
theorem two_power_conductor (k : ℕ) (χ : DirichletCharacter ℂ (2 ^ k))
    (hχ : χ.IsQuadratic) : χ.conductor ∈ ({1, 4, 8} : Finset ℕ) := by
  sorry

/-- **The primitive discriminant of a real character.** A quadratic Dirichlet character of any
positive level `N` agrees, at every integer coprime to `N`, with the complex realization of the
character of exactly one fundamental discriminant `D`, and `|D|` is its conductor. The principal
character corresponds to `D = 1`; the primitive nonprincipal case is
AnalyticNumberTheoryPartI §0.34a, and the uniqueness uses `χ(-1) = sign D`. -/
theorem exists_unique_fundamental_discriminant {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsQuadratic) :
    ∃! D : ℤ, ∃ hD : Int.IsFundamentalDiscr D,
      D.natAbs = χ.conductor ∧ ∀ n : ℤ, IsCoprime n N →
        χ n = TauCeti.Multiquadratic.fundamentalDiscriminantCharCast ℂ D hD n := by
  sorry

/-! ## Layer 2: reduction of integral quadratic presentations modulo m -/

/-- **The reduction map on the quotient.** The ring homomorphism `ℤ[ω]/(m) → (ℤ/m)[ω̄]` induced
by coefficientwise reduction `QuadraticAlgebra.mapRingHom (Int.castRingHom (ZMod m))`, which
kills `m` because `m = 0` in `ℤ/m`. -/
def reductionQuotientHom (a b : ℤ) (m : ℕ) :
    QuadraticAlgebra ℤ a b ⧸ Ideal.span {(m : QuadraticAlgebra ℤ a b)} →+*
      QuadraticAlgebra (ZMod m) (a : ZMod m) (b : ZMod m) :=
  Ideal.Quotient.lift _ (mapRingHom (Int.castRingHom (ZMod m)) a b) (by
    intro z hz
    obtain ⟨c, rfl⟩ := Ideal.mem_span_singleton'.mp hz
    rw [map_mul, map_natCast,
      ← map_natCast (algebraMap (ZMod m) (QuadraticAlgebra (ZMod m) (a : ZMod m) (b : ZMod m))),
      ZMod.natCast_self, map_zero, mul_zero])

/-- **The kernel of reduction modulo `m`** is the principal ideal `(m)` of `ℤ[ω]`: an element
reduces to zero exactly when both of its coordinates are divisible by `m`. -/
theorem reduction_kernel (a b : ℤ) (m : ℕ) :
    RingHom.ker (mapRingHom (Int.castRingHom (ZMod m)) a b) =
      Ideal.span ({(m : QuadraticAlgebra ℤ a b)} : Set (QuadraticAlgebra ℤ a b)) := by
  sorry

/-- **The quotient comparison.** Reduction modulo `m` identifies `ℤ[ω]/(m)` with the quadratic
algebra `(ℤ/m)[ω̄]` of the reduced parameters: the induced map is a ring isomorphism. -/
theorem bijective_reductionQuotientHom (a b : ℤ) (m : ℕ) :
    Function.Bijective (reductionQuotientHom a b m) := by
  sorry

/-- **The cardinality of the quotient.** For `m > 0`, `ℤ[ω]/(m)` has `m ^ 2` elements. -/
theorem card_reduction_quotient (a b : ℤ) (m : ℕ) (hm : 0 < m) :
    Nat.card (QuadraticAlgebra ℤ a b ⧸ Ideal.span {(m : QuadraticAlgebra ℤ a b)}) =
      m ^ 2 := by
  sorry

/-! ## Layer 3: finite quadratic algebras and Frobenius -/

/-- **Frobenius is conjugation in the inert case.** Over a finite field `F` with `Q` elements and
a nonsquare `r`, the `Q`-th power map on the quadratic field extension `F(√r)` is the quadratic
conjugation `star`; in particular `ω ^ Q = -ω`. In characteristic two every element is a square,
so the hypothesis forces `Q` odd. -/
theorem pow_card_eq_star {F : Type*} [Field F] [Finite F] {r : F} (hr : ¬ IsSquare r)
    (z : QuadraticAlgebra F r 0) : z ^ Nat.card F = star z := by
  sorry

/-- **Frobenius is the identity in the split case.** Over a finite field of odd cardinality `Q`
and for a nonzero square `r`, the algebra `F(√r)` is `F × F` and every element satisfies
`z ^ Q = z`. Oddness is needed: over `𝔽₂` with `r = 1` the algebra is not reduced. -/
theorem pow_card_eq_self_of_square {F : Type*} [Field F] [Finite F]
    (hodd : Odd (Nat.card F)) {r : F} (hr : IsSquare r) (hr0 : r ≠ 0)
    (z : QuadraticAlgebra F r 0) : z ^ Nat.card F = z := by
  sorry

/-- **The integral Frobenius congruence.** For an odd prime `p` and an integer `r` that is not a
square modulo `p`, every `z = u + v√r` in `ℤ[√r]` satisfies `z ^ p ≡ u - v√r (mod p)`
coefficientwise, that is, `z ^ p - star z` lies in the ideal `(p)`. -/
theorem frobenius_congruence (r : ℤ) {p : ℕ} (hp : p.Prime) (hp2 : p ≠ 2)
    (hr : ¬ IsSquare (r : ZMod p)) (z : QuadraticAlgebra ℤ r 0) :
    z ^ p - star z ∈ Ideal.span {(p : QuadraticAlgebra ℤ r 0)} := by
  sorry

/-! ## Layer 4: embeddings and coordinate bounds -/

/-- **The coordinate bound for a complex embedding.** For every `ℚ`-algebra homomorphism `σ` from
`ℚ(√r)` to `ℂ` and every `z = u + vω`, `‖σ z‖ ≤ |u| + |v| √|r|`, because `σ ω` is a complex
square root of `r`. No nonsquare hypothesis is needed for the bound. -/
theorem norm_embedding_le (r : ℚ)
    (σ : QuadraticAlgebra ℚ r 0 →ₐ[ℚ] ℂ) (z : QuadraticAlgebra ℚ r 0) :
    ‖σ z‖ ≤ |(z.re : ℝ)| + |(z.im : ℝ)| * Real.sqrt |(r : ℝ)| := by
  sorry

end TauCetiRoadmap.QuadraticCharactersAndReduction
