import Mathlib

/-!
# DeformationAndDerivedPatchingAlgebra: representative target signatures

The roadmap is README.md. This file records light definitions and target signatures
statable against the pinned Mathlib and Tau Ceti APIs; it is not exhaustive.
The choices made explicit here are the cumulative exponent n + 1, intrinsic versus
ambient multiplicity, near faithfulness through the nilradical, actual square
presentations, strict native cochain representatives and cohomological indexing.
Heavy coefficient, duality and patching objects remain targets in the README.

Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a;
Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
Cochains have C[n]^i = C^(i+n); a module in degree b is M[-b].
-/

noncomputable section
universe u v w
open IsLocalRing
open scoped Pointwise

namespace TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

variable (A : Type u) [CommRing A]
variable (M : Type v) [AddCommGroup M] [Module A M]

/-!
Layers 1–2 are specified in README.md, §§1.1–2.8. The small-extension predicate
is supplied by SchemeAndStackFoundations §4.2; the labelled coefficient,
relation-obstruction and hull comparisons require their further carriers.
Specializing the coefficient base retains the joint-completion carrier and the
chosen presentation kernel. Continuous framed representing pairs are compared
by the unique coefficient isomorphism preserving the actual universal lift.
-/

/-! ## Layer 3: Homological dimension, local duality and multiplicity -/

/-- The cumulative length uses I^(n+1); finiteness is a separate hypothesis. -/
def hilbertSamuelFunction (I : Ideal A) (n : ℕ) : ℕ∞ :=
  Module.length A (M ⧸ (I ^ (n + 1) • (⊤ : Submodule A M)))

/-- Extract d! times coefficient d; only an eventual length polynomial makes this multiplicity. -/
def multiplicityCoefficient (d : ℕ) (P : Polynomial ℚ) : ℚ :=
  (Nat.factorial d : ℚ) * P.coeff d

/-- Formal unmixedness tests all associated primes of the maximal-adic completion. -/
def FormallyUnmixed [IsLocalRing A] : Prop :=
  ∀ p ∈ associatedPrimes
    (AdicCompletion (maximalIdeal A) A) (AdicCompletion (maximalIdeal A) A),
    ringKrullDim ((AdicCompletion (maximalIdeal A) A) ⧸ p) = ringKrullDim A

/-- Lescot's criterion uses the map induced by the actual residue quotient. -/
theorem lescot_regular_iff [IsLocalRing A] [IsNoetherianRing A] :
    IsRegularLocalRing A ↔ ∃ n : ℕ,
      ∃ x : CategoryTheory.Abelian.Ext
        (ModuleCat.of A (ResidueField A)) (ModuleCat.of A A) n,
      x.comp (CategoryTheory.Abelian.Ext.mk₀
        (ModuleCat.ofHom (Algebra.linearMap A (ResidueField A)))) (Nat.add_zero n) ≠ 0 := by
  sorry

/-- The finite-pd module version keeps nonzeroness and the quotient direction. -/
theorem lescot_module_regular_iff (N : Type u) [AddCommGroup N] [Module A N]
    [IsLocalRing A] [IsNoetherianRing A]
    [Module.Finite A N] [Nontrivial N]
    (hpd : CategoryTheory.projectiveDimension (ModuleCat.of A N) < ⊤) :
    IsRegularLocalRing A ↔ ∃ n : ℕ,
      ∃ x : CategoryTheory.Abelian.Ext
        (ModuleCat.of A (ResidueField A)) (ModuleCat.of A N) n,
      x.comp (CategoryTheory.Abelian.Ext.mk₀ (ModuleCat.ofHom
        ((maximalIdeal A • (⊤ : Submodule A N)).mkQ))) (Nat.add_zero n) ≠ 0 := by
  sorry

/-- An eventual cumulative polynomial fixes multiplicity in all characteristics. -/
theorem multiplicityOne_regular [IsLocalRing A] [IsNoetherianRing A]
    (d : ℕ) (hd : ringKrullDim A = d) (P : Polynomial ℚ)
    (hP : ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      P.eval (n : ℚ) = ((hilbertSamuelFunction A A (maximalIdeal A) n).toNat : ℚ)) :
    IsRegularLocalRing A ↔ FormallyUnmixed A ∧ multiplicityCoefficient d P = 1 := by
  sorry

example (K : Type u) [Field K] : FormallyUnmixed K := by
  sorry

example [IsDomain A] [IsDiscreteValuationRing A] : FormallyUnmixed A := by
  sorry

example (K : Type u) [Field K] : FormallyUnmixed (TrivSqZeroExt K K) := by
  sorry

/-- The embedded prime in k[[x,y]]/(x²,xy) obstructs formal unmixedness. -/
example (K : Type u) [Field K] (R : Type u) [CommRing R] [IsLocalRing R]
    (e : R ≃+* (MvPowerSeries (Fin 2) K ⧸ Ideal.span
      {(MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) K) ^ 2,
        (MvPowerSeries.X (0 : Fin 2) : MvPowerSeries (Fin 2) K) *
          MvPowerSeries.X (1 : Fin 2)})) :
    ¬ FormallyUnmixed R := by
  sorry

/-- Degree-zero quotient-induced Ext over a field is nonzero. -/
example (K : Type u) [Field K] :
    ∃ x : CategoryTheory.Abelian.Ext (ModuleCat.of K K) (ModuleCat.of K K) 0,
      x.comp (CategoryTheory.Abelian.Ext.mk₀ (CategoryTheory.CategoryStruct.id
        (ModuleCat.of K K))) (Nat.add_zero 0) ≠ 0 := by
  sorry

/-- In the two-term parameter dual, the degree-one cokernel is A/(π). -/
example (π : A) :
    LinearMap.range (LinearMap.mul A A π) = Ideal.span {π} := by
  sorry

/-- A parameter resolution in cochain degrees -1,0 dualizes with differential -2. -/
example : (-1 : ℚ) ^ ((0 : ℤ) + 1) * 2 = -2 ∧
    (-1 : ℚ) ^ ((0 : ℤ) + 1) * 2 ≠ 2 := by
  norm_num

/-- Nonflat reduction creates a kernel in the two-term multiplication-by-two complex. -/
example : LinearMap.ker (LinearMap.mul ℤ ℤ 2) = ⊥ ∧
    LinearMap.ker (LinearMap.mul (ZMod 2) (ZMod 2) 2) = ⊤ := by
  sorry

/-- The first coefficient copy deforms by +T; the right coefficient copy is fixed. -/
example (K : Type u) [Field K] (t : K) :
    (Polynomial.C t + Polynomial.X) - Polynomial.C t = (Polynomial.X : Polynomial K) ∧
      Polynomial.C t - (Polynomial.C t + Polynomial.X) = -(Polynomial.X : Polynomial K) := by
  sorry

/-- The inseparable diagonal at p=2 is already a nonreduced local algebra. -/
example : ∃ e : TrivSqZeroExt (ZMod 2) (ZMod 2), e ≠ 0 ∧ e ^ 2 = 0 := by
  sorry

/-- Multiplicity one for the DVR polynomial and length two in dimension zero. -/
example : multiplicityCoefficient 1 (Polynomial.X + (1 : Polynomial ℚ)) = 1 ∧
    multiplicityCoefficient 0 (Polynomial.C (2 : ℚ)) = 2 := by
  norm_num [multiplicityCoefficient, Polynomial.coeff_one]

/-- The trace ideal uses all linear functionals, without a projectivity assumption. -/
def traceIdeal : Ideal A :=
  Ideal.span {a : A | ∃ (f : M →ₗ[A] A) (m : M), f m = a}


/-- The symbolic square is localization at a prime followed by contraction. -/
def symbolicSquare (p : Ideal A) [p.IsPrime] : Ideal A :=
  Ideal.comap (algebraMap A (Localization.AtPrime p))
    ((p ^ 2).map (algebraMap A (Localization.AtPrime p)))

/-- An ideal of definition gives finite cumulative lengths at every index. -/
theorem hilbertSamuel_finite [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤) :
    ∀ n : ℕ, hilbertSamuelFunction A M I n ≠ ⊤ := by
  sorry

/-- The cumulative function has a unique eventual rational polynomial. -/
theorem hilbertSamuel_eventual_polynomial
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤) :
    ∃! P : Polynomial ℚ, ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      P.eval (n : ℚ) = ((hilbertSamuelFunction A M I n).toNat : ℚ) := by
  sorry

/-- For nonzero M, the polynomial has degree dim Supp M and positive integral multiplicity. -/
theorem hilbertSamuel_degree_and_positive_integral_coefficient
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M] [Nontrivial M]
    (I : Ideal A) (hI : I ≤ maximalIdeal A)
    (hfinite : Module.length A (M ⧸ (I • (⊤ : Submodule A M))) ≠ ⊤)
    (d : ℕ) (hd : Module.supportDim A M = (d : WithBot ℕ∞))
    (P : Polynomial ℚ)
    (hP : ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
      P.eval (n : ℚ) = ((hilbertSamuelFunction A M I n).toNat : ℚ)) :
    P.natDegree = d ∧ ∃ e : ℕ, 0 < e ∧ multiplicityCoefficient d P = (e : ℚ) := by
  sorry


/-- The EnhancedDerivedSheaves §E1.6 bound specializes to finite modules over regular local rings. -/
theorem regular_local_finite_module_dimension_bound
    [IsRegularLocalRing A] [Module.Finite A M] :
    CategoryTheory.projectiveDimension (ModuleCat.of A M) ≤ ringKrullDim A := by
  sorry

/-- Over a local ring, trace one detects a split copy of A in any module. -/
theorem trace_eq_top_iff_free_summand [IsLocalRing A] :
    traceIdeal A M = ⊤ ↔
      ∃ (i : A →ₗ[A] M) (r : M →ₗ[A] A), r.comp i = LinearMap.id := by
  sorry

/-- Membership is tested after multiplying by an element outside the prime. -/
theorem symbolicSquare_membership (p : Ideal A) [p.IsPrime] (a : A) :
    a ∈ symbolicSquare A p ↔ ∃ s : A, s ∉ p ∧ s * a ∈ p ^ 2 := by
  sorry


example : multiplicityCoefficient 0 (Polynomial.C (5 : ℚ)) = 5 := by
  sorry

example : multiplicityCoefficient 2
    (Polynomial.C (1 / 2 : ℚ) * Polynomial.X^2 +
      Polynomial.C (3 / 2 : ℚ) * Polynomial.X + 1) = 1 := by
  sorry

example : multiplicityCoefficient 2 (Polynomial.X + (1 : Polynomial ℚ)) = 0 := by
  sorry

example : multiplicityCoefficient 3 (0 : Polynomial ℚ) = 0 := by
  sorry

example [Subsingleton M] (I : Ideal A) (n : ℕ) :
    hilbertSamuelFunction A M I n = 0 := by
  sorry

example (K : Type*) [Field K] (n : ℕ) : hilbertSamuelFunction K K ⊥ n = 1 := by
  sorry

example (n : ℕ) :
    hilbertSamuelFunction ℤ ℤ (Ideal.span {(2 : ℤ)}) n = (n + 1 : ℕ∞) := by
  sorry

/-- Monomials of total degree at most n compute the two-variable cumulative length. -/
example (K : Type u) [Field K] (n : ℕ) :
    let R := MvPowerSeries (Fin 2) K
    hilbertSamuelFunction R R (maximalIdeal R) n = (Nat.choose (n + 2) 2 : ℕ∞) := by
  sorry

/-- Powers of (2) scale cumulative length, including the zero quotient at exponent zero. -/
example (r n : ℕ) :
    hilbertSamuelFunction ℤ ℤ (Ideal.span {(2 : ℤ) ^ r}) n =
      (r * (n + 1) : ℕ∞) := by
  sorry

example : traceIdeal A A = ⊤ := by
  sorry

example [Subsingleton M] : traceIdeal A M = ⊥ := by
  sorry

example : traceIdeal ℤ (ZMod 2) = ⊥ := by
  sorry

/-- The two-variable parameter ideal has proper trace, hence no free rank-one summand. -/
example (K : Type u) [Field K] :
    let R := MvPowerSeries (Fin 2) K
    let I : Ideal R := Ideal.span {MvPowerSeries.X (0 : Fin 2),
      MvPowerSeries.X (1 : Fin 2)}
    traceIdeal R I = I := by
  sorry




example [IsDomain A] : symbolicSquare A (⊥ : Ideal A) = ⊥ := by
  sorry

example (p : Ideal A) [p.IsMaximal] : symbolicSquare A p = p ^ 2 := by
  sorry

example (p : Ideal A) [p.IsPrime] (a : A) (ha : a ∉ p) :
    a ∉ symbolicSquare A p := by
  sorry

/-- The quadric cone has a symbolic-square element outside the ordinary square in every characteristic. -/
example (K : Type u) [Field K] :
    let Q := MvPolynomial (Fin 3) K
    let I : Ideal Q := Ideal.span
      {(MvPolynomial.X (0 : Fin 3) : Q) * MvPolynomial.X (2 : Fin 3) -
        MvPolynomial.X (1 : Fin 3) ^ 2}
    let R := Q ⧸ I
    let x : R := Ideal.Quotient.mk I (MvPolynomial.X (0 : Fin 3))
    let y : R := Ideal.Quotient.mk I (MvPolynomial.X (1 : Fin 3))
    let p : Ideal R := Ideal.span {x, y}
    ∃ hp : p.IsPrime, letI : p.IsPrime := hp
      x ∈ symbolicSquare R p ∧ x ∉ p ^ 2 := by
  sorry

-- Total-jet normalization for the nonzero plane equation x^4.
example : Nat.choose (0 + 2) 2 - Nat.choose (0 + 2 - 4) 2 = 1 := by
  sorry

example : Nat.choose (1 + 2) 2 - Nat.choose (1 + 2 - 4) 2 = 3 := by
  sorry

example : Nat.choose (2 + 2) 2 - Nat.choose (2 + 2 - 4) 2 = 6 := by
  sorry

example : (4 : ℚ) * (0 + 1) - 4 * (4 - 1) / 2 = -2 := by
  sorry

/-! ## Layer 4: Finiteness and integral points -/

/-- A complete local source and Noetherian local target: a finite closed fibre forces finiteness. -/
theorem finite_of_finite_residual_fibre
    {B : Type w} [IsLocalRing A]
    [IsAdicComplete (maximalIdeal A) A]
    [CommRing B] [IsLocalRing B] [IsNoetherianRing B]
    [Algebra A B] [IsLocalHom (algebraMap A B)]
    [Module.Finite A (B ⧸ (maximalIdeal A).map (algebraMap A B))] :
    Module.Finite A B := by
  sorry

/-- A faithful finite module makes the action algebra finite over a Noetherian base. -/
theorem finite_of_faithful_module
    {S R N : Type*} [CommRing S] [IsNoetherianRing S] [CommRing R]
    [Algebra S R] [AddCommGroup N] [Module S N] [Module R N]
    [IsScalarTower S R N] [SMulCommClass R S N]
    [Module.Finite S N] [FaithfulSMul R N] : Module.Finite S R := by
  sorry

/-- For a finite local DVR algebra, dimension one is detected by a nonnilpotent uniformizer. -/
theorem dimension_ge_one_iff_not_nilpotent
    {O B : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [CommRing B] [IsLocalRing B] [Algebra O B] [Module.Finite O B]
    [IsLocalHom (algebraMap O B)] (π : O) (hπ : Irreducible π) :
    (1 ≤ ringKrullDim B) ↔ ¬ IsNilpotent (algebraMap O B π) := by
  sorry

/-- A nonempty generic fibre has a point in a finite extension and its integral closure; characteristic zero ensures finite normalization. -/
theorem exists_integral_point_of_not_nilpotent
    {O K B Ω : Type*} [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [Field K] [CharZero K] [Algebra O K] [IsFractionRing O K]
    [Field Ω] [Algebra K Ω] [Algebra O Ω] [IsScalarTower O K Ω] [IsAlgClosed Ω]
    [CommRing B] [IsLocalRing B] [Algebra O B] [Module.Finite O B]
    [IsLocalHom (algebraMap O B)] (π : O) (hπ : Irreducible π)
    (h : ¬ IsNilpotent (algebraMap O B π)) :
    ∃ E : IntermediateField K Ω, Module.Finite K E ∧
      (letI : Algebra O E := ((algebraMap K E).comp (algebraMap O K)).toAlgebra;
       Module.Finite O (integralClosure O E) ∧
         ∃ f : B →ₐ[O] integralClosure O E, IsLocalHom f.toRingHom) := by
  sorry

/-! ## Layer 5: Balanced module presentations -/

/-- A square finite presentation permits zero generators and does not require injectivity. -/
def HasSquarePresentation (S : Type*) [Ring S]
    (N : Type*) [AddCommGroup N] [Module S N] : Prop :=
  ∃ d : ℕ, ∃ f : (Fin d → S) →ₗ[S] (Fin d → S),
    ∃ g : (Fin d → S) →ₗ[S] N,
      Function.Surjective g ∧ LinearMap.range f = LinearMap.ker g

/-- A presentation with at most as many relations as generators can be made square by zero columns. -/
theorem square_presentation_iff_generator_relation_inequality
    [IsLocalRing A] [IsNoetherianRing A] [Module.Finite A M] :
    HasSquarePresentation A M ↔
      ∃ d e : ℕ, e ≤ d ∧
        ∃ f : (Fin e → A) →ₗ[A] (Fin d → A),
          ∃ g : (Fin d → A) →ₗ[A] M,
            Function.Surjective g ∧ LinearMap.range f = LinearMap.ker g := by
  sorry

example : HasSquarePresentation A A := by
  sorry

example (a : A) : HasSquarePresentation A (A ⧸ Ideal.span {a}) := by
  sorry

example [Subsingleton M] : HasSquarePresentation A M := by
  sorry

/-- The dual-number residue admits a square presentation despite its infinite projective dimension. -/
example (K : Type u) [Field K] :
    HasSquarePresentation (TrivSqZeroExt K K) (ResidueField (TrivSqZeroExt K K)) := by
  sorry

/-- The two-variable regular local residue needs two relations and one generator. -/
example (K : Type u) [Field K] :
    ¬ HasSquarePresentation (MvPowerSeries (Fin 2) K)
      (ResidueField (MvPowerSeries (Fin 2) K)) := by
  sorry

/-! ## Layer 6: Components and quotient identification -/

/-- Near faithfulness means the annihilator lies in the nilradical, even without Noetherianity. -/
def NearlyFaithful : Prop :=
  Module.annihilator A M ≤ (⊥ : Ideal A).radical

/-- For a finite module over any commutative ring, near faithfulness is full support. -/
theorem nearlyFaithful_iff_full_support [Module.Finite A M] :
    NearlyFaithful A M ↔ Module.support A M = Set.univ := by
  sorry

/-- A reduced source and full support force a surjective action-compatible quotient map to be injective. -/
theorem reduced_quotient_identification
    {B : Type w} [CommRing B] [IsNoetherianRing A] [IsReduced A]
    [Module B M] (f : A →+* B) (hf : Function.Surjective f)
    (hcompat : ∀ a : A, ∀ m : M, a • m = f a • m)
    (hsupport : Module.support A M = Set.univ) :
    Function.Injective f := by
  sorry

example : NearlyFaithful A A := by
  sorry

example [Nontrivial A] [Subsingleton M] : ¬ NearlyFaithful A M := by
  sorry

example : ¬ NearlyFaithful ℤ (ZMod 2) := by
  sorry

example : NearlyFaithful ℤ (ℚ ⧸ Submodule.span ℤ {(1 : ℚ)}) ∧
    Module.support ℤ (ℚ ⧸ Submodule.span ℤ {(1 : ℚ)}) ≠ Set.univ := by
  sorry

example (I : Ideal A) (hI : I ≤ (⊥ : Ideal A).radical) :
    NearlyFaithful A (A ⧸ I) := by
  sorry

/-- The dual-number residue has nilpotent annihilator but is not faithful. -/
example (K : Type u) [Field K] :
    NearlyFaithful (TrivSqZeroExt K K) (ResidueField (TrivSqZeroExt K K)) ∧
      ¬ FaithfulSMul (TrivSqZeroExt K K) (ResidueField (TrivSqZeroExt K K)) := by
  sorry

/-! ## Layer 7: Finite complexes, signed duality and coefficient towers -/

open CategoryTheory CategoryTheory.Limits
open scoped ZeroObject
attribute [local instance] HasDerivedCategory.standard

/-- Native derived module objects. -/
abbrev Der (R : Type u) [CommRing R] := DerivedCategory (ModuleCat.{u} R)

/-- Native integer-indexed cochain complexes. -/
abbrev Cpx (R : Type u) [CommRing R] := CochainComplex (ModuleCat.{u} R) ℤ

/-- Cohomology in the native module category. -/
abbrev H {R : Type u} [CommRing R] (i : ℤ) (C : Der R) :=
  (DerivedCategory.homologyFunctor (ModuleCat R) i).obj C

/-- Minimality on native cochains applies to finite free and complete flat models, without bounds. -/
def IsMinimal {R : Type u} [CommRing R] [IsLocalRing R] (P : Cpx R) : Prop :=
  ∀ i : ℤ, LinearMap.range (P.d i (i + 1)).hom ≤
    maximalIdeal R • (⊤ : Submodule R (P.X (i + 1)))

/-- A complete flat complex has bounded terms, each flat, separated and maximal-adically complete. -/
def CompleteFlatComplex {R : Type u} [CommRing R] [IsLocalRing R] (P : Cpx R) : Prop :=
  (∃ a b : ℤ, ∀ i : ℤ, i < a ∨ b < i → IsZero (P.X i)) ∧
    ∀ i : ℤ, Module.Flat R (P.X i) ∧ IsAdicComplete (maximalIdeal R) (P.X i)

/-- Residual exactness of three finite free terms forces middle exactness, with no endpoint assertion. -/
theorem three_term_residue_exactness [IsLocalRing A]
    (F₀ F₁ F₂ : Type v)
    [AddCommGroup F₀] [AddCommGroup F₁] [AddCommGroup F₂]
    [Module A F₀] [Module A F₁] [Module A F₂]
    [Module.Free A F₀] [Module.Free A F₁] [Module.Free A F₂]
    [Module.Finite A F₀] [Module.Finite A F₁] [Module.Finite A F₂]
    (f : F₀ →ₗ[A] F₁) (g : F₁ →ₗ[A] F₂) (hgf : g.comp f = 0)
    (hresidue : ∀ y : F₁, g y ∈ maximalIdeal A • (⊤ : Submodule A F₂) →
      ∃ x : F₀, y - f x ∈ maximalIdeal A • (⊤ : Submodule A F₁)) :
    LinearMap.range f = LinearMap.ker g := by
  sorry

/-- A residue-zero differential condition detects minimality in a field. -/
theorem minimal_iff_zero_differentials_over_field
    {K : Type u} [Field K] (P : Cpx K) :
    IsMinimal P ↔ ∀ i : ℤ, P.d i (i + 1) = 0 := by
  sorry

example {R : Type u} [CommRing R] [IsLocalRing R] :
    IsMinimal (0 : Cpx R) := by
  sorry

example {R : Type u} [CommRing R] [IsLocalRing R] (i : ℤ) :
    IsMinimal ((HomologicalComplex.single (ModuleCat R) (ComplexShape.up ℤ) i).obj
      (ModuleCat.of R R)) := by
  sorry

example {R : Type u} [CommRing R] [IsLocalRing R] (P : Cpx R) (i : ℤ)
    (x : P.X i) (hunit : (P.d i (i + 1)).hom x ∉
      maximalIdeal R • (⊤ : Submodule R (P.X (i + 1)))) : ¬ IsMinimal P := by
  sorry

/-- The identity disk over a field has a unit differential and is not minimal. -/
example (K : Type u) [Field K] :
    let S := (HomologicalComplex.single (ModuleCat K) (ComplexShape.up ℤ) 0)
    ¬ IsMinimal (CochainComplex.mappingCone (𝟙 (S.obj (ModuleCat.of K K)))) := by
  sorry

/-- A DVR uniformizer disk is minimal in cochain degrees -1 and zero. -/
example (R : Type u) [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    (π : R) (hπ : Irreducible π) :
    let S := (HomologicalComplex.single (ModuleCat R) (ComplexShape.up ℤ) 0)
    IsMinimal (CochainComplex.mappingCone
      (S.map (ModuleCat.ofHom (LinearMap.mul R R π)))) := by
  sorry

-- The differential of the rational 2-disk dual is +2; its bidual is -2.
example : (-1 : ℚ) ^ ((-1 : ℤ) + 1) * 2 = 2 := by
  sorry

-- Signed bidual evaluation is +1 in degree zero and -1 in degree one.
example : (-2 : ℚ) * 1 = (-1) * 2 := by
  sorry

-- Unsigned evaluation does not satisfy that chain equation in characteristic zero.
example : (-2 : ℚ) * 1 ≠ 1 * 2 := by
  sorry

-- The source cross differential is -1, the target is +1, and the signed map is diagonal.
example :
    (!![(0 : ℚ), 0; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) * !![-1, 0; 0, 1] =
      !![-1, 0; 0, 1] * !![(0 : ℚ), 0; -1, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> norm_num [Matrix.mul_apply, Fin.sum_univ_two]

-- An unsigned comparison fails the same chain equation.
example :
    (!![(0 : ℚ), 0; 1, 0] : Matrix (Fin 2) (Fin 2) ℚ) * (1 : Matrix (Fin 2) (Fin 2) ℚ) ≠
      (1 : Matrix (Fin 2) (Fin 2) ℚ) * !![(0 : ℚ), 0; -1, 0] := by
  intro h
  have hentry := congrArg (fun m : Matrix (Fin 2) (Fin 2) ℚ => m 1 0) h
  norm_num at hentry

-- In characteristic two the same signs agree, so it cannot detect this error.
example : (-1 : ZMod 2) = 1 := by
  sorry

/-! ## Layer 8: Simultaneous finite coefficient selection -/

/-- A finite-ring germ has its unique ultrafilter-large value; principal ultrafilters are allowed. -/
theorem finite_germ_equivalence (F : Ultrafilter ℕ)
    (B : Type u) [CommRing B] [Finite B] :
    ∃ e : Filter.Germ (F : Filter ℕ) B ≃+* B,
      (∀ b : B, e (Filter.Germ.const b) = b) ∧
      (∀ f : ℕ → B, ∀ᶠ n in (F : Filter ℕ),
        f n = e (Filter.Germ.ofFun f)) := by
  sorry

/-! ## Layer 9: Codimension, canonical duality and support transport -/

/-- Complex support is the union of the supports of its native cohomology modules. -/
def derivedSupport {R : Type u} [CommRing R] (C : Der R) : Set (PrimeSpectrum R) :=
  ⋃ i : ℤ, Module.support R (H i C)

/-- The cohomology annihilator uses an intersection, not a sum or the derived-action kernel. -/
def cohomologyAnnihilator {R : Type u} [CommRing R] (C : Der R) : Ideal R :=
  ⨅ i : ℤ, Module.annihilator R (H i C)

/-- Over a regular local ring, a nonzero finite-projective interval has support of codimension at most its width. -/
theorem codimension_amplitude_inequality
    {R : Type u} [CommRing R] [IsRegularLocalRing R]
    (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (P : Cpx R)
    (hbound : ∀ i, i < a ∨ a + l < i → IsZero (P.X i))
    (hfinite : ∀ i, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i))
    (e : DerivedCategory.Q.obj P ≅ C) :
    ∃ p : PrimeSpectrum R, p ∈ derivedSupport C ∧
      (n - l : WithBot ℕ∞) ≤ ringKrullDim (R ⧸ p.asIdeal) := by
  sorry

/-- The matching support upper bound forces concentration in the last degree. -/
theorem balanced_dimension_concentration
    {R : Type u} [CommRing R] [IsRegularLocalRing R]
    (C : Der R) (n l : ℕ) (a : ℤ)
    (hdim : ringKrullDim R = (n : WithBot ℕ∞)) (hl : l ≤ n)
    (hC : ¬ IsZero C) (P : Cpx R)
    (hbound : ∀ i, i < a ∨ a + l < i → IsZero (P.X i))
    (hfinite : ∀ i, Module.Finite R (P.X i) ∧ Module.Projective R (P.X i))
    (e : DerivedCategory.Q.obj P ≅ C)
    (hsupport : ∀ p ∈ derivedSupport C,
      ringKrullDim (R ⧸ p.asIdeal) ≤ (n - l : WithBot ℕ∞)) :
    (∀ i : ℤ, i ≠ a + l → IsZero (H i C)) ∧ ¬ IsZero (H (a + l) C) := by
  sorry

example {R : Type u} [CommRing R] : derivedSupport (0 : Der R) = ∅ := by
  sorry

example {R : Type u} [CommRing R] (I : Ideal R) (i : ℤ) :
    derivedSupport ((DerivedCategory.singleFunctor (ModuleCat R) i).obj
      (ModuleCat.of R (R ⧸ I))) = PrimeSpectrum.zeroLocus I := by
  sorry

example {R : Type u} [CommRing R] (C D : Der R) :
    derivedSupport (C ⊞ D) = derivedSupport C ∪ derivedSupport D := by
  sorry

example {R : Type u} [CommRing R] :
    cohomologyAnnihilator (0 : Der R) = ⊤ := by
  sorry

example {R : Type u} [CommRing R] (I : Ideal R) (i : ℤ) :
    cohomologyAnnihilator ((DerivedCategory.singleFunctor (ModuleCat R) i).obj
      (ModuleCat.of R (R ⧸ I))) = I := by
  sorry

example {R : Type u} [CommRing R] (C D : Der R) :
    cohomologyAnnihilator (C ⊞ D) =
      cohomologyAnnihilator C ⊓ cohomologyAnnihilator D := by
  sorry

/-
README definitions requiring the stated further carriers or substantial constructions:

Layer 1: ordinary adic Rees quotient and homogeneous module adapters, initial ideal,
labelled local/Artinian/complete coefficient adapters and Cohen choices and residue actions, nilpotent
and square-zero extensions, truncation tower, relative coefficient cotangent space,
residue-extension and coefficient-hull choices, complete-local tensor adapter,
formal smoothness lift adapter, local completion maps and regular-source squares, pro-Hom comparison and parameter quotient system.

Layer 2: relative minimal presentation, relation space, full-socle obstruction interface, relation obstruction and its
universal Artinian test, finite matrix equation algebra, continuous framed functor,
principal-unit orbit functor and its hull.

Layer 3: regular-sequence ideal and local complete-intersection presentation adapter and conormal comparisons,
bounded Hom subcomplex and stable quotient, residue acyclic closure with graded Lie square
operations and its PBW/Yoneda comparison, stable residue injection, depth_shortExact from residue Ext, finite resolution/depth comparison, top local-cohomology tensor comparison, explicit Cohen-presentation and noncomplete bounded-complex duality comparisons and canonical CM dual, canonical module with its regular-presentation Ext and regular-quotient comparisons, Gorenstein predicate,
type, graded Hilbert
polynomial and intrinsic/ambient multiplicities, Koszul parameter Euler comparison, superficial reductions and normalization descent for multiplicity one,
F-finiteness and local-locus adapters, total jets, shifted jet multiplication,
plane-curve postulation defect and quotient length comparisons.

Layer 4: algebraic/valued point comparison, generic formal smoothness and regular
power-series generic fibres, separable coefficient DVR construction and Artinian jet-coordinate
comparison for diagonal completions (finite algebraic differential rank), pointed diagonal tensor coordinates,
geometric component and torsion-free specialization comparisons.

Layer 5: Betti-number balance, finite decorated patch data, cofinal cutoff category,
limit presentation, simultaneous ring/module patch datum, characteristic-zero
cotangent patch datum, Sylow projectivity and norm/dual comparisons.

Layer 6: componentwise support, maximal coefficient-flat quotient, connectedness
dimension and arithmetic rank adapters, generic/special component correspondence,
specialization cycles, completed component products, determinant trivialization and CI parafactoriality.

Layer 7: native Tor indexing, finite-order pseudo-coherent comparisons, complete flat basis and continuous matrix
comparison, complete flat minimal retracts, signed dual functor,
E/O dual, strict tower action and quotient action,
finite derived Hom completion, derived action and isolated block comparison,
coefficient spectral sequence, its finite abutment filtration and derived right edge.

Layer 8: based matrix complex presentation, finite germ evaluation construction,
finite complex patch datum, paired patch datum, finite decorated coefficient types,
complete simultaneous patch, genuine derived deformation lift, augmentation and
paired comparison, finite-cutoff cohomology-action patch datum with actions on every framing quotient
and original-level kernel containment.

Layer 9: complex dimension and Fitting comparison, patched CM functor and finite-action canonical duality,
spectral deformation support, generic and special action blocks, local length
defect, normalization coefficient and derived divisor length comparison, paired
support transport and localized derived specialization; its coheight-one inversion
comparison assumes that the uniformizer lies outside the coefficient prime.
-/

end TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra
