import Mathlib

/-!
# Effective arithmetic bounds, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs. The arithmetic model predicate below
uses the native quotient and localization: its actual compatible surjection
from an etale rational algebra exhibits the number field as a field component.

The headline theorems are short integral rational bases, bounded arithmetic first
jets, explicit field components, logarithmic models, the isolated affine and
Jacobian-open distinct-point bounds, bounded-system field-class counts and
cubic-logarithmic discriminant counts. All eight are statable at the pins.
Etaleness of the Jacobian-open algebra over the rationals is a consequence of
Mathlib's submersive presentations and is not repeated as a model condition.
The two counting theorems use arbitrary finite families of pairwise nonisomorphic
number fields. These are equivalent to the unweighted class-cardinality bounds
by choosing one representative per class; ArithmeticStatisticsPartI owns the
quotient carrier used by the class-cardinality API.
-/

namespace TauCetiRoadmap.EffectiveBoundsPartII

open scoped NumberField

/-! ## Layer 0: Short algebraic integers -/

/-- Every number field has a rational basis of algebraic integers whose houses
are at most the square of its root discriminant (Couveignes, Proposition 1). -/
theorem exists_short_integral_basis (K : Type*) [Field K] [NumberField K] :
    ∃ b : Module.Basis (Fin (Module.finrank ℚ K)) ℚ K,
      (∀ i, IsIntegral ℤ (b i)) ∧
      ∀ i, NumberField.house (b i) ≤ NumberField.rootDiscr K ^ 2 := by
  sorry

/-! ## Layer 1: Bounded generators with independent first jets -/

/-- Bounded integer combinations of a short integral rational basis can give
surjective degree-bounded values and first partials at all complex conjugates.
The same parameters give the stated house bound; no integral-basis index is fixed. -/
theorem exists_bounded_first_jet_generators
    (K : Type*) [Field K] [NumberField K] (r d : ℕ)
    (hr : 1 ≤ r) (hd : 5 ≤ d)
    (hM : Module.finrank ℚ K * (r + 1) ≤ (d + r).choose d) :
    let n := Module.finrank ℚ K
    ∃ (b : Module.Basis (Fin n) ℚ K) (u : Fin n → Fin r → ℤ),
      (∀ i, IsIntegral ℤ (b i) ∧
        NumberField.house (b i) ≤ NumberField.rootDiscr K ^ 2) ∧
      (∀ i j, 0 ≤ u i j ∧ u i j ≤ (d * n * (r + 1) : ℕ)) ∧
      let κ : Fin r → K := fun j => ∑ i, (u i j : K) * b i
      (∀ j, IsIntegral ℤ (κ j) ∧
        NumberField.house (κ j) ≤
          (n : ℝ) ^ 2 * d * (r + 1) * NumberField.rootDiscr K ^ 2) ∧
      Function.Surjective
        (fun f : MvPolynomial.restrictTotalDegree (Fin r) ℂ d =>
          fun (τ : K →+* ℂ) (a : Option (Fin r)) =>
            match a with
            | none => MvPolynomial.eval (fun j => τ (κ j)) f.1
            | some j => MvPolynomial.eval (fun j => τ (κ j))
                (MvPolynomial.pderiv j f.1)) := by
  sorry

/-! ## Layer 4: Explicit field components -/

/-- The rational polynomial Jacobian of an ordered square system of integer
polynomials; rows index equations and columns index variables. -/
noncomputable def jacobianPolynomial {r : ℕ}
    (E : Fin r → MvPolynomial (Fin r) ℤ) : MvPolynomial (Fin r) ℚ :=
  Matrix.det (fun i j => MvPolynomial.pderiv j
    ((E i).map (Int.castRingHom ℚ)))

/-- The arithmetic specialization of the Jacobian-open algebra: quotient rational
polynomials by the integer equations and invert their polynomial Jacobian. -/
abbrev JacobianOpenAlgebra {r : ℕ} (E : Fin r → MvPolynomial (Fin r) ℤ) :=
  Localization.Away (Ideal.Quotient.mk
    (Ideal.span (Set.range (fun i => MvPolynomial.map (Int.castRingHom ℚ) (E i))))
    (jacobianPolynomial E))

/-- An integral point generating K, bounded integer equations vanishing there,
and the actual compatible surjection from their Jacobian-open algebra (etale over
the rationals for every system, by Mathlib's standard-smooth presentations).
The surjection exhibits K as an open and closed field factor, since an etale
algebra over a field is a finite product of finite separable field extensions. -/
def HasBoundedModel (K : Type*) [Field K] [NumberField K]
    (r d : ℕ) (H : ℝ) : Prop :=
  ∃ (κ : Fin r → 𝓞 K) (E : Fin r → MvPolynomial (Fin r) ℤ),
    (∀ i, (E i).totalDegree ≤ d) ∧
    (∀ i a, |((E i).coeff a : ℝ)| ≤ H) ∧
    (∀ i, MvPolynomial.aeval (fun j => (κ j : K)) (E i) = 0) ∧
    Function.Surjective
      (MvPolynomial.aeval (fun j => (κ j : K)) :
        MvPolynomial (Fin r) ℚ →ₐ[ℚ] K) ∧
    MvPolynomial.aeval (fun j => (κ j : K)) (jacobianPolynomial E) ≠ 0 ∧
    ∃ φ : JacobianOpenAlgebra E →ₐ[ℚ] K,
      Function.Surjective φ ∧
      ∀ f : MvPolynomial (Fin r) ℚ,
        φ (algebraMap _ (JacobianOpenAlgebra E)
          (Ideal.Quotient.mk
            (Ideal.span (Set.range (fun i => (E i).map (Int.castRingHom ℚ)))) f)) =
          MvPolynomial.aeval (fun j => (κ j : K)) f

/-- The explicit coefficient bound, with real exponent ell/(2n) and natural
ell = choose(d+r,d)-n. Its model theorem assumes n is a number-field degree
and choose(d+r,d) is at least n(r+1), so both n and ell are positive. -/
noncomputable def explicitCoefficientBound (n r d : ℕ) (δ : ℝ) : ℝ :=
  let M := (d + r).choose d
  let ell := M - n
  (ell : ℝ) ^ ((ell : ℝ) / (2 * (n : ℝ))) * Real.sqrt (M : ℝ) *
    ((n : ℝ) ^ 2 * d * (r + 1)) ^ d * δ ^ (2 * d)

/-- Every number field is a field component of a square system satisfying
Couveignes's explicit degree and coefficient bounds (Proposition 2).
The point, quotient, localization and compatible map are all those of the system. -/
theorem exists_explicit_small_model
    (K : Type*) [Field K] [NumberField K] (r d : ℕ)
    (hr : 1 ≤ r) (hd : 5 ≤ d)
    (hM : Module.finrank ℚ K * (r + 1) ≤ (d + r).choose d) :
    HasBoundedModel K r d
      (explicitCoefficientBound (Module.finrank ℚ K) r d
        (NumberField.rootDiscr K)) := by
  sorry

/-! ## Layer 5: Logarithmic models and discriminant counts -/

/-- The least positive r for which choose(2r,r) is at least n(r+1).
The defining admissible set is nonempty for every natural n by exponential
central-binomial growth; the arithmetic assertions use n at least one. -/
noncomputable def centralBinomialRank (n : ℕ) : ℕ :=
  sInf {r : ℕ | 0 < r ∧ n * (r + 1) ≤ (2 * r).choose r}

/-- A single absolute constant bounds the degree-dependent equation count,
degree, monomial count and coefficient height for every sufficiently large
number-field degree. The variable count depends only on n, not on K. -/
theorem exists_logarithmic_small_models :
    ∃ Q : ℝ, 3 ≤ Q ∧
      ∀ (K : Type*) [Field K] [NumberField K],
        Q < (Module.finrank ℚ K : ℝ) →
        let n := Module.finrank ℚ K
        let r := centralBinomialRank n
        5 ≤ r ∧ (r : ℝ) ≤ Q * Real.log n ∧
        ((2 * r).choose r : ℝ) ≤ Q * n * Real.log n ∧
        HasBoundedModel K r r
          (((n : ℝ) * NumberField.rootDiscr K) ^ (Q * Real.log n)) := by
  sorry

/-- Over an algebraically closed field, r polynomials in r variables of total
degree at most d have at most d^r isolated affine zeros, counted without
multiplicity and whatever the dimension of the other components. A point is
isolated when its maximal ideal is a minimal prime over the ideal of the system
(README §5.5; Couveignes §4, p.496). -/
theorem isolatedAffinePoints_ncard_le_pow
    {F : Type*} [Field F] [IsAlgClosed F] {r d : ℕ}
    (E : Fin r → MvPolynomial (Fin r) F) (hE : ∀ i, (E i).totalDegree ≤ d) :
    let Z := {x : Fin r → F |
      RingHom.ker (MvPolynomial.eval x) ∈ (Ideal.span (Set.range E)).minimalPrimes}
    Z.Finite ∧ Z.ncard ≤ d ^ r := by
  sorry

/-- Over an algebraically closed field, the common zeros of r polynomials in r
variables of total degree at most d at which their Jacobian determinant does not
vanish form a finite set of at most d^r points (README §5.5). -/
theorem jacobianOpen_points_finite_ncard_le
    {F : Type*} [Field F] [IsAlgClosed F] {r d : ℕ}
    (E : Fin r → MvPolynomial (Fin r) F) (hE : ∀ i, (E i).totalDegree ≤ d) :
    let Z := {x : Fin r → F | (∀ i, MvPolynomial.eval x (E i) = 0) ∧
      MvPolynomial.eval x (Matrix.det fun i j => MvPolynomial.pderiv j (E i)) ≠ 0}
    Z.Finite ∧ Z.ncard ≤ d ^ r := by
  sorry

/-- Bounded ordered integer systems represent at most the coefficient-box
cardinality times the derived Jacobian-open distinct-point bound in pairwise
nonisomorphic number fields (README §5.5; Couveignes §4, p.496). A field is represented by an actual
surjective rational algebra map from the system's Jacobian-open algebra. -/
theorem bounded_systems_field_class_bound
    (r d C m : ℕ)
    (K : Fin m → Type*) [∀ i, Field (K i)] [∀ i, NumberField (K i)]
    (hsep : Pairwise (fun i j => ¬ Nonempty (K i ≃ₐ[ℚ] K j)))
    (hmodels : ∀ i, ∃ E : Fin r → MvPolynomial (Fin r) ℤ,
      (∀ j, (E j).totalDegree ≤ d) ∧
      (∀ j a, |(E j).coeff a| ≤ (C : ℤ)) ∧
      ∃ φ : JacobianOpenAlgebra E →ₐ[ℚ] K i, Function.Surjective φ) :
    m ≤ (2 * C + 1) ^ (r * (d + r).choose d) * d ^ r := by
  sorry

/-- One absolute constant bounds every finite family of pairwise nonisomorphic
number fields of degree n > Q and absolute discriminant at most H ≥ 1.
This is the unweighted class count of Couveignes's Theorem 2, p.488
(README §5.6), with the same constant in the threshold and both exponents. -/
theorem discriminant_field_class_bound :
    ∃ Q : ℝ, 3 ≤ Q ∧
      ∀ (n H m : ℕ), Q < (n : ℝ) → 1 ≤ H →
      ∀ (K : Fin m → Type*) [∀ i, Field (K i)] [∀ i, NumberField (K i)],
        (∀ i, Module.finrank ℚ (K i) = n) →
        (∀ i, |NumberField.discr (K i)| ≤ (H : ℤ)) →
        Pairwise (fun i j => ¬ Nonempty (K i ≃ₐ[ℚ] K j)) →
        (m : ℝ) ≤ (n : ℝ) ^ (Q * n * (Real.log n) ^ 3) *
          (H : ℝ) ^ (Q * (Real.log n) ^ 3) := by
  sorry

end TauCetiRoadmap.EffectiveBoundsPartII
