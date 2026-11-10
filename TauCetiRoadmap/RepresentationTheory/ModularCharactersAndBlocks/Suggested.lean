module

import Mathlib
import TauCeti.GroupTheory.OrderOfElement.PPart
import TauCeti.RepresentationTheory.CharacterTable.Table
import TauCeti.RingTheory.Idempotents.Primitive.Basic

/-!
# Modular characters and blocks: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the five
definitions they need: block idempotents (primitive idempotents of the centre of the group
algebra), the Brauer coefficient projection, defect groups as maximal `p`-subgroups on which
the Brauer projection of a block idempotent is nonzero, the central-character relation that
sorts the complex irreducible characters into `p`-blocks modulo a maximal ideal of the algebraic
integers containing `p`, and the `p'`-core `O_{p'}(G)`. A block is principal when its idempotent
has nonzero augmentation, written with the native `MonoidAlgebra.lift`.

Headline theorems of the roadmap that are not statable at the pins:

* Brauer reciprocity `C = Dᵀ D`, the surjectivity of the decomposition map and the Brauer-character
  basis of the class functions on `p`-regular classes (Layers 2–3). They need Brauer characters
  and the reduction of stable lattices over a complete discrete valuation ring into `G₀(k[G])`;
  the pinned Tau Ceti has neither (its `TauCeti.reductionK0` reduces `ℤ`-forms only).
* Generalized decomposition numbers, their orthogonality relations and Brauer's second main
  theorem (Layers 5 and 7). They need Brauer characters of centralizers.
* The agreement of the central-character relation with the partition of the ordinary irreducible
  characters by the block idempotents of `O[G]` (Layer 4). It needs the ordinary characters over
  the fraction field `K` of a splitting `p`-modular system and their central idempotents in
  `K[G]`; `K` is not algebraically closed, and the pinned
  `TauCeti.Representation.primitiveCentralIdempotent` requires an algebraically closed field.
-/

namespace TauCetiRoadmap.ModularCharactersAndBlocks

/-! ## Layer 0: the centre of the group algebra and its block idempotents -/

/-- A **block idempotent** of `R[G]` is a primitive idempotent of the centre of `R[G]`
(Martínez, Theorem 2.11, p. 15). -/
abbrev IsBlockIdempotent {R G : Type*} [CommRing R] [Group G]
    (b : Subalgebra.center R (MonoidAlgebra R G)) : Prop :=
  TauCeti.IsPrimitiveIdempotent b

/-- **Uniqueness of the block decomposition.** Two complete families of orthogonal block
idempotents of `k[G]` agree up to reindexing. -/
theorem complete_blockIdempotents_unique {G : Type*} [Group G] [Finite G] {k : Type*} [Field k]
    {ι κ : Type*} [Fintype ι] [Fintype κ]
    (b : ι → Subalgebra.center k (MonoidAlgebra k G))
    (c : κ → Subalgebra.center k (MonoidAlgebra k G))
    (hb : CompleteOrthogonalIdempotents b) (hc : CompleteOrthogonalIdempotents c)
    (hbp : ∀ i, IsBlockIdempotent (b i)) (hcp : ∀ j, IsBlockIdempotent (c j)) :
    ∃ e : ι ≃ κ, ∀ i, b i = c (e i) := sorry

/-! ## Layer 1: modular systems, lattices and lifting -/

/-- **Blocks of `O[G]` and of `k[G]` correspond.** For a complete discrete valuation ring `O`
with residue field `k`, reduction modulo the maximal ideal is a bijection from the block
idempotents of `O[G]` to those of `k[G]` (Webb, Proposition 9.4.3, p. 149, for the lifting of
idempotents; centrality and uniqueness come from the class-sum bases of both centres). -/
theorem existsUnique_blockIdempotent_map_residue {G O : Type*} [Group G] [Finite G] [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    (c : Subalgebra.center (IsLocalRing.ResidueField O)
      (MonoidAlgebra (IsLocalRing.ResidueField O) G))
    (hc : IsBlockIdempotent c) :
    ∃! b : Subalgebra.center O (MonoidAlgebra O G), IsBlockIdempotent b ∧
      MonoidAlgebra.mapRingHom G (IsLocalRing.residue O) (b : MonoidAlgebra O G) =
        (c : MonoidAlgebra (IsLocalRing.ResidueField O) G) :=
  sorry

/-! ## Layer 2: Brauer characters and decomposition -/

/-- **Brauer's count of simple modules.** Over an algebraically closed field of characteristic
`p`, the number of isomorphism classes of simple `k[G]`-modules equals the number of conjugacy
classes of `p`-regular elements of `G` (Webb, Theorem 9.3.6, p. 147; Martínez, Theorem 1.9,
p. 5). -/
theorem card_simpleModules_eq_card_pRegularClasses {G k : Type u} [Group G] [Finite G] [Field k]
    [IsAlgClosed k] (p : ℕ) [Fact p.Prime] [CharP k p] :
    ∃ (ι : Type u) (_ : Fintype ι) (S : ι → ModuleCat.{u} (MonoidAlgebra k G)),
      (∀ i, IsSimpleModule (MonoidAlgebra k G) (S i)) ∧
      (∀ i j, Nonempty (S i ≅ S j) → i = j) ∧
      (∀ M : ModuleCat.{u} (MonoidAlgebra k G), IsSimpleModule (MonoidAlgebra k G) M →
        ∃ i, Nonempty (M ≅ S i)) ∧
      Fintype.card ι =
        Nat.card {C : ConjClasses G // ∃ g : G, ConjClasses.mk g = C ∧ (orderOf g).Coprime p} :=
  sorry

/-! ## Layer 4: blocks in the three coefficient rings -/

/-- **The central-character block relation.** For an ideal `M` of the algebraic integers
`integralClosure ℤ ℂ`, the functions `χ, ψ : G → ℂ` are related when, for every `g` with
conjugacy class `C`, the difference `|C| χ(g) / χ(1) - |C| ψ(g) / ψ(1)` lies in `M`. On
irreducible characters both terms are the central characters `ω_χ(K_C)` and `ω_ψ(K_C)`, which are
algebraic integers; for `M` maximal with `p ∈ M` the relation is equality of central characters
modulo `M`, and its classes are the `p`-blocks of ordinary characters (Sambale, Definition 1.6,
p. 15, with the residue field of the modular system replaced by the algebraic integers modulo
`M`). -/
def SameBlock {G : Type*} [Group G] (M : Ideal (integralClosure ℤ ℂ)) (χ ψ : G → ℂ) : Prop :=
  ∀ g : G, ∃ m ∈ M, (m : ℂ) =
    (Nat.card (ConjClasses.mk g).carrier : ℂ) * (χ g / χ 1 - ψ g / ψ 1)

/-! ## Layer 6: Brauer maps and defect groups -/

/-- The **Brauer coefficient projection** `k[G] → k[C_G(P)]`, which keeps the coefficients on the
centralizer of `P` and discards the others. It is linear on all of `k[G]` and multiplicative on
`P`-fixed elements when `P` is a `p`-group in characteristic `p` (`brauerProjection_mul`). -/
noncomputable def brauerProjection {G : Type*} [Group G] [Finite G] {k : Type*} [Field k]
    (P : Subgroup G) (x : MonoidAlgebra k G) :
    MonoidAlgebra k (Subgroup.centralizer (P : Set G)) := by
  classical
  letI := Fintype.ofFinite (Subgroup.centralizer (P : Set G))
  exact MonoidAlgebra.ofCoeff (Finsupp.equivFunOnFinite.symm fun c => x.coeff (c : G))

/-- **The Brauer map is multiplicative.** For a `p`-subgroup `P` in characteristic `p`, the
Brauer projection is multiplicative on elements whose coefficients are invariant under
conjugation by `P` (Webb, §12.5, p. 243, and Corollary 12.5.4, p. 246; Martínez, Theorem 4.1,
p. 23, for the centre). -/
theorem brauerProjection_mul {G : Type*} [Group G] [Finite G] {k : Type*} [Field k] {p : ℕ}
    [Fact p.Prime] [CharP k p] (P : Subgroup G) (hP : IsPGroup p P) (x y : MonoidAlgebra k G)
    (hx : ∀ a : P, ∀ g : G, x.coeff ((a : G) * g * (a : G)⁻¹) = x.coeff g)
    (hy : ∀ a : P, ∀ g : G, y.coeff ((a : G) * g * (a : G)⁻¹) = y.coeff g) :
    brauerProjection P (x * y) = brauerProjection P x * brauerProjection P y := sorry

/-- `P` is a **defect group** of the central element `e` of `k[G]`: `P` is a `p`-subgroup with
`Br_P(e) ≠ 0`, and no strictly larger `p`-subgroup `Q` has `Br_Q(e) ≠ 0` (Webb, Theorem 12.5.2
and Corollary 12.5.5, pp. 244–246; Sambale, Definition 1.4, p. 14). -/
def IsDefectGroup {G : Type*} [Group G] [Finite G] {k : Type*} [Field k] (p : ℕ)
    (e : Subalgebra.center k (MonoidAlgebra k G)) (P : Subgroup G) : Prop :=
  IsPGroup p P ∧ brauerProjection P (e : MonoidAlgebra k G) ≠ 0 ∧
    ∀ Q : Subgroup G, IsPGroup p Q → P ≤ Q → brauerProjection Q (e : MonoidAlgebra k G) ≠ 0 →
      Q = P

/-- **Defect groups are conjugate.** Any two defect groups of a block of `k[G]`, for any field
`k` of characteristic `p`, are conjugate in `G` (Webb, Corollary 12.3.2, p. 235, and
Theorem 12.5.2, p. 244; Sambale, Proposition 1.5, p. 14). -/
theorem isDefectGroup_conj {G : Type*} [Group G] [Finite G] {k : Type*} [Field k]
    {p : ℕ} [Fact p.Prime] [CharP k p] (e : Subalgebra.center k (MonoidAlgebra k G))
    (he : IsBlockIdempotent e) {P Q : Subgroup G} (hP : IsDefectGroup p e P)
    (hQ : IsDefectGroup p e Q) :
    ∃ g : G, Q = P.map (MulAut.conj g).toMonoidHom := sorry

/-- **The principal block has the Sylow subgroups as defect groups.** If the block idempotent `e`
has nonzero augmentation, its defect groups are exactly the Sylow `p`-subgroups of `G`, for any
field `k` of characteristic `p` (Webb, Corollary 12.4.7, p. 242, with Theorem 12.5.2, p. 244;
Sambale, Proposition 1.5, p. 14). -/
theorem isDefectGroup_iff_sylow_of_augmentation_ne_zero {G : Type*} [Group G] [Finite G]
    {k : Type*} [Field k] {p : ℕ} [Fact p.Prime] [CharP k p]
    (e : Subalgebra.center k (MonoidAlgebra k G)) (he : IsBlockIdempotent e)
    (haug : MonoidAlgebra.lift k k G 1 (e : MonoidAlgebra k G) ≠ 0) (P : Subgroup G) :
    IsDefectGroup p e P ↔ ∃ S : Sylow p G, P = S := sorry

/-! ## Layer 7: Brauer's main theorems -/

/-- **Brauer's first main theorem.** For a `p`-subgroup `D` with normalizer `N`, there is a
bijection from the blocks of `k[N]` with defect group `D` to the blocks of `k[G]` with defect
group `D`, sending `b` to the block `B` with `Br_D(e_B) e_b ≠ 0` in `k[G]` (Webb,
Theorem 12.6.4, p. 250; Martínez, Theorem 4.10, p. 27, and Corollary 4.6, p. 26). -/
theorem brauer_first_main {G : Type*} [Group G] [Finite G] {k : Type*} [Field k] [IsAlgClosed k]
    {p : ℕ} [Fact p.Prime] [CharP k p] (D : Subgroup G) (hD : IsPGroup p D) :
    ∃ f : {b : Subalgebra.center k (MonoidAlgebra k (Subgroup.normalizer (D : Set G))) //
          IsBlockIdempotent b ∧ IsDefectGroup p b (D.subgroupOf (Subgroup.normalizer (D : Set G)))} ≃
        {B : Subalgebra.center k (MonoidAlgebra k G) // IsBlockIdempotent B ∧ IsDefectGroup p B D},
      ∀ b, MonoidAlgebra.mapDomain ((↑) : Subgroup.centralizer (D : Set G) → G)
          (brauerProjection D ((f b).1 : MonoidAlgebra k G)) *
        MonoidAlgebra.mapDomain ((↑) : Subgroup.normalizer (D : Set G) → G)
          (b.1 : MonoidAlgebra k (Subgroup.normalizer (D : Set G))) ≠ 0 := sorry

open scoped Classical in
/-- **Block-section orthogonality.** Let `M` be a maximal ideal of the algebraic integers with
`p ∈ M`. If the `p`-parts of `g` and `h` are not conjugate, then for every irreducible complex
character `ψ` the sum of `χ(g) conj(χ(h))` over the irreducible characters `χ` in the block of
`ψ` vanishes (Martínez, Corollary 2.4, p. 11, for `g` `p`-regular and `h` `p`-singular; in
general, expand `χ(g)` and `χ(h)` in generalized decomposition numbers and apply the block form of
their orthogonality, Sambale, Theorem 1.14, p. 16). -/
theorem sum_sameBlock_mul_conj_eq_zero {G : Type*} [Group G] [Finite G] {p : ℕ} [Fact p.Prime]
    (M : Ideal (integralClosure ℤ ℂ)) [M.IsMaximal] (hpM : (p : integralClosure ℤ ℂ) ∈ M)
    (j : Fin (Nat.card (ConjClasses G))) {g h : G}
    (hgh : ¬ IsConj (TauCeti.pPart p g) (TauCeti.pPart p h)) :
    ∑ i with SameBlock M (TauCeti.irreducibleCharacter ℂ i) (TauCeti.irreducibleCharacter ℂ j),
      TauCeti.irreducibleCharacter ℂ i g * starRingEnd ℂ (TauCeti.irreducibleCharacter ℂ i h) =
      0 := sorry

/-- **Brauer's third main theorem, local form.** Let `P` be a `p`-subgroup and
`P C_G(P) ≤ H ≤ N_G(P)`, and let `e₀` be the principal block idempotent of `k[G]`. A block
idempotent `b` of `k[H]` satisfies `Br_P(e₀) b ≠ 0` in `k[G]` exactly when `b` is principal
(Martínez, Corollary 4.6, p. 26, and Corollary 5.9, p. 35). -/
theorem brauer_third_main_local {G : Type*} [Group G] [Finite G] {k : Type*} [Field k]
    [IsAlgClosed k] {p : ℕ} [Fact p.Prime] [CharP k p] (P H : Subgroup G) (hP : IsPGroup p P)
    (hPH : P ⊔ Subgroup.centralizer (P : Set G) ≤ H) (hHN : H ≤ Subgroup.normalizer (P : Set G))
    (e₀ : Subalgebra.center k (MonoidAlgebra k G)) (he₀ : IsBlockIdempotent e₀)
    (he₀aug : MonoidAlgebra.lift k k G 1 (e₀ : MonoidAlgebra k G) ≠ 0)
    (b : Subalgebra.center k (MonoidAlgebra k H)) (hb : IsBlockIdempotent b) :
    MonoidAlgebra.mapDomain ((↑) : Subgroup.centralizer (P : Set G) → G)
          (brauerProjection P (e₀ : MonoidAlgebra k G)) *
        MonoidAlgebra.mapDomain ((↑) : H → G) (b : MonoidAlgebra k H) ≠ 0 ↔
      MonoidAlgebra.lift k k H 1 (b : MonoidAlgebra k H) ≠ 0 := sorry

/-! ## Layer 8: normal subgroups and finite-group interfaces -/

/-- The **`p'`-core** `O_{p'}(G)`: the supremum of the normal subgroups of `G` whose order is
prime to `p`. For a finite group it is a characteristic subgroup of order prime to `p`, and it
contains every normal subgroup of order prime to `p`. -/
def pPrimeCore (p : ℕ) (G : Type*) [Group G] : Subgroup G :=
  sSup {N : Subgroup G | N.Normal ∧ (Nat.card N).Coprime p}

/-- **The kernel of the principal block is the `p'`-core.** Let `M` be a maximal ideal of the
algebraic integers with `p ∈ M`. An element `g` lies in `O_{p'}(G)` exactly when `χ(g) = χ(1)`
for every irreducible complex character `χ` in the block of the trivial character; that is,
`⋂_{χ ∈ Irr(B₀(G))} ker χ = O_{p'}(G)` (Navarro, Theorem 6.10). -/
theorem mem_pPrimeCore_iff_forall_principalBlock {G : Type*} [Group G] [Finite G] {p : ℕ}
    [Fact p.Prime] (M : Ideal (integralClosure ℤ ℂ)) [M.IsMaximal]
    (hpM : (p : integralClosure ℤ ℂ) ∈ M) (g : G) :
    g ∈ pPrimeCore p G ↔
      ∀ χ ∈ TauCeti.irreducibleCharacters ℂ G, SameBlock M χ (fun _ ↦ 1) → χ g = χ 1 := sorry

end TauCetiRoadmap.ModularCharactersAndBlocks
