import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCeti.NumberTheory.ModularForms.Newforms.NumberField
import TauCeti.Algebra.Module.Torsion.TateModule

/-!
# Abelian varieties of GL₂-type: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These are suggested forms of light definitions and theorem statements over
Mathlib `6b7abb3` and Tau Ceti `a91d3aa`. The README specifies every target, including
regular actions on powers, primitivity, modular Jacobians, Tate components and automorphy.

Rational endomorphisms use the tensor product of the native endomorphism ring. Dimension
uses the native tangent space and `AbelianVariety.finrank_tangentSpace_eq_dim`. Cohomology
uses canonical continuous cohomology with discrete, trivial-action unit coefficients.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct NumberField

attribute [local instance] CategoryTheory.Over.cartesianMonoidalCategory

namespace TauCeti.GL2Type

abbrev Qbar := AlgebraicClosure ℚ
abbrev GQ := Field.absoluteGaloisGroup ℚ
abbrev AVQ := TauCeti.AlgebraicGeometry.AbelianVariety ℚ

/-- Rationalization of the actual ring of endomorphisms. -/
abbrev End0 {K : Type} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :=
  ℚ ⊗[ℤ] TauCeti.AlgebraicGeometry.AbelianVariety.End A

/-- Simplicity over ℚ, spelled with actual closed subgroup varieties.
The positive-dimension condition excludes the trivial variety. -/
def IsSimpleOverQ (A : AVQ) : Prop :=
  A.dim ≠ 0 ∧ ∀ (B : AVQ) (f : B ⟶ A),
    _root_.AlgebraicGeometry.IsClosedImmersion
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f) →
    B.dim = 0 ∨ _root_.AlgebraicGeometry.Surjective
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f)

/-- Geometric points with the additive form of the native group-scheme law. -/
abbrev geometricPoints (A : AVQ) :=
  Additive ((CategoryTheory.Over.mk
    (_root_.AlgebraicGeometry.Spec.map (CommRingCat.ofHom (algebraMap ℚ Qbar)))) ⟶ A.toOver)

open scoped MonObj in
instance (A : AVQ) : AddCommGroup (geometricPoints A) :=
  inferInstanceAs (AddCommGroup (Additive (_ ⟶ A.toOver)))

open scoped MonObj in
/-- The action on geometric points is precomposition by the automorphism of Spec ℚ̄. -/
def pointGalois (A : AVQ) (σ : GQ) : geometricPoints A →+ geometricPoints A :=
  MonoidHom.toAdditive
    (((CategoryTheory.yonedaGrpObj A.toOver).map
      (CategoryTheory.Over.homMk
        (_root_.AlgebraicGeometry.Spec.map (CommRingCat.ofHom σ.toRingHom)) (by
          rw [← _root_.AlgebraicGeometry.Spec.map_comp]
          congr 1
          ext x
          exact σ.commutes x)).op).hom)

/-- The rational Tate module of the actual geometric point group. -/
abbrev rationalTateModule (A : AVQ) (ℓ : ℕ) [Fact ℓ.Prime] :=
  ℚ_[ℓ] ⊗[ℤ_[ℓ]] TauCeti.TateModule ℓ (geometricPoints A)

/-- Galois acts on the rational Tate module through its action on every torsion level. -/
def rationalTateAction (A : AVQ) (ℓ : ℕ) [Fact ℓ.Prime] (σ : GQ) :
    Module.End ℚ_[ℓ] (rationalTateModule A ℓ) :=
  (TauCeti.TateModule.mapLinearMap (p := ℓ) (pointGalois A σ)).baseChange ℚ_[ℓ]

/-- Arithmetic Frobenius at a prime of the algebraic integers reduces to the p-power map. -/
def IsArithmeticFrobenius (p : ℕ) (σ : GQ) : Prop :=
  ∃ P : Ideal (integralClosure ℤ Qbar), P.IsMaximal ∧
    (p : integralClosure ℤ Qbar) ∈ P ∧
    ∀ x : integralClosure ℤ Qbar,
      (⟨σ.toAlgHom x, (x.property.map (σ.toAlgHom.restrictScalars ℤ))⟩ : integralClosure ℤ Qbar) - x ^ p ∈ P

/-- A newform realizes A when its conjugate Euler polynomials are the Tate characteristic
polynomials outside one finite set, for every auxiliary prime and every Frobenius lift. -/
def HasNewformRealization (A : AVQ) {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) : Prop :=
  letI := TauCeti.numberField_CoefficientField f (by norm_num)
  ∃ S : Finset ℕ, ∀ (ℓ : ℕ) [Fact ℓ.Prime],
    ∃ b : Module.Basis (Fin (2 * Module.finrank ℚ A.TangentSpace))
      ℚ_[ℓ] (rationalTateModule A ℓ),
    ∀ (p : ℕ) (hp : p.Prime) (hpN : p.Coprime N),
      p ∉ S → p ≠ ℓ → ∀ σ : GQ, IsArithmeticFrobenius p σ →
      (Matrix.charpoly (LinearMap.toMatrix b b (rationalTateAction A ℓ σ))).map
          (algebraMap ℚ_[ℓ] (AlgebraicClosure ℚ_[ℓ])) =
        ∏ τ : TauCeti.CoefficientField f →ₐ[ℚ] AlgebraicClosure ℚ_[ℓ],
          (Polynomial.X ^ 2 - Polynomial.C
            (τ ⟨(UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p,
              TauCeti.coeff_mem_CoefficientField f ⟨p, hp.pos⟩⟩) * Polynomial.X +
            Polynomial.C (τ ⟨(f.χ (ZMod.unitOfCoprime p hpN) : ℂ),
              TauCeti.char_mem_CoefficientField f _⟩ * (p : AlgebraicClosure ℚ_[ℓ])))

/-- A geometric elliptic abelian variety is a ℚ-curve if each scalar conjugate is isogenous. -/
def IsGeometricQCurve (C : TauCeti.AlgebraicGeometry.AbelianVariety Qbar) : Prop :=
  C.dim = 1 ∧ ∀ σ : GQ,
    ∃ φ : (@TauCeti.AlgebraicGeometry.AbelianVariety.baseChange Qbar _ C Qbar _
      σ.toRingHom.toAlgebra) ⟶ C,
      TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ

/-- Every simple GL₂-type variety has a weight-two newform with its full rational
endomorphism algebra and all good Frobenius characteristic polynomials. -/
theorem modularityTheorem (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) :
    ∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 2),
      Nonempty (TauCeti.CoefficientField f ≃ₐ[ℚ] End0 A) ∧
        HasNewformRealization A f := sorry

/-- Every GL₂-type variety is isogenous to a finite power of a simple variety realized
by a weight-two newform; oldforms give its modular Jacobian quotient. -/
theorem modularityTheorem_general (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim) :
    ∃ (B : AVQ) (n : ℕ), 0 < n ∧ IsSimpleOverQ B ∧
      (∃ (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 2),
        Nonempty (TauCeti.CoefficientField f ≃ₐ[ℚ] End0 B) ∧ HasNewformRealization B f) ∧
      ∃ φ : piObj (fun _ : Fin n => B) ⟶ A,
        TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ := sorry

/-- Every non-CM geometric ℚ-curve is a factor of a simple GL₂-type variety over ℚ,
whose geometric base change is isogenous to the corresponding power of the curve. -/
theorem ribetTheorem61 (C : TauCeti.AlgebraicGeometry.AbelianVariety Qbar)
    (hC : IsGeometricQCurve C) (nonCM : Nonempty (ℚ ≃ₐ[ℚ] End0 C)) :
    ∃ A : AVQ, IsSimpleOverQ A ∧
      (∃ (E : Type) (_ : Field E) (_ : NumberField E),
        Nonempty (E ≃ₐ[ℚ] End0 A) ∧
          (Module.finrank ℚ E : WithBot ℕ∞) = A.dim) ∧
      ∃ φ : A.baseChange Qbar ⟶
        piObj (fun _ : Fin (Module.finrank ℚ A.TangentSpace) => C),
        TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ := sorry

/-- A non-CM geometric ℚ-curve is a factor of a rational variety realized by a
weight-two newform, with a geometric isogeny to a power of the curve. -/
theorem qCurvesGeometricallyModular (C : TauCeti.AlgebraicGeometry.AbelianVariety Qbar)
    (hC : IsGeometricQCurve C) (nonCM : Nonempty (ℚ ≃ₐ[ℚ] End0 C)) :
    ∃ (A : AVQ) (N : ℕ) (_ : NeZero N) (f : HeckeRing.GL2.Newform N 2),
      IsSimpleOverQ A ∧ Nonempty (TauCeti.CoefficientField f ≃ₐ[ℚ] End0 A) ∧
      HasNewformRealization A f ∧
      ∃ φ : A.baseChange Qbar ⟶
        piObj (fun _ : Fin (Module.finrank ℚ A.TangentSpace) => C),
        TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ := sorry

/-- The canonical map of integral endomorphisms into the rational tensor product. -/
def integralEnd (A : AVQ) (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A) : End0 A :=
  1 ⊗ₜ[ℤ] a

/-- A zero-dimensional variety fails the positive-dimension condition for simplicity. -/
theorem not_isSimpleOverQ_of_dim_zero (A : AVQ) (h : A.dim = 0) :
    ¬ IsSimpleOverQ A := fun hA => hA.1 h

/-- Equality of rational actions after clearing a common denominator. This uses native
homomorphisms and composition, whose pointwise additive law is written multiplicatively
in the native category; no Preadditive instance is imposed on its hom-sets. -/
def EEquivariant {A B : AVQ} {E : Type} [Field E] [Algebra ℚ E]
    (ιA : E →ₐ[ℚ] End0 A) (ιB : E →ₐ[ℚ] End0 B) (f : A ⟶ B) : Prop :=
  ∀ x : E, ∃ (n : ℤ) (_hn : n ≠ 0)
    (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (b : TauCeti.AlgebraicGeometry.AbelianVariety.End B),
    integralEnd A a = (n : ℚ) • ιA x ∧ integralEnd B b = (n : ℚ) • ιB x ∧
    TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a ≫ f =
      f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom b

/-- Stability of a subgroup under a rational field action, with nonzero denominators. -/
def IsStable {A B : AVQ} {E : Type} [Field E] [Algebra ℚ E]
    (ι : E →ₐ[ℚ] End0 A) (f : B ⟶ A) : Prop :=
  ∀ x : E, ∃ (n : ℤ) (_hn : n ≠ 0)
    (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (b : TauCeti.AlgebraicGeometry.AbelianVariety.End B),
    integralEnd A a = (n : ℚ) • ι x ∧
    f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a =
      TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom b ≫ f

/-- The dimension of any acting finite-dimensional division ℚ-algebra divides
that of the native tangent space. -/
theorem lieAlgebraDivisibility (A : AVQ) {D : Type} [DivisionRing D] [Algebra ℚ D]
    [FiniteDimensional ℚ D] (ι : D →ₐ[ℚ] End0 A) :
    Module.finrank ℚ D ∣ Module.finrank ℚ A.TangentSpace := sorry

/-- A nonzero stable abelian subvariety of a GL₂-type variety is the whole variety. -/
theorem stable_subvariety_surjective {A B : AVQ} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (f : B ⟶ A)
    (hf : _root_.AlgebraicGeometry.IsClosedImmersion
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f))
    (hB : B.dim ≠ 0) (hst : IsStable ι f) :
    _root_.AlgebraicGeometry.Surjective
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f) := sorry

/-! ## Layer GT.1: endomorphism algebras -/

/-! GT.1/primitive. The underlying power is a native finite product.
The regular field action uses a chosen basis; primitivity is specified in README.md. -/

def power (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E] : AVQ :=
  piObj (fun _ : Fin (Module.finrank F E) => B)

/-- Regular multiplication in the chosen basis is realized by a rational E-action
whose integral matrix entries agree after a common nonzero denominator is cleared. -/
theorem powerAction (B : AVQ) {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] [IsScalarTower ℚ F E]
    (b : Module.Basis (Fin (Module.finrank F E)) F E) (ι : F →ₐ[ℚ] End0 B) :
    ∃ ιE : E →ₐ[ℚ] End0 (power B F E), ∀ x : E,
      ∃ (n : ℤ) (_ : n ≠ 0)
        (a : TauCeti.AlgebraicGeometry.AbelianVariety.End (power B F E)),
        integralEnd (power B F E) a = (n : ℚ) • ιE x ∧
        ∀ i j : Fin (Module.finrank F E),
          integralEnd B (TauCeti.AlgebraicGeometry.AbelianVariety.End.ofHom
            ((Pi.lift (fun k => if k = j then 𝟙 B else
              TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom
                (0 : TauCeti.AlgebraicGeometry.AbelianVariety.End B))) ≫
              TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a ≫
              Pi.π (fun _ : Fin (Module.finrank F E) => B) i)) =
            (n : ℚ) • ι (b.repr (x * b j) i) := sorry

/-- Dimension of the native finite power (GT.1). -/
theorem power_dim (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E]
    [FiniteDimensional F E] :
    (power B F E).dim = (Module.finrank F E : WithBot ℕ∞) * B.dim := sorry

/-! GT.1/ribet-theorem-2-1: field part of the three-way equivalence. -/
/-- For simple GL₂-type A, its given coefficient field is all of End⁰ (Ribet Theorem 2.1). -/
theorem ribetTheorem21 (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : ∃ e : E ≃ₐ[ℚ] End0 A, ∀ x, e x = ι x := sorry

/-! GT.1/endomorphism-field. The underlying ring is canonical. Field transport is
constrained to preserve that Ring; no incompatible global instance is installed. -/
abbrev endField (A : AVQ) := End0 A

/-- The Field structure must preserve the existing native rational ring operations.
A separate arbitrary Field instance on the same type would not satisfy this statement. -/
theorem endField_numberField (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) :
    ∃ field : Field (endField A),
      field.toRing = (inferInstance : Ring (endField A)) ∧
      @NumberField (endField A) field := sorry

/-- The rational endomorphism field has degree equal to the geometric dimension. -/
theorem endField_finrank (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) :
    (Module.finrank ℚ (endField A) : WithBot ℕ∞) = A.dim := sorry

/-- Isogeny conjugation respects the native integral endomorphisms (GT.1). -/
theorem endField_isogeny {A B : AVQ} (f : A ⟶ B)
    (hf : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny f) :
    ∃ e : endField A ≃ₐ[ℚ] endField B,
      ∀ (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A)
        (b : TauCeti.AlgebraicGeometry.AbelianVariety.End B),
      TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a ≫ f =
        f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom b →
      e (integralEnd A a) = integralEnd B b := sorry

/-- The rational endomorphism algebra of an elliptic square is noncommutative. -/
theorem endField_not_simple (B : AVQ) (hd : B.dim = 1) :
    ¬ ∀ x y : End0 (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B), x * y = y * x := sorry

/-! GT.1/totally-real-or-cm: field alternative. The Rosati restriction is specified in the README. -/
theorem totallyRealOrCm (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : NumberField.IsTotallyReal E ∨ NumberField.IsCMField E := sorry

/-! ## Layer GT.2: integral models -/

/- GT.2/integral-model. Integer endomorphisms and the order of E are native rings.
The rational E-action is required to intertwine with the given one. -/
/-- An isogenous native variety with a compatible maximal integral endomorphism action. -/
structure IntegralModel (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) where
  variety : AVQ
  isogeny : A ⟶ variety
  isIsogeny : TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny isogeny
  rationalAction : E →ₐ[ℚ] End0 variety
  equivariant : EEquivariant ι rationalAction isogeny
  integralAction : 𝓞 E ≃+* TauCeti.AlgebraicGeometry.AbelianVariety.End variety
  extendsIntegral : ∀ x : 𝓞 E,
    integralEnd variety (integralAction x) = rationalAction (x : E)

/-- Existence of a maximal-order integral model for a simple GL₂-type variety (GT.2). -/
theorem integralModel (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : Nonempty (IntegralModel A ι) := sorry

/-- An elliptic square has no isogenous model whose full integral endomorphism
ring is the ring of integers of a number field. -/
theorem integralModel_square_isEmpty (B : AVQ) (h : B.dim = 1)
    {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B)) :
    IsEmpty (IntegralModel (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B) ι) := sorry

/-! ## Layer GT.3: coefficient and Tate-module comparisons -/

/-- Exact good coefficients in a common overfield identify the coefficient field with
the number field generated by the supplied good traces. -/
theorem coefficientIdentification {E L : Type} [Field E] [NumberField E]
    [Field L] [Algebra ℚ L] {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.Newform N 2) (i : E →ₐ[ℚ] L)
    (j : TauCeti.CoefficientField f →ₐ[ℚ] L) (a : ℕ → E) (S : Finset ℕ)
    (hgen : IntermediateField.adjoin ℚ
      {x : E | ∃ p : ℕ, p.Prime ∧ p ∉ S ∧ p.Coprime N ∧ x = a p} = ⊤)
    (hcoeff : ∀ (p : ℕ) (hp : p.Prime) (hpN : p.Coprime N), p ∉ S →
      j ⟨(UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p,
        TauCeti.coeff_mem_CoefficientField f ⟨p, hp.pos⟩⟩ = i (a p)) :
    ∃ e : TauCeti.CoefficientField f ≃ₐ[ℚ] E,
      (∀ x, i (e x) = j x) ∧ ∀ (p : ℕ) (hp : p.Prime) (hpN : p.Coprime N),
        p ∉ S → e ⟨(UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff p,
          TauCeti.coeff_mem_CoefficientField f ⟨p, hp.pos⟩⟩ = a p := sorry

/-- Two native varieties realized by the same newform have isomorphic rational Tate
representations at every auxiliary prime. -/
theorem tateModuleComparison (A B : AVQ) {N : ℕ} [NeZero N]
    (f : HeckeRing.GL2.Newform N 2)
    (hA : HasNewformRealization A f) (hB : HasNewformRealization B f)
    (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ e : rationalTateModule A ℓ ≃ₗ[ℚ_[ℓ]] rationalTateModule B ℓ,
      ∀ (σ : GQ) (v : rationalTateModule A ℓ),
        e (rationalTateAction A ℓ σ v) = rationalTateAction B ℓ σ (e v) := sorry

/-- A simple GL₂-type variety with totally real rational endomorphisms is realized
by a newform with trivial nebentypus. -/
theorem trivialCharacter (A : AVQ) {E : Type} [Field E] [NumberField E]
    [NumberField.IsTotallyReal E] (ι : E →ₐ[ℚ] End0 A)
    (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim) (hs : IsSimpleOverQ A)
    {N : ℕ} [NeZero N] (f : HeckeRing.GL2.Newform N 2)
    (hf : HasNewformRealization A f)
    (hfield : Nonempty (TauCeti.CoefficientField f ≃ₐ[ℚ] End0 A)) : f.χ = 1 := sorry

end TauCeti.GL2Type

namespace TauCeti.EllipticCurve
open TauCeti.GL2Type

/-! ## Layer GT.5: geometric ℚ-curves -/

/- GT.5/q-curve: actual nonsingular curves and actual conjugate isogenies.
Conjugation is coefficientwise WeierstrassCurve.map; map_id/map_map and
TauCeti.Isogeny.map_id/map_map supply coherence, not extra axiomatic fields. -/
/-- Every geometric Galois conjugate is isogenous to the original elliptic curve. -/
def IsQCurve (C : WeierstrassCurve Qbar) [C.IsElliptic] : Prop :=
  ∀ σ : GQ, Nonempty (TauCeti.Isogeny (C.map σ.toRingHom) C)

/-- The geometric ℚ-curve condition is invariant under isogeny. -/
theorem IsQCurve.of_isogeny {C D : WeierstrassCurve Qbar} [C.IsElliptic] [D.IsElliptic]
    (φ : TauCeti.Isogeny C D) (h : IsQCurve C) : IsQCurve D := sorry

/-- Every Galois conjugate of a ℚ-curve is a ℚ-curve. -/
theorem IsQCurve.conj {C : WeierstrassCurve Qbar} [C.IsElliptic]
    (h : IsQCurve C) (σ : GQ) : IsQCurve (C.map σ.toRingHom) := sorry

/-- Rational-model constructor on the actual native base change. -/
theorem IsQCurve.of_rational_model (W : WeierstrassCurve ℚ) [W.IsElliptic] :
    IsQCurve (W.map (algebraMap ℚ Qbar)) := sorry

/-- Rational-j constructor, using pinned WeierstrassCurve.exists_variableChange_of_j_eq. -/
theorem IsQCurve.of_rat (C : WeierstrassCurve Qbar) [C.IsElliptic]
    (hj : ∃ r : ℚ, algebraMap ℚ Qbar r = C.j) : IsQCurve C := sorry

/-- A finite Galois field contains the coefficients of a model and all needed isogenies.
Equality of base change fixes the actual model; no conjugation functor is assumed. -/
theorem IsQCurve.isogenies_over_galois (C : WeierstrassCurve Qbar) [C.IsElliptic]
    (h : IsQCurve C) (K₀ : IntermediateField ℚ Qbar) [FiniteDimensional ℚ K₀] :
    ∃ K : IntermediateField ℚ Qbar, K₀ ≤ K ∧ FiniteDimensional ℚ K ∧ IsGalois ℚ K ∧
      ∃ W : WeierstrassCurve K, W.IsElliptic ∧ W.map K.val = C ∧
        ∀ σ : K ≃ₐ[ℚ] K, Nonempty (TauCeti.Isogeny (W.map σ.toRingHom) W) := sorry

/-- Native Weierstrass model of X₀(11); its modular interpretation uses ModularCurvesPartII Layer 16. -/
def X0_11_model : WeierstrassCurve ℚ :=
  { a₁ := 0, a₂ := -1, a₃ := 1, a₄ := -10, a₆ := -20 }
instance : X0_11_model.IsElliptic := by
  refine ⟨?_⟩
  norm_num [X0_11_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

/-- A concrete CM curve, with its nonsingularity on the actual Mathlib carrier. -/
def Gaussian_model : WeierstrassCurve ℚ :=
  { a₁ := 0, a₂ := 0, a₃ := 0, a₄ := -1, a₆ := 0 }
instance : Gaussian_model.IsElliptic := by
  refine ⟨?_⟩
  norm_num [Gaussian_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

end TauCeti.EllipticCurve

namespace TauCeti.QCurve
open TauCeti.GL2Type

/-- Scalar extraction uses the geometric non-CM identification of the actual End⁰ ring. -/
def rationalScalar {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (nonCM : ℚ ≃ₐ[ℚ] End0 A) (u : (End0 A)ˣ) : ℚˣ :=
  Units.map nonCM.symm.toMonoidHom u

/-! The coefficient action here is TRIVIAL, including on algebraic units.
It is distinct from the natural Galois action on ℚ̄. These local instances are
fixed inside the resulting TopRep. Their topology is discrete. -/
section UnitCoefficients
variable (F : Type) [Field F]
local instance : TopologicalSpace (Additive Fˣ) := ⊥
local instance : DiscreteTopology (Additive Fˣ) := ⟨rfl⟩
local instance : DistribMulAction GQ (Additive Fˣ) where
  smul _ x := x
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
  smul_zero _ := rfl
  smul_add _ _ _ := rfl
local instance : SMulCommClass GQ ℤ (Additive Fˣ) := ⟨fun _ _ _ => rfl⟩
local instance : ContinuousSMul ℤ (Additive Fˣ) := ⟨continuous_of_discreteTopology⟩
local instance : ContinuousSMul GQ (Additive Fˣ) := ⟨continuous_snd⟩

/-- Discrete multiplicative units, additively presented with trivial Galois action. -/
def trivialUnitsCoefficients : TopRep ℤ GQ :=
  TauCeti.ofDiscreteModule ℤ GQ (Additive Fˣ)

/-- Canonical continuous degree-two cohomology of the discrete trivial unit module. -/
abbrev unitCohomology2 : TopModuleCat ℤ :=
  continuousCohomology 2 (trivialUnitsCoefficients F)

end UnitCoefficients
end TauCeti.QCurve

namespace TauCeti.GL2Type

/-- Ribet Theorem 6.3: trivial-action H² of discrete algebraic units vanishes. -/
theorem tateVanishingQbar (x : TauCeti.QCurve.unitCohomology2 Qbar) : x = 0 := sorry

/-! ## Layer GT.6: character twists -/

/- GT.6/twisting-lemma. The finite-order character acts on the Hom line in the
same convention as the displayed scalar twist. -/
/-- Isomorphic irreducible restrictions of positive finite rank differ by a finite character.
This extends GL2AutomorphicRepresentationsAndTransfer R17.6.18's rank-two export
`TauCeti.GL2Transfer.compatible_descent_twist`: take `r = ρ₂`, `s = ρ₁` and the same
H-intertwiner P, so its character is ψ. Openness of H makes the quotient character
continuous. The extension to arbitrary positive rank belongs to GT.6; the common
twist across coefficient primes and automorphic descent belong to R17.6.18. -/
theorem twistingLemma {G : Type} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (H : Subgroup G) [H.Normal]
    (hH : IsOpen (H : Set G)) {L : Type} [Field L] [IsAlgClosed L] [CharZero L]
    [TopologicalSpace L] [IsTopologicalRing L] {n : ℕ} (hn : 0 < n) (ρ₁ ρ₂ : G →* GL (Fin n) L)
    (hc₁ : Continuous ρ₁) (hc₂ : Continuous ρ₂)
    (hiso : ∃ P : GL (Fin n) L, ∀ g ∈ H,
      (ρ₂ g : Matrix (Fin n) (Fin n) L) =
        (P : Matrix (Fin n) (Fin n) L) * (ρ₁ g : Matrix (Fin n) (Fin n) L) *
        ((P⁻¹ : GL (Fin n) L) : Matrix (Fin n) (Fin n) L))
    (hirr : ∀ W : Submodule L (Fin n → L),
      (∀ g ∈ H, ∀ v ∈ W, (ρ₁ g : Matrix (Fin n) (Fin n) L).mulVec v ∈ W) →
      W = ⊥ ∨ W = ⊤) :
    ∃ ψ : G →* Lˣ, Continuous ψ ∧ Set.Finite (Set.range ψ) ∧
      (∀ g ∈ H, ψ g = 1) ∧ ∃ P : GL (Fin n) L, ∀ g : G,
      (ρ₂ g : Matrix (Fin n) (Fin n) L) =
        (ψ g : L) • ((P : Matrix (Fin n) (Fin n) L) * (ρ₁ g : Matrix (Fin n) (Fin n) L) *
        ((P⁻¹ : GL (Fin n) L) : Matrix (Fin n) (Fin n) L)) := sorry
end TauCeti.GL2Type

/-
README targets whose full carriers or constructions require the stated supplier interfaces:
GT.1: power_basis_indep, IsPrimitive, IsPrimitive.of_isogeny,
isPrimitive_iff_isSimple, endField_equiv, endField_isGL2Type, endField_involution,
modularQuotientIsGl2Type; functoriality of the derivative action. IsStable and
stable_subvariety_surjective use nonzero denominators above.
GT.2: integralModel_end, residualRep, residualRep_finrank, residualRep_charpoly,
residualRep_ss_indep, frobeniusPolynomial, determinantCharacter, odd,
absoluteIrreducibility, coefficientConjugation, coefficientsGenerate, innerTwistField,
residualIrreducibility, conductorBound, crystallineAtGoodPrimes.
The residualRep notation specializes ArithmeticGaloisRepresentations §6.4's actual
λ-torsion action to IntegralModel.variety. In residualRep_elliptic the integral
model is the original elliptic curve; the comparison is with that owner's §6.1
TateModule.residualRep on geometric torsion, before a basis is chosen. Changing
the integral model preserves the semisimplification.
GT.3: AbelianVariety.IsModularOfLevel, AbelianVariety.IsModular,
AbelianVariety.IsModularOfLevel.mono, AbelianVariety.IsModular.of_isogeny,
AbelianVariety.IsModular.quotient, AbelianVariety.isModular_iff,
AbelianVariety.IsModularOfLevel.gamma0, AbelianVariety.IsModular.elliptic;
serreWitnesses, fixedNewform,
modularityEquivalences, simpleQuotientsCharacterisation,
modularParametrisation.
serreWitnesses uses AlgebraicModularFormsAndSerreWeights R15.6's shared
TauCeti.ResidualModularity.ArisesFrom and ArisesFrom.iff_integral_model after
extension to a common algebraic residue field. Absolute irreducibility identifies
the given residual representation with the semisimple reduction. Witness existence
is supplied by ClassicalSerreModularity R27.6.
GT.4: conductorOfGl2Type, exactLevel, strictCompatibility, lFunction, parentCompatibility.
parentCompatibility uses EllipticCurves Layers 3–4 and 4.5a for minimal-model
discriminants, projective point counts and the semistable conductor. The elliptic
conductor comparison and IsNewformOf.level_eq_conductor are supplied by
EllipticCurveModularity R29.4; its R29.3 newformOf has that exact level. The
squarefree bad-prime formula requires semistability, whereas parentCompatibility
allows arbitrary elliptic reduction.
GT.5: EllipticCurve.IsQCurve.of_cm, IsQCurve.not_of_squared_traces;
QCurve.cocycle, QCurve.cocycle_isCocycle, QCurve.cocycleClass, QCurve.cocycleClass_indep,
QCurve.cocycle_sq, QCurve.cocycleClass_of_rat, QCurve.cocycle_rational,
QCurve.cocycle_quadratic, QCurve.cocycle_twist_after_extension, QCurve.cocycle_cm_excluded;
restrictionOfScalarsEndomorphisms, lieFreeRankOne,
quadraticQCurves, and the geometric splitting map α.
GT.6: qCurveGaloisModularity, qCurveAutomorphy, quadraticQCurvesModular.
The explicit Jacobian and regular-action checks use GL2Type.power_degree_one,
GL2Type.power_not_primitive, GL2Type.J0_23_primitive, GL2Type.endField_J0_23,
GL2Type.endField_J1_13, GL2Type.residualRep_elliptic, GL2Type.residualRep_det,
GL2Type.residualRep_not_A_l, IsModular.X0_11, IsModular.zero,
IsModular.J1_13_not_gamma0, IsModular.level_not_minimal in the README.
-/
