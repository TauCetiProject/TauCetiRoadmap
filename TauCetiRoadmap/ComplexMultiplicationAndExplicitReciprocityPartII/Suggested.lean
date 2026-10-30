module

public import Mathlib
public import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny

/-!
# Complex multiplication and explicit reciprocity, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, using native mathematical carriers.

The following headlines are not statable at the pins:
* CM height linearity on the overlap span: CM types, the component-period functional
  and stable Faltings heights of CM abelian varieties are missing.
* All-prime integral CM realizations and different-torsion graph comparison:
  integral CM families and tensor-compatible Breuil–Kisin realization carriers are missing.
* Total reflex metrized determinant and height identity: the total reflex family,
  filtered integral Hodge bundles and arithmetic Picard degrees are missing.
* Orthogonal big-CM arithmetic intersection and prime elimination: integral GSpin
  special divisors, their metrized Hodge line and CM arithmetic intersections are missing.
* Corrected nearby-type identity and quaternionic CM height by arithmetic adjunction:
  component Hodge heights, quaternionic integral curves and the modified intersection
  pairing are missing.
* Averaged Colmez, including its imaginary quadratic case: CM types and stable heights
  on actual CM abelian varieties are missing.
* Subpolynomial individual CM heights: stable Faltings heights of CM abelian varieties
  are missing.
* Primitive and general center-order polarized CM orbit bounds: polarized CM coarse
  moduli points, their endomorphism center orders and Galois action are missing.
* Polynomial CM lift heights and bounded moduli-degree finiteness: the Siegel CM
  locus and its algebraic uniformization and period-coordinate interface are missing.

No numerical implication or finite type-cube calculation replaces these headlines.
-/

public section

namespace TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII

open CategoryTheory TauCeti.AlgebraicGeometry
open scoped NumberField

universe u

/-! ## Layer 10: Individual height bounds and distant isogenies -/

/-- For every positive half-degree and every positive real epsilon, the ratio of
maximal-order class numbers of a CM field and its maximal real subfield is bounded
below by a positive dimension-uniform multiple of its absolute discriminant to
`1/4 - epsilon`. The constant is allowed to be ineffective.
Source: Tsimerman, The André–Oort conjecture for A_g, §2.2, p. 382, with the native
CM regulator ratio retained. -/
theorem relative_class_number_growth (g : ℕ) (hg : 0 < g)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧
      ∀ (E : Type u) [Field E] [NumberField E] [NumberField.IsCMField E],
        Module.finrank ℚ E = 2 * g →
        C * (|(NumberField.discr E : ℝ)|) ^ ((1 : ℝ) / 4 - ε) ≤
          (NumberField.classNumber E : ℝ) /
            (NumberField.classNumber (NumberField.maximalRealSubfield E) : ℝ) := by
  sorry

/-- Distant CM ideal isogenies. For every positive half-degree `g` and every positive real
epsilon there is a positive constant `c` with the following property. Let `E` be a CM field of
degree `2g` and `A` a complex abelian variety of dimension `g` whose endomorphism ring is
identified with the maximal order of `E`, so that `A` is simple with primitive CM by that maximal
order. Then some complex abelian variety `B` with the same endomorphism ring receives an
isogeny from `A` linear for both actions, hence has the same CM type, and every isogeny from `A`
to `B` has degree at least `c` times the absolute discriminant of `E` to the power
`1/4 - epsilon`. The degree of an isogeny is the rank of its finite flat underlying scheme
morphism at the identity point of `B` (Mathlib's `Scheme.Hom.finrank`); over `ℂ` it is the
order of the kernel. The constant is allowed to be ineffective.
Source: Tsimerman, The André–Oort conjecture for A_g, §2.2, Proposition 2.2 and the argument
preceding it, p. 382. -/
theorem distant_cm_isogenies (g : ℕ) (hg : 0 < g) (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, 0 < c ∧
      ∀ (E : Type u) [Field E] [NumberField E] [NumberField.IsCMField E],
        Module.finrank ℚ E = 2 * g →
        ∀ (A : AbelianVariety ℂ), A.dim = (g : WithBot ℕ∞) →
        ∀ ι : 𝓞 E ≃+* AbelianVariety.End A,
          ∃ (B : AbelianVariety ℂ) (κ : 𝓞 E ≃+* AbelianVariety.End B),
            (∃ f : A ⟶ B, AbelianVariety.IsIsogeny f ∧
              ∀ a : 𝓞 E,
                AbelianVariety.End.toHom (ι a) ≫ f = f ≫ AbelianVariety.End.toHom (κ a)) ∧
            ∀ f : A ⟶ B, AbelianVariety.IsIsogeny f →
              c * |(NumberField.discr E : ℝ)| ^ ((1 : ℝ) / 4 - ε) ≤
                ((AbelianVariety.Hom.toSchemeHom f).finrank B.zeroPoint : ℝ) := by
  sorry

end TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII
