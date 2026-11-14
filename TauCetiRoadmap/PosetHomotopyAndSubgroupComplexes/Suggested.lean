module

public import Mathlib
public import TauCeti.AlgebraicTopology.SimplicialComplex.OrderComplex
public import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.Basic
public import TauCeti.AlgebraicTopology.SimplicialComplex.Realization.Map
public import TauCeti.Topology.Homotopy.HomotopyGroup.WeakHomotopyEquivalence

/-!
# Homotopy of posets, finite spaces and subgroup complexes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with only the definitions
their statements need, all with real bodies. Finite spaces are Mathlib's topological spaces with
their `Specialization` order; posets are realised through Tau Ceti's order complex
`TauCeti.AbstractSimplicialComplex.orderComplex` and its weak realization
`AbstractSimplicialComplex.Realization`, with Tau Ceti's
`PreAbstractSimplicialComplex.SimplicialMap.realizationMap` for monotone maps and Tau Ceti's
`ContinuousMap.IsWeakHomotopyEquivalence`.

Headlines stated, with their README targets:

* 1.2 `homotopic_iff_eqvGen`; 1.3 `exists_retraction_of_isBeatPoint`;
  1.4 `exists_homeomorph_of_homotopyEquiv`; 1.5 `exists_invariant_core`,
  `exists_fixedPoint_of_contractibleSpace`;
* 2.1 `isWeakHomotopyEquivalence_of_isBasisLike`;
  2.2 `exists_isWeakHomotopyEquivalence_realization`; 2.3 `exists_isWeakHomotopyEquivalence_faces`;
* 3.1 `nonempty_homeomorph_nerve`; 3.2 `homotopic_realizationMap_of_le`;
  3.3 `contractibleSpace_of_conical`; 3.4 `exists_homotopyEquiv_of_contractible_fibres`;
  3.5 `chainEulerChar_modEq_of_fixedPoints`;
* 4.1 `exists_card_eq_iff_le_pRank`; 4.2 `exists_homotopyEquiv_elemAbelianToPSubgroup`;
  4.3 `contractibleSpace_of_normal`; 4.4 `contractibleSpace_withUpperSet_iff`;
  4.5 `not_connectedSpace_iff`; 4.6 `exists_normal_of_contractibleSpace`;
  4.7 `eulerChar_pSubgroupPoset_modEq`.

Not stated: README 3.4 (b), the fibre lemma for an arbitrary basic localizer, lacking
HomotopyTheoryOfCategories' `IsBasicLocalizer` and `IsAsphericalFunctor`. The `p`-core and the
`p`-rank are OddOrderTheorem's (§1.1 and §1.4), whose declarations are not importable here:
elementary abelian subgroups are written by their two conditions (abelian, exponent dividing
`p`), the `p`-rank `m_p(G)` in 4.1 as the supremum of the `k` such that `G` has such a subgroup of
order `p ^ k`, and `O_p(G) ≠ 1` as the existence of a nontrivial normal `p`-subgroup, its
equivalent form by OddOrderTheorem §1.1. The Euler characteristic `chainEulerChar` of 3.5 and 4.7
is the alternating count of faces, which Tau Ceti's
`AbstractSimplicialComplex.eulerChar_realization` identifies with the Euler characteristic of the
realization.
-/

@[expose] public section

universe u v

open CategoryTheory Topology TauCeti.SetLike TauCeti.AbstractSimplicialComplex
open scoped ContinuousMap

namespace TauCetiRoadmap.PosetHomotopyAndSubgroupComplexes

/-! ## Layer 1: finite spaces -/

/-- **1.3.** A beat point of a preorder: either the elements strictly below `x` have a largest
element (a down beat point) or the elements strictly above `x` have a smallest one (an up beat
point). -/
def IsBeatPoint {P : Type u} [Preorder P] (x : P) : Prop :=
  (∃ y, y < x ∧ ∀ z, z < x → z ≤ y) ∨ (∃ y, x < y ∧ ∀ z, x < z → y ≤ z)

section FiniteSpaces

variable {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]

/-- **1.2.** Two maps between finite spaces are homotopic exactly when they are joined by a fence
of maps, consecutive ones pointwise comparable in the specialization order. -/
theorem homotopic_iff_eqvGen [Finite X] [Finite Y] (f g : C(X, Y)) :
    f.Homotopic g ↔ Relation.EqvGen (fun f₁ f₂ : C(X, Y) => ∀ x, f₁ x ⤳ f₂ x) f g := sorry

/-- **1.3.** Removing a beat point of a finite `T₀` space leaves a strong deformation retract: a
retraction onto the complement of the point whose composite with the inclusion is homotopic to
the identity relative to that complement. -/
theorem exists_retraction_of_isBeatPoint [Finite X] [T0Space X] (x : X)
    (hx : IsBeatPoint (Specialization.toEquiv x)) :
    ∃ r : C(X, {y : X // y ≠ x}), (∀ y : {y : X // y ≠ x}, r y = y) ∧
      ((⟨Subtype.val, continuous_subtype_val⟩ : C({y : X // y ≠ x}, X)).comp r).HomotopicRel
        (ContinuousMap.id X) {y | y ≠ x} := sorry

/-- **1.4.** Stong's classification: a homotopy equivalence between finite `T₀` spaces without
beat points is a homeomorphism. -/
theorem exists_homeomorph_of_homotopyEquiv [Finite X] [T0Space X] [Finite Y] [T0Space Y]
    (hX : ∀ x : Specialization X, ¬ IsBeatPoint x) (hY : ∀ y : Specialization Y, ¬ IsBeatPoint y)
    (e : X ≃ₕ Y) : ∃ h : X ≃ₜ Y, ⇑h = ⇑e.toFun := sorry

/-- **1.5.** A finite `T₀` space on which a group acts by homeomorphisms has an invariant core: an
invariant subspace without beat points onto which it strongly deformation retracts. -/
theorem exists_invariant_core {G : Type v} [Group G] [MulAction G X] [ContinuousConstSMul G X]
    [Finite X] [T0Space X] :
    ∃ Y : Set X, (∀ g : G, ∀ y ∈ Y, g • y ∈ Y) ∧ (∀ y : Specialization Y, ¬ IsBeatPoint y) ∧
      ∃ r : C(X, Y), (∀ y : Y, r y = y) ∧
        ((⟨Subtype.val, continuous_subtype_val⟩ : C(Y, X)).comp r).HomotopicRel
          (ContinuousMap.id X) Y := sorry

/-- **1.5.** A group acting by homeomorphisms on a contractible finite `T₀` space has a fixed
point. -/
theorem exists_fixedPoint_of_contractibleSpace {G : Type v} [Group G] [MulAction G X]
    [ContinuousConstSMul G X] [Finite X] [T0Space X] [ContractibleSpace X] :
    ∃ x : X, ∀ g : G, g • x = x := sorry

/-! ## Layer 2: McCord's theorems -/

/-- **2.1.** A basis-like open cover: open sets covering the space such that every point of the
intersection of two members lies in a member contained in that intersection. -/
def IsBasisLike (𝒰 : Set (Set Y)) : Prop :=
  (∀ U ∈ 𝒰, IsOpen U) ∧ (∀ y : Y, ∃ U ∈ 𝒰, y ∈ U) ∧
    ∀ U ∈ 𝒰, ∀ V ∈ 𝒰, ∀ y ∈ U ∩ V, ∃ W ∈ 𝒰, y ∈ W ∧ W ⊆ U ∩ V

/-- **2.1.** McCord's theorem on basis-like covers: a map restricting to weak homotopy
equivalences over the members of a basis-like open cover of its target is a weak homotopy
equivalence. -/
theorem isWeakHomotopyEquivalence_of_isBasisLike (f : C(X, Y)) {𝒰 : Set (Set Y)}
    (h𝒰 : IsBasisLike 𝒰) (hf : ∀ U ∈ 𝒰, (f.restrictPreimage U).IsWeakHomotopyEquivalence) :
    f.IsWeakHomotopyEquivalence := sorry

/-- **2.2.** McCord's theorem: the realization of the order complex of the specialization order
of an Alexandrov-discrete `T₀` space maps to the space by a weak homotopy equivalence, sending each
point to the largest vertex of its carrier. -/
theorem exists_isWeakHomotopyEquivalence_realization [AlexandrovDiscrete X] [T0Space X] :
    ∃ f : C(AbstractSimplicialComplex.Realization (orderComplex (Specialization X)), X),
      (∀ x, Specialization.toEquiv (f x) ∈
          (AbstractSimplicialComplex.carrier (orderComplex (Specialization X)) x).1 ∧
        ∀ v ∈ (AbstractSimplicialComplex.carrier (orderComplex (Specialization X)) x).1,
          v ≤ Specialization.toEquiv (f x)) ∧
      f.IsWeakHomotopyEquivalence := sorry

end FiniteSpaces

/-- **2.3.** The upper-set carrier-map variant of McCord's theorem for a simplicial complex,
obtained from McCord's Theorem 2 through barycentric subdivision: the carrier map from the
realization to the face poset, with its upper-set topology, is continuous and a weak homotopy
equivalence. -/
theorem exists_isWeakHomotopyEquivalence_faces {ι : Type u}
    (K : AbstractSimplicialComplex ι) :
    ∃ f : C(AbstractSimplicialComplex.Realization K, WithUpperSet (Face K)),
      (∀ x, f x = WithUpperSet.toUpperSet (AbstractSimplicialComplex.carrier K x)) ∧
      f.IsWeakHomotopyEquivalence := sorry

/-! ## Layer 3: homotopy of posets -/

/-- **3.1.** The realization of the order complex of a partial order is homeomorphic to the
geometric realization of its nerve. -/
theorem nonempty_homeomorph_nerve (P : Type u) [PartialOrder P] :
    Nonempty (AbstractSimplicialComplex.Realization (orderComplex P) ≃ₜ
      SSet.toTop.obj (nerve P)) := sorry

/-- **3.2.** Comparable monotone maps realize to homotopic maps. -/
theorem homotopic_realizationMap_of_le {P : Type u} {Q : Type v} [Preorder P] [Preorder Q]
    [DecidableEq Q] {f g : P →o Q} (h : f ≤ g) :
    (orderComplexMap f).realizationMap.Homotopic (orderComplexMap g).realizationMap := sorry

/-- **3.3.** Quillen's conical contractibility: a preorder with a monotone self-map `f` and an
element `x₀` such that `x ≤ f x ≥ x₀` for every `x` has a contractible realization. -/
theorem contractibleSpace_of_conical {P : Type u} [Preorder P] (x₀ : P) (f : P →o P)
    (h₁ : ∀ x, x ≤ f x) (h₂ : ∀ x, x₀ ≤ f x) :
    ContractibleSpace (AbstractSimplicialComplex.Realization (orderComplex P)) := sorry

/-- **3.4.** Quillen's fibre lemma: a monotone map of partial orders all of whose fibres
`f⁻¹(Q≤q)` have contractible realizations realizes to a homotopy equivalence. -/
theorem exists_homotopyEquiv_of_contractible_fibres {P Q : Type u} [PartialOrder P]
    [PartialOrder Q] [DecidableEq Q] (f : P →o Q)
    (h : ∀ q : Q,
      ContractibleSpace (AbstractSimplicialComplex.Realization (orderComplex {p : P // f p ≤ q}))) :
    ∃ e : AbstractSimplicialComplex.Realization (orderComplex P) ≃ₕ
        AbstractSimplicialComplex.Realization (orderComplex Q),
      ⇑e.toFun = ⇑(orderComplexMap f).realizationMap := sorry

/-- **3.5.** The Euler characteristic of a preorder: the alternating count `Σ (-1) ^ (#σ + 1)` of
its nonempty finite chains. -/
noncomputable def chainEulerChar (T : Type u) [Preorder T] : ℤ :=
  ∑ᶠ σ : Face (orderComplex T), (-1 : ℤ) ^ (σ.1.card + 1)

/-- **3.5.** If a finite group `P` acts monotonically on a finite partial order `T` and the fixed
subposet of every nontrivial subgroup has Euler characteristic `1`, then the Euler characteristic
of `T` is congruent to `1` modulo `|P|`. -/
theorem chainEulerChar_modEq_of_fixedPoints {P : Type v} {T : Type u} [Group P] [Finite P]
    [PartialOrder T] [Finite T] [MulAction P T]
    (hmono : ∀ (g : P) (x y : T), x ≤ y → g • x ≤ g • y)
    (h : ∀ Q : Subgroup P, Q ≠ ⊥ → chainEulerChar {x : T // ∀ g ∈ Q, g • x = x} = 1) :
    chainEulerChar T ≡ 1 [ZMOD (Nat.card P : ℤ)] := sorry

/-! ## Layer 4: subgroup complexes -/

section SubgroupComplexes

variable (G : Type u) [Group G] (p : ℕ)

/-- **4.1.** Brown's poset `S_p(G)` of nontrivial `p`-subgroups of `G`, ordered by inclusion. -/
abbrev PSubgroupPoset : Type u :=
  {H : Subgroup G // H ≠ ⊥ ∧ IsPGroup p H}

/-- **4.1.** Quillen's poset `A_p(G)` of nontrivial elementary abelian `p`-subgroups of `G`:
nontrivial abelian subgroups of exponent dividing `p`, ordered by inclusion. -/
abbrev ElemAbelianPoset : Type u :=
  {H : Subgroup G // H ≠ ⊥ ∧ (∀ x ∈ H, ∀ y ∈ H, x * y = y * x) ∧ ∀ x ∈ H, x ^ p = 1}

/-- **4.1.** The inclusion `A_p(G) ⊆ S_p(G)`: a subgroup of exponent dividing `p` is a
`p`-group. -/
def elemAbelianToPSubgroup : ElemAbelianPoset G p →o PSubgroupPoset G p where
  toFun H := ⟨H.1, H.2.1, fun g => ⟨1, Subtype.ext (by simpa using H.2.2.2 g.1 g.2)⟩⟩
  monotone' _ _ h := h

variable {G p}

/-- **4.1.** The order complex of `A_p(G)` has a face with `n` vertices exactly when
`1 ≤ n ≤ m_p(G)`, so that its dimension is `m_p(G) - 1`; the `p`-rank `m_p(G)` of OddOrderTheorem
§1.4 is written out as the largest `k` such that `G` has an abelian subgroup of exponent dividing
`p` and order `p ^ k`. -/
theorem exists_card_eq_iff_le_pRank [Finite G] [Fact p.Prime] (n : ℕ) :
    (∃ σ : Face (orderComplex (ElemAbelianPoset G p)), σ.1.card = n) ↔
      1 ≤ n ∧ n ≤ sSup {k : ℕ | ∃ H : Subgroup G, (∀ x ∈ H, ∀ y ∈ H, x * y = y * x) ∧
        (∀ x ∈ H, x ^ p = 1) ∧ Nat.card H = p ^ k} := sorry

open scoped Classical in
/-- **4.2.** The Brown–Quillen theorem: the inclusion `A_p(G) ⊆ S_p(G)` realizes to a homotopy
equivalence. -/
theorem exists_homotopyEquiv_elemAbelianToPSubgroup [Finite G] [Fact p.Prime] :
    ∃ e : AbstractSimplicialComplex.Realization (orderComplex (ElemAbelianPoset G p)) ≃ₕ
        AbstractSimplicialComplex.Realization (orderComplex (PSubgroupPoset G p)),
      ⇑e.toFun = ⇑(orderComplexMap (elemAbelianToPSubgroup G p)).realizationMap := sorry

/-- **4.3.** If a group `G`, finite or not, has a nontrivial normal `p`-subgroup, then `S_p(G)` has
a contractible realization. -/
theorem contractibleSpace_of_normal [Fact p.Prime] (N : Subgroup G) [N.Normal]
    (hN : N ≠ ⊥) (hNp : IsPGroup p N) :
    ContractibleSpace
      (AbstractSimplicialComplex.Realization (orderComplex (PSubgroupPoset G p))) := sorry

/-- **4.4.** Stong's theorem: `S_p(G)`, as a finite space with its upper-set topology, is
contractible exactly when `G` has a nontrivial normal `p`-subgroup. -/
theorem contractibleSpace_withUpperSet_iff [Finite G] [Fact p.Prime] :
    ContractibleSpace (WithUpperSet (PSubgroupPoset G p)) ↔
      ∃ N : Subgroup G, N.Normal ∧ N ≠ ⊥ ∧ IsPGroup p N := sorry

/-- **4.5.** Quillen's criterion: when `p` divides `|G|`, the realization of `S_p(G)` is
disconnected exactly when `G` has a strongly `p`-embedded subgroup, a proper subgroup `M`
containing a Sylow `p`-subgroup with `M ∩ gMg⁻¹` of order prime to `p` for every `g ∉ M`. -/
theorem not_connectedSpace_iff [Finite G] [Fact p.Prime] (hp : p ∣ Nat.card G) :
    ¬ ConnectedSpace
        (AbstractSimplicialComplex.Realization (orderComplex (PSubgroupPoset G p))) ↔
      ∃ M : Subgroup G, M ≠ ⊤ ∧ (∃ P : Sylow p G, (P : Subgroup G) ≤ M) ∧
        ∀ g : G, g ∉ M → ¬ p ∣ Nat.card ↥(M ⊓ M.map (MulAut.conj g).toMonoidHom) := sorry

/-- **4.6.** Quillen's theorem for solvable groups: if `G` is solvable and `A_p(G)` has a
contractible realization, then `G` has a nontrivial normal `p`-subgroup. -/
theorem exists_normal_of_contractibleSpace [Finite G] [Fact p.Prime] [Group.IsSolvable G]
    (h : ContractibleSpace
      (AbstractSimplicialComplex.Realization (orderComplex (ElemAbelianPoset G p)))) :
    ∃ N : Subgroup G, N.Normal ∧ N ≠ ⊥ ∧ IsPGroup p N := sorry

/-- **4.7.** Brown's homological Sylow theorem: the Euler characteristic of `S_p(G)`, the
alternating count of the nonempty chains, is congruent to `1` modulo the `p`-part of `|G|`. -/
theorem eulerChar_pSubgroupPoset_modEq [Finite G] [Fact p.Prime] :
    chainEulerChar (PSubgroupPoset G p) ≡ 1
      [ZMOD ((p ^ (Nat.card G).factorization p : ℕ) : ℤ)] := sorry

end SubgroupComplexes

end TauCetiRoadmap.PosetHomotopyAndSubgroupComplexes
