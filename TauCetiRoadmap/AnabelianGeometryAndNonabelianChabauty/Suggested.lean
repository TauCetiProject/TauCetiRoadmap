import Mathlib
import TauCeti.AlgebraicGeometry.Cohomology.Genus

/-!
# Anabelian geometry and nonabelian Chabauty: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, where their carriers exist.

The proper hyperbolic Isom theorem over sub-p-adic fields is statable through
Mathlib's finite étale scheme-map categories and constant-cover functors. It includes
the number-field Isom theorem and requires no rational point on either curve.
The S-integral finiteness consequence for the thrice-punctured line is the S-unit
theorem of DiophantineApproximationAndTranscendence §4.5 and is not restated here.

The other headline signatures require objects absent at the pins. Layer 0's topological
nonabelian torsor classification, twisting and exact sequences need the native continuous
nonabelian H¹ carrier; Layer 0 constructs that carrier and its quotient descent and inflation theory. Layer 1's arbitrary-field smooth-curve and characteristic-zero product and Artin-tower
K(π,1) theorems need the scheme étale
fundamental group and its canonical cohomology comparison. Layer 2's unipotent realization
and crystalline comparison theorems need geometric tensor categories, unipotent path
torsors and their filtered realizations. Their abstract neutral tensor reconstruction
and tensor-isomorphism torsors are supplied by MotivesAndAlgebraicCycles §§6.1–6.3
and 6.8; Layer 2 specializes them to unipotent categories in characteristic zero.
Layer 3's general Hom theorem for smooth pro-varieties and hyperbolic pro-curves
needs the arithmetic fundamental-group extensions and their relative geometric
pro-p quotients, including the finite-cover/limit comparison for those schemes.

Layers 4–6 need algebra-valued unipotent cohomology, represented Selmer varieties,
Albanese and period maps, Jacobians with rational Kummer maps, mixed extensions and
Nekovář heights. Their representability, dimension-finiteness, rank criterion and height
equations therefore have no signatures here. Layer 7's section-map injectivity and section
conjectures need geometric section classes and the rational-point map. Soulé's theorem
needs the restricted-ramification Galois group with its rational Tate representations;
the graded-character, Selmer-vanishing, dimension and eventual-equality statements need
graded geometric unipotent groups and the resulting Selmer and Kim loci.

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

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty
