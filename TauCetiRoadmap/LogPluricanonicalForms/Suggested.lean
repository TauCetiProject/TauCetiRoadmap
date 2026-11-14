import Mathlib
import TauCeti.AlgebraicGeometry.Modules.Differentials.LocallyFree
import TauCeti.AlgebraicGeometry.VectorBundle.Determinant.LocallyConstantRank
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import TauCeti.AlgebraicGeometry.LineBundle.Dual
import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Invertible
import TauCeti.CategoryTheory.Monoidal.TensorPow

/-!
# Logarithmic pluricanonical forms: target signatures

`README.md` is definitive; this file is not the roadmap and is not exhaustive. It states the
negative-fiber headline on native sheaves, effective Cartier ideals and cartesian fiber squares.
The definitions have real bodies; only the target theorem has an admitted proof.

Two other headline interfaces require constructions specified in the README:

* the rational-section comparison (Layer 2) lacks the embedding of global sections of the
  native twisted canonical tensor power into rational pluriforms, with its affine membership
  comparison;
* generic nonvanishing of the specialized logarithmic section (Layer 4) lacks the fiber
  adjunction isomorphism and its induced restriction map from Layer 3. Pullback of a line bundle
  alone does not identify the pulled-back section with a pluricanonical section of the fiber.

Neither interface is replaced by an arbitrary predicate or an admitted data definition. The
negative-fiber implication is statable without naming the intermediate restriction map.
-/

noncomputable section

open CategoryTheory Limits AlgebraicGeometry
open TauCeti.AlgebraicGeometry

namespace TauCetiRoadmap.LogPluricanonicalForms

/-- The canonical line twisted by an effective Cartier divisor. The dual of its ideal sheaf
allows poles along the divisor. -/
def logCanonical (X : Scheme.{0}) [X.Over (Spec (.of ℂ))]
    [Smooth (X ↘ Spec (.of ℂ))]
    {E : X.IdealSheafData} (hE : E.IsEffectiveCartier) : InvertibleSheaf X :=
  (FiniteLocallyFreeSheaf.relativeDifferentials ℂ X).det.tensorProduct
    hE.toInvertibleSheaf.dual

/-- Global sections of the indicated tensor power of the twisted canonical line. -/
abbrev pluriformSections (X : Scheme.{0}) [X.Over (Spec (.of ℂ))]
    [Smooth (X ↘ Spec (.of ℂ))]
    {E : X.IdealSheafData} (hE : E.IsEffectiveCartier) (m : ℕ) :=
  Γ(TauCeti.tensorPow (logCanonical X hE).obj m, ⊤)

/-- Vanishing of all positive twisted plurigenera. For a reduced strict normal-crossing
boundary this is the negative logarithmic Kodaira condition. -/
def NegLogKodaira (X : Scheme.{0}) [X.Over (Spec (.of ℂ))]
    [Smooth (X ↘ Spec (.of ℂ))]
    {E : X.IdealSheafData} (hE : E.IsEffectiveCartier) : Prop :=
  ∀ m : ℕ, 0 < m → ∀ s : pluriformSections X hE m, s = 0

/-- A property of complex points holds very generally in `V` if it holds off a countable
union of proper closed subsets of the ambient scheme `Y`. No point-existence assertion is made. -/
def VeryGeneral {Y : Scheme.{0}} [Y.Over (Spec (.of ℂ))]
    (V : Y.Opens) (P : (Spec (.of ℂ) ⟶ Y) → Prop) : Prop :=
  ∃ Z : ℕ → Set Y, (∀ j, IsClosed (Z j) ∧ Z j ≠ Set.univ) ∧
    ∀ y : Spec (.of ℂ) ⟶ Y, y ≫ (Y ↘ Spec (.of ℂ)) = 𝟙 _ →
      Set.range y.base ⊆ (V : Set Y) \ ⋃ j, Z j → P y

/-- The negative-fiber implication for supplied smooth proper integral fiber models, with the
effective Cartier boundary pulled back as an ideal. This is the negative-infinity argument of
OpenAI, *The reverse logarithmic Kodaira inequality and additivity*, §2.2, first paragraph, p. 5,
in its effective-Cartier form. -/
theorem negLogKodaira_of_veryGeneral_fiber
    (X Y : Scheme.{0}) [X.Over (Spec (.of ℂ))] [Y.Over (Spec (.of ℂ))]
    [IsIntegral X] [IsIntegral Y]
    [Smooth (X ↘ Spec (.of ℂ))] [Smooth (Y ↘ Spec (.of ℂ))]
    [IsProper (X ↘ Spec (.of ℂ))] [IsProper (Y ↘ Spec (.of ℂ))]
    (f : X ⟶ Y) [f.IsOver (Spec (.of ℂ))] (hf : Function.Surjective f)
    (V : Y.Opens) (hV : (V : Set Y).Nonempty) [Smooth (f ∣_ V)]
    (E : X.IdealSheafData) (hE : E.IsEffectiveCartier) :
    VeryGeneral V (fun y ↦
      ∀ (F : Scheme.{0}) [F.Over (Spec (.of ℂ))] [IsIntegral F]
        [Smooth (F ↘ Spec (.of ℂ))] [IsProper (F ↘ Spec (.of ℂ))]
        (i : F ⟶ X), IsPullback i (F ↘ Spec (.of ℂ)) f y →
        ∀ (EF : F.IdealSheafData) (hEF : EF.IsEffectiveCartier),
          EF = E.comap i → NegLogKodaira F hEF → NegLogKodaira X hE) := by
  sorry

end TauCetiRoadmap.LogPluricanonicalForms
