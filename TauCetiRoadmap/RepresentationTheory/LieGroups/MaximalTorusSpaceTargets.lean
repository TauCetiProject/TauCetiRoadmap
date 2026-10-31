import TauCetiRoadmap.RepresentationTheory.LieGroups.Suggested
import TauCeti.AlgebraicTopology.UniversalCover.Deck.FundamentalGroup.Basic

/-!
# The space of maximal tori: suggested native targets

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These signatures illustrate Layer6's quotient, covering and endpoint interfaces;
`sorry` marks future constructions and proofs, not completed library work.
-/

namespace TauCetiRoadmap.RepresentationTheory.LieGroups.MaximalTorusSpace

open scoped Manifold ContDiff

variable {G : Type*} [TopologicalSpace G] [Group G]

abbrev space (T : Subgroup G) := G ⧸ Subgroup.normalizer (T : Set G)

/-- The native map of homogeneous spaces induced by T ≤ N(T). -/
def projection (T : Subgroup G) : G ⧸ T → space T :=
  Subgroup.quotientMapOfLE Subgroup.le_normalizer

omit [TopologicalSpace G] in
@[simp] theorem projection_mk (T : Subgroup G) (g : G) :
    projection T (QuotientGroup.mk g) = QuotientGroup.mk g := rfl

section Equivalences
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  {H : Type*} [TopologicalSpace H]

/-- The deck map sends op([n]) to right multiplication by n. -/
noncomputable def deckEquiv (I : ModelWithCorners ℝ E H)
    [FiniteDimensional ℝ E] [ChartedSpace H G] [LieGroup I ∞ G]
    [T2Space G] [BoundarylessManifold I G] [CompactSpace G] [ConnectedSpace G] : (T : Subgroup G) → (hT : IsMaximalTorus T) →
    (weylGroup T)ᵐᵒᵖ ≃* deck (projection T) := by sorry

/-- Whole-Pi admission of the actual endpoint isomorphism, not an assumed field. -/
noncomputable def endpointEquiv (I : ModelWithCorners ℝ E H)
    [FiniteDimensional ℝ E] [ChartedSpace H G] [LieGroup I ∞ G]
    [T2Space G] [BoundarylessManifold I G] [CompactSpace G] [ConnectedSpace G] : (T : Subgroup G) → (hT : IsMaximalTorus T) →
    FundamentalGroup (space T) (QuotientGroup.mk (1 : G)) ≃* weylGroup T := by sorry

end Equivalences

section CompactLie
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
  (I : ModelWithCorners ℝ E H) [ChartedSpace H G]
  [LieGroup I ∞ G] [T2Space G] [BoundarylessManifold I G]
  [CompactSpace G] [ConnectedSpace G]

include I in
/-- The concrete conjugation parametrization of all maximal tori. -/
theorem exists_orbitEquiv (T : Subgroup G) (hT : IsMaximalTorus T) :
    ∃ e : space T ≃ {S : Subgroup G // IsMaximalTorus S},
      ∀ g : G, (e (QuotientGroup.mk g)).val =
        T.map (MulAut.conj g).toMonoidHom := sorry

include I in
/-- Follows from the earlier regular-chamber comparison, for any compact connected K. -/
theorem flag_simplyConnected (T : Subgroup G) (hT : IsMaximalTorus T) :
    SimplyConnectedSpace (G ⧸ T) := sorry

include I in
theorem isCoveringMap (T : Subgroup G) (hT : IsMaximalTorus T) :
    IsCoveringMap (projection T) := sorry

include I in
/-- Native loop multiplication is reverse path concatenation. No inversion of
this endpoint Weyl element is needed. -/
theorem endpointEquiv_apply_eq_iff (T : Subgroup G) (hT : IsMaximalTorus T)
    (γ : FundamentalGroup (space T) (QuotientGroup.mk (1 : G)))
    (n : Subgroup.normalizer (T : Set G)) :
    endpointEquiv I T hT γ = QuotientGroup.mk n ↔
      ((isCoveringMap (I := I) T hT).monodromy γ
        ⟨QuotientGroup.mk (1 : G), rfl⟩ : G ⧸ T) =
        QuotientGroup.mk (n : G) := sorry

end CompactLie
end TauCetiRoadmap.RepresentationTheory.LieGroups.MaximalTorusSpace
