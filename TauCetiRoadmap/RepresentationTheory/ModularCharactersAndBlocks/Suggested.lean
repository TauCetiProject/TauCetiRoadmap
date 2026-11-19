module

import Mathlib
import TauCeti.Algebra.Module.ProjectiveCover.Basic
import TauCeti.GroupTheory.OrderOfElement.PPart
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.RepresentationTheory.CharacterTable.Table
import TauCeti.RepresentationTheory.GrothendieckGroup.CartanMatrix
import TauCeti.RingTheory.CompositionSeries.Multiplicity
import TauCeti.RingTheory.Idempotents.Primitive.Basic

/-!
# Modular characters and blocks: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need: block idempotents (primitive idempotents of the centre of the group
algebra), Brauer characters for an identification of prime-to-`p` roots of unity, the
central-character relation that sorts the complex irreducible characters into `p`-blocks modulo
a maximal ideal of the algebraic integers containing `p`, the ordinary characters of a block at
any `p`-modular system, the Brauer coefficient projection, defect groups as maximal `p`-subgroups
on which the Brauer projection of a block idempotent is nonzero, the defect of a block, the
Brauer correspondent, and a stand-in for the `p'`-core of OddOrderTheorem §1.1 in the shape of
mathlib4#39771. A block is principal when its idempotent
has nonzero augmentation, written with the native `MonoidAlgebra.lift`. The decomposition
numbers in the statements of Layers 2 and 3 are the Jordan–Hölder multiplicities
`TauCeti.jordanHolderMultiplicity` of the simple `k[G]`-modules in the reduction `k ⊗_O L` of a
`G`-stable `O`-lattice `L`, formed with the native `Representation.baseChange`. An irreducible
representation of `G` over the fraction field `K` of `O` lies in a block of `O[G]` when the block
idempotent, mapped to `K[G]`, acts on it as the identity.

Headline theorems of the roadmap that are not stated here:

* The spanning half of the Brauer-character basis theorem (Layer 2), which needs a complete
  family of simple modules indexed together with the `p`-regular classes; its count is
  `card_simpleModules_eq_card_pRegularClasses` and its independence
  `linearIndependent_brauerCharacter`.
* Generalized decomposition numbers, their orthogonality relations and Brauer's second main
  theorem (Layers 5 and 7). They need the irreducible Brauer characters of every centralizer of a
  `p`-element as indexed families.
-/

namespace TauCetiRoadmap.ModularCharactersAndBlocks

/-! ## Layer 0: element sections, cores and the centre of the group algebra -/

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

/-- The **`p'`-core** `O_{p'}(H)` of a subgroup `H` of `G`, as a subgroup of `G`: the supremum of
the subgroups of `H` that are normal in `H` and of order prime to `p`. It stands in for the
`π`-core of OddOrderTheorem §1.1 at `π = {p}'`, in the shape of mathlib4#39771's
`Subgroup.pCore p H`; the `p'`-core of `G` is `pPrimeCore p ⊤`. -/
def pPrimeCore {G : Type*} [Group G] (p : ℕ) (H : Subgroup G) : Subgroup G :=
  sSup {N : Subgroup G | N ≤ H ∧ (N.subgroupOf H).Normal ∧ (Nat.card N).Coprime p}

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

/-- The **Brauer character** of a representation `ρ` of `G` on a finite-dimensional `k`-vector
space, for an identification `τ` of the `m`-th roots of unity of `k` with those of `ℂ`: at a
`p`-regular `g`, the sum over the `m`-th roots of unity `ζ` of `k` of the multiplicity of `ζ` as a
root of the characteristic polynomial of `ρ g`, times `τ ζ`, and `0` at a `p`-singular `g`. When
`k` contains a primitive `m`-th root of unity and the order of every `p`-regular element divides
`m`, it is the sum of the `τ`-lifts of the eigenvalues of `ρ g` (Webb, §10.1, p. 170). -/
noncomputable def brauerCharacter {G k V : Type*} [Group G] [Field k] [AddCommGroup V]
    [Module k V] [FiniteDimensional k V] (p : ℕ) {m : ℕ} [NeZero m]
    (τ : rootsOfUnity m k ≃* rootsOfUnity m ℂ) (ρ : Representation k G V) (g : G) : ℂ := by
  classical
  letI := Fintype.ofFinite (rootsOfUnity m k)
  exact if (orderOf g).Coprime p then
    ∑ ζ : rootsOfUnity m k,
      ((LinearMap.charpoly (ρ g)).rootMultiplicity ((ζ : kˣ) : k) : ℂ) * ((τ ζ : ℂˣ) : ℂ)
  else 0

/-- **The irreducible Brauer characters are linearly independent.** Over an algebraically closed
field `k` of characteristic `p`, with `m` prime to `p` divisible by the order of every `p`-regular
element, the Brauer characters of pairwise non-isomorphic irreducible representations are
linearly independent over `ℂ` as functions on the `p`-regular elements (Webb, Theorem 10.2.2,
p. 176). -/
theorem linearIndependent_brauerCharacter {G k : Type u} [Group G] [Finite G] [Field k]
    [IsAlgClosed k] {p : ℕ} [Fact p.Prime] [CharP k p] {m : ℕ} [NeZero m] (hm : m.Coprime p)
    (hdvd : ∀ g : G, (orderOf g).Coprime p → orderOf g ∣ m)
    (τ : rootsOfUnity m k ≃* rootsOfUnity m ℂ) {ι : Type*} (V : ι → Type u)
    [∀ i, AddCommGroup (V i)] [∀ i, Module k (V i)] [∀ i, FiniteDimensional k (V i)]
    (ρ : ∀ i, Representation k G (V i)) (hirr : ∀ i, (ρ i).IsIrreducible)
    (hnoniso : Pairwise fun i j ↦ IsEmpty ((ρ i).Equiv (ρ j))) :
    LinearIndependent ℂ fun i (g : {g : G // (orderOf g).Coprime p}) ↦
      brauerCharacter p τ (ρ i) (g : G) := sorry

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

/-- **Integral surjectivity of the decomposition map.** Let `O` be a complete discrete valuation
ring whose fraction field `K` has characteristic zero and contains a primitive `e`-th root of
unity, `e` the exponent of `G`, and let `k` be its residue field. Let `(S i)` be pairwise
non-isomorphic simple `k[G]`-modules and `(L c)` a family of `G`-stable free `O`-lattices of
finite rank such that every irreducible `K[G]`-module is isomorphic to some `K ⊗_O L c`. Then
the vectors `([k ⊗_O L c : S i])_i` span `ℤ^ι`: every class of `G₀(k[G])` is an integral
combination of reductions of lattices (Webb, remark after Corollary 10.2.4, p. 178; the
decomposition matrix has full rank by Corollary 10.2.4). -/
theorem span_decompositionRows_eq_top {G O : Type u} [Group G] [Finite G] [CommRing O]
    [IsDomain O] [IsDiscreteValuationRing O] [IsAdicComplete (IsLocalRing.maximalIdeal O) O]
    [CharZero O] {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G))
    {ι κ : Type u} [Fintype ι]
    (S : ι → FGModuleCat.{u} (MonoidAlgebra (IsLocalRing.ResidueField O) G))
    [∀ i, IsSimpleModule (MonoidAlgebra (IsLocalRing.ResidueField O) G) (S i)]
    (hSnoniso : Pairwise fun i j ↦
      IsEmpty ((S i : Type u) ≃ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G] S j))
    (L : κ → Type u) [∀ c, AddCommGroup (L c)] [∀ c, Module O (L c)]
    [∀ c, Module.Free O (L c)] [∀ c, Module.Finite O (L c)]
    (ρ : ∀ c, Representation O G (L c))
    [∀ c, IsNoetherian (MonoidAlgebra (IsLocalRing.ResidueField O) G)
      (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule]
    [∀ c, IsArtinian (MonoidAlgebra (IsLocalRing.ResidueField O) G)
      (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule]
    (hexh : ∀ (V : Type u) [AddCommGroup V] [Module (FractionRing O) V]
      [FiniteDimensional (FractionRing O) V] (σ : Representation (FractionRing O) G V),
      σ.IsIrreducible →
        ∃ c, Nonempty (σ.Equiv (Representation.baseChange (FractionRing O) (ρ c)))) :
    Submodule.span ℤ (Set.range fun c i =>
      (TauCeti.jordanHolderMultiplicity (MonoidAlgebra (IsLocalRing.ResidueField O) G)
        (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule (S i) : ℤ)) =
      ⊤ :=
  sorry

/-! ## Layer 3: projective modules, reciprocity and the Cartan matrix -/

/-- **Brauer reciprocity `C = Dᵀ D`.** Let `O` be a complete discrete valuation ring whose
fraction field `K` has characteristic zero and contains a primitive `e`-th root of unity, `e` the
exponent of `G`, and let `k` be its residue field. Take exhaustive families of pairwise
non-isomorphic indecomposable projective `k[G]`-modules `P i` and simple `k[G]`-modules `S i`,
with `P i` a projective cover of `S i`, and `G`-stable free `O`-lattices `L c` of finite rank
whose scalar extensions `K ⊗_O L c` are pairwise non-isomorphic irreducible `K[G]`-modules
representing every irreducible one. Then the native Cartan matrix, `C i j = [P j : S i]`, equals
`Dᵀ D` for the decomposition matrix `D c i = [k ⊗_O L c : S i]` (Webb, Theorem 9.5.4 and
Corollary 9.5.6, pp. 159–160). -/
theorem cartanMatrix_eq_transpose_mul_decomposition {G O : Type u} [Group G] [Finite G]
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G))
    [IsArtinianRing (MonoidAlgebra (IsLocalRing.ResidueField O) G)]
    {ι κ : Type u} [Fintype ι] [Fintype κ]
    (P : ι → (TauCeti.finiteProjectiveModules
      (MonoidAlgebra (IsLocalRing.ResidueField O) G)).FullSubcategory)
    (S : ι → FGModuleCat.{u} (MonoidAlgebra (IsLocalRing.ResidueField O) G))
    [∀ i, IsSimpleModule (MonoidAlgebra (IsLocalRing.ResidueField O) G) (S i)]
    (hind : ∀ i,
      TauCeti.IsIndecomposableModule (MonoidAlgebra (IsLocalRing.ResidueField O) G) (P i).obj)
    (hPnoniso : Pairwise fun i j ↦
      IsEmpty (↥(P i).obj ≃ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G] ↥(P j).obj))
    (hPexh : TauCeti.IsExhaustiveIndecomposableProjectiveFamily P)
    (hSnoniso : Pairwise fun i j ↦
      IsEmpty ((S i : Type u) ≃ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G] S j))
    (hSexh : TauCeti.IsExhaustiveSimpleFamily S)
    (hcover : ∀ i, ∃ f : (P i).obj →ₗ[MonoidAlgebra (IsLocalRing.ResidueField O) G]
      (S i : Type u), TauCeti.IsProjectiveCover f)
    (L : κ → Type u) [∀ c, AddCommGroup (L c)] [∀ c, Module O (L c)]
    [∀ c, Module.Free O (L c)] [∀ c, Module.Finite O (L c)]
    (ρ : ∀ c, Representation O G (L c))
    [∀ c, IsNoetherian (MonoidAlgebra (IsLocalRing.ResidueField O) G)
      (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule]
    [∀ c, IsArtinian (MonoidAlgebra (IsLocalRing.ResidueField O) G)
      (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule]
    (hirr : ∀ c, (Representation.baseChange (FractionRing O) (ρ c)).IsIrreducible)
    (hnoniso : Pairwise fun c d ↦
      IsEmpty ((Representation.baseChange (FractionRing O) (ρ c)).Equiv
        (Representation.baseChange (FractionRing O) (ρ d))))
    (hexh : ∀ (V : Type u) [AddCommGroup V] [Module (FractionRing O) V]
      [FiniteDimensional (FractionRing O) V] (σ : Representation (FractionRing O) G V),
      σ.IsIrreducible →
        ∃ c, Nonempty (σ.Equiv (Representation.baseChange (FractionRing O) (ρ c)))) :
    TauCeti.cartanMatrix P S hind hPnoniso hPexh hSnoniso hSexh =
      (Matrix.of fun c i =>
        (TauCeti.jordanHolderMultiplicity (MonoidAlgebra (IsLocalRing.ResidueField O) G)
          (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule (S i) :
            ℤ)).transpose *
      Matrix.of fun c i =>
        (TauCeti.jordanHolderMultiplicity (MonoidAlgebra (IsLocalRing.ResidueField O) G)
          (Representation.baseChange (IsLocalRing.ResidueField O) (ρ c)).asModule (S i) : ℤ) :=
  sorry

/-! ## Layer 4: blocks in the three coefficient rings -/

/-- **Blocks of `O[G]` and central characters.** Let `O` be a complete discrete valuation ring
whose fraction field `K` has characteristic zero and contains a primitive `e`-th root of unity,
`e` the exponent of `G`. Two irreducible representations `V` and `W` of `G` over `K` lie in one
block of `O[G]` (one block idempotent acts as the identity on both) exactly when their central
characters agree modulo the maximal ideal `m` on every class sum: for every `g` with conjugacy
class `C`, `|C| χ_V(g) / χ_V(1) - |C| χ_W(g) / χ_W(1)` lies in `m` (Webb, §12.2, pp. 231–232,
for blocks of `K[G]`-modules; Sambale, Definition 1.6, p. 15; Martínez, Definition 2.1, p. 9, and
Theorem 2.12, pp. 15–16). -/
theorem exists_blockIdempotent_iff_centralCharacter_congr {G O : Type u} [Group G] [Finite G]
    [CommRing O] [IsDomain O] [IsDiscreteValuationRing O]
    [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharZero O]
    {ζ : FractionRing O} (hζ : IsPrimitiveRoot ζ (Monoid.exponent G))
    {V W : Type u} [AddCommGroup V] [Module (FractionRing O) V]
    [FiniteDimensional (FractionRing O) V] [AddCommGroup W] [Module (FractionRing O) W]
    [FiniteDimensional (FractionRing O) W]
    (ρ : Representation (FractionRing O) G V) (σ : Representation (FractionRing O) G W)
    (hρ : ρ.IsIrreducible) (hσ : σ.IsIrreducible) :
    (∃ b : Subalgebra.center O (MonoidAlgebra O G), IsBlockIdempotent b ∧
        ρ.asAlgebraHom (MonoidAlgebra.mapRingHom G (algebraMap O (FractionRing O)) b) = 1 ∧
        σ.asAlgebraHom (MonoidAlgebra.mapRingHom G (algebraMap O (FractionRing O)) b) = 1) ↔
      ∀ g : G, ∃ m ∈ IsLocalRing.maximalIdeal O, algebraMap O (FractionRing O) m =
        (Nat.card (ConjClasses.mk g).carrier : FractionRing O) *
          (ρ.character g / ρ.character 1 - σ.character g / σ.character 1) :=
  sorry

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

/-- The **ordinary characters of a block**: for `b ∈ O[G]`, the characters of the irreducible
representations of `G` over the fraction field `K` of `O`, on coordinate spaces `Fin n → K`, on
which the image of `b` in `K[G]` acts as the identity. For a block idempotent `e_B` of `O[G]` over
a splitting `p`-modular system this is `Irr(B)` (Martínez, Definition 2.1, p. 9). -/
def blockCharacters {G O : Type*} [Group G] [CommRing O] [IsDomain O] (b : MonoidAlgebra O G) :
    Set (G → FractionRing O) :=
  {χ | ∃ (n : ℕ) (ρ : Representation (FractionRing O) G (Fin n → FractionRing O)),
    ρ.IsIrreducible ∧ ρ.character = χ ∧
      ρ.asAlgebraHom (MonoidAlgebra.mapRingHom G (algebraMap O (FractionRing O)) b) = 1}

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

/-- The **defect** of a central element `e` of `k[G]`: the exponent `d` with `|D| = p ^ d` for a
defect group `D` of `e`. For a block idempotent all defect groups are conjugate
(`isDefectGroup_conj`), so this is the defect of the block (Sambale, Proposition 1.5, p. 14). -/
noncomputable def blockDefect {G : Type*} [Group G] [Finite G] {k : Type*} [Field k] (p : ℕ)
    (e : Subalgebra.center k (MonoidAlgebra k G)) : ℕ :=
  sSup {d | ∃ D : Subgroup G, IsDefectGroup p e D ∧ Nat.card D = p ^ d}

/-- Every defect group of a block has order `p ^ blockDefect p e`. -/
theorem card_eq_pow_blockDefect {G : Type*} [Group G] [Finite G] {k : Type*} [Field k]
    {p : ℕ} [Fact p.Prime] [CharP k p] (e : Subalgebra.center k (MonoidAlgebra k G))
    (he : IsBlockIdempotent e) {D : Subgroup G} (hD : IsDefectGroup p e D) :
    Nat.card D = p ^ blockDefect p e := sorry

/-- The **Brauer correspondent** of `e ∈ k[G]` at a subgroup `D`: the Brauer projection
`Br_D(e)`, read in `k[N_G(D)]` through `C_G(D) ≤ N_G(D)`. For a block with defect group `D` it is
a block idempotent of `k[N_G(D)]` with defect group `D` (`brauer_first_main`). -/
noncomputable def brauerCorrespondent {G : Type*} [Group G] [Finite G] {k : Type*} [Field k]
    (D : Subgroup G) (e : MonoidAlgebra k G) :
    MonoidAlgebra k (Subgroup.normalizer (D : Set G)) :=
  MonoidAlgebra.mapDomain (Subgroup.inclusion (Subgroup.centralizer_le_normalizer (D : Set G)))
    (brauerProjection D e)

/-! ## Layer 7: Brauer's main theorems -/

/-- **Brauer's first main theorem.** For a `p`-subgroup `D` with normalizer `N`, the Brauer
correspondent `B ↦ Br_D(e_B)` is a bijection from the blocks of `k[G]` with defect group `D` onto
the blocks of `k[N]` with defect group `D` (Webb, Theorem 12.6.4, p. 250; Martínez,
Theorem 4.10, p. 27, and Corollary 4.6, p. 26). -/
theorem brauer_first_main {G : Type*} [Group G] [Finite G] {k : Type*} [Field k] [IsAlgClosed k]
    {p : ℕ} [Fact p.Prime] [CharP k p] (D : Subgroup G) (hD : IsPGroup p D) :
    ∃ f : {B : Subalgebra.center k (MonoidAlgebra k G) //
          IsBlockIdempotent B ∧ IsDefectGroup p B D} ≃
        {b : Subalgebra.center k (MonoidAlgebra k (Subgroup.normalizer (D : Set G))) //
          IsBlockIdempotent b ∧ IsDefectGroup p b (D.subgroupOf (Subgroup.normalizer (D : Set G)))},
      ∀ B, ((f B).1 : MonoidAlgebra k (Subgroup.normalizer (D : Set G))) =
        brauerCorrespondent D (B.1 : MonoidAlgebra k G) := sorry

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

/-- **The kernel of the principal block is the `p'`-core.** Let `M` be a maximal ideal of the
algebraic integers with `p ∈ M`. An element `g` lies in `O_{p'}(G)` exactly when `χ(g) = χ(1)`
for every irreducible complex character `χ` in the block of the trivial character; that is,
`⋂_{χ ∈ Irr(B₀(G))} ker χ = O_{p'}(G)` (Navarro, Theorem 6.10). -/
theorem mem_pPrimeCore_iff_forall_principalBlock {G : Type*} [Group G] [Finite G] {p : ℕ}
    [Fact p.Prime] (M : Ideal (integralClosure ℤ ℂ)) [M.IsMaximal]
    (hpM : (p : integralClosure ℤ ℂ) ∈ M) (g : G) :
    g ∈ pPrimeCore p (⊤ : Subgroup G) ↔
      ∀ χ ∈ TauCeti.irreducibleCharacters ℂ G, SameBlock M χ (fun _ ↦ 1) → χ g = χ 1 := sorry

end TauCetiRoadmap.ModularCharactersAndBlocks
