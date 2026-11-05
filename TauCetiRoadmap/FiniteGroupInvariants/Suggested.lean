module

public import Mathlib
public import TauCeti.GroupTheory.SpecificGroups.CFSG.Classification
public import TauCeti.RepresentationTheory.CharacterTable.Table
public import TauCeti.RingTheory.KrullSchmidt.Indecomposable

/-!
# Invariants of finite groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few simple
definitions, all with real bodies, that those statements need. Every other target, with its API
and its Checks, is specified in `README.md` only.

Two headline theorems of the README are not statable at the pins:

* Herbrand's unit theorem (README 9.3), that the character of `(𝓞 K)ˣ ⊗ ℚ` for a Galois number
  field `K` with group `G` is the permutation character of `G` on the infinite places minus the
  trivial character;
* the Kuroda–Kubota classification of the unit types of real biquadratic fields (README 9.4).

Both need the `ℤ[Gal(K/ℚ)]`-module structure of the unit group modulo torsion, which is not a
declaration of the pinned Mathlib or Tau Ceti; constructing it is the first target of README 9.3,
not a simple definition. Kuroda's class number formula (README 9.4), which needs only the unit
index, is stated below.
-/

@[expose] public section

namespace TauCetiRoadmap.FiniteGroupInvariants

open Subgroup Pointwise

universe u

variable (G : Type u) [Group G]

/-! ## Layer 0: series and characteristic subgroups -/

/-- The normal subgroups of `G`, ordered by inclusion (README 0.1). -/
abbrev NormalSubgroup : Type u := {N : Subgroup G // N.Normal}

/-- Joins and meets of normal subgroups are normal; the complete lattice structure is the one
inherited from `Subgroup G` (README 0.1). -/
noncomputable instance : CompleteLattice (NormalSubgroup G) :=
  inferInstanceAs (CompleteLattice (CompleteSublattice.mk' {N : Subgroup G | N.Normal}
    (fun _ hs => Subgroup.sSup_normal _ hs)
    (fun s hs => by
      rw [sInf_eq_iInf']
      exact normal_iInf_normal fun N : s => hs N.2)))

/-- Dedekind's modular law for normal subgroups, from `A ⊔ B = A * B` for normal `B`
(README 0.1). -/
instance : IsModularLattice (NormalSubgroup G) where
  sup_inf_le_assoc_of_le {A} B {C} h := by
    have := B.2
    have := C.2
    show ((A.1 ⊔ B.1) ⊓ C.1 : Subgroup G) ≤ A.1 ⊔ (B.1 ⊓ C.1)
    intro g hg
    rw [← SetLike.mem_coe, mul_normal, mul_inf_assoc _ _ _ h, ← mul_normal]
    exact hg

/-- The underlying subgroup of a member of `NormalSubgroup G` is normal (README 0.1). -/
instance (N : NormalSubgroup G) : (N.1).Normal := N.2

/-- A chief series is a composition series in the modular lattice of normal subgroups, for
Mathlib's `JordanHolderLattice` instance on a modular lattice (README 0.2). -/
abbrev ChiefSeries : Type u := CompositionSeries (NormalSubgroup G)

/-- A finite group in `Type`, the carrier of isomorphism classes of chief and composition factors
(README, Conventions). -/
structure FinGrp where
  carrier : Type
  [grp : Group carrier]
  [fin : Finite carrier]

attribute [instance] FinGrp.grp FinGrp.fin

/-- Isomorphism classes of finite groups (README, Conventions). -/
def IsoClass : Type 1 :=
  Quotient (⟨fun A B : FinGrp => Nonempty (A.carrier ≃* B.carrier),
    ⟨fun _ => ⟨MulEquiv.refl _⟩, fun ⟨e⟩ => ⟨e.symm⟩, fun ⟨e⟩ ⟨f⟩ => ⟨e.trans f⟩⟩⟩ : Setoid FinGrp)

/-- The isomorphism class of a finite group in any universe, through a copy on
`Fin (Nat.card H)` (README, Conventions). -/
noncomputable def IsoClass.mk (H : Type*) [Group H] [Finite H] : IsoClass :=
  Quotient.mk _ (@FinGrp.mk (Fin (Nat.card H)) (Finite.equivFin H).symm.group _)

variable {G} in
/-- The multiset of chief factors of a chief series: the isomorphism classes of its successive
quotients (README 0.2). -/
noncomputable def chiefFactors [Finite G] (s : ChiefSeries G) : Multiset IsoClass :=
  ↑(List.ofFn fun i : Fin s.length =>
    IsoClass.mk ((s i.succ).1 ⧸ (s i.castSucc).1.subgroupOf (s i.succ).1))

/-- Jordan–Hölder for chief series: two chief series of a finite group from `⊥` to `⊤` have the
same multiset of factors (README 0.2). -/
theorem chiefFactors_eq [Finite G] (s t : ChiefSeries G) (hs : s.head = ⊥ ∧ s.last = ⊤)
    (ht : t.head = ⊥ ∧ t.last = ⊤) : chiefFactors s = chiefFactors t := sorry

variable {G} in
/-- A minimal normal subgroup: a nontrivial normal subgroup containing no normal subgroup of `G`
other than `⊥` and itself (README 0.3). -/
def IsMinimalNormal (N : Subgroup G) : Prop :=
  N.Normal ∧ N ≠ ⊥ ∧ ∀ M ≤ N, M.Normal → M = ⊥ ∨ M = N

/-- A minimal normal subgroup of a finite group is a direct power of a simple group; in
particular every chief factor is characteristically simple (README 0.3; Robinson 3.3.15). -/
theorem exists_mulEquiv_pi_of_isMinimalNormal [Finite G] {N : Subgroup G}
    (hN : IsMinimalNormal N) :
    ∃ (S : Type u) (_ : Group S), IsSimpleGroup S ∧ ∃ k : ℕ, Nonempty (N ≃* (Fin k → S)) :=
  sorry

/-- A composition series of a group: a strictly increasing chain from `⊥` to `⊤`, each term
normal in the next, with simple quotients (README 0.4). -/
structure GroupCompositionSeries where
  length : ℕ
  series : Fin (length + 1) → Subgroup G
  strictMono : StrictMono series
  head : series 0 = ⊥
  last : series (Fin.last length) = ⊤
  normal : ∀ i : Fin length, ((series i.castSucc).subgroupOf (series i.succ)).Normal
  simple : ∀ i : Fin length,
    IsSimpleGroup (series i.succ ⧸ (series i.castSucc).subgroupOf (series i.succ))

/-- Every finite group has a composition series (README 0.4). -/
theorem nonempty_groupCompositionSeries [Finite G] : Nonempty (GroupCompositionSeries G) := sorry

variable {G} in
/-- The multiset of simple factors of a composition series (README 0.5). -/
noncomputable def GroupCompositionSeries.factors [Finite G] (s : GroupCompositionSeries G) :
    Multiset IsoClass :=
  ↑(List.ofFn fun i : Fin s.length =>
    haveI := s.normal i
    IsoClass.mk (s.series i.succ ⧸ (s.series i.castSucc).subgroupOf (s.series i.succ)))

/-- Jordan–Hölder for composition series of a finite group (README 0.5). -/
theorem GroupCompositionSeries.factors_eq [Finite G] (s t : GroupCompositionSeries G) :
    s.factors = t.factors := sorry

/-- The composition factors of `G`, well defined by `GroupCompositionSeries.factors_eq`
(README 0.5). -/
noncomputable def compositionFactors [Finite G] : Multiset IsoClass :=
  (nonempty_groupCompositionSeries G).some.factors

/-- The composition length (README 0.5). -/
noncomputable def compositionLength [Finite G] : ℕ := (compositionFactors G).card

/-- Composition length is additive over a normal subgroup (README 0.5). -/
theorem compositionLength_quotient_add [Finite G] (N : Subgroup G) [N.Normal] :
    compositionLength (G ⧸ N) + compositionLength N = compositionLength G := sorry

/-- The socle, the join of the minimal normal subgroups (README 0.7). -/
def socle : Subgroup G := sSup {N | IsMinimalNormal N}

/-- The socle of a finite solvable group is abelian (README 0.7). -/
theorem isMulCommutative_socle [Finite G] [Group.IsSolvable G] : IsMulCommutative (socle G) :=
  sorry

/-- The invariant factors `d₁ ∣ d₂ ∣ ⋯` (all `> 1`) of a finite abelian group, `[]` for the
trivial group; `smithInvariants_unique` says this is the only such list presenting `A`
(README 0.9). -/
noncomputable def smithInvariants (A : Type*) [AddCommGroup A] [Finite A] : List ℕ :=
  open scoped Classical in
  if h : ∃ l : List ℕ, l.Pairwise (· ∣ ·) ∧ (∀ d ∈ l, 1 < d) ∧
      Nonempty (A ≃+ ((i : Fin l.length) → ZMod (l.get i))) then h.choose else []

/-- The invariant factors present the group (README 0.9). -/
theorem nonempty_addEquiv_pi_smithInvariants (A : Type*) [AddCommGroup A] [Finite A] :
    (smithInvariants A).Pairwise (· ∣ ·) ∧ (∀ d ∈ smithInvariants A, 1 < d) ∧
      Nonempty (A ≃+ ((i : Fin (smithInvariants A).length) → ZMod ((smithInvariants A).get i))) :=
  sorry

/-- Uniqueness of invariant factors: a divisibility chain of integers `> 1` presenting `A` is
`smithInvariants A` (README 0.9). -/
theorem smithInvariants_unique (A : Type*) [AddCommGroup A] [Finite A] (l : List ℕ)
    (hdvd : l.Pairwise (· ∣ ·)) (hone : ∀ d ∈ l, 1 < d)
    (he : Nonempty (A ≃+ ((i : Fin l.length) → ZMod (l.get i)))) : l = smithInvariants A :=
  sorry

/-! ## Layer 1: classes of finite groups -/

/-- A supersolvable group has a chain of subgroups normal in `G` from `⊥` to `⊤` with cyclic
successive quotients (README 1.1). -/
class IsSupersolvable : Prop where
  exists_series : ∃ (k : ℕ) (N : Fin (k + 1) → Subgroup G) (_ : ∀ i, (N i).Normal), Monotone N ∧
    N 0 = ⊥ ∧ N (Fin.last k) = ⊤ ∧
    ∀ i : Fin k, IsCyclic (N i.succ ⧸ (N i.castSucc).subgroupOf (N i.succ))

/-- Huppert's criterion: a finite group is supersolvable exactly when every maximal subgroup has
prime index (README 1.1; Huppert 1954). -/
theorem isSupersolvable_iff_forall_isCoatom_index_prime [Finite G] :
    IsSupersolvable G ↔ ∀ H : Subgroup G, IsCoatom H → H.index.Prime := sorry

/-- A metacyclic group has a cyclic normal subgroup with cyclic quotient (README 1.2). -/
def IsMetacyclic : Prop := ∃ (N : Subgroup G) (_ : N.Normal), IsCyclic N ∧ IsCyclic (G ⧸ N)

/-- An A-group: every Sylow subgroup is abelian (README 1.3, mirroring Mathlib's `IsZGroup`). -/
class IsAGroup : Prop where
  isMulCommutative_sylow : ∀ (p : ℕ) [Fact p.Prime] (P : Sylow p G), IsMulCommutative P

/-- A rational group, in its class-theoretic form: every element is conjugate to each of its
powers of exponent prime to its order (README 1.4). -/
def IsRationalGroup : Prop := ∀ x : G, ∀ n : ℕ, n.Coprime (orderOf x) → IsConj x (x ^ n)

/-- An almost simple group, in its centralizer form: a nonabelian simple normal subgroup with
trivial centralizer (README 1.5). -/
def IsAlmostSimple : Prop :=
  ∃ S : Subgroup G, S.Normal ∧ IsSimpleGroup S ∧ ¬ IsMulCommutative S ∧ centralizer (S : Set G) = ⊥

/-- An almost simple group lies between a nonabelian simple group and its automorphism group
(README 1.5). -/
theorem isAlmostSimple_iff [Finite G] :
    IsAlmostSimple G ↔ ∃ (S : Type u) (_ : Group S) (_ : IsSimpleGroup S) (_ : ¬ IsMulCommutative S)
      (f : G →* MulAut S), Function.Injective f ∧ (MulAut.conj : S →* MulAut S).range ≤ f.range :=
  sorry

/-- A complete group: trivial centre and only inner automorphisms (README 1.6). -/
def IsComplete : Prop := center G = ⊥ ∧ Function.Surjective (MulAut.conj : G →* MulAut G)

/-- Hölder: `Sₙ` is complete for `n ∉ {2, 6}` (README 1.6). -/
theorem isComplete_perm_fin (n : ℕ) (h2 : n ≠ 2) (h6 : n ≠ 6) : IsComplete (Equiv.Perm (Fin n)) :=
  sorry

/-! ## Layer 2: Hall's converse -/

variable {G} in
/-- A Hall `π`-subgroup, for a set of primes `π`: every prime dividing its order lies in `π` and
no prime dividing its index does (README 2.1). -/
def IsHallFor (π : Set ℕ) (H : Subgroup G) : Prop :=
  (∀ p, p.Prime → p ∣ Nat.card H → p ∈ π) ∧ (∀ p, p.Prime → p ∣ H.index → p ∉ π)

/-- Hall's converse: a finite group with a `p`-complement for every prime `p` is solvable
(README 2.1). -/
theorem isSolvable_of_forall_exists_isHallFor_compl [Finite G]
    (h : ∀ p : ℕ, p.Prime → ∃ H : Subgroup G, IsHallFor {q | q ≠ p} H) : Group.IsSolvable G :=
  sorry

/-! ## Layer 3: divisions -/

/-- The division (rational conjugacy) relation: `x ∼ y` when a power of `x` of exponent prime to
its order is conjugate to `y` (README 3.6). -/
def divisionSetoid : Setoid G where
  r x y := ∃ n : ℕ, n.Coprime (orderOf x) ∧ IsConj (x ^ n) y
  iseqv := by
    refine ⟨fun x => ⟨1, Nat.coprime_one_left _, by rw [pow_one]⟩, ?_, ?_⟩
    · rintro x y ⟨n, hn, c, hc⟩
      have hy : orderOf y = orderOf x := by
        rw [← hc.orderOf_eq, hn.symm.orderOf_pow]
      rcases Nat.lt_or_ge 1 (orderOf x) with h1 | h1
      · obtain ⟨m, -, hm⟩ := Nat.exists_mul_mod_eq_one_of_coprime hn h1
        have hx : (x ^ n) ^ m = x := by rw [← pow_mul, ← pow_mod_orderOf, hm, pow_one]
        refine ⟨m, ?_, ?_⟩
        · rw [hy]
          apply Nat.coprime_of_mul_modEq_one n
          change m * n % _ = 1 % _
          rw [mul_comm, hm, Nat.mod_eq_of_lt h1]
        · rw [← hx]
          exact (IsConj.pow m ⟨c, hc⟩).symm
      · refine ⟨1, Nat.coprime_one_left _, ?_⟩
        rcases Nat.le_one_iff_eq_zero_or_eq_one.mp h1 with h0 | h0
        · rw [h0, Nat.coprime_zero_right] at hn
          subst hn
          simpa using (IsConj.symm ⟨c, hc⟩)
        · rw [orderOf_eq_one_iff] at h0
          rw [h0] at hy
          rw [orderOf_eq_one_iff.mp (hy.trans orderOf_one), h0, pow_one]
    · rintro x y z ⟨n, hn, hxy⟩ ⟨m, hm, hyz⟩
      obtain ⟨c, hc⟩ := hxy
      have hy : orderOf y = orderOf x := by
        rw [← hc.orderOf_eq, hn.symm.orderOf_pow]
      refine ⟨n * m, Nat.coprime_mul_iff_left.mpr ⟨hn, hy ▸ hm⟩, ?_⟩
      rw [pow_mul]
      exact (IsConj.pow m ⟨c, hc⟩).trans hyz

/-- Divisions, the classes of the division relation (README 3.6). -/
def Division : Type u := Quotient (divisionSetoid G)

/-- The units of `ZMod (exponent G)` act on conjugacy classes by powering (README 3.7). -/
noncomputable instance : MulAction (ZMod (Monoid.exponent G))ˣ (ConjClasses G) where
  smul u := Quotient.map' (fun g : G => g ^ (Units.val u).val) fun _ _ h => IsConj.pow _ h
  one_smul C := by
    induction C using Quotient.inductionOn' with | h g => ?_
    change Quotient.mk'' (g ^ (1 : ZMod (Monoid.exponent G)).val) = Quotient.mk'' g
    rw [ZMod.val_one_eq_one_mod, ← Monoid.pow_eq_mod_exponent, pow_one]
  mul_smul u v C := by
    induction C using Quotient.inductionOn' with | h g => ?_
    change Quotient.mk'' (g ^ (Units.val (u * v)).val) =
      Quotient.mk'' ((g ^ (Units.val v).val) ^ (Units.val u).val)
    rw [Units.val_mul, ZMod.val_mul, ← Monoid.pow_eq_mod_exponent, ← pow_mul, mul_comm]

/-- Divisions are the orbits of the cyclotomic action on conjugacy classes (README 3.7). -/
theorem nonempty_division_equiv_orbits [Finite G] :
    Nonempty (Division G ≃ MulAction.orbitRel.Quotient (ZMod (Monoid.exponent G))ˣ (ConjClasses G)) :=
  sorry

/-! ## Layer 4: commutators, isoclinism and stem groups -/

/-- The commutator length: the least `k` such that every element of the commutator subgroup is a
product of `k` commutators (README 4.1). -/
noncomputable def commutatorLength : ℕ :=
  sInf {k | (commutator G : Set G) ⊆ commutatorSet G ^ k}

/-- Guralnick's theorem: in a finite group of order less than `96`, every element of the
commutator subgroup is a commutator (README 4.1; Guralnick 1982). -/
theorem commutatorLength_le_one_of_card_lt [Finite G] (hG : Nat.card G < 96) :
    commutatorLength G ≤ 1 := sorry

open scoped commutatorElement in
/-- The commutator map on the central quotient (README 4.2). -/
def commutatorMap : G ⧸ center G → G ⧸ center G → commutator G := fun a b =>
  Quotient.liftOn₂' a b
    (fun x y : G => ⟨⁅x, y⁆, commutator_mem_commutator (mem_top x) (mem_top y)⟩)
    fun x₁ y₁ x₂ y₂ hx hy => by
      rw [QuotientGroup.leftRel_apply, mem_center_iff] at hx hy
      obtain ⟨z, hz, rfl⟩ : ∃ z, (∀ g, g * z = z * g) ∧ x₂ = x₁ * z :=
        ⟨_, hx, by rw [mul_inv_cancel_left]⟩
      obtain ⟨w, hw, rfl⟩ : ∃ w, (∀ g, g * w = w * g) ∧ y₂ = y₁ * w :=
        ⟨_, hy, by rw [mul_inv_cancel_left]⟩
      ext
      calc ⁅x₁, y₁⁆ = x₁ * (y₁ * w * x₁⁻¹ * w⁻¹) * y₁⁻¹ := by
            rw [mul_assoc y₁ w, ← hw x₁⁻¹, commutatorElement_def]
            group
        _ = x₁ * (z * (y₁ * w) * z⁻¹) * x₁⁻¹ * (w⁻¹ * y₁⁻¹) := by
            rw [← hz, mul_inv_cancel_right]
            group
        _ = ⁅x₁ * z, y₁ * w⁆ := by
            rw [commutatorElement_def]
            group

/-- An isoclinism: isomorphisms of central quotients and of commutator subgroups compatible with
the commutator maps (README 4.3). -/
structure Isoclinism (H : Type*) [Group H] where
  centralQuotient : G ⧸ center G ≃* H ⧸ center H
  derived : commutator G ≃* commutator H
  compat : ∀ x y, derived (commutatorMap G x y) =
    commutatorMap H (centralQuotient x) (centralQuotient y)

/-- Isoclinic groups (README 4.3). -/
def Isoclinic (H : Type*) [Group H] : Prop := Nonempty (Isoclinism G H)

/-- A stem group: the centre lies in the commutator subgroup (README 4.4). -/
def IsStemGroup : Prop := center G ≤ commutator G

/-- P. Hall: every finite group is isoclinic to a finite stem group (README 4.4; Hall 1940). -/
theorem exists_isoclinic_isStemGroup [Finite G] :
    ∃ (H : Type u) (_ : Group H) (_ : Finite H), IsStemGroup H ∧ Isoclinic G H := sorry

/-! ## Layer 5: the subgroup lattice and faithful permutation degrees -/

variable {G} in
/-- The Möbius function of the subgroup lattice, `μ_G(H) = μ(H, G)` (README 5.1). -/
noncomputable def mobiusSub [Finite G] (H : Subgroup G) : ℤ :=
  open scoped Classical in
  letI : Fintype (Subgroup G) := Fintype.ofFinite _
  letI : LocallyFiniteOrder (Subgroup G) := Fintype.toLocallyFiniteOrder
  IncidenceAlgebra.mu ℤ H ⊤

variable {G} in
/-- The Möbius function of the normal-subgroup lattice from the bottom, `μ(1, N)` (README 5.1). -/
noncomputable def mobiusQuo [Finite G] (N : NormalSubgroup G) : ℤ :=
  open scoped Classical in
  letI : Fintype (NormalSubgroup G) := Fintype.ofFinite _
  letI : LocallyFiniteOrder (NormalSubgroup G) := Fintype.toLocallyFiniteOrder
  IncidenceAlgebra.mu ℤ ⊥ N

/-- Hall's Eulerian function, the number of generating `k`-tuples (README 5.2). -/
noncomputable def eulerian [Finite G] (k : ℕ) : ℕ :=
  Nat.card {v : Fin k → G // Subgroup.closure (Set.range v) = ⊤}

/-- Hall's formula: `φ_k(G) = Σ_H μ(H, G) |H|^k` (README 5.2; Hall 1936). -/
theorem eulerian_eq_sum_mobiusSub [Finite G] (k : ℕ) :
    letI : Fintype (Subgroup G) := Fintype.ofFinite _
    (eulerian G k : ℤ) = ∑ H : Subgroup G, mobiusSub H * (Nat.card H : ℤ) ^ k := sorry

/-- The number of faithful irreducible complex characters by Möbius inversion over the normal
subgroups: `Σ_N μ(1, N) k(G ⧸ N)` (README 5.3). -/
theorem card_faithful_irreducibleCharacters [Finite G] :
    letI : Fintype (NormalSubgroup G) := Fintype.ofFinite _
    (Nat.card {χ : TauCeti.irreducibleCharacters ℂ G //
        ∀ g : G, (χ : G → ℂ) g = (χ : G → ℂ) 1 → g = 1} : ℤ) =
      ∑ N : NormalSubgroup G, mobiusQuo N * (Nat.card (ConjClasses (G ⧸ N.1)) : ℤ) := sorry

/-- The minimal faithful permutation degree (README 5.4). -/
noncomputable def permutationDegree : ℕ :=
  sInf {n | ∃ f : G →* Equiv.Perm (Fin n), Function.Injective f}

/-- Johnson's formula: the minimal faithful permutation degree is the least total index of a
family of subgroups whose cores intersect trivially (README 5.4; Johnson 1971). -/
theorem permutationDegree_eq_sInf_sum_index [Finite G] :
    permutationDegree G =
      sInf {n | ∃ s : Finset (Subgroup G), (⨅ H ∈ s, H.normalCore) = ⊥ ∧ ∑ H ∈ s, H.index = n} :=
  sorry

/-! ## Layer 6: rational characters, Schur indices and faithful linear degrees -/

section Characters

/-- The character field `ℚ(χ)`, the subfield of `ℂ` generated by the values of `χ` (README 6.1). -/
noncomputable def characterField [Finite G] (χ : TauCeti.irreducibleCharacters ℂ G) :
    IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range (χ : G → ℂ))

/-- Two irreducible characters are Galois conjugate when one is `g ↦ χ (g ^ n)` for some `n`
prime to the exponent (README 6.2). -/
def GaloisConj [Finite G] (χ ψ : TauCeti.irreducibleCharacters ℂ G) : Prop :=
  ∃ n : ℕ, n.Coprime (Monoid.exponent G) ∧ ∀ g : G, (ψ : G → ℂ) g = (χ : G → ℂ) (g ^ n)

/-- Brauer's permutation lemma, counted: the number of Galois orbits of irreducible characters
equals the number of divisions (README 6.2). -/
theorem card_quot_galoisConj_eq_card_division [Finite G] :
    Nat.card (Quot (GaloisConj G)) = Nat.card (Division G) := sorry

/-- The rational character of a Galois orbit `o`: the pointwise sum of the irreducible characters
in `o` (README 6.3). -/
noncomputable def rationalCharacter [Finite G] (o : Quot (GaloisConj G)) (g : G) : ℂ :=
  ∑ᶠ (χ : TauCeti.irreducibleCharacters ℂ G) (_ : Quot.mk _ χ = o), (χ : G → ℂ) g

/-- The rational characters are a `ℚ`-basis of the `ℚ`-valued functions on `G` constant on
divisions: every such function is a unique `ℚ`-combination of them (README 6.3). -/
theorem existsUnique_eq_sum_rationalCharacter [Finite G] (f : G → ℚ)
    (hf : ∀ x y : G, (divisionSetoid G) x y → f x = f y) :
    ∃! c : Quot (GaloisConj G) → ℚ,
      ∀ g : G, (f g : ℂ) = ∑ᶠ o : Quot (GaloisConj G), (c o : ℂ) * rationalCharacter G o g := sorry

variable {G} in
/-- The Schur index of `χ` over a subfield `F ⊆ ℂ`: the least degree `[E : F(χ)]` of a finite
extension `F(χ) ≤ E ≤ ℂ` over which a representation with character `χ` exists (README 6.4). -/
noncomputable def schurIndex [Finite G] (F : IntermediateField ℚ ℂ)
    (χ : TauCeti.irreducibleCharacters ℂ G) : ℕ :=
  sInf {d | ∃ E : IntermediateField ℚ ℂ, F ⊔ characterField G χ ≤ E ∧
    d = (F ⊔ characterField G χ).relfinrank E ∧ d ≠ 0 ∧
    ∃ (n : ℕ) (ρ : Representation E G (Fin n → E)), ∀ g, (ρ.character g : ℂ) = (χ : G → ℂ) g}

/-- The Schur index divides the degree `χ 1` (README 6.4). -/
theorem schurIndex_dvd_degree [Finite G] (F : IntermediateField ℚ ℂ)
    (χ : TauCeti.irreducibleCharacters ℂ G) :
    ∃ m : ℕ, (χ : G → ℂ) 1 = ((schurIndex F χ * m : ℕ) : ℂ) := sorry

/-- Brauer–Speiser: a real-valued irreducible character has Schur index at most `2` over `ℚ`
(README 6.4). -/
theorem schurIndex_le_two_of_real [Finite G] (χ : TauCeti.irreducibleCharacters ℂ G)
    (hχ : ∀ g, ((χ : G → ℂ) g).im = 0) : schurIndex ⊥ χ ≤ 2 := sorry

/-- The character of an irreducible rational representation is the Schur index over `ℚ` times
the rational character of a Galois orbit (README 6.5). -/
theorem exists_character_eq_schurIndex_mul_rationalCharacter [Finite G] (V : Type)
    [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V] (ρ : Representation ℚ G V)
    (hρ : ρ.IsIrreducible) :
    ∃ χ : TauCeti.irreducibleCharacters ℂ G, ∀ g : G,
      ((ρ.character g : ℚ) : ℂ) = (schurIndex ⊥ χ : ℂ) * rationalCharacter G (Quot.mk _ χ) g :=
  sorry

/-- A finite group is rational exactly when every irreducible character is rational-valued
(README 6.6). -/
theorem isRationalGroup_iff_forall_mem_range [Finite G] :
    IsRationalGroup G ↔
      ∀ (χ : TauCeti.irreducibleCharacters ℂ G) (g : G), (χ : G → ℂ) g ∈ (algebraMap ℚ ℂ).range :=
  sorry

open scoped Classical in
/-- A monomial group: every irreducible character is induced from a degree-one character of a
subgroup, the induced character written out (README 6.7). -/
def IsMonomial [Fintype G] : Prop :=
  ∀ χ : TauCeti.irreducibleCharacters ℂ G, ∃ (H : Subgroup G) (ψ : H →* ℂˣ), ∀ g : G,
    (χ : G → ℂ) g = (Nat.card H : ℂ)⁻¹ *
      ∑ x : G, if h : x⁻¹ * g * x ∈ H then (ψ ⟨x⁻¹ * g * x, h⟩ : ℂ) else 0

/-- Taketa's theorem: monomial groups are solvable (README 6.7). -/
theorem isSolvable_of_isMonomial [Fintype G] (h : IsMonomial G) : Group.IsSolvable G := sorry

/-- Supersolvable groups are monomial (README 6.7). -/
theorem isMonomial_of_isSupersolvable [Fintype G] [IsSupersolvable G] : IsMonomial G := sorry

/-- Taunt: solvable A-groups are monomial (README 6.7). -/
theorem isMonomial_of_isAGroup [Fintype G] [Group.IsSolvable G] [IsAGroup G] : IsMonomial G :=
  sorry

/-- The minimal degree of a faithful irreducible complex representation, read off the character
table (`χ` is faithful iff `χ g = χ 1` only for `g = 1`); `⊤` if there is none (README 6.8). -/
noncomputable def irrDegreeC [Finite G] : ℕ∞ :=
  ⨅ (χ : TauCeti.irreducibleCharacters ℂ G) (_ : ∀ g : G, (χ : G → ℂ) g = (χ : G → ℂ) 1 → g = 1),
    ((⌊((χ : G → ℂ) 1).re⌋₊ : ℕ) : ℕ∞)

/-- Gaschütz: a finite group has a faithful irreducible complex representation exactly when its
socle is the normal closure of one element (README 6.8). -/
theorem irrDegreeC_lt_top_iff [Finite G] :
    irrDegreeC G < ⊤ ↔ ∃ g : G, Subgroup.normalClosure {g} = socle G := sorry

end Characters

/-! ## Layer 7: Gassmann equivalence and arithmetic equivalence -/

/-- Gassmann equivalence of finite-index subgroups of an arbitrary group `Γ`, by fixed-coset
counts (README 7.3). -/
def AlmostConjugateOfFiniteIndex {Γ : Type*} [Group Γ] (H K : Subgroup Γ) : Prop :=
  ∀ γ : Γ, Nat.card (MulAction.fixedBy (Γ ⧸ H) γ) = Nat.card (MulAction.fixedBy (Γ ⧸ K) γ)

/-- Gassmann equivalence can be tested in any common finite quotient (README 7.3). -/
theorem almostConjugateOfFiniteIndex_iff_map {Γ : Type*} [Group Γ] (H K N : Subgroup Γ) [N.Normal]
    [N.FiniteIndex] (hH : N ≤ H) (hK : N ≤ K) :
    AlmostConjugateOfFiniteIndex H K ↔
      AlmostConjugateOfFiniteIndex (H.map (QuotientGroup.mk' N)) (K.map (QuotientGroup.mk' N)) :=
  sorry

/-- Perlis' theorem: two subfields of a Galois extension `L/ℚ` have the same Dedekind zeta
function exactly when their fixed groups are Gassmann equivalent (README 7.4). -/
theorem dedekindZeta_eq_iff_almostConjugate (L : Type*) [Field L] [NumberField L] [IsGalois ℚ L]
    (H K : Subgroup (L ≃ₐ[ℚ] L)) :
    NumberField.dedekindZeta (IntermediateField.fixedField H) =
        NumberField.dedekindZeta (IntermediateField.fixedField K) ↔
      AlmostConjugateOfFiniteIndex H K := sorry

/-- Arithmetically equivalent number fields have the same degree, discriminant, number of real
places and product `h · R` of class number and regulator (README 7.5). -/
theorem invariants_eq_of_dedekindZeta_eq (F F' : Type*) [Field F] [NumberField F] [Field F']
    [NumberField F'] (h : NumberField.dedekindZeta F = NumberField.dedekindZeta F') :
    Module.finrank ℚ F = Module.finrank ℚ F' ∧ NumberField.discr F = NumberField.discr F' ∧
      NumberField.InfinitePlace.nrRealPlaces F = NumberField.InfinitePlace.nrRealPlaces F' ∧
      NumberField.classNumber F * NumberField.Units.regulator F =
        NumberField.classNumber F' * NumberField.Units.regulator F' := sorry

/-! ## Layer 8: elusive permutation groups -/

/-- An elusive permutation group has no fixed-point-free element of prime order (README 8.3). -/
def IsElusive {α : Type*} (P : Subgroup (Equiv.Perm α)) : Prop :=
  ¬ ∃ g ∈ P, (orderOf g).Prime ∧ ∀ x, g x ≠ x

/-- A transitive permutation group of prime-power degree `p ^ a`, `a ≥ 1`, contains a
fixed-point-free element of order `p` (README 8.3). -/
theorem not_isElusive_of_card_eq_prime_pow {α : Type*} [Fintype α] {p a : ℕ} (hp : p.Prime)
    (ha : 0 < a) (hα : Fintype.card α = p ^ a) (P : Subgroup (Equiv.Perm α))
    [MulAction.IsPretransitive P α] : ¬ IsElusive P := sorry

/-- Fein–Kantor–Schacher, from the classification of finite simple groups: a transitive
permutation group of degree `> 1` contains a fixed-point-free element of prime-power order
(README 8.3). -/
theorem exists_fixedPointFree_isPrimePow_of_classification
    (hCFSG : TauCeti.ClassificationStatement.{0}) {α : Type*} [Finite α] (hα : 1 < Nat.card α)
    (P : Subgroup (Equiv.Perm α)) [MulAction.IsPretransitive P α] :
    ∃ g ∈ P, IsPrimePow (orderOf g) ∧ ∀ x, g x ≠ x := sorry

/-! ## Layer 9: integral representations -/

/-- Jordan–Zassenhaus for group rings: for a finite group `Γ` and each `n`, the `ℤ[Γ]`-lattices of
`ℤ`-rank `n` fall into finitely many isomorphism classes (README 9.1). -/
theorem jordan_zassenhaus (Γ : Type) [Group Γ] [Finite Γ] (n : ℕ) :
    ∃ (ι : Type) (_ : Finite ι) (L : ι → Type) (_ : ∀ i, AddCommGroup (L i))
      (_ : ∀ i, Module (MonoidAlgebra ℤ Γ) (L i)),
      ∀ (M : Type) [AddCommGroup M] [Module (MonoidAlgebra ℤ Γ) M] [Module.Free ℤ M]
        [Module.Finite ℤ M], Module.finrank ℤ M = n →
        ∃ i, Nonempty (M ≃ₗ[MonoidAlgebra ℤ Γ] L i) := sorry

/-- Diederichsen–Reiner: for a prime `p` there are exactly `2 h + 1` isomorphism classes of
indecomposable `ℤ[C_p]`-lattices, `h` the class number of `ℚ(ζ_p)` (README 9.2; Reiner 1957,
Corollary, p. 145). -/
theorem diederichsen_reiner (p : ℕ) [Fact p.Prime] [NeZero p] :
    ∃ (ι : Type) (_ : Fintype ι) (L : ι → Type) (_ : ∀ i, AddCommGroup (L i))
      (_ : ∀ i, Module (MonoidAlgebra ℤ (Multiplicative (ZMod p))) (L i)),
      Fintype.card ι = 2 * NumberField.classNumber (CyclotomicField p ℚ) + 1 ∧
      (∀ i, Module.Free ℤ (L i) ∧ Module.Finite ℤ (L i) ∧
        TauCeti.IsIndecomposableModule (MonoidAlgebra ℤ (Multiplicative (ZMod p))) (L i)) ∧
      (∀ i j, Nonempty (L i ≃ₗ[MonoidAlgebra ℤ (Multiplicative (ZMod p))] L j) → i = j) ∧
      ∀ (M : Type) [AddCommGroup M] [Module (MonoidAlgebra ℤ (Multiplicative (ZMod p))) M]
        [Module.Free ℤ M] [Module.Finite ℤ M],
        TauCeti.IsIndecomposableModule (MonoidAlgebra ℤ (Multiplicative (ZMod p))) M →
        ∃ i, Nonempty (M ≃ₗ[MonoidAlgebra ℤ (Multiplicative (ZMod p))] L i) := sorry

/-- The unit index `q(K) = [E_K : E₁ E₂ E₃]` of a number field `K` relative to three subfields:
the index in `(𝓞 K)ˣ` of the subgroup generated by the images of their unit groups (README 9.4). -/
noncomputable def unitIndex (K : Type*) [Field K] [NumberField K] (k₁ k₂ k₃ : IntermediateField ℚ K) :
    ℕ :=
  (Subgroup.closure
    (Set.range (Units.map (algebraMap (NumberField.RingOfIntegers k₁)
        (NumberField.RingOfIntegers K)).toMonoidHom) ∪
      Set.range (Units.map (algebraMap (NumberField.RingOfIntegers k₂)
        (NumberField.RingOfIntegers K)).toMonoidHom) ∪
      Set.range (Units.map (algebraMap (NumberField.RingOfIntegers k₃)
        (NumberField.RingOfIntegers K)).toMonoidHom))).index

/-- Kuroda's class number formula for a biquadratic field `K/ℚ` with quadratic subfields
`k₁, k₂, k₃`: `h(K) = q(K) h₁ h₂ h₃ / 4` for totally real `K` and `/ 2` otherwise (README 9.4;
Lemmermeyer 1994, Theorem 1). -/
theorem classNumber_mul_eq_unitIndex_mul (K : Type*) [Field K] [NumberField K] [IsGalois ℚ K]
    (hK : Module.finrank ℚ K = 4) (hexp : ∀ σ : K ≃ₐ[ℚ] K, σ * σ = 1)
    (k₁ k₂ k₃ : IntermediateField ℚ K) (h₁ : Module.finrank ℚ k₁ = 2)
    (h₂ : Module.finrank ℚ k₂ = 2) (h₃ : Module.finrank ℚ k₃ = 2) (h₁₂ : k₁ ≠ k₂) (h₁₃ : k₁ ≠ k₃)
    (h₂₃ : k₂ ≠ k₃) :
    (NumberField.IsTotallyReal K → 4 * NumberField.classNumber K =
      unitIndex K k₁ k₂ k₃ * NumberField.classNumber k₁ * NumberField.classNumber k₂ *
        NumberField.classNumber k₃) ∧
    (¬ NumberField.IsTotallyReal K → 2 * NumberField.classNumber K =
      unitIndex K k₁ k₂ k₃ * NumberField.classNumber k₁ * NumberField.classNumber k₂ *
        NumberField.classNumber k₃) := sorry

/-! ## Layer 10: finite subgroups of general linear groups -/

/-- A finite subgroup of `GL_n(ℚ)` is conjugate in `GL_n(ℚ)` into `GL_n(ℤ)` (README 10.1). -/
theorem exists_conj_le_range_int (n : ℕ) (H : Subgroup (GL (Fin n) ℚ)) [Finite H] :
    ∃ g : GL (Fin n) ℚ, H.map (MulAut.conj g) ≤
      (Units.map (Int.castRingHom ℚ).mapMatrix.toMonoidHom : GL (Fin n) ℤ →* GL (Fin n) ℚ).range :=
  sorry

/-- Minkowski's lemma: for `m ≥ 3`, a torsion element of `GL_n(ℤ)` congruent to `1` modulo `m`
is `1` (README 10.2; Serre, arXiv:1011.0346v1, §1.2, Lemma 1). -/
theorem eq_one_of_isOfFinOrder_of_map_eq_one (n m : ℕ) (hm : 3 ≤ m)
    (M : GL (Fin n) ℤ) (hM : IsOfFinOrder M)
    (h : Units.map (Int.castRingHom (ZMod m)).mapMatrix.toMonoidHom M = 1) : M = 1 := sorry

/-- Minkowski's bound `M(n) = ∏_ℓ ℓ ^ (Σ_k ⌊n / (ℓ ^ k (ℓ - 1))⌋)`, the product over primes
`ℓ ≤ n + 1` (README 10.2; Serre, arXiv:1011.0346v1, §1.1, Theorem 1). -/
def minkowskiBound (n : ℕ) : ℕ :=
  ∏ ℓ ∈ (Finset.range (n + 2)).filter Nat.Prime,
    ℓ ^ (∑ k ∈ Finset.range (n + 1), n / (ℓ ^ k * (ℓ - 1)))

/-- Minkowski's theorem: the order of a finite subgroup of `GL_n(ℚ)` divides `M(n)`
(README 10.2; Serre, arXiv:1011.0346v1, §1.1, Theorem 1 (i)). -/
theorem card_dvd_minkowskiBound (n : ℕ) (H : Subgroup (GL (Fin n) ℚ)) [Finite H] :
    Nat.card H ∣ minkowskiBound n := sorry

/-- Conjugacy of subgroups (README 10.3). -/
def IsConjSubgroup {Γ : Type*} [Group Γ] (H K : Subgroup Γ) : Prop :=
  ∃ g : Γ, H.map (MulAut.conj g) = K

/-- Finite subgroups of a group up to conjugacy (README 10.3). -/
def FiniteSubgroupClasses (Γ : Type) [Group Γ] : Type :=
  Quotient (⟨fun H K : {H : Subgroup Γ // Finite H} => IsConjSubgroup H.1 K.1,
    ⟨fun H => ⟨1, by ext; simp⟩,
      fun ⟨g, h⟩ => ⟨g⁻¹, by rw [← h, Subgroup.map_map]; ext; simp [mul_assoc]⟩,
      fun ⟨g, h⟩ ⟨g', h'⟩ => ⟨g' * g, by rw [← h', ← h, Subgroup.map_map]; ext; simp [mul_assoc]⟩⟩⟩ :
    Setoid _)

/-- The `ℤ`-classes in dimension `n` (arithmetic crystal classes) (README 10.3). -/
abbrev ZClasses (n : ℕ) : Type := FiniteSubgroupClasses (GL (Fin n) ℤ)

/-- The `ℚ`-classes in dimension `n` (geometric crystal classes) (README 10.3). -/
abbrev QClasses (n : ℕ) : Type := FiniteSubgroupClasses (GL (Fin n) ℚ)

/-- Thirteen `ℤ`-classes and ten `ℚ`-classes in dimension two (README 10.3). -/
theorem card_zClasses_two_qClasses_two :
    Nat.card (ZClasses 2) = 13 ∧ Nat.card (QClasses 2) = 10 := sorry

/-- Seventy-three `ℤ`-classes and thirty-two `ℚ`-classes in dimension three (README 10.3). -/
theorem card_zClasses_three_qClasses_three :
    Nat.card (ZClasses 3) = 73 ∧ Nat.card (QClasses 3) = 32 := sorry

/-- Seven hundred and ten `ℤ`-classes and two hundred and twenty-seven `ℚ`-classes in dimension
four (README 10.4; Brown–Bülow–Neubüser–Wondratschek–Zassenhaus 1978). -/
theorem card_zClasses_four_qClasses_four :
    Nat.card (ZClasses 4) = 710 ∧ Nat.card (QClasses 4) = 227 := sorry

/-- The optimal Jordan constant: the least `J` such that every finite subgroup of `GL_n(ℂ)` has an
abelian normal subgroup of index at most `J` (README 10.5). -/
noncomputable def jordanBound (n : ℕ) : ℕ :=
  sInf {J : ℕ | ∀ H : Subgroup (GL (Fin n) ℂ), Finite H →
    ∃ A : Subgroup H, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ J}

/-- Jordan's theorem over any field of characteristic zero (README 10.5). -/
theorem jordan_exists_abelian_normal_index_le {F : Type*} [Field F] [CharZero F] (n : ℕ)
    (H : Subgroup (GL (Fin n) F)) [Finite H] :
    ∃ A : Subgroup H, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ jordanBound n := sorry

/-- A subgroup of `GL_n(F)` that is finite modulo scalars (finite image in `PGL(n, F)`) has an
abelian normal subgroup of index at most `jordanBound n` (README 10.5). -/
theorem jordan_exists_abelian_normal_index_le_of_finite_map {F : Type*} [Field F] [CharZero F]
    (n : ℕ) (B : Subgroup (GL (Fin n) F)) [Finite (B.map Matrix.ProjGenLinGroup.mk)] :
    ∃ A : Subgroup B, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ jordanBound n := sorry

/-- Over an algebraically closed field of characteristic zero, an irreducible finite-dimensional
representation of a subgroup of `GL_n(F)` finite modulo scalars has dimension at most
`jordanBound n` (README 10.5). -/
theorem finrank_le_jordanBound {F : Type*} [Field F] [CharZero F] [IsAlgClosed F] (n : ℕ)
    (B : Subgroup (GL (Fin n) F)) [Finite (B.map Matrix.ProjGenLinGroup.mk)]
    {W : Type*} [AddCommGroup W] [Module F W] [FiniteDimensional F W]
    (ρ : Representation F B W) (hρ : ρ.IsIrreducible) :
    Module.finrank F W ≤ jordanBound n := sorry

/-- Schur's explicit bound, for `n ≥ 1` (README 10.5; at `n = 0` the right side is `0` and
`jordanBound 0 = 1`). -/
theorem jordanBound_le_schur (n : ℕ) (hn : 1 ≤ n) :
    (jordanBound n : ℝ) ≤
      (Real.sqrt (8 * n) + 1) ^ (2 * n ^ 2) - (Real.sqrt (8 * n) - 1) ^ (2 * n ^ 2) := sorry

/-- Collins, from the classification of finite simple groups: for `n ≥ 71` the optimal Jordan
constant is `(n + 1)!`, attained by `S_{n+1}` on its standard representation (README 10.5;
Collins 2007). -/
theorem jordanBound_eq_factorial_of_classification (hCFSG : TauCeti.ClassificationStatement.{0})
    (n : ℕ) (hn : 71 ≤ n) : jordanBound n = (n + 1).factorial := sorry

end TauCetiRoadmap.FiniteGroupInvariants

end
