import Mathlib

/-!
# The Amitsur–Levitzki theorem: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorems of
the roadmap against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need: the standard polynomial, polynomial identities, the degree of
a noncommutative polynomial, multilinear polynomials, the Grassmann matrix of Rosset's proof and
a verbatim copy of the generic matrices of IntegralHeckeAndGaloisDeterminants §0.4.

Every headline theorem of the README is stated here.
-/

namespace TauCetiRoadmap.AmitsurLevitzki

noncomputable section

open Matrix

universe u

/-! ## Layer 1: standard polynomials and polynomial identities -/

/-- 1.1 The standard polynomial `S_k = ∑_σ sign(σ) x_{σ 0} ⋯ x_{σ (k-1)}` in the free algebra on
`k` letters over `R`. -/
def standardPolynomial (R : Type*) [CommRing R] (k : ℕ) : FreeAlgebra R (Fin k) :=
  ∑ σ : Equiv.Perm (Fin k),
    (Equiv.Perm.sign σ : ℤ) • (List.ofFn fun i => FreeAlgebra.ι R (σ i)).prod

/-- 1.1 The multilinear polynomial `∑_σ α(σ) x_{σ 0} ⋯ x_{σ (d-1)}` of degree `d` with coefficient
family `α`. -/
def multilinearPolynomial {R : Type*} [CommRing R] {d : ℕ}
    (α : Equiv.Perm (Fin d) → R) : FreeAlgebra R (Fin d) :=
  ∑ σ : Equiv.Perm (Fin d), α σ • (List.ofFn fun i => FreeAlgebra.ι R (σ i)).prod

/-- 1.1 A noncommutative polynomial `f` with coefficients in `R` is a polynomial identity of the
`R`-algebra `A` when every evaluation of `f` in `A` vanishes. -/
def IsPolynomialIdentity {R X : Type*} [CommRing R] (f : FreeAlgebra R X) (A : Type*) [Ring A]
    [Algebra R A] : Prop :=
  ∀ x : X → A, FreeAlgebra.lift R x f = 0

/-- 1.1 The degree of a noncommutative polynomial: the largest length of a word whose coefficient
is nonzero, and `0` for the zero polynomial. -/
def totalDegree {R X : Type*} [CommRing R] (f : FreeAlgebra R X) : ℕ :=
  ((FreeAlgebra.basisFreeMonoid R X).repr f).support.sup fun w => w.toList.length

/-- 1.2 If `S_k` is a polynomial identity of an `R`-algebra `A`, so is `S_m` for every `m ≥ k`. -/
theorem IsPolynomialIdentity.standardPolynomial_of_le {R A : Type*} [CommRing R] [Ring A]
    [Algebra R A] {k m : ℕ} (h : IsPolynomialIdentity (standardPolynomial R k) A) (hkm : k ≤ m) :
    IsPolynomialIdentity (standardPolynomial R m) A := by
  sorry

/-- 1.3 An `R`-algebra spanned as an `R`-module by `d` elements satisfies `S_k` for every
`k > d`. -/
theorem isPolynomialIdentity_standardPolynomial_of_span {R A : Type*} [CommRing R] [Ring A]
    [Algebra R A] {d k : ℕ} (s : Fin d → A) (hs : Submodule.span R (Set.range s) = ⊤)
    (hk : d < k) : IsPolynomialIdentity (standardPolynomial R k) A := by
  sorry

/-- 1.4 Standard polynomials of positive even degree are traceless on square matrices over a
commutative ring, in every characteristic. -/
theorem trace_lift_standardPolynomial_eq_zero {R : Type*} [CommRing R] {n k : ℕ} (hk : 0 < k)
    (x : Fin (2 * k) → Matrix (Fin n) (Fin n) R) :
    (FreeAlgebra.lift R x (standardPolynomial R (2 * k))).trace = 0 := by
  sorry

/-! ## Layer 2: Rosset's theorem when `n!` is a unit -/

/-- 2.1 Trace criterion over a commutative ring in which `n!` is a unit: if the traces of `B`,
`B²`, …, `Bⁿ` vanish, then the characteristic polynomial of `B` is `Xⁿ` and `Bⁿ = 0`. -/
theorem charpoly_eq_X_pow_and_pow_eq_zero_of_trace_pow {C : Type*} [CommRing C] {n : ℕ}
    (hn : IsUnit (n.factorial : C)) (B : Matrix (Fin n) (Fin n) C)
    (htr : ∀ k, 1 ≤ k → k ≤ n → (B ^ k).trace = 0) :
    B.charpoly = Polynomial.X ^ n ∧ B ^ n = 0 := by
  sorry

/-- 2.2 The Grassmann matrix `∑ᵢ xᵢ εᵢ` of a family of `m` matrices over `C`, with
`ε₀, …, ε_{m-1}` the standard generators of the exterior algebra of `C^m`. -/
def grassmannMatrix {C : Type*} [CommRing C] {n m : ℕ}
    (x : Fin m → Matrix (Fin n) (Fin n) C) :
    Matrix (Fin n) (Fin n) (ExteriorAlgebra C (Fin m → C)) :=
  ∑ i, (x i).map (algebraMap C (ExteriorAlgebra C (Fin m → C))) *
    Matrix.scalar (Fin n) (ExteriorAlgebra.ι C (Pi.single i 1 : Fin m → C))

/-- 2.2 The `k`-th power of the Grassmann matrix is `∑_{|s| = k} S_k(x restricted to s) ε_s`, the
sum over the `k`-element subsets `s` of `Fin m`, enumerated increasingly, with `ε_s` the ordered
product of the generators indexed by `s`. -/
theorem grassmannMatrix_pow {C : Type*} [CommRing C] {n m : ℕ}
    (x : Fin m → Matrix (Fin n) (Fin n) C) (k : ℕ) :
    grassmannMatrix x ^ k =
      ∑ s : {s : Finset (Fin m) // s.card = k},
        (FreeAlgebra.lift C (x ∘ s.1.orderEmbOfFin s.2) (standardPolynomial C k)).map
            (algebraMap C (ExteriorAlgebra C (Fin m → C))) *
          Matrix.scalar (Fin n) (ExteriorAlgebra.ιMulti C k
            fun j => (Pi.single (s.1.orderEmbOfFin s.2 j) 1 : Fin m → C)) := by
  sorry

/-- 2.3 **Rosset's theorem.** If `n!` is a unit in the commutative ring `C`, the standard
polynomial `S_{2n}` is a polynomial identity of the `n × n` matrices over `C`. -/
theorem isPolynomialIdentity_standardPolynomial_of_isUnit_factorial {C : Type*} [CommRing C]
    {n : ℕ} (hn : IsUnit (n.factorial : C)) :
    IsPolynomialIdentity (standardPolynomial C (2 * n)) (Matrix (Fin n) (Fin n) C) := by
  sorry

/-! ## Layer 3: the Amitsur–Levitzki theorem over every commutative ring -/

/-- 3.1 The generic `d × d` matrices on a set `X`: the letter `a` goes to the matrix of variables
`(x_{a,i,j})_{i,j}` over `ℤ[x_{a,i,j}]`. (Copied verbatim from IntegralHeckeAndGaloisDeterminants
§0.4.) -/
def genericMatrices (X : Type*) (d : ℕ) :
    FreeAlgebra ℤ X →ₐ[ℤ] Matrix (Fin d) (Fin d) (MvPolynomial (X × Fin d × Fin d) ℤ) :=
  FreeAlgebra.lift ℤ fun a ↦ Matrix.of fun i j ↦ MvPolynomial.X (a, i, j)

/-- 3.1 **Generic Amitsur–Levitzki.** The standard polynomial `S_{2n}` vanishes on the `2n`
generic `n × n` matrices over `ℤ`. -/
theorem genericMatrices_standardPolynomial (n : ℕ) :
    genericMatrices (Fin (2 * n)) n (standardPolynomial ℤ (2 * n)) = 0 := by
  sorry

/-- 3.2 **The Amitsur–Levitzki theorem.** For every commutative ring `R` and every `n`, the
standard polynomial `S_{2n}` is a polynomial identity of the `n × n` matrices over `R`. -/
theorem isPolynomialIdentity_standardPolynomial_two_mul (R : Type*) [CommRing R] (n : ℕ) :
    IsPolynomialIdentity (standardPolynomial R (2 * n)) (Matrix (Fin n) (Fin n) R) := by
  sorry

/-! ## Layer 4: minimality of the degree `2n` -/

/-- 4.1 **Staircase lemma.** A multilinear polynomial of degree `d < 2n` that is a polynomial
identity of the `n × n` matrices over a commutative ring has all coefficients zero. -/
theorem eq_zero_of_isPolynomialIdentity_multilinearPolynomial {R : Type*} [CommRing R]
    {n d : ℕ} (hd : d < 2 * n) (α : Equiv.Perm (Fin d) → R)
    (h : IsPolynomialIdentity (multilinearPolynomial α) (Matrix (Fin n) (Fin n) R)) :
    α = 0 := by
  sorry

/-- 4.2 **Multilinearization.** If a nonzero noncommutative polynomial `f` is a polynomial identity
of an `R`-algebra `A`, then some nonzero multilinear polynomial of the same degree is one. -/
theorem exists_multilinearPolynomial_of_isPolynomialIdentity {R X A : Type*} [CommRing R]
    [Ring A] [Algebra R A] {f : FreeAlgebra R X} (hf0 : f ≠ 0) (hf : IsPolynomialIdentity f A) :
    ∃ α : Equiv.Perm (Fin (totalDegree f)) → R, α ≠ 0 ∧
      IsPolynomialIdentity (multilinearPolynomial α) A := by
  sorry

/-- 4.3 **Minimality.** No nonzero noncommutative polynomial of degree less than `2n` is a
polynomial identity of the `n × n` matrices over a commutative ring. -/
theorem not_isPolynomialIdentity_of_totalDegree_lt {R X : Type*} [CommRing R] {n : ℕ}
    {f : FreeAlgebra R X} (hf0 : f ≠ 0) (hdeg : totalDegree f < 2 * n) :
    ¬ IsPolynomialIdentity f (Matrix (Fin n) (Fin n) R) := by
  sorry

/-- 4.4 For a nontrivial commutative ring `R`, the standard polynomial `S_m` is a polynomial
identity of the `n × n` matrices over `R` exactly when `m ≥ 2n`. -/
theorem isPolynomialIdentity_standardPolynomial_iff {R : Type*} [CommRing R] [Nontrivial R]
    {n m : ℕ} :
    IsPolynomialIdentity (standardPolynomial R m) (Matrix (Fin n) (Fin n) R) ↔ 2 * n ≤ m := by
  sorry

/-! ## Layer 5: Azumaya algebras -/

/-- 5.1 An Azumaya algebra of constant rank `d²` over a commutative ring `A` satisfies the
standard polynomial `S_{2d}`. -/
theorem isPolynomialIdentity_standardPolynomial_of_isAzumaya (A R : Type u) [CommRing A]
    [Ring R] [Algebra A R] [IsAzumaya A R] (d : ℕ)
    (hrank : Module.rankAtStalk (R := A) R = fun _ => d * d) :
    IsPolynomialIdentity (standardPolynomial A (2 * d)) R := by
  sorry

/-- 5.2 An Azumaya algebra of constant rank `d²` over a commutative ring `A` satisfies no nonzero
noncommutative polynomial with coefficients in `A` of degree less than `2d`. -/
theorem not_isPolynomialIdentity_of_isAzumaya_of_totalDegree_lt (A R : Type u) [CommRing A]
    [Ring R] [Algebra A R] [IsAzumaya A R] (d : ℕ)
    (hrank : Module.rankAtStalk (R := A) R = fun _ => d * d) {X : Type*}
    {f : FreeAlgebra A X} (hf0 : f ≠ 0) (hdeg : totalDegree f < 2 * d) :
    ¬ IsPolynomialIdentity f R := by
  sorry

end

end TauCetiRoadmap.AmitsurLevitzki
