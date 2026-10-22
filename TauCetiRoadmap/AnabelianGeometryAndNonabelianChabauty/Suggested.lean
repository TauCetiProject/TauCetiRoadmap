import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.Genus

/-!
# Anabelian geometry and nonabelian Chabauty: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

Two headline results can be stated against the pinned carriers:

* Layer 3: Isom reconstruction for proper hyperbolic curves over sub-p-adic fields,
  expressed through Mathlib's categories of finite étale scheme maps and their
  constant-cover functors. This includes the number-field Isom theorem and requires
  no rational point on either curve.
* Layer 7: Siegel finiteness for the thrice-punctured line over every ring of rational
  S-integers, expressed as finiteness of the elements x for which x and 1 − x are units
  in Mathlib's `Set.integer`.

The other headline signatures require objects absent at the pins. Layer 0's topological
nonabelian torsor classification, twisting and exact sequences need the native continuous
nonabelian H¹ carrier; the specified `TauCeti.NonabelianH1` modules are not in the pinned
Tau Ceti revision. Layer 1's curve and Artin-tower K(π,1) theorems need the scheme étale
fundamental group and its canonical cohomology comparison. Layer 2's unipotent realization
and crystalline comparison theorems need geometric tensor categories, unipotent path
torsors and their filtered realizations. Layer 3's Hom theorems need the arithmetic
fundamental-group extensions and their relative geometric pro-p quotients.

Layers 4–6 need algebra-valued unipotent cohomology, represented Selmer varieties,
Albanese and period maps, Jacobians with rational Kummer maps, mixed extensions and
Nekovář heights. Their representability, dimension-finiteness, rank criterion and height
equations therefore have no signatures here. Layer 7's section-map injectivity and section
conjectures need geometric section classes and the rational-point map. Soulé's theorem
needs the restricted-ramification Galois group with its rational Tate representations;
the graded-character, Selmer-vanishing, dimension and eventual-equality statements need
graded geometric unipotent groups and the resulting Selmer and Kim loci.
The S-integral finiteness consequence above needs none of these missing carriers.
-/

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

universe u

open CategoryTheory AlgebraicGeometry in
/-- An equivalence of finite étale cover categories compatible with constant covers
comes from a unique base-field isomorphism of proper hyperbolic curves over a sub-p-adic
field. No rational point is required; the base field embeds in a finitely generated
extension of the specified p-adic field. -/
theorem anabelian_isom
    (p : ℕ) [Fact p.Prime] {K L : Type u} [Field K] [Field L] [Algebra ℚ_[p] L]
    (embedding : K →+* L)
    (hfg : ∃ s : Finset L, IntermediateField.adjoin ℚ_[p] (s : Set L) = ⊤)
    (X Y : Scheme.{u}) [X.Over (Spec (.of K))] [Y.Over (Spec (.of K))]
    [SmoothOfRelativeDimension 1 (X ↘ Spec (.of K))]
    [SmoothOfRelativeDimension 1 (Y ↘ Spec (.of K))]
    [IsProper (X ↘ Spec (.of K))] [IsProper (Y ↘ Spec (.of K))]
    [GeometricallyConnected (X ↘ Spec (.of K))]
    [GeometricallyConnected (Y ↘ Spec (.of K))]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial X).obj 1)]
    [FiniteDimensional K (TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology
      (TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial Y).obj 1)]
    (hX : 2 ≤ X.genus K) (hY : 2 ≤ Y.genus K) :
    let P : MorphismProperty Scheme.{u} := @AlgebraicGeometry.IsFinite ⊓ @AlgebraicGeometry.Etale
    letI : P.IsStableUnderBaseChange := {
      of_isPullback := fun sq hf =>
        ⟨MorphismProperty.of_isPullback (P := @AlgebraicGeometry.IsFinite) sq hf.1,
          MorphismProperty.of_isPullback (P := @AlgebraicGeometry.Etale) sq hf.2⟩ }
    ∀ e : P.Over ⊤ X ≌ P.Over ⊤ Y,
      Nonempty (MorphismProperty.Over.pullback P ⊤ (X ↘ Spec (.of K)) ⋙ e.functor ≅
        MorphismProperty.Over.pullback P ⊤ (Y ↘ Spec (.of K))) →
      ∃! f : X ≅ Y, f.hom.IsOver (Spec (.of K)) ∧
        Nonempty (e.functor ≅ MorphismProperty.Over.pullback P ⊤ f.inv) := by
  sorry

/-- Layer 7: the S-integral points of the thrice-punctured line are finite.
Here x and 1 − x being units is exactly the condition of avoiding 0, 1 and ∞ over
Mathlib's ring of rational S-integers. -/
theorem thricePuncturedLine_sIntegralPoints_finite
    (S : Finset (IsDedekindDomain.HeightOneSpectrum ℤ)) :
    {x : (S : Set (IsDedekindDomain.HeightOneSpectrum ℤ)).integer ℚ |
      IsUnit x ∧ IsUnit (1 - x)}.Finite := by
  sorry

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty
