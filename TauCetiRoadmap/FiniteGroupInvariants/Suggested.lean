import Mathlib
import TauCeti.GroupTheory.Elementary
import TauCeti.RepresentationTheory.CharacterTable.Table
import TauCeti.RepresentationTheory.CharacterTable.Kernel
import TauCeti.RepresentationTheory.CharacterTable.Solvable
import TauCeti.GroupTheory.Perm.Partition
import TauCeti.RingTheory.KrullSchmidt.Indecomposable

/-!
# Invariants of finite groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
carriers, the pinned conventions, and the theorems whose statements use nothing else. The other
targets (the cyclotomic action on irreducible characters, its Galois orbits and the rational
characters of 6.2–6.3, and every milestone without a declaration below), with their definitions
and Checks, are specified in `README.md` only. Discharging every declaration here would finish
neither a layer nor the roadmap. `sorry` is permitted in theorem proofs in this human-owned
repository: these are targets, not implementations.

The carrier is a finite group `G` with `[Group G] [Finite G]`; `[Fintype G] [DecidableEq G]`
appear only on the few computed objects. Every invariant is stated on Mathlib's objects
(`Subgroup G`, `ConjClasses G`, `MulAut G`, `Representation`, `Equiv.Perm`, `GL (Fin n) R`) and on
Tau Ceti's character table (`TauCeti.irreducibleCharacters ℂ G`); nothing here introduces a second
carrier for any of them, and Gassmann equivalence (`Subgroup.AlmostConjugate`, Tau Ceti beyond this
repository's pin) is consumed in prose only.

Conventions visible in the signatures: the normal-subgroup lattice `NormalSubgroup G` carries the
chief series, while composition series are the separate `GroupCompositionSeries`; `derivedLength`,
`commutatorLength`, `permutationDegree`, `transitiveDegree` are `sInf`s on `ℕ` with the junk value
`0` on the empty set, and the faithful linear degrees are `ℕ∞`-valued with `⊤` for "none"; the Fitting
subgroup, radical and socle are suprema; divisions are the quotient by the coprime-power conjugacy
relation; the Möbius function is `IncidenceAlgebra.mu` on `Subgroup G`; the Schur index is a least
degree of a realization field; `jordanBound n` is the optimal Jordan constant over `ℂ`, an `sInf`
on `ℕ`, and Jordan's theorem is stated with it over every field of characteristic zero. The
`JordanHolderLattice` structure on `NormalSubgroup G` is Mathlib's instance for a modular lattice,
with `IsMaximal` the covering relation.

Two declarations are proved rather than `sorry`ed, as bridge checks of the instance lists they
rely on: `isAGroup_of_isZGroup` (Mathlib's `IsZGroup` Sylow instance) and
`commutatorLength_of_isMulCommutative` (the pointwise-power convention for `commutatorSet`). Two
more are proved as non-vacuity constructors for the structures carrying compatibility laws:
`GroupCompositionSeries.trivial` and `Isoclinism.refl`.
-/

namespace TauCetiRoadmap.FiniteGroupInvariants

open Subgroup Pointwise

universe u

variable (G : Type u) [Group G]

/-! ## Layer 0: series and characteristic subgroups -/

/-- `README.md`, Layer 0, 0.1: the lattice of normal subgroups. -/
abbrev NormalSubgroup : Type u := {N : Subgroup G // N.Normal}

/-- `README.md`, Layer 0, 0.1: joins and meets of normal subgroups are normal; the lattice
structure is the one inherited from `Subgroup G`. -/
noncomputable instance : CompleteLattice (NormalSubgroup G) :=
  inferInstanceAs (CompleteLattice (CompleteSublattice.mk' {N : Subgroup G | N.Normal}
    (fun _ hs => Subgroup.sSup_normal _ hs)
    (fun s hs => by
      rw [sInf_eq_iInf']
      exact normal_iInf_normal fun N : s => hs N.2)))

/-- `README.md`, Layer 0, 0.1: Dedekind's modular law for normal subgroups, from `A ⊔ B = A * B`
when `B` is normal. -/
instance : IsModularLattice (NormalSubgroup G) where
  sup_inf_le_assoc_of_le {A} B {C} h := by
    have := B.2
    have := C.2
    show ((A.1 ⊔ B.1) ⊓ C.1 : Subgroup G) ≤ A.1 ⊔ (B.1 ⊓ C.1)
    intro g hg
    rw [← SetLike.mem_coe, mul_normal, mul_inf_assoc _ _ _ h, ← mul_normal]
    exact hg

/-- `README.md`, Layer 0, 0.2: a chief series is a composition series in the lattice of normal
subgroups, for Mathlib's `JordanHolderLattice` instance on the modular lattice of 0.1. -/
abbrev ChiefSeries : Type u := CompositionSeries (NormalSubgroup G)

/-- `README.md`, Layer 0 (*Pinned conventions*): a finite group in `Type`, the carrier of
isomorphism classes of chief and composition factors. -/
structure FinGrp where
  carrier : Type
  [grp : Group carrier]
  [fin : Finite carrier]

attribute [instance] FinGrp.grp FinGrp.fin

/-- `README.md`, Layer 0 (*Pinned conventions*): isomorphism classes of finite groups. -/
def IsoClass : Type 1 :=
  Quotient (⟨fun A B : FinGrp => Nonempty (A.carrier ≃* B.carrier),
    ⟨fun _ => ⟨MulEquiv.refl _⟩, fun ⟨e⟩ => ⟨e.symm⟩, fun ⟨e⟩ ⟨f⟩ => ⟨e.trans f⟩⟩⟩ : Setoid FinGrp)

/-- `README.md`, Layer 0 (*Pinned conventions*): the isomorphism class of a finite group in any
universe, through a copy on `Fin (Nat.card H)`. -/
noncomputable def IsoClass.mk (H : Type*) [Group H] [Finite H] : IsoClass :=
  Quotient.mk _ (@FinGrp.mk (Fin (Nat.card H)) (Finite.equivFin H).symm.group _)

variable {G} in
/-- `README.md`, Layer 0, 0.2: the multiset of chief factors of a chief series, the isomorphism
classes of its successive quotients. -/
noncomputable def chiefFactors [Finite G] (s : ChiefSeries G) : Multiset IsoClass :=
  ↑(List.ofFn fun i : Fin s.length =>
    haveI := (s i.castSucc).2
    IsoClass.mk ((s i.succ).1 ⧸ (s i.castSucc).1.subgroupOf (s i.succ).1))

/-- `README.md`, Layer 0, 0.2: Jordan–Hölder for chief series with the same ends. -/
theorem chiefFactors_eq [Finite G] (s t : ChiefSeries G) (hs : s.head = ⊥ ∧ s.last = ⊤)
    (ht : t.head = ⊥ ∧ t.last = ⊤) : chiefFactors s = chiefFactors t := sorry

/-- `README.md`, Layer 0, 0.4: a composition series of a group: a strictly increasing chain from
`⊥` to `⊤`, each term normal in the next, with simple quotients. -/
structure GroupCompositionSeries where
  length : ℕ
  series : Fin (length + 1) → Subgroup G
  strictMono : StrictMono series
  head : series 0 = ⊥
  last : series (Fin.last length) = ⊤
  normal : ∀ i : Fin length, ((series i.castSucc).subgroupOf (series i.succ)).Normal
  simple : ∀ i : Fin length,
    IsSimpleGroup (series i.succ ⧸ (series i.castSucc).subgroupOf (series i.succ))

/-- `README.md`, Layer 0, 0.4: every finite group has a composition series. -/
theorem nonempty_groupCompositionSeries [Finite G] : Nonempty (GroupCompositionSeries G) := sorry

/-- `README.md`, Layer 0, 0.4 (non-vacuity constructor, proved): the length-`0` composition series
of the trivial group. -/
def GroupCompositionSeries.trivial : GroupCompositionSeries PUnit where
  length := 0
  series := fun _ => ⊥
  strictMono := fun i j h => absurd (Subsingleton.elim (α := Fin 1) i j) h.ne
  head := rfl
  last := by ext x; simp
  normal := fun i => i.elim0
  simple := fun i => i.elim0

variable {G} in
/-- `README.md`, Layer 0, 0.5: the multiset of simple factors of a composition series. -/
noncomputable def GroupCompositionSeries.factors [Finite G] (s : GroupCompositionSeries G) :
    Multiset IsoClass :=
  ↑(List.ofFn fun i : Fin s.length =>
    haveI := s.normal i
    IsoClass.mk (s.series i.succ ⧸ (s.series i.castSucc).subgroupOf (s.series i.succ)))

/-- `README.md`, Layer 0, 0.5: Jordan–Hölder for composition series of a finite group. -/
theorem GroupCompositionSeries.factors_eq [Finite G] (s t : GroupCompositionSeries G) :
    s.factors = t.factors := sorry

/-- `README.md`, Layer 0, 0.5: the composition factors of `G`, well defined by
`GroupCompositionSeries.factors_eq`. -/
noncomputable def compositionFactors [Finite G] : Multiset IsoClass :=
  (nonempty_groupCompositionSeries G).some.factors

/-- `README.md`, Layer 0, 0.5: the composition length. -/
noncomputable def compositionLength [Finite G] : ℕ := (compositionFactors G).card

/-- `README.md`, Layer 0, 0.5: composition length is additive over a normal subgroup. -/
theorem compositionLength_quotient_add [Finite G] (N : Subgroup G) [N.Normal] :
    compositionLength (G ⧸ N) + compositionLength N = compositionLength G := sorry

/-- `README.md`, Layer 0, 0.6: the derived length, the least `n` with `derivedSeries G n = ⊥`;
`0` for the trivial group and the junk value `0` for a non-solvable group. -/
noncomputable def derivedLength : ℕ := sInf {n | derivedSeries G n = ⊥}

/-- `README.md`, Layer 0, 0.6: the junk value is never mistaken for data. -/
theorem derivedLength_eq_zero_iff :
    derivedLength G = 0 ↔ Subsingleton G ∨ ¬ Group.IsSolvable G := sorry

/-- `README.md`, Layer 0, 0.6: derived length `1` means nontrivial abelian. -/
theorem derivedLength_eq_one_iff :
    derivedLength G = 1 ↔ IsMulCommutative G ∧ Nontrivial G := sorry

variable {G} in
/-- `README.md`, Layer 0, 0.7: a minimal normal subgroup. -/
def IsMinimalNormal (N : Subgroup G) : Prop :=
  N.Normal ∧ N ≠ ⊥ ∧ ∀ M ≤ N, M.Normal → M = ⊥ ∨ M = N

/-- `README.md`, Layer 0, 0.7: the socle, the join of the minimal normal subgroups. -/
def socle : Subgroup G := sSup {N | IsMinimalNormal N}

/-- `README.md`, Layer 0, 0.7: the socle of a finite solvable group is abelian. -/
theorem isMulCommutative_socle [Finite G] [Group.IsSolvable G] : IsMulCommutative (socle G) := sorry

/-- `README.md`, Layer 0, 0.8: the Fitting subgroup, the join of the normal nilpotent subgroups. -/
def fittingSubgroup : Subgroup G := sSup {N | N.Normal ∧ Group.IsNilpotent N}

/-- `README.md`, Layer 0, 0.8: the solvable radical. -/
def solvableRadical : Subgroup G := sSup {N | N.Normal ∧ Group.IsSolvable N}

/-- `README.md`, Layer 0, 0.8: Fitting's theorem. -/
theorem isNilpotent_fittingSubgroup [Finite G] : Group.IsNilpotent (fittingSubgroup G) := sorry

/-- `README.md`, Layer 0, 0.8: the Fitting subgroup is the whole group exactly for nilpotent groups. -/
theorem fittingSubgroup_eq_top_iff [Finite G] : fittingSubgroup G = ⊤ ↔ Group.IsNilpotent G := sorry

/-- `README.md`, Layer 0, 0.8: the Fitting subgroup of a solvable group is self-centralizing. -/
theorem centralizer_fittingSubgroup_le [Finite G] [Group.IsSolvable G] :
    centralizer (fittingSubgroup G : Set G) ≤ fittingSubgroup G := sorry

/-- `README.md`, Layer 0, 0.9: the invariant factors `d₁ ∣ d₂ ∣ ⋯` (all `> 1`) of a finite
abelian group; `[]` for the trivial group. The list is the unique one with these properties
presenting `A`, which `nonempty_addEquiv_directSum_smithInvariants` asserts exists. -/
noncomputable def smithInvariants (A : Type*) [AddCommGroup A] [Finite A] : List ℕ :=
  open scoped Classical in
  if h : ∃ l : List ℕ, l.Pairwise (· ∣ ·) ∧ (∀ d ∈ l, 1 < d) ∧
      Nonempty (A ≃+ ((i : Fin l.length) → ZMod (l.get i))) then h.choose else []

/-- `README.md`, Layer 0, 0.9: the invariant factors present the group. -/
theorem nonempty_addEquiv_directSum_smithInvariants (A : Type*) [AddCommGroup A] [Finite A] :
    (smithInvariants A).Pairwise (· ∣ ·) ∧ (∀ d ∈ smithInvariants A, 1 < d) ∧
      Nonempty (A ≃+ ((i : Fin (smithInvariants A).length) → ZMod ((smithInvariants A).get i))) :=
  sorry

/-! ## Layer 1: classes of finite groups -/

/-- `README.md`, Layer 1, 1.1: a supersolvable group has a chain of subgroups normal in `G` with
cyclic successive quotients. -/
class IsSupersolvable : Prop where
  exists_series : ∃ (k : ℕ) (N : Fin (k + 1) → Subgroup G) (_ : ∀ i, (N i).Normal), Monotone N ∧
    N 0 = ⊥ ∧ N (Fin.last k) = ⊤ ∧
    ∀ i : Fin k, IsCyclic (N i.succ ⧸ (N i.castSucc).subgroupOf (N i.succ))

/-- `README.md`, Layer 1, 1.1: supersolvable groups are solvable. -/
theorem isSolvable_of_isSupersolvable [IsSupersolvable G] : Group.IsSolvable G := sorry

/-- `README.md`, Layer 1, 1.1: finite nilpotent groups are supersolvable. -/
theorem isSupersolvable_of_isNilpotent [Finite G] [Group.IsNilpotent G] : IsSupersolvable G := sorry

/-- `README.md`, Layer 1, 1.1: Huppert's criterion through maximal subgroups. -/
theorem isSupersolvable_iff_forall_isCoatom_index_prime [Finite G] :
    IsSupersolvable G ↔ ∀ H : Subgroup G, IsCoatom H → H.index.Prime := sorry

/-- `README.md`, Layer 1, 1.1: `A₄` is not supersolvable (the boundary check for extension closure). -/
theorem not_isSupersolvable_alternatingGroup_four :
    ¬ IsSupersolvable (alternatingGroup (Fin 4)) := sorry

/-- `README.md`, Layer 1, 1.2: a metacyclic group is cyclic-by-cyclic. -/
def IsMetacyclic : Prop := ∃ (N : Subgroup G) (_ : N.Normal), IsCyclic N ∧ IsCyclic (G ⧸ N)

/-- `README.md`, Layer 1, 1.2: metacyclic groups are supersolvable. -/
theorem IsMetacyclic.isSupersolvable [Finite G] (h : IsMetacyclic G) : IsSupersolvable G := sorry

/-- `README.md`, Layer 1, 1.2: Z-groups are metacyclic. -/
theorem isMetacyclic_of_isZGroup [Finite G] [IsZGroup G] : IsMetacyclic G := sorry

/-- `README.md`, Layer 1, 1.3: an A-group has abelian Sylow subgroups (mirroring `IsZGroup`). -/
class IsAGroup : Prop where
  isMulCommutative_sylow : ∀ (p : ℕ) [Fact p.Prime] (P : Sylow p G), IsMulCommutative P

/-- `README.md`, Layer 1, 1.3 (bridge check, proved): a Z-group is an A-group, because Mathlib's
`IsZGroup` makes every Sylow subgroup cyclic and a cyclic group is commutative. -/
theorem isAGroup_of_isZGroup [IsZGroup G] : IsAGroup G :=
  ⟨fun p _ P => by
    have : IsCyclic P := inferInstance
    let _ : CommGroup P := IsCyclic.commGroup
    exact ⟨⟨mul_comm⟩⟩⟩

/-- `README.md`, Layer 1, 1.4: a rational group, in its class-theoretic form. -/
def IsRationalGroup : Prop := ∀ x : G, ∀ n : ℕ, n.Coprime (orderOf x) → IsConj x (x ^ n)

/-- `README.md`, Layer 1, 1.4: symmetric groups are rational. -/
theorem isRationalGroup_perm (α : Type*) [Fintype α] [DecidableEq α] :
    IsRationalGroup (Equiv.Perm α) := sorry

/-- `README.md`, Layer 1, 1.5: a quasisimple group. -/
def IsQuasisimple : Prop := Group.IsPerfect G ∧ IsSimpleGroup (G ⧸ center G)

/-- `README.md`, Layer 1, 1.6: an almost simple group, in its centralizer form. -/
def IsAlmostSimple : Prop :=
  ∃ S : Subgroup G, S.Normal ∧ IsSimpleGroup S ∧ ¬ IsMulCommutative S ∧ centralizer (S : Set G) = ⊥

/-- `README.md`, Layer 1, 1.6: an almost simple group is a group between a nonabelian simple group
and its automorphism group. -/
theorem isAlmostSimple_iff [Finite G] :
    IsAlmostSimple G ↔ ∃ (S : Type u) (_ : Group S) (_ : IsSimpleGroup S) (_ : ¬ IsMulCommutative S)
      (f : G →* MulAut S), Function.Injective f ∧ (MulAut.conj : S →* MulAut S).range ≤ f.range :=
  sorry

/-- `README.md`, Layer 1, 1.5–1.6: `SL(2,5)` is quasisimple and not almost simple. -/
theorem isQuasisimple_SL2_5_not_isAlmostSimple :
    IsQuasisimple (Matrix.SpecialLinearGroup (Fin 2) (ZMod 5)) ∧
      ¬ IsAlmostSimple (Matrix.SpecialLinearGroup (Fin 2) (ZMod 5)) := sorry

/-- `README.md`, Layer 1, 1.7: a complete group. -/
def IsComplete : Prop := center G = ⊥ ∧ Function.Surjective (MulAut.conj : G →* MulAut G)

/-- `README.md`, Layer 1, 1.7: `Sₙ` is complete for `n ∉ {2, 6}`. -/
theorem isComplete_perm_fin (n : ℕ) (h2 : n ≠ 2) (h6 : n ≠ 6) : IsComplete (Equiv.Perm (Fin n)) :=
  sorry

open scoped Classical in
/-- `README.md`, Layer 1, 1.8: the product of the primes `p` for which `G` is `p`-elementary. -/
noncomputable def elementaryPrimes [Finite G] : ℕ :=
  ∏ p ∈ (Nat.card G).primeFactors.filter (fun p => TauCeti.IsPElementary p G), p

/-! ## Layer 2: Hall subgroups -/

variable {G} in
/-- `README.md`, Layer 2, 2.1: a Hall `π`-subgroup, for a set of primes `π`: its order is the
`π`-part of the order of `G`. -/
def IsHallFor (π : Set ℕ) (H : Subgroup G) : Prop :=
  (∀ p, p.Prime → p ∣ Nat.card H → p ∈ π) ∧ (∀ p, p.Prime → p ∣ H.index → p ∉ π)

/-- `README.md`, Layer 2, 2.2: Hall's theorem: a finite solvable group has Hall `π`-subgroups for
every `π`, and any two are conjugate. -/
theorem exists_isHallFor_of_isSolvable [Finite G] [Group.IsSolvable G] (π : Set ℕ) :
    (∃ H : Subgroup G, IsHallFor π H) ∧
      ∀ H K : Subgroup G, IsHallFor π H → IsHallFor π K → ∃ g : G, H.map (MulAut.conj g) = K := sorry

/-- `README.md`, Layer 2, 2.3: Hall's converse: a group with a `p`-complement for every prime `p`
is solvable. -/
theorem isSolvable_of_forall_exists_isHallFor_compl [Finite G]
    (h : ∀ p : ℕ, p.Prime → ∃ H : Subgroup G, IsHallFor {q | q ≠ p} H) : Group.IsSolvable G := sorry

/-! ## Layer 3: automorphisms, autjugacy and divisions -/

/-- `README.md`, Layer 3, 3.1: the inner automorphism group. -/
abbrev Inn : Subgroup (MulAut G) := (MulAut.conj : G →* MulAut G).range

/-- `README.md`, Layer 3, 3.1: inner automorphisms form a normal subgroup. -/
instance : (Inn G).Normal :=
  ⟨fun _ ⟨g, hg⟩ φ => ⟨φ g, by subst hg; ext x; simp [mul_assoc]⟩⟩

/-- `README.md`, Layer 3, 3.1: the outer automorphism group. -/
abbrev Out : Type u := MulAut G ⧸ Inn G

/-- `README.md`, Layer 3, 3.1: `#Out G · #(G ⧸ Z(G)) = #Aut G`. -/
theorem card_out_mul_card_quotient_center [Finite G] :
    Nat.card (Out G) * Nat.card (G ⧸ center G) = Nat.card (MulAut G) := sorry

/-- `README.md`, Layer 3, 3.1: `Out Q₈` has order `6`. -/
theorem card_out_quaternionGroup_two : Nat.card (Out (QuaternionGroup 2)) = 6 := sorry

/-- `README.md`, Layer 3, 3.3: autjugacy classes are the orbits of `Aut G` on `G`. -/
abbrev AutjugacyClasses : Type u := MulAction.orbitRel.Quotient (MulAut G) G

/-- `README.md`, Layer 3, 3.3: there are at most as many autjugacy classes as conjugacy classes. -/
theorem card_autjugacyClasses_le [Finite G] :
    Nat.card (AutjugacyClasses G) ≤ Nat.card (ConjClasses G) := sorry

/-- `README.md`, Layer 3, 3.6: the division (rational conjugacy) relation. -/
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

/-- `README.md`, Layer 3, 3.6: divisions. -/
def Division : Type u := Quotient (divisionSetoid G)

/-- `README.md`, Layer 3, 3.6: a division is a union of conjugacy classes. -/
def ConjClasses.toDivision : ConjClasses G → Division G :=
  Quotient.map' id fun _ _ h => ⟨1, Nat.coprime_one_left _, by rw [pow_one]; exact h⟩

/-- `README.md`, Layer 3, 3.6: the number of divisions equals the number of classes exactly for
rational groups. -/
theorem card_division_eq_card_conjClasses_iff [Finite G] :
    Nat.card (Division G) = Nat.card (ConjClasses G) ↔ IsRationalGroup G := sorry

/-- `README.md`, Layer 3, 3.7: the cyclotomic units act on conjugacy classes by powering. -/
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

/-- `README.md`, Layer 3, 3.7: divisions are the orbits of the cyclotomic action. -/
theorem nonempty_division_equiv_orbits [Finite G] :
    Nonempty (Division G ≃ MulAction.orbitRel.Quotient (ZMod (Monoid.exponent G))ˣ (ConjClasses G)) :=
  sorry

/-! ## Layer 4: commutators, isoclinism and stem groups -/

/-- `README.md`, Layer 4, 4.1: the commutator length: the least `k` such that every element of the
commutator subgroup is a product of `k` commutators. -/
noncomputable def commutatorLength : ℕ :=
  sInf {k | (commutator G : Set G) ⊆ commutatorSet G ^ k}

/-- `README.md`, Layer 4, 4.1 (bridge check, proved): an abelian group has commutator length `0`,
because `commutatorSet G ^ 0 = {1}` under the pointwise monoid structure on `Set G`. -/
theorem commutatorLength_of_isMulCommutative [IsMulCommutative G] : commutatorLength G = 0 := by
  apply Nat.sInf_eq_zero.mpr
  left
  show (commutator G : Set G) ⊆ commutatorSet G ^ 0
  rw [pow_zero]
  intro g hg
  have h1 : commutator G = ⊥ := by
    rw [commutator_def, eq_bot_iff]
    refine Subgroup.commutator_le.mpr fun x _ y _ => ?_
    exact Subgroup.mem_bot.mpr (commutatorElement_eq_one_iff_mul_comm.mpr (IsMulCommutative.is_comm.comm x y))
  rw [h1] at hg
  rw [Set.mem_one]
  exact Subgroup.mem_bot.mp (SetLike.mem_coe.mp hg)

/-- `README.md`, Layer 4, 4.1: commutator length is `0` exactly for abelian groups. -/
theorem commutatorLength_eq_zero_iff [Finite G] : commutatorLength G = 0 ↔ IsMulCommutative G := sorry

/-- `README.md`, Layer 4, 4.1: **Guralnick's theorem** (1982): in a finite group of order less
than `96`, every element of the commutator subgroup is a commutator. -/
theorem commutatorLength_le_one_of_card_lt [Finite G] (hG : Nat.card G < 96) :
    commutatorLength G ≤ 1 := sorry

open scoped commutatorElement in
/-- `README.md`, Layer 4, 4.2: the commutator map on the central quotient. -/
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

/-- `README.md`, Layer 4, 4.3: an isoclinism. -/
structure Isoclinism (H : Type*) [Group H] where
  centralQuotient : G ⧸ center G ≃* H ⧸ center H
  derived : commutator G ≃* commutator H
  compat : ∀ x y, derived (commutatorMap G x y) =
    commutatorMap H (centralQuotient x) (centralQuotient y)

/-- `README.md`, Layer 4, 4.3 (non-vacuity constructor, proved): the identity isoclinism. -/
def Isoclinism.refl : Isoclinism G G := ⟨MulEquiv.refl _, MulEquiv.refl _, fun _ _ => rfl⟩

/-- `README.md`, Layer 4, 4.3: isoclinic groups. -/
def Isoclinic (H : Type*) [Group H] : Prop := Nonempty (Isoclinism G H)

/-- `README.md`, Layer 4, 4.4: a stem group. -/
def IsStemGroup : Prop := center G ≤ commutator G

/-- `README.md`, Layer 4, 4.4: every finite group is isoclinic to a stem group. -/
theorem exists_isoclinic_isStemGroup [Finite G] :
    ∃ (H : Type u) (_ : Group H) (_ : Finite H), IsStemGroup H ∧ Isoclinic G H := sorry

/-! ## Layer 5: the subgroup lattice and faithful permutation degrees -/

variable {G} in
/-- `README.md`, Layer 5, 5.1: the Möbius function of the subgroup lattice, `μ_G(H) = μ(H, G)`. -/
noncomputable def mobiusSub [Finite G] (H : Subgroup G) : ℤ :=
  open scoped Classical in
  letI : Fintype (Subgroup G) := Fintype.ofFinite _
  letI : LocallyFiniteOrder (Subgroup G) := Fintype.toLocallyFiniteOrder
  IncidenceAlgebra.mu ℤ H ⊤

/-- `README.md`, Layer 5, 5.1: `μ_G(1)` for `S₄`. -/
theorem mobiusSub_bot_perm_four : mobiusSub (⊥ : Subgroup (Equiv.Perm (Fin 4))) = -12 := sorry

/-- `README.md`, Layer 5, 5.2: Hall's Eulerian function, the number of generating `k`-tuples. -/
noncomputable def eulerian [Finite G] (k : ℕ) : ℕ :=
  Nat.card {v : Fin k → G // Subgroup.closure (Set.range v) = ⊤}

/-- `README.md`, Layer 5, 5.2: Hall's formula. -/
theorem eulerian_eq_sum_mobiusSub [Finite G] (k : ℕ) :
    letI : Fintype (Subgroup G) := Fintype.ofFinite _
    (eulerian G k : ℤ) = ∑ H : Subgroup G, mobiusSub H * (Nat.card H : ℤ) ^ k := sorry

/-- `README.md`, Layer 5, 5.2: automorphisms act freely on generating tuples. -/
theorem card_mulAut_dvd_eulerian [Finite G] (k : ℕ) : Nat.card (MulAut G) ∣ eulerian G k := sorry

/-- `README.md`, Layer 5, 5.4: the minimal faithful permutation degree. -/
noncomputable def permutationDegree : ℕ :=
  sInf {n | ∃ f : G →* Equiv.Perm (Fin n), Function.Injective f}

/-- `README.md`, Layer 5, 5.4: the minimal transitive degree, the least index of a core-free
subgroup. -/
noncomputable def transitiveDegree : ℕ :=
  sInf {n | ∃ H : Subgroup G, H.normalCore = ⊥ ∧ H.index = n}

/-- `README.md`, Layer 5, 5.4: the permutation degree is at most the transitive degree. -/
theorem permutationDegree_le_transitiveDegree [Finite G] :
    permutationDegree G ≤ transitiveDegree G := sorry

/-- `README.md`, Layer 5, 5.4: Johnson's formula for the permutation degree. -/
theorem permutationDegree_eq_sInf_sum_index [Finite G] :
    permutationDegree G =
      sInf {n | ∃ s : Finset (Subgroup G), (⨅ H ∈ s, H.normalCore) = ⊥ ∧ ∑ H ∈ s, H.index = n} :=
  sorry

/-- `README.md`, Layer 5, 5.4: `Q₈` needs eight points. -/
theorem permutationDegree_quaternionGroup_two : permutationDegree (QuaternionGroup 2) = 8 := sorry

/-! ## Layer 6: rational characters, Schur indices and faithful linear degrees -/

section Characters

variable [Finite G]

/-- `README.md`, Layer 6, 6.1: the character field `ℚ(χ)`. -/
noncomputable def characterField (χ : TauCeti.irreducibleCharacters ℂ G) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ (Set.range (χ : G → ℂ))

variable {G} in
/-- `README.md`, Layer 6, 6.4: the Schur index of `χ` over a subfield `F ⊆ ℂ`: the least degree
`[E : F(χ)]` of a field `F(χ) ≤ E ≤ ℂ` over which a representation with character `χ` exists.
The degree is `IntermediateField.relfinrank`, which is `0` for an infinite extension. -/
noncomputable def schurIndex (F : IntermediateField ℚ ℂ) (χ : TauCeti.irreducibleCharacters ℂ G) :
    ℕ :=
  sInf {d | ∃ E : IntermediateField ℚ ℂ, F ⊔ characterField G χ ≤ E ∧
    d = (F ⊔ characterField G χ).relfinrank E ∧ d ≠ 0 ∧
    ∃ (n : ℕ) (ρ : Representation E G (Fin n → E)), ∀ g, (ρ.character g : ℂ) = (χ : G → ℂ) g}

/-- `README.md`, Layer 6, 6.4: the Schur index divides the degree `χ 1` (a natural number cast
into `ℂ`; divisibility is stated in `ℕ`, where it carries content). -/
theorem schurIndex_dvd_degree (F : IntermediateField ℚ ℂ) (χ : TauCeti.irreducibleCharacters ℂ G) :
    ∃ m : ℕ, (χ : G → ℂ) 1 = ((schurIndex F χ * m : ℕ) : ℂ) := sorry

/-- `README.md`, Layer 6, 6.4: Brauer–Speiser: a real-valued irreducible character has Schur index
at most `2` over `ℚ`. -/
theorem schurIndex_le_two_of_real (χ : TauCeti.irreducibleCharacters ℂ G)
    (hχ : ∀ g, ((χ : G → ℂ) g).im = 0) : schurIndex ⊥ χ ≤ 2 := sorry

open scoped Classical in
/-- `README.md`, Layer 6, 6.7: a monomial group: every irreducible character is induced from a
degree-one character of a subgroup (the induced character written out). -/
def IsMonomial [Fintype G] : Prop :=
  ∀ χ : TauCeti.irreducibleCharacters ℂ G, ∃ (H : Subgroup G) (ψ : H →* ℂˣ), ∀ g : G,
    (χ : G → ℂ) g = (Nat.card H : ℂ)⁻¹ *
      ∑ x : G, if h : x⁻¹ * g * x ∈ H then (ψ ⟨x⁻¹ * g * x, h⟩ : ℂ) else 0

/-- `README.md`, Layer 6, 6.7: Taketa's theorem. -/
theorem isSolvable_of_isMonomial [Fintype G] (h : IsMonomial G) : Group.IsSolvable G := sorry

/-- `README.md`, Layer 6, 6.7: supersolvable groups are monomial. -/
theorem isMonomial_of_isSupersolvable [Fintype G] [IsSupersolvable G] : IsMonomial G := sorry

/-- `README.md`, Layer 6, 6.8: the minimal degree of a faithful irreducible complex representation,
read off the character table (`χ` is faithful iff `χ g = χ 1` only for `g = 1`); `⊤` if none. -/
noncomputable def irrDegreeC : ℕ∞ :=
  ⨅ (χ : TauCeti.irreducibleCharacters ℂ G) (_ : ∀ g : G, (χ : G → ℂ) g = (χ : G → ℂ) 1 → g = 1),
    ((⌊((χ : G → ℂ) 1).re⌋₊ : ℕ) : ℕ∞)

/-- `README.md`, Layer 6, 6.8: the minimal degree of a faithful complex representation on a
finite-dimensional space (without finite-dimensionality every group would get `0`, since an
infinite-dimensional faithful `V` has `finrank = 0`). -/
noncomputable def linDegreeC : ℕ∞ :=
  ⨅ (V : Type u) (_ : AddCommGroup V) (_ : Module ℂ V) (_ : FiniteDimensional ℂ V)
    (ρ : Representation ℂ G V) (_ : Function.Injective ρ), (Module.finrank ℂ V : ℕ∞)

/-- `README.md`, Layer 6, 6.8: a faithful irreducible representation is in particular faithful. -/
theorem linDegreeC_le_irrDegreeC : linDegreeC G ≤ irrDegreeC G := sorry

/-- `README.md`, Layer 6, 6.8: `C₄ × C₄` has no faithful irreducible representation. -/
theorem irrDegreeC_zmod_four_prod :
    irrDegreeC (Multiplicative (ZMod 4 × ZMod 4)) = ⊤ := sorry

end Characters

/-! ## Layer 7: Gassmann classes and arithmetic equivalence -/

variable {G} in
/-- `README.md`, Layer 7, 7.3: Gassmann equivalence of finite-index subgroups of an arbitrary group
`Γ`, by fixed-coset counts; for finite `Γ` this is Tau Ceti's `Subgroup.AlmostConjugate`. -/
def AlmostConjugateOfFiniteIndex {Γ : Type*} [Group Γ] (H K : Subgroup Γ) : Prop :=
  ∀ γ : Γ, Nat.card (MulAction.fixedBy (Γ ⧸ H) γ) = Nat.card (MulAction.fixedBy (Γ ⧸ K) γ)

/-- `README.md`, Layer 7, 7.3: the reduction to a common finite quotient. -/
theorem almostConjugateOfFiniteIndex_iff_map {Γ : Type*} [Group Γ] (H K N : Subgroup Γ) [N.Normal]
    [N.FiniteIndex] (hH : N ≤ H) (hK : N ≤ K) :
    AlmostConjugateOfFiniteIndex H K ↔
      AlmostConjugateOfFiniteIndex (H.map (QuotientGroup.mk' N)) (K.map (QuotientGroup.mk' N)) :=
  sorry

/-- `README.md`, Layer 7, 7.4: Perlis' theorem. Two subfields of a Galois extension `L/ℚ` have the
same Dedekind zeta function exactly when their fixed groups are Gassmann equivalent. -/
theorem dedekindZeta_eq_iff_almostConjugate (L : Type*) [Field L] [NumberField L] [IsGalois ℚ L]
    (H K : Subgroup (L ≃ₐ[ℚ] L)) :
    NumberField.dedekindZeta (IntermediateField.fixedField H) =
        NumberField.dedekindZeta (IntermediateField.fixedField K) ↔
      AlmostConjugateOfFiniteIndex H K := sorry

/-! ## Layer 8: Malle invariants -/

variable {G} in
/-- `README.md`, Layer 8, 8.3: an elusive permutation group has no fixed-point-free element of
prime order. -/
def IsElusive {α : Type*} (P : Subgroup (Equiv.Perm α)) : Prop :=
  ¬ ∃ g ∈ P, (orderOf g).Prime ∧ ∀ x, g x ≠ x

/-- `README.md`, Layer 8, 8.3: a transitive group of prime degree is not elusive. -/
theorem not_isElusive_of_prime_card {α : Type*} [Fintype α] (hp : (Fintype.card α).Prime)
    (P : Subgroup (Equiv.Perm α)) [MulAction.IsPretransitive P α] : ¬ IsElusive P := sorry

/-! ## Layer 9: integral representations -/

/-- `README.md`, Layer 9, 9.2: Diederichsen–Reiner for `p ≤ 19` (class number one): an
indecomposable `ℤ[C_p]`-lattice (Tau Ceti's `IsIndecomposableModule`) is the trivial lattice, the
quotient of `ℤ[C_p]` by the norm element, or `ℤ[C_p]` itself. -/
theorem diederichsen_reiner (p : ℕ) [Fact p.Prime] [NeZero p] (hp19 : p ≤ 19) (L : Type*)
    [AddCommGroup L] [Module (MonoidAlgebra ℤ (Multiplicative (ZMod p))) L] [Module.Free ℤ L]
    [Module.Finite ℤ L]
    (hL : TauCeti.IsIndecomposableModule (MonoidAlgebra ℤ (Multiplicative (ZMod p))) L) :
    Module.finrank ℤ L = 1 ∨
      Nonempty (L ≃ₗ[MonoidAlgebra ℤ (Multiplicative (ZMod p))]
        (MonoidAlgebra ℤ (Multiplicative (ZMod p)) ⧸
          Ideal.span {∑ g : Multiplicative (ZMod p), MonoidAlgebra.of ℤ (Multiplicative (ZMod p)) g})) ∨
      Nonempty (L ≃ₗ[MonoidAlgebra ℤ (Multiplicative (ZMod p))] MonoidAlgebra ℤ (Multiplicative (ZMod p))) :=
  sorry

/-! ## Layer 10: finite subgroups of general linear groups -/

/-- `README.md`, Layer 10, 10.2: Minkowski's lemma: for `p ≥ 3`, a torsion element of `GL_n(ℤ)`
congruent to `1` modulo `p` is `1`. -/
theorem eq_one_of_isOfFinOrder_of_map_eq_one (n : ℕ) (p : ℕ) [Fact p.Prime] (hp : 3 ≤ p)
    (M : GL (Fin n) ℤ) (hM : IsOfFinOrder M)
    (h : Units.map (Int.castRingHom (ZMod p)).mapMatrix.toMonoidHom M = 1) : M = 1 := sorry

/-- `README.md`, Layer 10, 10.2: a finite subgroup of `GL_n(ℤ)` has order dividing `#GL_n(𝔽₃)`. -/
theorem card_dvd_card_GL_zmod_three (n : ℕ) (H : Subgroup (GL (Fin n) ℤ)) [Finite H] :
    Nat.card H ∣ Nat.card (GL (Fin n) (ZMod 3)) := sorry

/-- `README.md`, Layer 10, 10.3: conjugacy of subgroups. -/
def IsConjSubgroup {Γ : Type*} [Group Γ] (H K : Subgroup Γ) : Prop :=
  ∃ g : Γ, H.map (MulAut.conj g) = K

/-- `README.md`, Layer 10, 10.3: the `ℤ`-classes in dimension `n`. -/
def ZClasses (n : ℕ) : Type :=
  Quotient (⟨fun H K : {H : Subgroup (GL (Fin n) ℤ) // Finite H} => IsConjSubgroup H.1 K.1,
    ⟨fun H => ⟨1, by ext; simp⟩,
      fun ⟨g, h⟩ => ⟨g⁻¹, by rw [← h, Subgroup.map_map]; ext; simp [mul_assoc]⟩,
      fun ⟨g, h⟩ ⟨g', h'⟩ => ⟨g' * g, by rw [← h', ← h, Subgroup.map_map]; ext; simp [mul_assoc]⟩⟩⟩ :
    Setoid _)

/-- `README.md`, Layer 10, 10.3: thirteen `ℤ`-classes of finite subgroups of `GL₂(ℤ)`. -/
theorem card_zClasses_two : Nat.card (ZClasses 2) = 13 := sorry

/-- `README.md`, Layer 10, 10.3: seventy-three `ℤ`-classes of finite subgroups of `GL₃(ℤ)`. -/
theorem card_zClasses_three : Nat.card (ZClasses 3) = 73 := sorry

/-- `README.md`, Layer 10, 10.4: seven hundred and ten `ℤ`-classes of finite subgroups of `GL₄(ℤ)`
(Brown et al. 1978). -/
theorem card_zClasses_four : Nat.card (ZClasses 4) = 710 := sorry

/-- `README.md`, Layer 10, 10.5: the optimal Jordan constant, the least `J` such that every finite
subgroup of `GL_n(ℂ)` has an abelian normal subgroup of index at most `J`. -/
noncomputable def jordanBound (n : ℕ) : ℕ :=
  sInf {J : ℕ | ∀ H : Subgroup (GL (Fin n) ℂ), Finite H →
    ∃ A : Subgroup H, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ J}

/-- `README.md`, Layer 10, 10.5: **Jordan's theorem** over any field of characteristic zero. -/
theorem jordan_exists_abelian_normal_index_le {F : Type*} [Field F] [CharZero F] (n : ℕ)
    (H : Subgroup (GL (Fin n) F)) [Finite H] :
    ∃ A : Subgroup H, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ jordanBound n := sorry

/-- `README.md`, Layer 10, 10.5: a subgroup of `GL_n(F)` that is finite modulo scalars (finite
image in `PGL(n, F)`) has an abelian normal subgroup of index at most `jordanBound n`. -/
theorem jordan_exists_abelian_normal_index_le_of_finite_map {F : Type*} [Field F] [CharZero F]
    (n : ℕ) (B : Subgroup (GL (Fin n) F)) [Finite (B.map Matrix.ProjGenLinGroup.mk)] :
    ∃ A : Subgroup B, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ jordanBound n := sorry

/-- `README.md`, Layer 10, 10.5: over an algebraically closed field of characteristic zero, an
irreducible finite-dimensional representation of a subgroup of `GL_n(F)` finite modulo scalars has
dimension at most `jordanBound n`. -/
theorem finrank_le_jordanBound {F : Type*} [Field F] [CharZero F] [IsAlgClosed F] (n : ℕ)
    (B : Subgroup (GL (Fin n) F)) [Finite (B.map Matrix.ProjGenLinGroup.mk)]
    {W : Type*} [AddCommGroup W] [Module F W] [FiniteDimensional F W]
    (ρ : Representation F B W) (hρ : ρ.IsIrreducible) :
    Module.finrank F W ≤ jordanBound n := sorry

/-- `README.md`, Layer 10, 10.5: Schur's explicit bound, for `n ≥ 1` (at `n = 0` the right side is
`0` and `jordanBound 0 = 1`). -/
theorem jordanBound_le_schur (n : ℕ) (hn : 1 ≤ n) :
    (jordanBound n : ℝ) ≤
      (Real.sqrt (8 * n) + 1) ^ (2 * n ^ 2) - (Real.sqrt (8 * n) - 1) ^ (2 * n ^ 2) := sorry

/-- `README.md`, Layer 10, 10.5: finite subgroups of `GL_1` are abelian. -/
theorem jordanBound_one : jordanBound 1 = 1 := sorry

end TauCetiRoadmap.FiniteGroupInvariants
