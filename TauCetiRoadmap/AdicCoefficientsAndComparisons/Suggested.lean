import Mathlib
import TauCeti.AlgebraicGeometry.EffectiveCartierDivisor.Basic
import TauCeti.AlgebraicGeometry.VectorBundle.FiniteLocallyFree

/-!
# Adic coefficients and scheme comparison: headline target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones; discharging
all of them finishes neither a layer nor the roadmap.

Layer L2's strict cofilteredness of finitely presented compactifications and the strict
refinements with Cartier boundary or an extended vector bundle are statable on native schemes,
ideal sheaves and module sheaves. The two predicates below record the explicit factorisation
and strictness conditions on scheme maps. They introduce no category of compactifications.

The other headline results need objects absent from the pinned libraries. Layer L0's adic
reconstruction, six operations, adic main theorems and rational scheme comparison need stable
enhanced étale categories and derived completion. Layer L1's avatars and comparison functor
need small v-sheaves, marked perfectoid untilts and their geometric sites. Layer L2's categorical
compactification continuity needs the shared compactification category, and its Hom continuity
and proper-support extensions need constructible derived categories and their operations.
Layers L3, L4 and L6's ECD 27.1–27.7 need those avatars, categories and comparison functors;
the analytic cover of L4 also needs adic spaces and cohomological smoothness. Layer L5's
smooth alteration pairs need alterations and strict normal-crossing divisors, and its descent
and local comparison need enhanced cohomology and Kummer classes. The semistable and inertia
comparisons of L6 likewise need these geometric cohomology objects. No signatures for these
results are given here.
-/

open CategoryTheory AlgebraicGeometry

universe u

namespace TauCeti.AdicCoefficientsAndComparisons

/-- A compactification expressed on its scheme maps, without choosing a category of
compactifications. No density condition is imposed. -/
def IsCompactification {X Y C : Scheme.{u}} (f : Y ⟶ X) (j : Y ⟶ C) (q : C ⟶ X) : Prop :=
  IsOpenImmersion j ∧ QuasiCompact j ∧ IsProper q ∧ j ≫ q = f

/-- A strict refinement, including the two triangles and equality of the interior opens. -/
def IsStrictRefinement {X Y C' C : Scheme.{u}}
    (j' : Y ⟶ C') (q' : C' ⟶ X) (j : Y ⟶ C) (q : C ⟶ X) (g : C' ⟶ C) : Prop :=
  j' ≫ g = j ∧ g ≫ q = q' ∧ g ⁻¹' Set.range j = Set.range j'

/-- `L2/fp-strict-cofiltered`: finitely presented compactifications exist over a qcqs base,
have common strict finitely presented refinements, and admit strict finitely presented
refinements equalising arbitrary parallel morphisms of compactifications. -/
theorem fpStrictCofiltered {X Y : Scheme.{u}} [CompactSpace X] [QuasiSeparatedSpace X]
    (f : Y ⟶ X) [IsSeparated f] [QuasiCompact f] [LocallyOfFinitePresentation f] :
    (∃ (C : Scheme.{u}) (j : Y ⟶ C) (q : C ⟶ X),
      IsCompactification f j q ∧ LocallyOfFinitePresentation q) ∧
    (∀ (C₁ C₂ : Scheme.{u}) (j₁ : Y ⟶ C₁) (q₁ : C₁ ⟶ X)
        (j₂ : Y ⟶ C₂) (q₂ : C₂ ⟶ X),
      IsCompactification f j₁ q₁ → LocallyOfFinitePresentation q₁ →
      IsCompactification f j₂ q₂ → LocallyOfFinitePresentation q₂ →
      ∃ (C₃ : Scheme.{u}) (j₃ : Y ⟶ C₃) (q₃ : C₃ ⟶ X)
          (g₁ : C₃ ⟶ C₁) (g₂ : C₃ ⟶ C₂),
        IsCompactification f j₃ q₃ ∧ LocallyOfFinitePresentation q₃ ∧
        IsStrictRefinement j₃ q₃ j₁ q₁ g₁ ∧ IsStrictRefinement j₃ q₃ j₂ q₂ g₂) ∧
    (∀ (C₁ C₂ : Scheme.{u}) (j₁ : Y ⟶ C₁) (q₁ : C₁ ⟶ X)
        (j₂ : Y ⟶ C₂) (q₂ : C₂ ⟶ X),
      IsCompactification f j₁ q₁ → LocallyOfFinitePresentation q₁ →
      IsCompactification f j₂ q₂ → LocallyOfFinitePresentation q₂ →
      ∀ (a b : C₁ ⟶ C₂),
        j₁ ≫ a = j₂ → a ≫ q₂ = q₁ → j₁ ≫ b = j₂ → b ≫ q₂ = q₁ →
        ∃ (C₃ : Scheme.{u}) (j₃ : Y ⟶ C₃) (q₃ : C₃ ⟶ X) (g : C₃ ⟶ C₁),
          IsCompactification f j₃ q₃ ∧ LocallyOfFinitePresentation q₃ ∧
          IsStrictRefinement j₃ q₃ j₁ q₁ g ∧ g ≫ a = g ≫ b) := by
  sorry

/-- `L2/cartier-boundary-cofinal`: every compactification over a noetherian affine base has a
strict refinement whose boundary is the support of a native effective Cartier ideal sheaf. -/
theorem cartierBoundary_strictRefinement {S Y C : Scheme.{u}} [IsAffine S] [IsNoetherian S]
    (f : Y ⟶ S) [IsSeparated f] [QuasiCompact f] [LocallyOfFiniteType f]
    (j : Y ⟶ C) (q : C ⟶ S) (hC : IsCompactification f j q) :
    ∃ (C' : Scheme.{u}) (j' : Y ⟶ C') (q' : C' ⟶ S) (g : C' ⟶ C),
      IsCompactification f j' q' ∧ IsStrictRefinement j' q' j q g ∧
      ∃ I : C'.IdealSheafData,
        I.IsEffectiveCartier ∧ (I.support : Set C') = (Set.range j')ᶜ := by
  sorry

/-- `L2/vector-bundle-extension-cofinal`: every finite locally free sheaf extends over a strict
refinement of any compactification over a noetherian affine base, with ranks allowed to vary. -/
theorem vectorBundleExtension_strictRefinement {S Y C : Scheme.{u}}
    [IsAffine S] [IsNoetherian S] (f : Y ⟶ S)
    [IsSeparated f] [QuasiCompact f] [LocallyOfFiniteType f]
    (F : Y.Modules) (hF : Scheme.Modules.isFiniteLocallyFree Y F)
    (j : Y ⟶ C) (q : C ⟶ S) (hC : IsCompactification f j q) :
    ∃ (C' : Scheme.{u}) (j' : Y ⟶ C') (q' : C' ⟶ S) (g : C' ⟶ C),
      IsCompactification f j' q' ∧ IsStrictRefinement j' q' j q g ∧
      ∃ F' : C'.Modules, Scheme.Modules.isFiniteLocallyFree C' F' ∧
        Nonempty ((Scheme.Modules.pullback j').obj F' ≅ F) := by
  sorry

end TauCeti.AdicCoefficientsAndComparisons
