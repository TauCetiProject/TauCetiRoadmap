import Mathlib
import TauCeti.AlgebraicTopology.EilenbergMacLane.Covering
import TauCeti.AlgebraicTopology.EilenbergMacLane.HomotopyEquiv
import TauCeti.AlgebraicTopology.UniversalCover.Circle.EilenbergMacLane
import TauCeti.AlgebraicTopology.UniversalCover.Circle.FundamentalGroup
import TauCeti.AlgebraicTopology.UniversalCover.Circle.HigherHomotopy
import TauCeti.AlgebraicTopology.UniversalCover.Classification.Bijection
import TauCeti.AlgebraicTopology.UniversalCover.Classification.DeckGroup
import TauCeti.AlgebraicTopology.UniversalCover.Classification.EilenbergMacLane
import TauCeti.AlgebraicTopology.UniversalCover.Classification.MonodromyEquivalence
import TauCeti.AlgebraicTopology.UniversalCover.Classification.RecoveredSubgroup
import TauCeti.AlgebraicTopology.UniversalCover.Deck.FundamentalGroup.UniversalCover
import TauCeti.AlgebraicTopology.UniversalCover.Quotient
import TauCeti.AlgebraicTopology.UniversalCover.RealProjective.FundamentalGroup.Basic
import TauCeti.AlgebraicTopology.UniversalCover.Torus.EilenbergMacLane
import TauCeti.AlgebraicTopology.UniversalCover.Torus.FundamentalGroup
import TauCeti.AlgebraicTopology.UniversalCover.Torus.HigherHomotopy
import TauCeti.Topology.Homotopy.HomotopyGroup.BasepointChange
import TauCeti.Topology.Homotopy.HomotopyGroup.Covering
import TauCeti.Topology.Homotopy.HomotopyGroup.Map

/-!
# Universal covers: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for the milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a stage nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed
by the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel
rather than asserted in prose. No statement is left as `sorry`. That is evidence for completion,
not its criterion: completion is judged by a milestone-by-milestone audit against `README.md`,
which a `sorry`-free file of suggested forms cannot replace.

The roadmap asks for two conventions to be fixed before anything is stated. The
deck group of the universal cover is isomorphic to `(FundamentalGroup X x₀)ᵐᵒᵖ`, the opposite
group, which is the form the left action of Stage 0.3 forces (Stage 1, milestone 5). Homotopy
groups are Mathlib's cubical `HomotopyGroup`, indexed by a finite type `N` rather than by a
natural number, so "for `n ≥ 2`" reads as `[Nontrivial N]` or as the `π_ (n + 2)` form.

The standing hypotheses of the roadmap -- `[PathConnectedSpace X]`, `[LocallyPathConnectedSpace X]`
and `[SemilocallySimplyConnectedSpace X]` -- are carried explicitly on every statement that needs
them, never baked into a structure.
-/

namespace TauCetiRoadmap.UniversalCovers

open TauCeti CategoryTheory
open scoped Topology Topology.Homotopy unitInterval ContinuousMap

universe u v

/-! ## Stage 0: the ported foundations -/

section Stage0

variable {X : Type u} [TopologicalSpace X]

/-- **Milestone 1 — discreteness of the homotopy-class fibres.** Based paths from `x₀` modulo
endpoint-preserving homotopy, over a fixed endpoint, form a discrete space. Path-connectedness of
`X` is not needed, and the total space is not discrete: only these fibres are. -/
theorem discreteTopology_pathHomotopicQuotient [LocallyPathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ x : X) :
    DiscreteTopology (Path.Homotopic.Quotient x₀ x) :=
  Path.Homotopic.Quotient.instDiscreteTopology

/-- Once the endpoint projection is a covering map, its fibres are discrete too; that step is
where path-connectedness enters, since it is what makes the projection surjective. -/
theorem discreteTopology_fiber [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ x : X) :
    DiscreteTopology (UniversalCover.proj (x₀ := x₀) ⁻¹' {x}) :=
  UniversalCover.discreteTopology_fiber x₀ x

/-- **Milestone 2 — the based-path space and the cover.** The endpoint projection out of
`UniversalCover x₀` is a covering map. -/
theorem isCoveringMap [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) :
    IsCoveringMap (UniversalCover.proj (x₀ := x₀)) :=
  UniversalCover.isCoveringMap x₀

/-- The universal cover is path-connected and simply connected. -/
theorem pathConnectedSpace (x₀ : X) : PathConnectedSpace (UniversalCover x₀) :=
  UniversalCover.pathConnectedSpace x₀

theorem simplyConnectedSpace [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) :
    SimplyConnectedSpace (UniversalCover x₀) :=
  UniversalCover.simplyConnectedSpace x₀

/-- The universal lifting property out of a simply connected, locally path-connected space. -/
theorem existsUnique_continuousMap_lifts {A : Type v} [TopologicalSpace A]
    [SimplyConnectedSpace A] [LocallyPathConnectedSpace A]
    [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X)
    (f : C(A, X)) (a₀ : A) (e₀ : UniversalCover x₀) (he : UniversalCover.proj e₀ = f a₀) :
    ∃! F : C(A, UniversalCover x₀), F a₀ = e₀ ∧ UniversalCover.proj ∘ F = f :=
  UniversalCover.existsUnique_continuousMap_lifts x₀ f a₀ e₀ he

/-- **Milestone 3 — the `π₁` action.** `π₁(X, x₀)` acts faithfully and continuously on the
universal cover, and the projection is the quotient covering map for that action. -/
noncomputable example (x₀ : X) : MulAction (FundamentalGroup X x₀) (UniversalCover x₀) :=
  inferInstance

example (x₀ : X) : FaithfulSMul (FundamentalGroup X x₀) (UniversalCover x₀) := inferInstance

example (x₀ : X) : ContinuousConstSMul (FundamentalGroup X x₀) (UniversalCover x₀) :=
  inferInstance

theorem isQuotientCoveringMap [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) :
    IsQuotientCoveringMap (UniversalCover.proj (x₀ := x₀)) (FundamentalGroup X x₀) :=
  UniversalCover.isQuotientCoveringMap

/-- **Milestone 4 — the deck transformation group.** `Deck p` is a subgroup of the
self-homeomorphisms of the total space, and so is a group acting faithfully and continuously. -/
example {E : Type u} [TopologicalSpace E] (p : E → X) : Subgroup (E ≃ₜ E) := Deck p

example {E : Type u} [TopologicalSpace E] (p : E → X) : MulAction (Deck p) E := inferInstance

example {E : Type u} [TopologicalSpace E] (p : E → X) : FaithfulSMul (Deck p) E := inferInstance

example {E : Type u} [TopologicalSpace E] (p : E → X) : ContinuousConstSMul (Deck p) E :=
  inferInstance

end Stage0

/-! ## Stage 1: closing out the universal cover -/

section Stage1

variable {X : Type u} [TopologicalSpace X]

/-- **Milestone 5 — `Deck(proj) ≃* π₁(X, x₀)ᵐᵒᵖ`.** The convention check the roadmap asked for
resolves against the opposite group: the `π₁` action of Stage 0.3 is a left action, so the deck
group is the opposite of the fundamental group, not the fundamental group itself. -/
noncomputable def deckFundamentalGroupEquiv [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) :
    Deck (UniversalCover.proj (x₀ := x₀)) ≃* (FundamentalGroup X x₀)ᵐᵒᵖ :=
  UniversalCover.deckFundamentalGroupEquiv x₀

/-- With that isomorphism, `UniversalCover x₀ / π₁(X, x₀) ≃ X` is the quotient-cover statement of
Stage 0.3, read through Mathlib's `IsQuotientCoveringMap`. -/
noncomputable def quotientHomeomorph [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) :
    MulAction.orbitRel.Quotient (FundamentalGroup X x₀) (UniversalCover x₀) ≃ₜ X :=
  UniversalCover.orbitQuotientHomeomorph x₀

end Stage1

/-! ## Stage 2: the lifting criterion and the Galois correspondence -/

section Stage2

variable {X : Type u} [TopologicalSpace X] (x₀ : X)

/-- **Milestone 6 — the general lifting criterion**, consumed from Mathlib rather than rebuilt:
the hypotheses are path-connectedness and local path-connectedness of the source, a lift of the
basepoint, and the subgroup inclusion that `f_*(π₁ A) ⊆ p_*(π₁ E)` abbreviates. -/
theorem existsUnique_continuousMap_lifts_of_range_le {A E : Type u} [TopologicalSpace A]
    [TopologicalSpace E] [PathConnectedSpace A] [LocallyPathConnectedSpace A]
    {p : E → X} (cov : IsCoveringMap p) {f : C(A, X)} {a₀ : A} {e₀ : E} (he : p e₀ = f a₀)
    (le : (FundamentalGroup.map f a₀).range ≤
      (FundamentalGroup.mapOfEq ⟨p, cov.continuous⟩ he).range) :
    ∃! F : C(A, E), F a₀ = e₀ ∧ p ∘ F = f :=
  cov.existsUnique_continuousMap_lifts_of_range_le he le

variable [LocallyPathConnectedSpace X] [PathConnectedSpace X] [SemilocallySimplyConnectedSpace X]

/-- **Milestone 7 — the cover attached to `H ≤ π₁(X, x₀)`.** Its descended endpoint projection is
a covering map, and the subgroup it recovers at the quotient basepoint is `H` itself. -/
theorem isCoveringMap_subgroupQuotientProj (H : Subgroup (FundamentalGroup X x₀)) :
    IsCoveringMap (UniversalCover.subgroupQuotientProj x₀ H) :=
  UniversalCover.isCoveringMap_subgroupQuotientProj x₀ H

theorem range_recovered_subgroup (H : Subgroup (FundamentalGroup X x₀)) :
    (FundamentalGroup.mapOfEq
      (x := UniversalCover.SubgroupQuotient.basepoint x₀ H) (y := x₀)
      ⟨UniversalCover.subgroupQuotientProj x₀ H,
        UniversalCover.continuous_subgroupQuotientProj x₀ H⟩
      (UniversalCover.subgroupQuotientProj_basepoint x₀ H)).range = H :=
  UniversalCover.range_mapOfEq_subgroupQuotientProj x₀ H

omit [LocallyPathConnectedSpace X] [PathConnectedSpace X] [SemilocallySimplyConnectedSpace X] in
/-- The other half of milestone 7: the subgroup a cover recovers moves by conjugacy when the
chosen lift of the basepoint moves. -/
theorem exists_range_eq_map_conj {E F : Type u} [TopologicalSpace E] [TopologicalSpace F]
    {p : E → X} {q : F → X} (hq : IsCoveringMap q) {e₀ : E} {f₀ : F}
    (hpe : p e₀ = x₀) (hqf : q f₀ = x₀) (h : E ≃ₜ F) (hcomp : q ∘ h = p)
    (hj : Joined (h e₀) f₀) :
    ∃ γ : FundamentalGroup X x₀,
      (FundamentalGroup.mapOfEq ⟨q, hq.continuous⟩ hqf).range =
        (FundamentalGroup.mapOfEq ⟨p, hcomp ▸ hq.continuous.comp h.continuous⟩ hpe).range.map
          (MulAut.conj γ).toMonoidHom :=
  hq.exists_range_eq_map_conj_of_homeomorph_comp_eq hpe hqf h hcomp hj

/-- **Milestone 8 — the Galois correspondence, pointed.** Every pointed connected cover is the
cover of exactly one subgroup. -/
theorem existsUnique_subgroup {E : Type u} [TopologicalSpace E] [PathConnectedSpace E]
    {p : E → X} (hp : IsCoveringMap p) {e₀ : E} (hpe : p e₀ = x₀) :
    ∃! H : Subgroup (FundamentalGroup X x₀), ∃ h : E ≃ₜ UniversalCover.SubgroupQuotient x₀ H,
      h e₀ = UniversalCover.SubgroupQuotient.basepoint x₀ H ∧
        UniversalCover.subgroupQuotientProj x₀ H ∘ h = p :=
  UniversalCover.existsUnique_subgroup_homeomorph_subgroupQuotient (x₀ := x₀) hp hpe

/-- **The Galois correspondence, unpointed.** Two subgroup quotients are isomorphic as covers
exactly when the subgroups are conjugate. -/
theorem isomorphic_iff_conjugate (H K : Subgroup (FundamentalGroup X x₀)) :
    (∃ h : UniversalCover.SubgroupQuotient x₀ H ≃ₜ UniversalCover.SubgroupQuotient x₀ K,
        UniversalCover.subgroupQuotientProj x₀ K ∘ h =
          UniversalCover.subgroupQuotientProj x₀ H) ↔
      ∃ γ : FundamentalGroup X x₀, K = H.map (MulAut.conj γ).toMonoidHom :=
  UniversalCover.exists_homeomorph_subgroupQuotient_comp_eq_iff_exists_eq_map_conj x₀ H K

/-- **The deck group of an intermediate cover is `N(H)/H`.** -/
noncomputable def deckSubgroupQuotientProjEquiv (H : Subgroup (FundamentalGroup X x₀)) :
    (Subgroup.normalizer (H : Set (FundamentalGroup X x₀))) ⧸
        H.subgroupOf (Subgroup.normalizer (H : Set (FundamentalGroup X x₀)))
      ≃* Deck (UniversalCover.subgroupQuotientProj x₀ H) :=
  UniversalCover.deckSubgroupQuotientProjEquiv x₀ H

omit [LocallyPathConnectedSpace X] [SemilocallySimplyConnectedSpace X] in
/-- Before the regular-cover theorem: a connected covering is regular exactly when its deck
group acts transitively on a fibre. -/
theorem isRegular_iff_fiber_isPretransitive {E : Type u} [TopologicalSpace E]
    [PreconnectedSpace E] {p : E → X} (hp : IsCoveringMap p) {x : X} (e : p ⁻¹' {x}) :
    Deck.IsRegular p ↔ MulAction.IsPretransitive (Deck p) (p ⁻¹' {x}) :=
  Deck.isRegular_iff_fiber_isPretransitive hp e

/-- **Regularity is normality**, and then the deck group is `π₁(X, x₀)/H`. -/
theorem isRegular_iff_normal (H : Subgroup (FundamentalGroup X x₀)) :
    Deck.IsRegular (UniversalCover.subgroupQuotientProj x₀ H) ↔ H.Normal :=
  UniversalCover.isRegular_subgroupQuotientProj_iff_normal x₀ H

noncomputable def deckEquivOfNormal (H : Subgroup (FundamentalGroup X x₀)) [H.Normal] :
    FundamentalGroup X x₀ ⧸ H ≃* Deck (UniversalCover.subgroupQuotientProj x₀ H) :=
  UniversalCover.deckSubgroupQuotientProjEquivOfNormal x₀ H

end Stage2

/-- **Milestone 8, the alternative lens.** Covering spaces of `X` are equivalent to functors out
of the fundamental groupoid, and the connected ones to transitive such actions. -/
noncomputable def monodromyEquivalence (X : TopCat.{u}) [PathConnectedSpace X] [LocallyPathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] :
    CoveringSpace X ≌ (FundamentalGroupoid X ⥤ Type u) :=
  CoveringSpace.monodromyEquivalence X

noncomputable def connectedMonodromyEquivalence (X : TopCat.{u}) [PathConnectedSpace X]
    [LocallyPathConnectedSpace X] [SemilocallySimplyConnectedSpace X] :
    ConnectedCoveringSpace X ≌ TransitiveFundamentalGroupoidAction X :=
  ConnectedCoveringSpace.monodromyEquivalence X

/-! ## Stage 3: higher homotopy -/

section Stage3

variable {X : Type u} [TopologicalSpace X] {N : Type v} [Fintype N]

/-- **Milestone 9 — the `π_n` API.** A pointed continuous map induces a map of homotopy groups,
functorially. -/
def homotopyGroupMap {Y : Type u} [TopologicalSpace Y] {x : X} {y : Y} (f : C(X, Y))
    (hf : f x = y) : HomotopyGroup N X x → HomotopyGroup N Y y :=
  HomotopyGroup.map f hf

omit [Fintype N] in
theorem homotopyGroupMap_id (x : X) (a : HomotopyGroup N X x) :
    homotopyGroupMap (ContinuousMap.id X) rfl a = a :=
  HomotopyGroup.map_id_apply a

omit [Fintype N] in
theorem homotopyGroupMap_comp {Y Z : Type u} [TopologicalSpace Y] [TopologicalSpace Z]
    {x : X} {y : Y} {z : Z} (g : C(Y, Z)) (hg : g y = z) (f : C(X, Y)) (hf : f x = y)
    (a : HomotopyGroup N X x) :
    homotopyGroupMap g hg (homotopyGroupMap f hf a) =
      homotopyGroupMap (g.comp f) (by simp [hf, hg]) a :=
  HomotopyGroup.map_comp_apply g hg f hf a

omit [Fintype N] in
/-- The boundary-relative API on `Ω^N`: a generalized loop is constant on the cube boundary, and
postcomposition with a pointed map respects homotopy relative to that boundary. -/
theorem genLoop_boundary {x : X} (p : Ω^ N X x) {t : I^N} (ht : t ∈ Cube.boundary N) :
    p.1 t = x :=
  GenLoop.boundary p t ht

omit [Fintype N] in
theorem genLoop_map_homotopic {Y : Type u} [TopologicalSpace Y] {x : X} {y : Y}
    {f g : Ω^ N X x} (h : GenLoop.Homotopic f g) (F : C(X, Y)) (hF : F x = y) :
    GenLoop.Homotopic (GenLoop.map F hF f) (GenLoop.map F hF g) :=
  GenLoop.map_homotopic h F hF

omit [Fintype N] in
/-- Cubes are path-connected, and so are their boundaries in dimension at least two: this is the
connectedness input the `π_n` arguments need. -/
theorem isPathConnected_cube : IsPathConnected (Set.univ : Set (I^N)) :=
  TauCeti.isPathConnected_cube

omit [Fintype N] in
theorem isPathConnected_cubeBoundary [Nontrivial N] : IsPathConnected (Cube.boundary N) :=
  TauCeti.isPathConnected_cubeBoundary

/-- Basepoint change along a path is an isomorphism of homotopy groups, in every dimension. -/
noncomputable def homotopyGroupMulEquivOfPath [Nonempty N] [DecidableEq N] {x y : X}
    (γ : Path x y) : HomotopyGroup N X x ≃* HomotopyGroup N X y :=
  TauCeti.homotopyGroupMulEquivOfPath γ

/-- **Milestone 10 — a covering map induces an isomorphism on `π_n` for `n ≥ 2`**, the dimension
condition reading as `Nontrivial N` on the cubical index type. -/
noncomputable def coveringHomotopyGroupMulEquiv [DecidableEq N] [Nontrivial N]
    {E : Type u} [TopologicalSpace E] {p : E → X} (hp : IsCoveringMap p) (e : E) :
    HomotopyGroup N E e ≃* HomotopyGroup N X (p e) :=
  hp.homotopyGroupMulEquiv e

end Stage3

/-! ## Stage 4: applications -/

section Stage4

/-- **Milestone 11 — `π_n(S¹) = 0` for `n ≥ 2`.** -/
example {N : Type u} [Fintype N] [Nontrivial N] [DecidableEq N] (p : ℝ) (x : AddCircle p) :
    Subsingleton (HomotopyGroup N (AddCircle p) x) :=
  inferInstance

/-- **Milestone 12 — `π₁(S¹) ≅ ℤ`.** -/
noncomputable def circleFundamentalGroupMulEquiv :
    FundamentalGroup UnitAddCircle 0 ≃* Multiplicative ℤ :=
  UnitAddCircle.fundamentalGroupMulEquiv

/-- **Milestone 13 — `π_n(Tᵏ)`.** The fundamental group of a torus is the product of copies of
`ℤ`, and every higher homotopy group vanishes. -/
noncomputable def torusFundamentalGroupMulEquiv {ι : Type u} {p : ι → ℝ} (hp : ∀ i, p i ≠ 0)
    {x : ∀ i, AddCircle (p i)} (e : ∀ i, ((↑) : ℝ → AddCircle (p i)) ⁻¹' {x i}) :
    FundamentalGroup (∀ i, AddCircle (p i)) x ≃* ∀ _ : ι, Multiplicative ℤ :=
  AddCircle.piFundamentalGroupMulEquiv hp e

example {ι : Type u} {N : Type u} [Fintype N] [Nontrivial N] [DecidableEq N] (p : ι → ℝ)
    (x : ∀ i, AddCircle (p i)) : Subsingleton (HomotopyGroup N (∀ i, AddCircle (p i)) x) :=
  inferInstance

/-- **Milestone 13 — `π₁(RPⁿ) ≅ ℤ/2` for `n ≥ 2`**, at any basepoint. -/
noncomputable def realProjectiveFundamentalGroupMulEquiv {n : ℕ} (hn : 2 ≤ n) (x : RealProjectiveSpace n) :
    FundamentalGroup (RealProjectiveSpace n) x ≃* ℤˣ :=
  RealProjectiveSpace.fundamentalGroupMulEquivAt n hn x

end Stage4

/-! ### Milestone 14: recognition of `K(G, 1)` spaces -/

section EilenbergMacLane

variable {X : Type u} [TopologicalSpace X]

/-- A space is aspherical exactly when the higher homotopy groups of its universal cover
vanish: this is the recognition criterion the roadmap asks for. -/
theorem isAspherical_iff [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) :
    IsAspherical X x₀ ↔
      ∀ n : ℕ, Subsingleton (π_ (n + 2) (UniversalCover x₀)
        (UniversalCover.basepointLift x₀ : UniversalCover x₀)) :=
  UniversalCover.isAspherical_iff x₀

/-- With a fundamental group identified, the same hypothesis recognizes a `K(G, 1)`. -/
theorem isEilenbergMacLaneSpaceOne [LocallyPathConnectedSpace X] [PathConnectedSpace X]
    [SemilocallySimplyConnectedSpace X] (x₀ : X) {G : Type v} [Group G]
    (e : FundamentalGroup X x₀ ≃* G)
    (h : ∀ n : ℕ, Subsingleton (π_ (n + 2) (UniversalCover x₀)
      (UniversalCover.basepointLift x₀ : UniversalCover x₀))) :
    IsEilenbergMacLaneSpaceOne G X x₀ :=
  UniversalCover.isEilenbergMacLaneSpaceOne x₀ e h

/-- Asphericity transfers along a covering map to the total space. -/
theorem isAspherical_totalSpace {E : Type u} [TopologicalSpace E] [PathConnectedSpace E]
    {p : E → X} {e : E} {x : X} (hp : IsCoveringMap p) (he : p e = x) (h : IsAspherical X x) :
    IsAspherical E e :=
  hp.isAspherical_totalSpace he h

/-- Asphericity and the `K(G, 1)` property are stable under products and indexed products. -/
theorem isAspherical_prod {Y : Type u} [TopologicalSpace Y] {x : X} {y : Y}
    (hX : IsAspherical X x) (hY : IsAspherical Y y) : IsAspherical (X × Y) (x, y) :=
  hX.prod hY

theorem isAspherical_pi {ι : Type v} {Z : ι → Type u} [∀ i, TopologicalSpace (Z i)]
    {z : ∀ i, Z i} (h : ∀ i, IsAspherical (Z i) (z i)) : IsAspherical (∀ i, Z i) z :=
  IsAspherical.pi h

theorem isEilenbergMacLaneSpaceOne_pi {ι : Type v} {G : ι → Type v} [∀ i, Group (G i)]
    {Z : ι → Type u} [∀ i, TopologicalSpace (Z i)] {z : ∀ i, Z i}
    (h : ∀ i, IsEilenbergMacLaneSpaceOne (G i) (Z i) (z i)) :
    IsEilenbergMacLaneSpaceOne (∀ i, G i) (∀ i, Z i) z :=
  IsEilenbergMacLaneSpaceOne.pi h

/-- Asphericity and the `K(G, 1)` property are homotopy invariants, so in particular they are
stable under homeomorphism. -/
theorem isAspherical_of_homotopyEquiv {Y : Type u} [TopologicalSpace Y] {x : X}
    (h : IsAspherical X x) (e : X ≃ₕ Y) (y : Y) : IsAspherical Y y :=
  h.of_homotopyEquiv e y

theorem isEilenbergMacLaneSpaceOne_of_homotopyEquiv {Y : Type u} [TopologicalSpace Y] {x : X}
    {G : Type v} [Group G] (h : IsEilenbergMacLaneSpaceOne G X x) (e : X ≃ₕ Y) (y : Y) :
    IsEilenbergMacLaneSpaceOne G Y y :=
  h.of_homotopyEquiv e y

theorem isEilenbergMacLaneSpaceOne_of_homeomorph {Y : Type u} [TopologicalSpace Y] {x : X}
    {G : Type v} [Group G] (h : IsEilenbergMacLaneSpaceOne G X x) (e : X ≃ₜ Y) (y : Y) :
    IsEilenbergMacLaneSpaceOne G Y y :=
  h.of_homotopyEquiv e.toHomotopyEquiv y

/-- Circles and tori are the examples. -/
theorem circle_isEilenbergMacLaneSpaceOne (p : ℝ) (hp : p ≠ 0) (x : AddCircle p) :
    IsEilenbergMacLaneSpaceOne (Multiplicative ℤ) (AddCircle p) x :=
  AddCircle.isEilenbergMacLaneSpaceOne p hp x

theorem torus_isEilenbergMacLaneSpaceOne {ι : Type u} (p : ι → ℝ) (hp : ∀ i, p i ≠ 0)
    (x : ∀ i, AddCircle (p i)) :
    IsEilenbergMacLaneSpaceOne (∀ _ : ι, Multiplicative ℤ) (∀ i, AddCircle (p i)) x :=
  AddCircle.isEilenbergMacLaneSpaceOne_pi p hp x

end EilenbergMacLane

end TauCetiRoadmap.UniversalCovers
