module

public import Mathlib

/-!
# Projective modules over polynomial rings: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib, each with `sorry`,
together with the definitions their statements need, all with real bodies on Mathlib's carriers.
The API around each target, the special cases and the Checks stay in the README.

Headlines stated, with their README targets:

* 1.1 `exists_specialLinearGroup_row_pow`; 2.1 `isStablyFree_mvPolynomial`;
* 3.1 `isExtendedFrom_iff_evalZero`; 3.2 `exists_unit_lift_dilation`;
  3.3 `exists_ideal_isExtendedAfter_away`; 3.4 `isExtendedFrom_of_forall_isMaximal`;
  3.5 `isExtendedFrom_mvPolynomial_of_forall_isMaximal`;
* 4.1 `isPrincipalIdealRing_monicLocalization` and `isField_monicLocalization`;
  4.2 `free_of_free_monicLocalization_of_isLocalRing`;
  4.3 `isExtendedFrom_of_isExtendedFrom_monicLocalization`;
  4.4 `nonempty_linearEquiv_of_monicLocalization`; 4.5 `free_of_free_monicLocalization`;
* 5.1 `exists_mulVec_eq_eval_zero`; 5.2 `free_mvPolynomial`; 5.3 `isExtendedFrom_mvPolynomial`;
  5.4 `exists_generalLinearGroup_col_eq_of_isUnimodular`.

Every headline of the README is stated. Finite free resolutions and the unimodular extension
property are PadicDifferentialEquationsAndRigidCohomology's (§RD.0.55, §RD.0.56) and enter only
the routes of 2.1 and 5.4, whose statements use Mathlib's `Module.IsStablyFree` and
`Module.IsUnimodular` alone; the gluing of finitely generated projective modules over a glueing
pair is RelativeFarguesFontaine's (§6.4, §6.5) and enters only the route of 4.4. The base changes
along `A[X] → B[X]` and `A[X₁, …, Xₙ] → B[X₁, …, Xₙ]` use Mathlib's `Polynomial.algebra` and
`MvPolynomial.algebraMvPolynomial`, which are not global instances; they are installed locally
inside the two predicates that need them. In 3.2 the localisation of a not necessarily
commutative `A`-algebra `R` at `f ∈ A` is `Localization.Away f ⊗[A] R`, and the substitution
`X ↦ gX` is `Polynomial.eval₂ C (g • X)`.
-/

@[expose] public section

universe u v w

open Polynomial TensorProduct

namespace TauCetiRoadmap.ProjectiveModulesOverPolynomialRings

/-! ## Layer 1: Suslin's `r!` theorem -/

/-- **1.1.** Suslin's `r!` theorem: if `(a₀, …, a_r)` is unimodular, `r ≥ 1`, the exponents are
positive and `r!` divides their product, then `(a₀ ^ m₀, …, a_r ^ m_r)` is the first row of a
matrix of determinant one (Suslin 1977, Theorem 2). -/
theorem exists_specialLinearGroup_row_pow {A : Type u} [CommRing A] {r : ℕ} (hr : r ≠ 0)
    (a : Fin (r + 1) → A) (ha : Ideal.span (Set.range a) = ⊤) (m : Fin (r + 1) → ℕ)
    (hm : ∀ i : Fin (r + 1), 0 < m i) (hdvd : r.factorial ∣ ∏ i : Fin (r + 1), m i) :
    ∃ α : Matrix.SpecialLinearGroup (Fin (r + 1)) A,
      ∀ i : Fin (r + 1), (α : Matrix (Fin (r + 1)) (Fin (r + 1)) A) 0 i = a i ^ m i := by
  sorry

/-! ## Layer 2: Serre's stable freeness -/

/-- **2.1.** Serre: a finitely generated projective module over a polynomial ring in finitely
many variables over a field, in any universe, is stably free. -/
theorem isStablyFree_mvPolynomial (k : Type u) [Field k] (n : ℕ) (P : Type v) [AddCommGroup P]
    [Module (MvPolynomial (Fin n) k) P] [Module.Finite (MvPolynomial (Fin n) k) P]
    [Module.Projective (MvPolynomial (Fin n) k) P] :
    Module.IsStablyFree (MvPolynomial (Fin n) k) P := by
  sorry

variable {A : Type u} [CommRing A]

/-! ## Layer 3: extended modules and Quillen patching -/

/-- **3.1.** An `R`-module is extended from `A` when it is isomorphic to `R ⊗[A] N` for some
`A`-module `N`. -/
def IsExtendedFrom (A : Type u) (R : Type w) [CommRing A] [CommRing R] [Algebra A R]
    (M : Type v) [AddCommGroup M] [Module R M] : Prop :=
  ∃ (N : Type v) (_ : AddCommGroup N) (_ : Module A N), Nonempty (M ≃ₗ[R] R ⊗[A] N)

/-- **3.1.** For an `A`-algebra `B` and an `A[X]`-module `M`, the base change `B[X] ⊗[A[X]] M`
along `A[X] → B[X]` is extended from `B`. -/
def IsExtendedAfter (A : Type u) [CommRing A] (B : Type w) [CommRing B] [Algebra A B]
    (M : Type v) [AddCommGroup M] [Module A[X] M] : Prop :=
  letI : Algebra A[X] B[X] := Polynomial.algebra A B
  IsExtendedFrom B B[X] (B[X] ⊗[A[X]] M)

/-- **3.1.** For an `A`-algebra `B` and an `A[X₁, …, Xₙ]`-module `M`, the base change along
`A[X₁, …, Xₙ] → B[X₁, …, Xₙ]` is extended from `B`. -/
def IsExtendedAfterMv (A : Type u) [CommRing A] (B : Type w) [CommRing B] [Algebra A B] (n : ℕ)
    (M : Type v) [AddCommGroup M] [Module (MvPolynomial (Fin n) A) M] : Prop :=
  letI : Algebra (MvPolynomial (Fin n) A) (MvPolynomial (Fin n) B) :=
    MvPolynomial.algebraMvPolynomial
  IsExtendedFrom B (MvPolynomial (Fin n) B) (MvPolynomial (Fin n) B ⊗[MvPolynomial (Fin n) A] M)

/-- **3.1.** An `A[X]`-module is extended from `A` if and only if it is extended from its
specialisation `M(0) = A ⊗[A[X]] M` at `X = 0`, for `A` an `A[X]`-algebra through evaluation at
`0` (Quillen 1976, p. 168; Lombardi–Quitté, Fact XVI.1.1). -/
theorem isExtendedFrom_iff_evalZero [Algebra A[X] A] (hA : algebraMap A[X] A = evalRingHom 0)
    (M : Type v) [AddCommGroup M] [Module A[X] M] :
    IsExtendedFrom A A[X] M ↔ Nonempty (M ≃ₗ[A[X]] A[X] ⊗[A] (A ⊗[A[X]] M)) := by
  sorry

/-- **3.2.** Quillen's dilation lemma: let `R` be an `A`-algebra, not necessarily commutative,
`f ∈ A`, and `θ` a unit of `R_f[X]` with `θ(0) = 1`, where `R_f = A_f ⊗[A] R`. Then there is `k`
such that whenever `g₁ − g₂ ∈ fᵏA`, some unit `ψ` of `R[X]` with `ψ(0) = 1` has image
`θ(g₁X) θ(g₂X)⁻¹` in `R_f[X]`, stated with the inverse multiplied out (Quillen 1976, Lemma 1,
pp. 167–168). -/
theorem exists_unit_lift_dilation (R : Type w) [Ring R] [Algebra A R] (f : A)
    (θ : (Localization.Away f ⊗[A] R)[X]ˣ)
    (hθ : (θ : (Localization.Away f ⊗[A] R)[X]).coeff 0 = 1) :
    ∃ k : ℕ, ∀ g₁ g₂ : A, g₁ - g₂ ∈ Ideal.span {f ^ k} →
      ∃ ψ : R[X]ˣ, (ψ : R[X]).coeff 0 = 1 ∧
        (ψ : R[X]).map (Algebra.TensorProduct.includeRight : R →ₐ[A] Localization.Away f ⊗[A] R) *
            (θ : (Localization.Away f ⊗[A] R)[X]).eval₂ C (g₂ • X) =
          (θ : (Localization.Away f ⊗[A] R)[X]).eval₂ C (g₁ • X) := by
  sorry

/-- **3.3.** The Quillen ideal: for a finitely presented `A[X]`-module `M`, the `a ∈ A` such that
`M_a` is extended from `A_a` form an ideal (Quillen 1976, proof of Theorem 1, p. 168). -/
theorem exists_ideal_isExtendedAfter_away (M : Type v) [AddCommGroup M] [Module A[X] M]
    [Module.FinitePresentation A[X] M] :
    ∃ I : Ideal A, ∀ a : A, a ∈ I ↔ IsExtendedAfter A (Localization.Away a) M := by
  sorry

/-- **3.4.** Quillen patching: a finitely presented `A[X]`-module that is extended at every
maximal ideal of `A` is extended (Quillen 1976, Theorem 1, p. 168). -/
theorem isExtendedFrom_of_forall_isMaximal (M : Type v) [AddCommGroup M] [Module A[X] M]
    [Module.FinitePresentation A[X] M]
    (h : ∀ (m : Ideal A) [m.IsMaximal], IsExtendedAfter A (Localization.AtPrime m) M) :
    IsExtendedFrom A A[X] M := by
  sorry

/-- **3.5.** Quillen patching in `n` variables (Quillen 1976, Theorem 1′, p. 169). -/
theorem isExtendedFrom_mvPolynomial_of_forall_isMaximal (n : ℕ) (M : Type v) [AddCommGroup M]
    [Module (MvPolynomial (Fin n) A) M] [Module.FinitePresentation (MvPolynomial (Fin n) A) M]
    (h : ∀ (m : Ideal A) [m.IsMaximal], IsExtendedAfterMv A (Localization.AtPrime m) n M) :
    IsExtendedFrom A (MvPolynomial (Fin n) A) M := by
  sorry

/-! ## Layer 4: monic inversion and Horrocks' theorem -/

/-- **4.1.** The monic polynomials of `A[X]`, a submonoid. -/
def monicSubmonoid (A : Type u) [CommRing A] : Submonoid A[X] where
  carrier := {p | p.Monic}
  mul_mem' hp hq := Monic.mul hp hq
  one_mem' := monic_one

/-- **4.1.** Quillen's Lemma 2: if `k` is a principal ideal domain, so is `k⟨X⟩`, the
localisation of `k[X]` at the monic polynomials (Quillen 1976, Lemma 2, p. 169). -/
theorem isPrincipalIdealRing_monicLocalization (k : Type u) [CommRing k] [IsDomain k]
    [IsPrincipalIdealRing k] :
    IsDomain (Localization (monicSubmonoid k)) ∧
      IsPrincipalIdealRing (Localization (monicSubmonoid k)) := by
  sorry

/-- **4.1.** For a field `k`, `k⟨X⟩` is a field, the field of rational functions
(Quillen 1976, Lemma 2, p. 169). -/
theorem isField_monicLocalization (k : Type u) [Field k] :
    IsField (Localization (monicSubmonoid k)) := by
  sorry

/-- **4.2.** Local Horrocks: over a local ring `A`, a finitely generated projective `A[X]`-module
that becomes free over `A⟨X⟩` is free (Lombardi–Quitté, Theorem XVI.4.3). -/
theorem free_of_free_monicLocalization_of_isLocalRing [IsLocalRing A] (P : Type v)
    [AddCommGroup P] [Module A[X] P] [Module.Finite A[X] P] [Module.Projective A[X] P]
    (h : Module.Free (Localization (monicSubmonoid A))
      (Localization (monicSubmonoid A) ⊗[A[X]] P)) :
    Module.Free A[X] P := by
  sorry

/-- **4.3.** Affine Horrocks' theorem: a finitely generated projective `A[X]`-module that becomes
extended from `A` over `A⟨X⟩` is extended from `A` (Lombardi–Quitté, Theorem XVI.4.7). -/
theorem isExtendedFrom_of_isExtendedFrom_monicLocalization (P : Type v) [AddCommGroup P]
    [Module A[X] P] [Module.Finite A[X] P] [Module.Projective A[X] P]
    (h : IsExtendedFrom A (Localization (monicSubmonoid A))
      (Localization (monicSubmonoid A) ⊗[A[X]] P)) :
    IsExtendedFrom A A[X] P := by
  sorry

/-- **4.4.** Bass: finitely generated projective `A`-modules that become isomorphic over `A⟨X⟩`
are isomorphic (Lombardi–Quitté, Theorem XVI.4.8). -/
theorem nonempty_linearEquiv_of_monicLocalization (P Q : Type v) [AddCommGroup P] [Module A P]
    [Module.Finite A P] [Module.Projective A P] [AddCommGroup Q] [Module A Q] [Module.Finite A Q]
    [Module.Projective A Q]
    (h : Nonempty (Localization (monicSubmonoid A) ⊗[A] P ≃ₗ[Localization (monicSubmonoid A)]
      Localization (monicSubmonoid A) ⊗[A] Q)) :
    Nonempty (P ≃ₗ[A] Q) := by
  sorry

/-- **4.5.** Quillen's form of Horrocks' theorem: over any commutative ring `A`, a finitely
generated projective `A[X]`-module that becomes free over `A⟨X⟩` is free (Quillen 1976,
Theorem 3, p. 169). -/
theorem free_of_free_monicLocalization (P : Type v) [AddCommGroup P] [Module A[X] P]
    [Module.Finite A[X] P] [Module.Projective A[X] P]
    (h : Module.Free (Localization (monicSubmonoid A))
      (Localization (monicSubmonoid A) ⊗[A[X]] P)) :
    Module.Free A[X] P := by
  sorry

/-! ## Layer 5: unimodular polynomial vectors and the Quillen–Suslin theorem -/

/-- **5.1.** Little Horrocks' global theorem: a unimodular vector over `A[X]` whose head ideal,
for some formal degrees `d`, is the unit ideal is equivalent under `GLₙ(A[X])` to its value at
`X = 0` (Lombardi–Quitté, Theorem XVI.5.15). -/
theorem exists_mulVec_eq_eval_zero {n : ℕ} (f : Fin n → A[X])
    (hf : Ideal.span (Set.range f) = ⊤) (d : Fin n → ℕ) (hd : ∀ i : Fin n, (f i).natDegree ≤ d i)
    (hhead : Ideal.span (Set.range fun i : Fin n => (f i).coeff (d i)) = ⊤) :
    ∃ g : GL (Fin n) A[X],
      (g : Matrix (Fin n) (Fin n) A[X]).mulVec f = fun i : Fin n => C ((f i).eval 0) := by
  sorry

/-- **5.2.** The Quillen–Suslin theorem: over a principal ideal domain `k`, every finitely
generated projective `k[X₁, …, Xₙ]`-module is free (Quillen 1976, Theorem 4, p. 169;
Suslin 1976). -/
theorem free_mvPolynomial (k : Type u) [CommRing k] [IsDomain k] [IsPrincipalIdealRing k] (n : ℕ)
    (P : Type v) [AddCommGroup P] [Module (MvPolynomial (Fin n) k) P]
    [Module.Finite (MvPolynomial (Fin n) k) P] [Module.Projective (MvPolynomial (Fin n) k) P] :
    Module.Free (MvPolynomial (Fin n) k) P := by
  sorry

/-- **5.3.** Over a Dedekind domain `B`, every finitely generated projective
`B[X₁, …, Xₙ]`-module is extended from `B` (Quillen 1976, Theorem 4′, p. 170). -/
theorem isExtendedFrom_mvPolynomial (B : Type u) [CommRing B] [IsDedekindDomain B] (n : ℕ)
    (P : Type v) [AddCommGroup P] [Module (MvPolynomial (Fin n) B) P]
    [Module.Finite (MvPolynomial (Fin n) B) P] [Module.Projective (MvPolynomial (Fin n) B) P] :
    IsExtendedFrom B (MvPolynomial (Fin n) B) P := by
  sorry

/-- **5.4.** Suslin: over a principal ideal domain `k`, every unimodular vector over
`k[X₁, …, Xₙ]` is the first column of an invertible matrix (Lombardi–Quitté, Theorem XVI.5.5, for
a field). -/
theorem exists_generalLinearGroup_col_eq_of_isUnimodular (k : Type u) [CommRing k] [IsDomain k]
    [IsPrincipalIdealRing k] (n m : ℕ) (v : Fin (m + 1) → MvPolynomial (Fin n) k)
    (hv : Module.IsUnimodular (MvPolynomial (Fin n) k) v) :
    ∃ g : GL (Fin (m + 1)) (MvPolynomial (Fin n) k),
      ∀ i, (g : Matrix (Fin (m + 1)) (Fin (m + 1)) (MvPolynomial (Fin n) k)) i 0 = v i := by
  sorry

end TauCetiRoadmap.ProjectiveModulesOverPolynomialRings
