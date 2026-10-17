import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.BaseChange.Basic
import TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete.Basic
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation.Comparison
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.AlgebraicGeometry.EllipticCurve.IsomOfJ
import Mathlib.FieldTheory.Galois.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.KrullTopology
import Mathlib.NumberTheory.NumberField.Basic
import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.NumberTheory.NumberField.InfinitePlace.TotallyRealComplex
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.GroupTheory.Solvable
import Mathlib.Tactic.NormNum

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

namespace TauCeti.GL2Type

abbrev Qbar := AlgebraicClosure ℚ
abbrev GQ := Field.absoluteGaloisGroup ℚ
abbrev AVQ := TauCeti.AlgebraicGeometry.AbelianVariety ℚ

/-- Rationalization of the actual ring of endomorphisms. -/
abbrev End0 {K : Type} [Field K] (A : TauCeti.AlgebraicGeometry.AbelianVariety K) :=
  ℚ ⊗[ℤ] TauCeti.AlgebraicGeometry.AbelianVariety.End A

/-- The canonical map of integral endomorphisms into the rational tensor product. -/
def integralEnd (A : AVQ) (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A) : End0 A :=
  1 ⊗ₜ[ℤ] a

#check TauCeti.AlgebraicGeometry.AbelianVariety.finrank_tangentSpace_eq_dim

/-- Simplicity over ℚ, spelled with actual closed subgroup varieties.
The positive-dimension condition excludes the trivial variety. -/
def IsSimpleOverQ (A : AVQ) : Prop :=
  A.dim ≠ 0 ∧ ∀ (B : AVQ) (f : B ⟶ A),
    _root_.AlgebraicGeometry.IsClosedImmersion
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f) →
    B.dim = 0 ∨ _root_.AlgebraicGeometry.Surjective
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f)

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

/-- A nonzero stable abelian subvariety of a GL₂-type variety is the whole variety. -/
theorem stable_subvariety_surjective {A B : AVQ} {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (f : B ⟶ A)
    (hf : _root_.AlgebraicGeometry.IsClosedImmersion
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f))
    (hB : B.dim ≠ 0) (hst : IsStable ι f) :
    _root_.AlgebraicGeometry.Surjective
      (TauCeti.AlgebraicGeometry.AbelianVariety.Hom.toSchemeHom f) := sorry

/-- Rational scalars use the native integral multiplication map. -/
example (A : AVQ) : integralEnd A (2 : TauCeti.AlgebraicGeometry.AbelianVariety.End A) =
    (2 : ℚ) • (1 : End0 A) := sorry

example (A : AVQ) : integralEnd A 0 = 0 := sorry

example (A : AVQ) :
    integralEnd A ((2 : TauCeti.AlgebraicGeometry.AbelianVariety.End A) * 3) =
      (6 : ℚ) • (1 : End0 A) := sorry

example (A : AVQ) :
    IsUnit (integralEnd A (2 : TauCeti.AlgebraicGeometry.AbelianVariety.End A)) := sorry

example (A : AVQ) (h : A.dim = 1) : IsSimpleOverQ A := sorry

example (B : AVQ) (h : B.dim = 1) :
    ¬ IsSimpleOverQ (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B) := sorry

example (B : AVQ) (h : B.dim = 1) :
    Module.finrank ℚ
      (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B).TangentSpace = 2 := sorry

example (A : AVQ) (h : A.dim = 1) : Module.finrank ℚ A.TangentSpace = 1 := sorry

example (A : AVQ) (h : A.dim = 0) : Module.finrank ℚ A.TangentSpace = 0 := sorry

/-- Zero-dimensional varieties fail simplicity. -/
example (A : AVQ) (h : A.dim = 0) : ¬ IsSimpleOverQ A := sorry

/-- The same rational action intertwines the identity morphism. -/
example (A : AVQ) {E : Type} [Field E] [Algebra ℚ E]
    (ι : E →ₐ[ℚ] End0 A) : EEquivariant ι ι (𝟙 A) := sorry

/-- Integer-scalar isogenies intertwine the same rational field action. -/
example (A : AVQ) {E : Type} [Field E] [Algebra ℚ E]
    (ι : E →ₐ[ℚ] End0 A) :
    EEquivariant ι ι
      (TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom
        (2 : TauCeti.AlgebraicGeometry.AbelianVariety.End A)) := sorry

/-- The identity inclusion is stable for every rational field action. -/
example (A : AVQ) {E : Type} [Field E] [Algebra ℚ E]
    (ι : E →ₐ[ℚ] End0 A) : IsStable ι (𝟙 A) := sorry

/-- Rational scalar actions preserve every homomorphism's image. -/
example {A B : AVQ} (f : B ⟶ A) :
    IsStable (Algebra.ofId ℚ (End0 A)) f := sorry

/-- Distinct conjugate actions cannot intertwine the identity. -/
example (A : AVQ) {E : Type} [Field E] [Algebra ℚ E]
    (ι : E →ₐ[ℚ] End0 A) (hι : Function.Injective ι)
    (θ : E ≃ₐ[ℚ] E) (hθ : θ ≠ AlgEquiv.refl) :
    ¬ EEquivariant ι (ι.comp θ.toAlgHom) (𝟙 A) := sorry

/-- Doubling a nonzero denominator preserves the same integral intertwining equation. -/
example {A B : AVQ} {E : Type} [Field E] [Algebra ℚ E]
    (ιA : E →ₐ[ℚ] End0 A) (ιB : E →ₐ[ℚ] End0 B) (f : A ⟶ B)
    (x : E) (n : ℤ) (hn : n ≠ 0)
    (a : TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (b : TauCeti.AlgebraicGeometry.AbelianVariety.End B)
    (ha : integralEnd A a = (n : ℚ) • ιA x)
    (hb : integralEnd B b = (n : ℚ) • ιB x)
    (hf : TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom a ≫ f =
      f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom b) :
    (2 * n : ℤ) ≠ 0 ∧
      integralEnd A (2 * a) = ((2 * n : ℤ) : ℚ) • ιA x ∧
      integralEnd B (2 * b) = ((2 * n : ℤ) : ℚ) • ιB x ∧
      TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom (2 * a) ≫ f =
        f ≫ TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom (2 * b) := sorry

/-! ## Layer GT.1: endomorphism algebras -/

#check Module.finrank_dvd_finrank_right

/-! GT.1/primitive. The underlying power is a native finite product.
The regular field action uses a chosen basis; primitivity is specified in README.md. -/

def power (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E] : AVQ :=
  piObj (fun _ : Fin (Module.finrank F E) => B)

/-- Regular multiplication in the chosen basis acts through the given rational F-action. -/
def powerAction (B : AVQ) {F E : Type} [Field F] [NumberField F]
    [Field E] [NumberField E] [Algebra F E] [IsScalarTower ℚ F E]
    (b : Module.Basis (Fin (Module.finrank F E)) F E) (ι : F →ₐ[ℚ] End0 B) :
    E →ₐ[ℚ] End0 (power B F E) := sorry

/-- For the regular quadratic action in the basis (1, √2), the first factor is unstable. -/
example (B : AVQ) (hB : B.dim = 1) {E : Type} [Field E] [NumberField E]
    (b : Module.Basis (Fin (Module.finrank ℚ E)) ℚ E)
    (i j : Fin (Module.finrank ℚ E)) (hij : i ≠ j)
    (hi : b i = 1) (hj : b j ^ 2 = 2) (hd : Module.finrank ℚ E = 2) :
    ¬ IsStable (powerAction B b (Algebra.ofId ℚ (End0 B)))
      (Pi.lift (fun k => if k = i then 𝟙 B else
        TauCeti.AlgebraicGeometry.AbelianVariety.End.toHom
          (0 : TauCeti.AlgebraicGeometry.AbelianVariety.End B))) := sorry

/-- Dimension of the native finite power (GT.1). -/
theorem power_dim (B : AVQ) (F E : Type) [Field F] [Field E] [Algebra F E]
    [FiniteDimensional F E] :
    (power B F E).dim = (Module.finrank F E : WithBot ℕ∞) * B.dim := sorry

/-- The degree-one power has the original native carrier up to isomorphism. -/
example (B : AVQ) (F : Type) [Field F] : Nonempty (power B F F ≅ B) := sorry

-- test: GL2Type.power_compat_degree_equation (native degree equation)
example (B : AVQ) {F E : Type} [Field F] [NumberField F] [Field E] [NumberField E]
    [Algebra F E] [IsScalarTower ℚ F E] [FiniteDimensional F E]
    (hd : (Module.finrank ℚ F : WithBot ℕ∞) = B.dim) :
    (Module.finrank ℚ E : WithBot ℕ∞) = (power B F E).dim := sorry

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

-- A dimension-one native abelian variety over ℚ has rational endomorphism field.
example (A : AVQ) (hd : A.dim = 1) : Nonempty (endField A ≃ₐ[ℚ] ℚ) := sorry

-- A square of an elliptic curve has noncommutative rational endomorphisms.
example (B : AVQ) (hd : B.dim = 1) :
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

-- test: GL2Type.integralModel_trivial (existence with the SAME native variety)
example (A : AVQ) {E : Type} [Field E] [NumberField E] (ι : E →ₐ[ℚ] End0 A)
    (e : 𝓞 E ≃+* TauCeti.AlgebraicGeometry.AbelianVariety.End A)
    (he : ∀ x : 𝓞 E, integralEnd A (e x) = ι (x : E)) :
    ∃ M : IntegralModel A ι, M.variety = A := sorry

/-- A square of an elliptic variety cannot have a full commutative maximal-order model. -/
example (B : AVQ) (h : B.dim = 1) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B)) :
    IsEmpty (IntegralModel (TauCeti.AlgebraicGeometry.AbelianVariety.prod B B) ι) := sorry

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

example : X0_11_model.Δ = -161051 := by
  norm_num [X0_11_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : ({ X0_11_model with a₃ := 0 } : WeierstrassCurve ℚ).Δ ≠
    X0_11_model.Δ := by
  norm_num [X0_11_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : X0_11_model.c₄ = 496 := sorry

example : X0_11_model.j = (-122023936 / 161051 : ℚ) := sorry

-- test: IsQCurve.rational
example : IsQCurve (X0_11_model.map (algebraMap ℚ Qbar)) := sorry

/-- A concrete CM curve, with its nonsingularity on the actual Mathlib carrier. -/
def Gaussian_model : WeierstrassCurve ℚ :=
  { a₁ := 0, a₂ := 0, a₃ := 0, a₄ := -1, a₆ := 0 }
instance : Gaussian_model.IsElliptic := by
  refine ⟨?_⟩
  norm_num [Gaussian_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : Gaussian_model.Δ = 64 := by
  norm_num [Gaussian_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : ({ Gaussian_model with a₄ := 0 } : WeierstrassCurve ℚ).Δ = 0 := by
  norm_num [Gaussian_model, WeierstrassCurve.Δ, WeierstrassCurve.b₂,
    WeierstrassCurve.b₄, WeierstrassCurve.b₆, WeierstrassCurve.b₈]

example : Gaussian_model.j = (1728 : ℚ) := sorry

-- test: IsQCurve.cm (concrete curve)
example : IsQCurve (Gaussian_model.map (algebraMap ℚ Qbar)) := sorry

-- test: IsQCurve.twist (native quadraticTwistOf with nonzero discriminant)
-- t=0, n=-d/4 has t²-4n=d, so this is the short model twist by d.
example (W : WeierstrassCurve ℚ) [W.IsElliptic] (d : Qbar) (hd : d ≠ 0) :
    ∃ h : ((W.map (algebraMap ℚ Qbar)).quadraticTwistOf 0 (-d / 4)).IsElliptic,
      @IsQCurve ((W.map (algebraMap ℚ Qbar)).quadraticTwistOf 0 (-d / 4)) h := sorry

-- Same test: the two reductions of the √2 twist at 7; unequal traces are allowed.
example :
    1 + (Finset.univ.filter (fun xy : ZMod 7 × ZMod 7 =>
      xy.2 ^ 2 = xy.1 ^ 3 - 9 * xy.1 + 27)).card = 4 ∧
    1 + (Finset.univ.filter (fun xy : ZMod 7 × ZMod 7 =>
      xy.2 ^ 2 = xy.1 ^ 3 - 16 * xy.1 + 64)).card = 12 := by decide
end TauCeti.EllipticCurve

namespace TauCeti.QCurve
open TauCeti.GL2Type

/-- Scalar extraction uses the geometric non-CM identification of the actual End⁰ ring. -/
def rationalScalar {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (nonCM : ℚ ≃ₐ[ℚ] End0 A) (u : (End0 A)ˣ) : ℚˣ :=
  Units.map nonCM.symm.toMonoidHom u

example {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (nonCM : ℚ ≃ₐ[ℚ] End0 A) (u : (End0 A)ˣ) :
    nonCM (rationalScalar nonCM u : ℚ) = (u : End0 A) := sorry

example {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (nonCM : ℚ ≃ₐ[ℚ] End0 A) (u v : (End0 A)ˣ) :
    rationalScalar nonCM (u * v) = rationalScalar nonCM u * rationalScalar nonCM v := sorry

example {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (e : ℚ ≃ₐ[ℚ] End0 A) : rationalScalar e 1 = 1 := sorry

example {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (e : ℚ ≃ₐ[ℚ] End0 A) :
    rationalScalar e (Units.map e.toMonoidHom (-1 : ℚˣ)) = -1 := sorry

example {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (e : ℚ ≃ₐ[ℚ] End0 A) :
    rationalScalar e
      (Units.map e.toMonoidHom (Units.mk0 (2 / 3 : ℚ) (by norm_num))) =
        Units.mk0 (2 / 3 : ℚ) (by norm_num) := sorry

example {A : TauCeti.AlgebraicGeometry.AbelianVariety Qbar}
    (e : ℚ ≃ₐ[ℚ] End0 A) (u : (End0 A)ˣ) :
    rationalScalar e u⁻¹ = (rationalScalar e u)⁻¹ := sorry

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

/-- An abbreviation of canonical continuous cohomology, never a new quotient. -/
abbrev unitCohomology2 : TopModuleCat ℤ :=
  continuousCohomology 2 (trivialUnitsCoefficients F)
/-- The additive zero is the multiplicative identity. -/
example : (0 : Additive Fˣ) = Additive.ofMul (1 : Fˣ) := rfl

/-- The coefficient action fixes each unit, even for nontrivial Galois elements. -/
example (g : GQ) (u : Additive Fˣ) : g • u = u := rfl

example :
    Additive.ofMul (Units.mk0 (2 : ℚ) (by norm_num)) +
      Additive.ofMul (Units.mk0 (3 : ℚ) (by norm_num)) =
        Additive.ofMul (Units.mk0 (6 : ℚ) (by norm_num)) := sorry

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
modularQuotientIsGl2Type; the derivative action. IsStable and
stable_subvariety_surjective use nonzero denominators above.
GT.2: integralModel_end, residualRep, residualRep_finrank, residualRep_charpoly,
residualRep_ss_indep, frobeniusPolynomial, determinantCharacter, odd,
absoluteIrreducibility, coefficientConjugation, coefficientsGenerate, innerTwistField,
residualIrreducibility, conductorBound, crystallineAtGoodPrimes.
GT.3: AbelianVariety.IsModularOfLevel, AbelianVariety.IsModular,
AbelianVariety.IsModularOfLevel.mono, AbelianVariety.IsModular.of_isogeny,
AbelianVariety.IsModular.quotient, AbelianVariety.isModular_iff,
AbelianVariety.IsModularOfLevel.gamma0, AbelianVariety.IsModular.elliptic;
serreWitnesses, fixedNewform, coefficientIdentification, tateModuleComparison,
modularityTheorem, modularityEquivalences, simpleQuotientsCharacterisation,
trivialCharacter, modularParametrisation.
GT.4: conductorOfGl2Type, exactLevel, strictCompatibility, lFunction, parentCompatibility.
GT.5: EllipticCurve.IsQCurve.of_cm, IsQCurve.not_of_squared_traces;
QCurve.cocycle, QCurve.cocycle_isCocycle, QCurve.cocycleClass, QCurve.cocycleClass_indep,
QCurve.cocycle_sq, QCurve.cocycleClass_of_rat, QCurve.cocycle_rational,
QCurve.cocycle_quadratic, QCurve.cocycle_twist_after_extension, QCurve.cocycle_cm_excluded;
restrictionOfScalarsEndomorphisms, lieFreeRankOne, ribetTheorem61,
qCurvesGeometricallyModular, quadraticQCurves, and the geometric splitting map α.
GT.6: qCurveGaloisModularity, qCurveAutomorphy, quadraticQCurvesModular.
The explicit Jacobian and regular-action checks use GL2Type.power_degree_one,
GL2Type.power_not_primitive, GL2Type.J0_23_primitive, GL2Type.endField_J0_23,
GL2Type.endField_J1_13, GL2Type.residualRep_elliptic, GL2Type.residualRep_det,
GL2Type.residualRep_not_A_l, IsModular.X0_11, IsModular.zero,
IsModular.J1_13_not_gamma0, IsModular.level_not_minimal in the README.
-/
