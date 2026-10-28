import TauCeti.RepresentationTheory.Compact.PeterWeyl
import Mathlib.Topology.Algebra.PontryaginDual

/-!
Selected suggested signatures for README.md, which is definitive. This file is
not exhaustive. The admissions are future proof targets, using the native
unitary dual, circle characters, continuous functions and Haar L².
-/

set_option autoImplicit false

noncomputable section

open MeasureTheory

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

universe u

variable (G : Type u) [CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G]

/-- The complex continuous function of an actual circle-valued character. -/
def compactCharacter (χ : PontryaginDual G) : C(G, ℂ) :=
  ⟨fun g => (χ g : ℂ), continuous_subtype_val.comp (map_continuous χ)⟩

/-- The native irreducible-class bijection is pinned by its scalar action.
The Peter–Weyl coefficient convention requires the inverse of this character
when reindexing the basis below. -/
theorem exists_irrepClass_characterEquiv :
    ∃ e : TauCeti.IrrepClass ℂ G ≃ PontryaginDual G,
      ∀ (i : TauCeti.IrrepClass ℂ G), (TauCeti.IrrepClass.model i).dim = 1 ∧
        ∀ g : G, (TauCeti.IrrepClass.model i).rep g =
          (e i g : ℂ) • ContinuousLinearMap.id ℂ
            (EuclideanSpace ℂ (Fin (TauCeti.IrrepClass.model i).dim)) := by
  sorry

/-- Character polynomials are uniformly dense on every compact abelian group. -/
theorem compactCharacter_span_dense :
    (Submodule.span ℂ (Set.range (compactCharacter G))).topologicalClosure = ⊤ := by
  sorry

variable [MeasurableSpace G] [BorelSpace G]

/-- The Fourier basis is indexed by native characters, with these exact vectors. -/
theorem exists_characterBasis :
    ∃ b : HilbertBasis (PontryaginDual G) ℂ (Lp ℂ 2 (TauCeti.haarProb G)),
      ∀ χ, b χ = ContinuousMap.toLp 2 (TauCeti.haarProb G) ℂ
        (compactCharacter G χ) := by
  sorry

end TauCetiRoadmap.RepresentationTheory.CompactGroups
