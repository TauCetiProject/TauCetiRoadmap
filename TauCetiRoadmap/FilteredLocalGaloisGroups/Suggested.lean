import Mathlib
import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap
import TauCeti.NumberTheory.LocalField.Uniformizer
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic

/-!
# Filtered local Galois groups and their solvable quotients: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file pins the carriers of Layers 0 and 1, which are group theory with no arithmetic input:
the closed derived series `closedDerivedSeries` and the solvable quotients `SolvableQuotient`,
filtrations `GroupFiltration` with filtered isomorphisms `IsFiltered` relative to an index set and
outer filtered isomorphisms `FilteredOut`, quotient filtrations, and the Herbrand functions and
restriction of a filtration to an open subgroup. It states the headline theorems of Layer 3
against the pinned Tau Ceti: the coordinates `artinCoordinateHom` on the abelianized absolute
Galois group, and centre-freeness of `G_K^m` for `m ≥ 2` and of `G_K`.

Layer 2 is stated in `README.md` only. The absolute upper filtration of
TauCetiProject/TauCetiRoadmap#1410 §4a.1 has no declaration at the pins, so the identification
of the Layer 1 constructions on local Galois groups with the upper numbering has nothing to be
stated against here.

Suggested homes: `TauCeti/Topology/Algebra/Group/Filtration/` for Layers 0 and 1, and
`TauCeti/NumberTheory/LocalField/FilteredGaloisGroup/` for Layers 2 and 3.
-/

open scoped Pointwise

namespace TauCetiRoadmap.FilteredLocalGaloisGroups

/-! ## Layer 0: the closed derived series and solvable quotients -/

section Layer0

variable (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- The **closed derived series** `G^[n]`: the topological closure of Mathlib's `derivedSeries`.
The recursion through closed commutators is `closedDerivedSeries_succ`. -/
def closedDerivedSeries (n : ℕ) : Subgroup G :=
  (derivedSeries G n).topologicalClosure

instance (n : ℕ) : (closedDerivedSeries G n).Normal :=
  Subgroup.is_normal_topologicalClosure _

theorem isClosed_closedDerivedSeries (n : ℕ) : IsClosed (closedDerivedSeries G n : Set G) :=
  Subgroup.isClosed_topologicalClosure _

theorem closedDerivedSeries_zero : closedDerivedSeries G 0 = ⊤ := by
  rw [closedDerivedSeries, derivedSeries_zero]
  exact top_unique (Subgroup.le_topologicalClosure _)

theorem closedDerivedSeries_one :
    closedDerivedSeries G 1 = (commutator G).topologicalClosure := by
  rw [closedDerivedSeries, derivedSeries_one]

/-- `G^[n+1]` is the closure of the commutator subgroup of `G^[n]`. -/
theorem closedDerivedSeries_succ (n : ℕ) :
    closedDerivedSeries G (n + 1) =
      (⁅closedDerivedSeries G n, closedDerivedSeries G n⁆).topologicalClosure :=
  sorry

theorem closedDerivedSeries_antitone : Antitone (closedDerivedSeries G) :=
  sorry

/-- A continuous isomorphism carries `G^[n]` onto `G'^[n]`. -/
theorem map_closedDerivedSeries {G' : Type*} [Group G'] [TopologicalSpace G']
    [IsTopologicalGroup G'] (e : G ≃ₜ* G') (n : ℕ) :
    (closedDerivedSeries G n).map e.toMulEquiv.toMonoidHom = closedDerivedSeries G' n :=
  sorry

/-- The maximal `n`-step solvable quotient `G^n = G/G^[n]`. For `n = 1` it is
`TopologicalAbelianization G` (`closedDerivedSeries_one`). -/
abbrev SolvableQuotient (n : ℕ) : Type _ :=
  G ⧸ closedDerivedSeries G n

/-- The image of `G^[m]` in `G^{m+n}` is the `m`-th closed derived subgroup of `G^{m+n}`. -/
theorem map_closedDerivedSeries_solvableQuotient [CompactSpace G] [T2Space G] (m n : ℕ) :
    (closedDerivedSeries G m).map (QuotientGroup.mk' (closedDerivedSeries G (m + n))) =
      closedDerivedSeries (SolvableQuotient G (m + n)) m :=
  sorry

/-- **A closed subgroup above `G^[m]`** [Hyeon 2025, Lem. 2.3(1)]: if `G^[m] ≤ H`, then
`G^[m+n]` lies in the `n`-th closed derived subgroup of `H`, computed in `H`. -/
theorem closedDerivedSeries_add_le (H : Subgroup G) (hH : IsClosed (H : Set G)) (m n : ℕ)
    (hm : closedDerivedSeries G m ≤ H) :
    closedDerivedSeries G (m + n) ≤ (closedDerivedSeries H n).map H.subtype :=
  sorry

/-- **The closed commutator subgroup of an intersection**: for a closed normal `N` of a profinite
group, `closure ⁅N, N⁆` is the intersection of the `closure ⁅N·U, N·U⁆` over the open normal
subgroups `U`. -/
theorem topologicalClosure_commutator_eq_iInf [CompactSpace G] [TotallyDisconnectedSpace G]
    (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G)) :
    (⁅N, N⁆).topologicalClosure =
      ⨅ U : OpenNormalSubgroup G, (⁅N ⊔ U.toSubgroup, N ⊔ U.toSubgroup⁆).topologicalClosure :=
  sorry

/-- **A prosolvable group has trivial `⋂_n G^[n]`.** -/
theorem iInf_closedDerivedSeries_eq_bot [CompactSpace G] [TotallyDisconnectedSpace G]
    (h : ∀ U : OpenNormalSubgroup G, Group.IsSolvable (G ⧸ U.toSubgroup)) :
    ⨅ n, closedDerivedSeries G n = ⊥ :=
  sorry

/-- **Centre-freeness passes to the limit**: if `⋂_n G^[n] = 1` and every `G^m` with `m ≥ m₀` is
centre-free, then `G` is centre-free. -/
theorem center_eq_bot_of_center_solvableQuotient_eq_bot
    (h : ⨅ n, closedDerivedSeries G n = ⊥) (m₀ : ℕ)
    (hm : ∀ m, m₀ ≤ m → Subgroup.center (SolvableQuotient G m) = ⊥) :
    Subgroup.center G = ⊥ :=
  sorry

/-- **Divisibility in a profinite abelian group**: `⋂_{n ≥ 1} A^n = 1`. -/
theorem iInf_range_powMonoidHom_eq_bot (A : Type*) [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] :
    ⨅ n : ℕ+, (powMonoidHom (n : ℕ) : A →* A).range = ⊥ :=
  sorry

end Layer0

/-! ## Layer 1: filtered topological groups -/

section Layer1

/-- A **filtration** of a topological group: an antitone family `u ↦ G(u)`, `u ∈ ℝ`, of closed
normal subgroups. No exhaustiveness, separatedness or continuity in `u` is assumed. -/
structure GroupFiltration (G : Type*) [Group G] [TopologicalSpace G] where
  /-- The step `G(u)`. -/
  step : ℝ → Subgroup G
  antitone_step : Antitone step
  isClosed_step : ∀ u, IsClosed (step u : Set G)
  normal_step : ∀ u, (step u).Normal

variable {G G' : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [Group G'] [TopologicalSpace G'] [IsTopologicalGroup G']

/-- `α` is **`S`-filtered**: it carries `G(u)` onto `G'(u)` for every `u ∈ S`. The index sets in
use are `Set.Ici 0` [Hyeon 2025, §2] and `Set.Ioi 0` [Mochizuki 1997, Def. 2.3]. -/
def IsFiltered (F : GroupFiltration G) (F' : GroupFiltration G') (S : Set ℝ) (α : G ≃ₜ* G') :
    Prop :=
  ∀ u ∈ S, (F.step u).map α.toMulEquiv.toMonoidHom = F'.step u

/-- The `S`-filtered isomorphisms `G ≃ₜ* G'`. -/
def FilteredIsom (F : GroupFiltration G) (F' : GroupFiltration G') (S : Set ℝ) : Type _ :=
  {α : G ≃ₜ* G' // IsFiltered F F' S α}

/-- Two filtered isomorphisms differ by an inner automorphism of the target. -/
def FilteredIsom.setoid (F : GroupFiltration G) (F' : GroupFiltration G') (S : Set ℝ) :
    Setoid (FilteredIsom F F' S) where
  r α β := ∃ g : G', ∀ x, β.1 x = g * α.1 x * g⁻¹
  iseqv := sorry

/-- **Outer filtered isomorphisms** `Out_Filt(G, G'; S)`: the `S`-filtered isomorphisms modulo
post-composition with inner automorphisms of `G'`. -/
def FilteredOut (F : GroupFiltration G) (F' : GroupFiltration G') (S : Set ℝ) : Type _ :=
  Quotient (FilteredIsom.setoid F F' S)

/-- An `S`-filtered isomorphism followed by conjugation by an element of `G'` is `S`-filtered:
the steps are normal. -/
theorem isFiltered_of_conj {F : GroupFiltration G} {F' : GroupFiltration G'} {S : Set ℝ}
    {α β : G ≃ₜ* G'} (hα : IsFiltered F F' S α) (g : G') (hβ : ∀ x, β x = g * α x * g⁻¹) :
    IsFiltered F F' S β :=
  sorry

/-- The **quotient filtration** `(G/N)(u) = G(u)·N/N`. -/
def GroupFiltration.quotient [CompactSpace G] (F : GroupFiltration G) (N : Subgroup G) [N.Normal]
    (hN : IsClosed (N : Set G)) : GroupFiltration (G ⧸ N) where
  step u := (F.step u).map (QuotientGroup.mk' N)
  antitone_step _ _ h := Subgroup.map_mono (F.antitone_step h)
  isClosed_step := sorry
  normal_step u := (F.normal_step u).map _ (QuotientGroup.mk'_surjective N)

/-- The **Herbrand function** of a subgroup `H`: `ψ_H(u) = u` for `u ≤ 0`, and
`ψ_H(u) = (1/f_H) ∫_0^u [G : G(t)·H] dt` for `u ≥ 0`, with `f_H = [G : G(0)·H]`. `G(t) ⊔ H` is
`G(t)·H`, the step being normal. -/
noncomputable def GroupFiltration.herbrandPsi (F : GroupFiltration G) (H : Subgroup G) (u : ℝ) :
    ℝ :=
  if u ≤ 0 then u
  else (∫ t in (0 : ℝ)..u, ((F.step t ⊔ H).index : ℝ)) / ((F.step 0 ⊔ H).index : ℝ)

theorem GroupFiltration.strictMono_herbrandPsi [CompactSpace G] (F : GroupFiltration G)
    {H : Subgroup G} (hH : IsOpen (H : Set G)) : StrictMono (F.herbrandPsi H) :=
  sorry

theorem GroupFiltration.surjective_herbrandPsi [CompactSpace G] (F : GroupFiltration G)
    {H : Subgroup G} (hH : IsOpen (H : Set G)) : Function.Surjective (F.herbrandPsi H) :=
  sorry

/-- `ψ_H` as an order isomorphism of `ℝ`; `φ_H` is its inverse. -/
noncomputable def GroupFiltration.herbrandPsiOrderIso [CompactSpace G] (F : GroupFiltration G)
    {H : Subgroup G} (hH : IsOpen (H : Set G)) : ℝ ≃o ℝ :=
  StrictMono.orderIsoOfSurjective (F.herbrandPsi H) (F.strictMono_herbrandPsi hH)
    (F.surjective_herbrandPsi hH)

/-- The **restriction** of a filtration to an open subgroup: `H(w) = G(φ_H(w)) ∩ H`. -/
noncomputable def GroupFiltration.restrict [CompactSpace G] (F : GroupFiltration G)
    {H : Subgroup G} (hH : IsOpen (H : Set G)) : GroupFiltration H where
  step w := (F.step ((F.herbrandPsiOrderIso hH).symm w)).subgroupOf H
  antitone_step := sorry
  isClosed_step := sorry
  normal_step := sorry

/-- **A filtered isomorphism restricts to open subgroups.** If `α` is `S`-filtered with
`[0, ∞) ⊆ S` and carries `H` onto `H'`, its restriction is `[0, ∞)`-filtered for the restricted
filtrations. -/
theorem exists_isFiltered_restrict [CompactSpace G] [CompactSpace G']
    {F : GroupFiltration G} {F' : GroupFiltration G'} {S : Set ℝ} (hS : Set.Ici 0 ⊆ S)
    {α : G ≃ₜ* G'} (hα : IsFiltered F F' S α) {H : Subgroup G} {H' : Subgroup G'}
    (hH : IsOpen (H : Set G)) (hH' : IsOpen (H' : Set G'))
    (hHH' : H.map α.toMulEquiv.toMonoidHom = H') :
    ∃ β : H ≃ₜ* H', (∀ x : H, (β x : G') = α x) ∧
      IsFiltered (F.restrict hH) (F'.restrict hH') (Set.Ici 0) β :=
  sorry

end Layer1

/-! ## Layer 3: the abelianization in coordinates and centre-freeness -/

section Layer3

open ValuativeRel TauCeti TauCeti.ClassFieldTheory

variable (p : ℕ) [Fact p.Prime] (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K]
  [IsNonarchimedeanLocalField K] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]

/-- The **coordinates** `𝒪_K^× × Ẑ → G_K^ab`, `(u, a) ↦ Art_K(u) · Art_K(ϖ)^ᶻ a`. -/
noncomputable def artinCoordinateHom (ϖ : Kˣ) :
    𝒪[K]ˣ × zHat.{0} →* Field.absoluteGaloisGroupAbelianization K :=
  MonoidHom.coprod ((artinMap K).comp (Units.map (algebraMap 𝒪[K] K).toMonoidHom))
    (zHat.lift (artinMap K ϖ)).toMonoidHom

/-- **`G_K^ab ≅ 𝒪_K^× × Ẑ` for a uniformizer `ϖ`**, as topological groups. -/
theorem exists_continuousMulEquiv_artinCoordinateHom (ϖ : Kˣ) (hϖ : IsUniformizer K ϖ) :
    ∃ e : 𝒪[K]ˣ × zHat.{0} ≃ₜ* Field.absoluteGaloisGroupAbelianization K,
      ⇑e = artinCoordinateHom K ϖ :=
  sorry

/-- **The centre lies in the top layer** [Hyeon 2025, Lem. A.2]:
`Z(G_K^{m+1}) ≤ G_K^[m]/G_K^[m+1]`. -/
theorem center_solvableQuotient_succ_le (m : ℕ) :
    Subgroup.center (SolvableQuotient (Field.absoluteGaloisGroup K) (m + 1)) ≤
      (closedDerivedSeries (Field.absoluteGaloisGroup K) m).map
        (QuotientGroup.mk' (closedDerivedSeries (Field.absoluteGaloisGroup K) (m + 1))) :=
  sorry

/-- **`G_K^m` is centre-free for `m ≥ 2`** [Hyeon 2025, Prop. A.1]. -/
theorem center_solvableQuotient_eq_bot (m : ℕ) (hm : 2 ≤ m) :
    Subgroup.center (SolvableQuotient (Field.absoluteGaloisGroup K) m) = ⊥ :=
  sorry

/-- **`G_K` is centre-free.** -/
theorem center_absoluteGaloisGroup_eq_bot :
    Subgroup.center (Field.absoluteGaloisGroup K) = ⊥ :=
  sorry

end Layer3

end TauCetiRoadmap.FilteredLocalGaloisGroups
