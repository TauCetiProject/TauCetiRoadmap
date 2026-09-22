import Mathlib
import TauCeti.AlgebraicTopology.EilenbergMacLane.HomotopyEquiv
import TauCeti.AlgebraicTopology.SimplicialComplex.Realization
import TauCeti.AlgebraicTopology.UniversalCover.Classification.EilenbergMacLane

/-!
# Classifying spaces of discrete groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a stage nor the roadmap. `sorry` is permitted in this human-owned repository:
these are targets, not implementations.

Both models of the roadmap appear: the simplicial one of Stage 1, built from the countable join,
and the cellular one of Stage 2, built from a presentation. Their names are separate, because
Stage 3's comparison is a theorem about two different spaces and not a definitional identity.
Mathlib's `classifyingSpaceUniversalCover` is the simplicial `G`-set of the bar resolution, a
different object again, so everything here is named in the `TauCeti` namespace.

The base point is part of the data everywhere: the fundamental group is taken at it, and the
classification theorems of the universal-covers roadmap are pointed.
-/

namespace TauCetiRoadmap.ClassifyingSpaces

open TauCeti

universe u v

/-! ## Stage 1: the simplicial model -/

section Simplicial

variable (A : ℕ → Type u) (G : Type u) [Group G]

/-- **Milestone 1 — the countable join.** The faces are the nonempty finite sets of indexed
vertices meeting each index at most once. -/
def countableJoin : AbstractSimplicialComplex (Σ i : ℕ, A i) := sorry

/-- The realization of the countable join of copies of `G`, the total space of the construction. -/
noncomputable def universalGSpace : Type u :=
  AbstractSimplicialComplex.Realization (countableJoin fun _ : ℕ => G)

noncomputable instance : TopologicalSpace (universalGSpace G) := sorry

/-- Its distinguished point, the vertex at index `0` labelled by `1`. -/
noncomputable def universalGSpaceBasepoint : universalGSpace G := sorry

/-- **Milestone 2 — weak contractibility.** With nonempty factors at infinitely many indices the
realization is path-connected with vanishing homotopy groups; for a group this is the total space
above. -/
instance : PathConnectedSpace (universalGSpace G) := sorry

instance : SimplyConnectedSpace (universalGSpace G) := sorry

theorem subsingleton_homotopyGroup_universalGSpace {N : Type u} [Fintype N] [Nontrivial N]
    [DecidableEq N] (x : universalGSpace G) :
    Subsingleton (HomotopyGroup N (universalGSpace G) x) := sorry

/-- **Milestone 3 — the action and the orbit cover.** -/
noncomputable instance : MulAction G (universalGSpace G) := sorry

instance : ContinuousConstSMul G (universalGSpace G) := sorry

/-- The classifying space is the orbit space of that action. -/
def classifyingSpace : Type u :=
  Quotient (MulAction.orbitRel G (universalGSpace G))

noncomputable instance : TopologicalSpace (classifyingSpace G) := sorry

noncomputable def classifyingSpaceProj : universalGSpace G → classifyingSpace G := sorry

noncomputable def classifyingSpaceBasepoint : classifyingSpace G := sorry

/-- The orbit map is the quotient covering map of the action: this is the statement the
universal-covers roadmap's classification consumes. -/
theorem isQuotientCoveringMap_classifyingSpaceProj :
    IsQuotientCoveringMap (classifyingSpaceProj G) G := sorry

/-- Two points of the total space have the same image exactly when a group element carries one to
the other, and that element is unique. -/
theorem classifyingSpaceProj_eq_iff (x y : universalGSpace G) :
    classifyingSpaceProj G x = classifyingSpaceProj G y ↔ ∃! g : G, g • x = y := sorry

/-- **Milestone 4 — the standing hypotheses.** Both spaces satisfy the hypotheses under which the
covering-space classification applies. -/
instance : LocallyPathConnectedSpace (universalGSpace G) := sorry

instance : PathConnectedSpace (classifyingSpace G) := sorry

instance : LocallyPathConnectedSpace (classifyingSpace G) := sorry

instance : SemilocallySimplyConnectedSpace (classifyingSpace G) := sorry

/-- **Milestone 5 — it is a `K(G, 1)`.** The fundamental group is `G`, in the direction fixed
against the opposite-group convention of the universal-covers roadmap. -/
noncomputable def fundamentalGroupClassifyingSpace :
    FundamentalGroup (classifyingSpace G) (classifyingSpaceBasepoint G) ≃* G := sorry

theorem isEilenbergMacLaneSpaceOne_classifyingSpace :
    IsEilenbergMacLaneSpaceOne G (classifyingSpace G) (classifyingSpaceBasepoint G) := sorry

/-- The unconditional existence theorem: every group is the fundamental group of an aspherical
space, with no hypothesis on the group. -/
theorem exists_isEilenbergMacLaneSpaceOne :
    ∃ (X : Type u) (_ : TopologicalSpace X) (x : X), IsEilenbergMacLaneSpaceOne G X x := sorry

/-- **Milestone 6 — functoriality**, strictly and not only up to homotopy. -/
noncomputable def classifyingSpaceMap {H : Type u} [Group H] (φ : G →* H) :
    C(classifyingSpace G, classifyingSpace H) := sorry

theorem classifyingSpaceMap_id : classifyingSpaceMap G (MonoidHom.id G) = ContinuousMap.id _ :=
  sorry

theorem fundamentalGroup_classifyingSpaceMap {H : Type u} [Group H] (φ : G →* H) :
    ∀ γ, fundamentalGroupClassifyingSpace H
        (FundamentalGroup.mapOfEq (classifyingSpaceMap G φ) sorry γ) =
      φ (fundamentalGroupClassifyingSpace G γ) := sorry

end Simplicial

/-! ## Stage 2: the cellular model -/

section Cellular

variable {α : Type u}

/-- **Milestone 7 — the presentation complex** of a presentation: one vertex, a one-cell for each
generator, a two-cell for each relator. -/
def presentationComplex (rels : Set (FreeGroup α)) : Type u := sorry

noncomputable instance (rels : Set (FreeGroup α)) :
    TopologicalSpace (presentationComplex rels) := sorry

noncomputable def presentationComplexBasepoint (rels : Set (FreeGroup α)) :
    presentationComplex rels := sorry

/-- Its fundamental group is the presented group, by van Kampen. -/
noncomputable def fundamentalGroupPresentationComplex (rels : Set (FreeGroup α)) :
    FundamentalGroup (presentationComplex rels) (presentationComplexBasepoint rels) ≃*
      PresentedGroup rels := sorry

/-- **Milestone 10 — the cellular model.** Attaching cells above dimension two to the
presentation complex of the tautological presentation gives a `K(G, 1)` of CW type. -/
def cellularClassifyingSpace (G : Type u) [Group G] : Type u := sorry

noncomputable instance (G : Type u) [Group G] :
    TopologicalSpace (cellularClassifyingSpace G) := sorry

noncomputable def cellularClassifyingSpaceBasepoint (G : Type u) [Group G] :
    cellularClassifyingSpace G := sorry

theorem isEilenbergMacLaneSpaceOne_cellularClassifyingSpace (G : Type u) [Group G] :
    IsEilenbergMacLaneSpaceOne G (cellularClassifyingSpace G)
      (cellularClassifyingSpaceBasepoint G) := sorry

end Cellular

/-! ## Stage 3: uniqueness and the comparison of the models -/

section Uniqueness

variable {G : Type u} [Group G]

/-- **Milestone 12 — uniqueness.** Two `K(G, 1)` spaces of the same group, one of CW type, are
homotopy equivalent by an equivalence realizing a prescribed isomorphism of fundamental groups. -/
theorem nonempty_homotopyEquiv_of_isEilenbergMacLaneSpaceOne
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] {x : X} {y : Y}
    (hX : IsEilenbergMacLaneSpaceOne G X x) (hY : IsEilenbergMacLaneSpaceOne G Y y) :
    Nonempty (ContinuousMap.HomotopyEquiv X Y) := sorry

/-- **Milestone 13 — the two models agree.** -/
theorem nonempty_homotopyEquiv_classifyingSpace :
    Nonempty (ContinuousMap.HomotopyEquiv (classifyingSpace G) (cellularClassifyingSpace G)) :=
  sorry

end Uniqueness

/-! ## Stage 4: group homology and cohomology -/

section Homology

/-- **Milestone 16 — the comparison with algebra.** The singular homology of the classifying
space is the group homology of the trivial module. Stated over `ℤ` and in the bottom universe for
readability; the roadmap asks for it over any commutative ring and any group. -/
theorem singularHomology_classifyingSpace_iso_groupHomology (G : Type) [Group G] (n : ℕ) :
    Nonempty (groupHomology (Rep.trivial ℤ G ℤ) n ≅
      ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) n).obj
        (ModuleCat.of ℤ ℤ)).obj (TopCat.of (classifyingSpace G))) := sorry

end Homology

end TauCetiRoadmap.ClassifyingSpaces
