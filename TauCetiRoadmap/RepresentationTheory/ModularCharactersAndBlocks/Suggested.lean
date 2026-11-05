module

import Mathlib
import TauCeti.RingTheory.Idempotents.Primitive.Basic

/-!
# Modular characters and blocks: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the three
definitions they need: block idempotents (primitive idempotents of the centre of the group
algebra), the Brauer coefficient projection, and defect groups as maximal `p`-subgroups on which
the Brauer projection of a block idempotent is nonzero. A block is principal when its idempotent
has nonzero augmentation, written with the native `MonoidAlgebra.lift`.

Headline theorems of the roadmap that are not statable at the pins:

* Brauer reciprocity `C = Dᵀ D`, the surjectivity of the decomposition map and the Brauer-character
  basis of the class functions on `p`-regular classes (Layers 2–3). They need Brauer characters
  and the reduction of stable lattices over a complete discrete valuation ring into `G₀(k[G])`;
  the pinned Tau Ceti has neither (its `TauCeti.reductionK0` reduces `ℤ`-forms only).
* Generalized decomposition numbers, their orthogonality relations and Brauer's second main
  theorem (Layers 5 and 7). They need Brauer characters of centralizers.
* The ordinary block partition, block-section orthogonality and the kernel theorem
  `⋂_{χ ∈ Irr(B₀)} ker χ = O_{p'}(G)` (Layers 4, 5 and 8). They need the partition of the
  complex irreducible characters into `p`-blocks through a `p`-modular system, and the core
  `O_{p'}(G)`, which is not at the pinned Mathlib.
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

end TauCetiRoadmap.ModularCharactersAndBlocks
