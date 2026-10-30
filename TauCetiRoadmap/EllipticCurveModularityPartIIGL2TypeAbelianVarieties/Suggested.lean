import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Product
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace

/-!
# Abelian varieties of GL₂-type and modularity of ℚ-curves: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
simple definitions needed to state them.

Stated here: Ribet's centralizer and simple-power decomposition theorem for a GL₂-type
variety (§1.3), the totally-real-or-CM alternative for the endomorphism field of a ℚ-simple
GL₂-type variety (§1.5), and Ribet's theorem that every non-CM ℚ-curve is a geometric factor
of a ℚ-simple GL₂-type variety over ℚ (§5.6). Rational endomorphisms, simplicity and geometric
conjugation are defined on the native abelian varieties.

Not statable at the pins. The modular-Jacobian conclusions of Layers 1, 3 and 5 need the
curves `X₁(N)`, `X₀(N)`, the Jacobians `J₁(N)`, `J₀(N)` and the Hecke quotient `A_f`; the
native newform and its coefficient field exist, but these geometric objects do not. The
compatible-system results of Layer 2 and the newform Galois comparison of Layer 6 need the
abelian λ-adic components, the λ-torsion and the newform Galois representations. Layer 4
needs in addition the abelian conductor, the local Euler factors and the Weil–Deligne
parameters; its L-function and functional equation cannot be stated without them. The Rosati
assertion of §1.5 and the Weil-restriction and quadratic endomorphism-algebra assertions of
Layer 5 need native polarizations and Weil restriction. The solvable-field automorphy and
quadratic-field modularity of Layer 6 need automorphic representations and their local
factors, including the CM alternative. Tate's vanishing `H²(G_ℚ, ℚ̄ˣ) = 0` (§5.3) is a
supplier's theorem and is not restated here.
-/

noncomputable section
open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

namespace TauCetiRoadmap.EllipticCurveModularityPartIIGL2TypeAbelianVarieties

/-! ## Layer 1: Abelian varieties of GL₂-type and their endomorphism algebras -/

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

/-- A geometric elliptic abelian variety is a ℚ-curve if each scalar conjugate is isogenous. -/
def IsGeometricQCurve (C : TauCeti.AlgebraicGeometry.AbelianVariety Qbar) : Prop :=
  C.dim = 1 ∧ ∀ σ : GQ,
    ∃ φ : (@TauCeti.AlgebraicGeometry.AbelianVariety.baseChange Qbar _ C Qbar _
      σ.toRingHom.toAlgebra) ⟶ C,
      TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ

/-- Ribet's Theorem 2.1 (§1.3): E is its own centralizer; simplicity is equivalent
to E being the whole rational endomorphism algebra. Every GL₂-type variety has the
corresponding matrix algebra and simple-power isogeny decomposition
(Ribet92, Theorem 2.1, p. 3). -/
theorem ribetTheorem21 (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim) :
    (∀ x : End0 A, (∀ y : E, x * ι y = ι y * x) ↔ x ∈ Set.range ι) ∧
    (IsSimpleOverQ A ↔ Function.Surjective ι) ∧
    ∃ (F : IntermediateField ℚ E) (B : AVQ),
      IsSimpleOverQ B ∧ Nonempty (F ≃ₐ[ℚ] End0 B) ∧
      (Module.finrank ℚ F : WithBot ℕ∞) = B.dim ∧
      ∃ (b : Module.Basis (Fin (Module.finrank F E)) F E)
        (e : End0 A ≃ₐ[ℚ] Matrix (Fin (Module.finrank F E)) (Fin (Module.finrank F E)) F),
        (∀ x : E, e (ι x) = Algebra.leftMulMatrix b x) ∧
        ∃ φ : piObj (fun _ : Fin (Module.finrank F E) => B) ⟶ A,
          TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ := sorry

/-- The endomorphism field of a ℚ-simple GL₂-type variety is totally real or CM (§1.5;
Ribet92, §3, p. 4). -/
theorem totallyRealOrCm (A : AVQ) {E : Type} [Field E] [NumberField E]
    (ι : E →ₐ[ℚ] End0 A) (hd : (Module.finrank ℚ E : WithBot ℕ∞) = A.dim)
    (hs : IsSimpleOverQ A) : NumberField.IsTotallyReal E ∨ NumberField.IsCMField E := sorry

/-! ## Layer 5: ℚ-curves as factors of abelian varieties of GL₂-type -/

/-- Ribet's Theorem 6.1 (§5.6): every non-CM geometric ℚ-curve is a factor of a ℚ-simple
GL₂-type variety over ℚ, whose geometric base change is isogenous to the corresponding power
of the curve (Ribet92, Theorem 6.1, p. 12). -/
theorem ribetTheorem61 (C : TauCeti.AlgebraicGeometry.AbelianVariety Qbar)
    (hC : IsGeometricQCurve C) (nonCM : Nonempty (ℚ ≃ₐ[ℚ] End0 C)) :
    ∃ A : AVQ, IsSimpleOverQ A ∧
      (∃ (E : Type) (_ : Field E) (_ : NumberField E),
        Nonempty (E ≃ₐ[ℚ] End0 A) ∧
          (Module.finrank ℚ E : WithBot ℕ∞) = A.dim) ∧
      ∃ φ : A.baseChange Qbar ⟶
        piObj (fun _ : Fin (Module.finrank ℚ A.TangentSpace) => C),
        TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny φ := sorry

end TauCetiRoadmap.EllipticCurveModularityPartIIGL2TypeAbelianVarieties
