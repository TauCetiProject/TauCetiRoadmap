import Mathlib
import TauCeti.RepresentationTheory.GrothendieckGroup.SimpleBasis
import TauCeti.RepresentationTheory.Induction.FiniteDimensional.Projection
import TauCeti.RepresentationTheory.Induction.Permutation
import TauCeti.RepresentationTheory.CharacterTable.Determined
import TauCeti.RepresentationTheory.BaseChange
import TauCeti.LinearAlgebra.Eigenspace.JointEigenvector.Kolchin

/-!
# Induction theorems in Grothendieck groups of modular representations: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

`G₀(k[G])` is Tau Ceti's `TauCeti.ExactK0` of `TauCeti.finiteModulesExactStructure` for the
group algebra. Layers as in `README.md`: 0 `modRepK0 k G` and its dictionary with `FDRep k G`;
1 ring structure, restriction, induction, permutation classes; 2 elements of `ℓ`-power order;
3 the lattice defect of a `G`-module; 4 Artin's identity and the modular Artin theorem, exported
as `modularArtin_exists_nsmul_mem_indCyclicCoprime`.
-/

namespace TauCetiRoadmap.RepresentationTheory.ModularInduction

open CategoryTheory MonoidalCategory

universe u

/-! ## Layer 0: the Grothendieck group of a group algebra -/

/-- **The group algebra of a finite group is Artinian**, being finite-dimensional; this is the
hypothesis of `TauCeti.simpleClassBasis`. -/
instance isArtinianRing_monoidAlgebra (k G : Type u) [Field k] [Group G] [Finite G] :
    IsArtinianRing (MonoidAlgebra k G) :=
  IsArtinianRing.of_finite k (MonoidAlgebra k G)

/-- **The dictionary**: finite-dimensional representations of a finite group are the finitely
generated modules over its group algebra, `V ↦ V.ρ.asModule`; the restriction of Mathlib's
`Rep.equivalenceModuleMonoidAlgebra` to finite objects. -/
noncomputable def fdRepEquivalence (k G : Type u) [Field k] [Group G] [Finite G] :
    FDRep k G ≌ FGModuleCat.{u} (MonoidAlgebra k G) :=
  sorry

/-- **`G₀(k[G])`**: the exact Grothendieck group of the finitely generated (equivalently,
finite-length) `k[G]`-modules, with `[M₂] = [M₁] + [M₃]` for every short exact sequence. -/
def modRepK0 (k G : Type u) [Field k] [Group G] [Finite G] : Type u :=
  TauCeti.ExactK0.{u} (TauCeti.finiteModulesExactStructure (MonoidAlgebra k G))

noncomputable instance (k G : Type u) [Field k] [Group G] [Finite G] :
    AddCommGroup (modRepK0 k G) :=
  inferInstanceAs
    (AddCommGroup (TauCeti.ExactK0.{u} (TauCeti.finiteModulesExactStructure (MonoidAlgebra k G))))

namespace modRepK0

variable {k G : Type u} [Field k] [Group G] [Finite G]

/-- **The class `[V]`** of a finite-dimensional representation. -/
noncomputable def of (V : FDRep k G) : modRepK0 k G :=
  TauCeti.ExactK0.of (E := TauCeti.finiteModulesExactStructure (MonoidAlgebra k G))
    ((fdRepEquivalence k G).functor.obj V)

/-- **The defining relation**, for short exact sequences in the abelian category `FDRep k G`. -/
theorem of_shortExact {S : ShortComplex (FDRep k G)} (hS : S.ShortExact) :
    of S.X₂ = of S.X₁ + of S.X₃ := sorry

/-- The classes of simple representations generate `G₀(k[G])`. -/
theorem closure_of_simple :
    AddSubgroup.closure {x : modRepK0 k G | ∃ V : FDRep k G, Simple V ∧ x = of V} = ⊤ := sorry

/-- **The universal property**: an isomorphism-invariant function on representations, additive on
short exact sequences, factors through `G₀(k[G])`. -/
noncomputable def lift {A : Type*} [AddCommGroup A] (f : FDRep k G → A)
    (hiso : ∀ {V W : FDRep k G}, (V ≅ W) → f V = f W)
    (hses : ∀ {S : ShortComplex (FDRep k G)}, S.ShortExact → f S.X₂ = f S.X₁ + f S.X₃) :
    modRepK0 k G →+ A :=
  sorry

theorem lift_of {A : Type*} [AddCommGroup A] (f : FDRep k G → A)
    (hiso : ∀ {V W : FDRep k G}, (V ≅ W) → f V = f W)
    (hses : ∀ {S : ShortComplex (FDRep k G)}, S.ShortExact → f S.X₂ = f S.X₁ + f S.X₃)
    (V : FDRep k G) : lift f hiso hses (of V) = f V := sorry

/-- **The dimension homomorphism** `[V] ↦ dim_k V`. -/
noncomputable def finrank : modRepK0 k G →+ ℤ := sorry

theorem finrank_of (V : FDRep k G) : finrank (of V) = Module.finrank k V := sorry

/-- **The Jordan–Hölder coordinate** at `S`, Tau Ceti's `TauCeti.jordanHolderCoordinate` through
the dictionary: on `[V]`, the multiplicity of `S` as a composition factor of `V`. -/
noncomputable def multiplicity (S : FDRep k G) : modRepK0 k G →+ ℤ :=
  TauCeti.jordanHolderCoordinate (MonoidAlgebra k G) ((fdRepEquivalence k G).functor.obj S)

/-! ## Layer 1: the ring structure, restriction, induction, and permutation classes -/

/-- **Multiplication**, from the tensor product over `k` with the diagonal action. -/
noncomputable def mulHom : modRepK0 k G →+ modRepK0 k G →+ modRepK0 k G := sorry

noncomputable instance : Mul (modRepK0 k G) := ⟨fun x y ↦ mulHom x y⟩

noncomputable instance : One (modRepK0 k G) := ⟨of (𝟙_ (FDRep k G))⟩

/-- **`G₀(k[G])` is a commutative ring** on the additive group of `TauCeti.ExactK0`. -/
noncomputable instance : CommRing (modRepK0 k G) where
  __ := (inferInstance : AddCommGroup (modRepK0 k G))
  left_distrib := sorry
  right_distrib := sorry
  zero_mul := sorry
  mul_zero := sorry
  mul_assoc := sorry
  one_mul := sorry
  mul_one := sorry
  mul_comm := sorry

theorem of_tensor (V W : FDRep k G) : of (V ⊗ W) = of V * of W := sorry

/-- **Restriction along a group homomorphism**, inflation included. -/
noncomputable def res {H : Type u} [Group H] [Finite H] (φ : H →* G) :
    modRepK0 k G →+* modRepK0 k H := sorry

theorem res_of {H : Type u} [Group H] [Finite H] (φ : H →* G) (V : FDRep k G) :
    res φ (of V) = of ((Action.res (FGModuleCat k) φ).obj V) := sorry

/-- **Induction from a subgroup**, well defined because induction is exact. -/
noncomputable def ind (S : Subgroup G) : modRepK0 k S →+ modRepK0 k G := sorry

theorem ind_of (S : Subgroup G) (A : FDRep k S) : ind S (of A) = of (TauCeti.indFDRep A) := sorry

/-- **The projection formula**, the class form of `TauCeti.indFDRepProjection`. -/
theorem ind_mul_res (S : Subgroup G) (y : modRepK0 k S) (x : modRepK0 k G) :
    ind S (y * res S.subtype x) = ind S y * x := sorry

variable (k G) in
/-- **The class of the permutation module** `k[X]` of a finite `G`-set. -/
noncomputable def perm (X : Type u) [MulAction G X] [Finite X] : modRepK0 k G :=
  of (FDRep.of (Representation.ofMulAction k G X))

/-- Inducing the trivial class gives the coset permutation class (`TauCeti.indTrivialIso`). -/
theorem ind_one (S : Subgroup G) : ind S (1 : modRepK0 k S) = perm k G (G ⧸ S) := sorry

/-- **Induction of a coset permutation module**: `Ind_C^G k[C/D] = k[G/D]` for `D ≤ C`. -/
theorem ind_perm_quotient {D C : Subgroup G} (h : D ≤ C) :
    ind C (perm k C (C ⧸ D.subgroupOf C)) = perm k G (G ⧸ D) := sorry

variable (k G) in
/-- **The classes induced from a family `P` of subgroups**, the `G₀` counterpart of
`TauCeti.ClassFunction.indVirtualCharacters`. -/
noncomputable def indClasses (P : Subgroup G → Prop) : AddSubgroup (modRepK0 k G) :=
  ⨆ (C : Subgroup G) (_ : P C), (ind (k := k) C).range

variable (k G) in
noncomputable abbrev indCyclic : AddSubgroup (modRepK0 k G) :=
  indClasses k G fun C ↦ IsCyclic C

variable (k G) in
noncomputable abbrev indCyclicCoprime (ℓ : ℕ) : AddSubgroup (modRepK0 k G) :=
  indClasses k G fun C ↦ IsCyclic C ∧ ¬ ℓ ∣ Nat.card C

end modRepK0

/-! ## Layer 2: elements of `ℓ`-power order -/

section Layer2

variable {k : Type u} [Field k] (ℓ : ℕ) [Fact ℓ.Prime] [CharP k ℓ]

/-- **A fixed vector** when every element acts with `ℓ`-power order in characteristic `ℓ`, by
Kolchin's theorem (`Representation.exists_common_fixed_vector_of_isUnipotent`). -/
theorem exists_fixed_vector_of_pow_eq_one {H : Type*} [Monoid H] {V : Type*} [AddCommGroup V]
    [Module k V] [FiniteDimensional k V] [Nontrivial V] (ρ : Representation k H V)
    (hρ : ∀ g : H, ∃ n : ℕ, ρ g ^ ℓ ^ n = 1) : ∃ v : V, v ≠ 0 ∧ ∀ g : H, ρ g v = v := sorry

variable {G : Type u} [Group G] [Finite G]

/-- **The `ℓ′`-part of a cyclic subgroup**: for a generator `g` of `C`, the subgroup generated by
`g ^ |C|_ℓ` has order prime to `ℓ` and index `|C|_ℓ` in `C`, and contains an `ℓ`-power of every
element of `C`. -/
theorem exists_coprimePart_of_isCyclic {C : Subgroup G} [IsCyclic C] :
    ∃ D : Subgroup G, D ≤ C ∧ (D.subgroupOf C).Normal ∧ ¬ ℓ ∣ Nat.card D ∧
      (∀ c ∈ C, ∃ n : ℕ, c ^ ℓ ^ n ∈ D) ∧ D.relIndex C = ℓ ^ (Nat.card C).factorization ℓ :=
  sorry

namespace modRepK0

/-- **Trivial composition factors**: if every element acts with `ℓ`-power order,
`[V] = dim V · [k]`. -/
theorem of_eq_finrank_nsmul_one {H : Type u} [Group H] [Finite H] (V : FDRep k H)
    (hV : ∀ g : H, ∃ n : ℕ, V.ρ (g ^ ℓ ^ n) = 1) :
    of V = Module.finrank k V • (1 : modRepK0 k H) := sorry

/-- **`G₀` of an `ℓ`-group is `ℤ · [k]`**. -/
theorem eq_finrank_nsmul_one_of_isPGroup {H : Type u} [Group H] [Finite H] (hH : IsPGroup ℓ H)
    (x : modRepK0 k H) : x = finrank x • (1 : modRepK0 k H) := sorry

/-- **Coset permutation classes along a quotient of `ℓ`-power exponent**:
`[k[G/D]] = [C : D] · [k[G/C]]`. -/
theorem relIndex_nsmul_ind_one {D C : Subgroup G} (hDC : D ≤ C) (hD : (D.subgroupOf C).Normal)
    (hC : ∀ c ∈ C, ∃ n : ℕ, c ^ ℓ ^ n ∈ D) :
    D.relIndex C • ind C (1 : modRepK0 k C) = ind D (1 : modRepK0 k D) := sorry

end modRepK0

end Layer2

/-! ## Layer 3: reduction of `G`-modules modulo `ℓ`

A `G`-module is `[AddCommGroup V] [DistribMulAction G V]`, with its canonical `ℤ`-module
structure. -/

section Layer3

variable (k G : Type u) [Field k] [Group G] [Finite G]

/-- **The `G`-action on the `n`-torsion** `V[n]` (Mathlib's `AddSubgroup.torsionBy V n`). -/
@[instance_reducible]
def torsionByDistribMulAction (V : Type u) [AddCommGroup V] [DistribMulAction G V] (n : ℕ) :
    DistribMulAction G (AddSubgroup.torsionBy V n) where
  smul g x := ⟨g • (x : V), by
    have hx := x.2
    rw [AddSubgroup.torsionBy.nsmul_iff] at hx ⊢
    rw [← smul_comm, hx, smul_zero]⟩
  one_smul _ := sorry
  mul_smul _ _ _ := sorry
  smul_zero _ := sorry
  smul_add _ _ _ := sorry

/-- **The reduction** `k ⊗_ℤ V` of a `G`-module (Tau Ceti's `Representation.baseChange`); in
characteristic `ℓ` it is `k ⊗_{𝔽_ℓ} (V/ℓV)`. -/
noncomputable def reduction (V : Type u) [AddCommGroup V] [DistribMulAction G V]
    [Module.Finite k (TensorProduct ℤ k V)] : FDRep k G :=
  FDRep.of (Representation.baseChange k (Representation.ofDistribMulAction ℤ G V))

variable (ℓ : ℕ) [CharP k ℓ]

/-- In characteristic `ℓ`, finiteness of `V/ℓV` (Mathlib's `ModN V ℓ`) makes `k ⊗_ℤ V`
finite-dimensional. -/
theorem finite_baseChange_of_finite_modN (V : Type u) [AddCommGroup V] [Finite (ModN V ℓ)] :
    Module.Finite k (TensorProduct ℤ k V) := sorry

/-- **The lattice defect** `[k ⊗_ℤ V] - [k ⊗_ℤ V[ℓ]]`; for `k = ZMod ℓ` it is `[V/ℓV] - [V[ℓ]]`,
the invariant of NSW (7.3.3). -/
noncomputable def latticeDefect (V : Type u) [AddCommGroup V] [DistribMulAction G V]
    [Finite (ModN V ℓ)] [Finite (AddSubgroup.torsionBy V ℓ)] : modRepK0 k G :=
  haveI := finite_baseChange_of_finite_modN k ℓ V
  letI := torsionByDistribMulAction G V ℓ
  modRepK0.of (reduction k G V) - modRepK0.of (reduction k G (AddSubgroup.torsionBy V ℓ))

variable [Fact ℓ.Prime]

/-- **Additivity**: the snake lemma for multiplication by `ℓ` (NSW (7.3.3)). -/
theorem latticeDefect_add_of_exact {A B C : Type u} [AddCommGroup A] [DistribMulAction G A]
    [AddCommGroup B] [DistribMulAction G B] [AddCommGroup C] [DistribMulAction G C]
    (f : A →+[G] B) (g : B →+[G] C) (hf : Function.Injective f) (hfg : Function.Exact f g)
    (hg : Function.Surjective g) [Finite (ModN A ℓ)] [Finite (AddSubgroup.torsionBy A ℓ)]
    [Finite (ModN B ℓ)] [Finite (AddSubgroup.torsionBy B ℓ)] [Finite (ModN C ℓ)]
    [Finite (AddSubgroup.torsionBy C ℓ)] :
    latticeDefect k G ℓ B = latticeDefect k G ℓ A + latticeDefect k G ℓ C := sorry

/-- **A finite `G`-module has defect zero** (NSW (7.3.3)(i)); the last two instance arguments
follow from `Finite V` and are those of `latticeDefect`. -/
theorem latticeDefect_eq_zero_of_finite (V : Type u) [AddCommGroup V] [DistribMulAction G V]
    [Finite V] [Finite (ModN V ℓ)] [Finite (AddSubgroup.torsionBy V ℓ)] :
    latticeDefect k G ℓ V = 0 := sorry

/-- **Lattices with isomorphic rationalizations have the same reduction class**, in every
characteristic: the integral `ℤ[G]` analogue of Milne ADT I Lemma 2.12 (stated there for finitely
generated `ℤ_p[H]`-modules with isomorphic `ℚ_p`-rationalizations), proved by the same snake-lemma
argument: in characteristic `ℓ`, clear denominators and apply NSW (7.3.3)(ii). -/
theorem of_reduction_eq_of_nonempty_equiv (V W : Type u) [AddCommGroup V] [DistribMulAction G V]
    [Module.Free ℤ V] [Module.Finite ℤ V] [AddCommGroup W] [DistribMulAction G W]
    [Module.Free ℤ W] [Module.Finite ℤ W]
    (h : Nonempty ((Representation.baseChange ℚ (Representation.ofDistribMulAction ℤ G V)).Equiv
      (Representation.baseChange ℚ (Representation.ofDistribMulAction ℤ G W)))) :
    modRepK0.of (reduction k G V) = modRepK0.of (reduction k G W) := sorry

end Layer3

/-! ## Layer 4: Artin's identity and the modular Artin theorem -/

section Layer4

variable {G : Type u} [Group G] [Finite G]

/-- **The Artin coefficient** `m_C = ∑_{D cyclic, C ≤ D} μ([D : C])`, zero unless `C` is cyclic:
the Möbius coefficients inside
`TauCeti.ClassFunction.natCard_nsmul_one_mem_indVirtualCharacters_isCyclic`. -/
noncomputable def artinCoeff (C : Subgroup G) : ℤ :=
  ∑ᶠ (D : Subgroup G) (_ : IsCyclic D ∧ C ≤ D), ArithmeticFunction.moebius (C.relIndex D)

/-- **Artin's identity for fixed points**: `|G| = ∑_C m_C · |C| · #(G/C)^g`. -/
theorem sum_artinCoeff_mul_card_fixedBy (g : G) :
    ∑ᶠ C : Subgroup G, artinCoeff C * Nat.card C * Nat.card (MulAction.fixedBy (G ⧸ C) g) =
      (Nat.card G : ℤ) := sorry

/-- **Rational permutation representations are determined by fixed-point counts**. -/
theorem nonempty_equiv_ofMulAction_rat (X Y : Type u) [MulAction G X] [MulAction G Y] [Finite X]
    [Finite Y] (h : ∀ g : G, Nat.card (MulAction.fixedBy X g) = Nat.card (MulAction.fixedBy Y g)) :
    Nonempty ((Representation.ofMulAction ℚ G X).Equiv (Representation.ofMulAction ℚ G Y)) :=
  Representation.nonempty_equiv_of_character_eq _ _ <| funext fun g ↦ by
    rw [TauCeti.char_ofMulAction, TauCeti.char_ofMulAction]
    exact congrArg Nat.cast (h g)

variable (k : Type u) [Field k]

/-- **Permutation modules with the same fixed-point counts have the same class**, in every
characteristic: in characteristic `ℓ` through the permutation lattices and Layer 3. -/
theorem modRepK0.perm_eq_of_card_fixedBy_eq (X Y : Type u) [MulAction G X] [MulAction G Y]
    [Finite X] [Finite Y]
    (h : ∀ g : G, Nat.card (MulAction.fixedBy X g) = Nat.card (MulAction.fixedBy Y g)) :
    modRepK0.perm k G X = modRepK0.perm k G Y := sorry

/-- **Artin's identity in `G₀(k[G])`**, in every characteristic. -/
theorem modRepK0.natCard_nsmul_one_eq_sum_artinCoeff :
    Nat.card G • (1 : modRepK0 k G) =
      ∑ᶠ C : Subgroup G, (artinCoeff C * Nat.card C) • modRepK0.ind C (1 : modRepK0 k C) := sorry

/-- **Artin's theorem in `G₀`**: `|G| · x` is induced from cyclic subgroups. -/
theorem modularArtin_natCard_nsmul_mem_indCyclic (x : modRepK0 k G) :
    Nat.card G • x ∈ modRepK0.indCyclic k G := sorry

variable (ℓ : ℕ) [Fact ℓ.Prime] [CharP k ℓ]

/-- **The modular Artin theorem**: `|G| · x` is induced from cyclic subgroups of order prime to
`ℓ`. Multiply Artin's identity by `x`. At a cyclic `C` with `ℓ′`-part `D` and `r = [C : D]`,
`relIndex_nsmul_ind_one` and the projection formula give
`r • ind C (res C.subtype x) = ind D (res D.subtype x)`, and `r` divides `|C|` since `D ≤ C`. The
index is absorbed by the factor `|C|` of the Artin coefficient:
`(m_C · |C|) • ind C (res C.subtype x) = (m_C · (|C| / r)) • ind D (res D.subtype x)`. -/
theorem modularArtin_natCard_nsmul_mem_indCyclicCoprime (x : modRepK0 k G) :
    Nat.card G • x ∈ modRepK0.indCyclicCoprime k G ℓ := by
  classical
  have hx : Nat.card G • x = (Nat.card G • (1 : modRepK0 k G)) * x := by
    rw [smul_mul_assoc, one_mul]
  rw [hx, modRepK0.natCard_nsmul_one_eq_sum_artinCoeff k]
  refine finsum_induction (fun y ↦ y * x ∈ modRepK0.indCyclicCoprime k G ℓ) ?_ ?_ fun C ↦ ?_
  · show (0 : modRepK0 k G) * x ∈ _
    rw [zero_mul]
    exact zero_mem _
  · intro a b ha hb
    show (a + b) * x ∈ _
    rw [add_mul]
    exact add_mem ha hb
  -- the summand at `C` is `(m_C · |C|) • ind C (res C.subtype x)`
  show ((artinCoeff C * Nat.card C) • modRepK0.ind C 1) * x ∈ _
  rw [smul_mul_assoc, ← modRepK0.ind_mul_res, one_mul]
  by_cases hC : IsCyclic C
  · obtain ⟨D, hDC, hDn, hDℓ, hpow, -⟩ := exists_coprimePart_of_isCyclic ℓ (C := C)
    have key : D.relIndex C • modRepK0.ind C (modRepK0.res C.subtype x) =
        modRepK0.ind D (modRepK0.res D.subtype x) := by
      rw [← one_mul (modRepK0.res C.subtype x), ← one_mul (modRepK0.res D.subtype x),
        modRepK0.ind_mul_res, modRepK0.ind_mul_res, ← smul_mul_assoc,
        modRepK0.relIndex_nsmul_ind_one (k := k) ℓ hDC hDn hpow]
    obtain ⟨q, hq⟩ := Subgroup.relIndex_dvd_card D C
    have hcoeff : artinCoeff C * (Nat.card C : ℤ) = artinCoeff C * q * (D.relIndex C : ℤ) := by
      rw [hq]
      push_cast
      ring
    have hmem : modRepK0.ind D (modRepK0.res D.subtype x) ∈ modRepK0.indCyclicCoprime k G ℓ :=
      AddSubgroup.mem_iSup_of_mem D <| AddSubgroup.mem_iSup_of_mem
        (⟨Subgroup.isCyclic_of_le hDC, hDℓ⟩ : IsCyclic D ∧ ¬ ℓ ∣ Nat.card D)
        (AddMonoidHom.mem_range.mpr ⟨_, rfl⟩)
    rw [hcoeff, mul_zsmul, natCast_zsmul, key]
    exact zsmul_mem hmem _
  · -- `m_C = 0`: a subgroup of a cyclic group is cyclic
    have hm : artinCoeff C = 0 := finsum_eq_zero_of_forall_eq_zero fun D ↦ by
      rw [finsum_eq_if, ite_eq_right]
      rintro ⟨hD, hle⟩
      exact hC (Subgroup.isCyclic_of_le hle)
    rw [hm, zero_mul, zero_smul]
    exact zero_mem _

/-- **The modular Artin induction theorem** (NSW (7.3.4), Milne ADT I Lemma 2.10), the export
consumed by ClassFieldTheory's local Euler characteristic, with `N = |G|` from
`modularArtin_natCard_nsmul_mem_indCyclicCoprime`. -/
theorem modularArtin_exists_nsmul_mem_indCyclicCoprime (x : modRepK0 k G) :
    ∃ N : ℕ, 0 < N ∧ N • x ∈ modRepK0.indCyclicCoprime k G ℓ :=
  ⟨Nat.card G, Nat.card_pos, modularArtin_natCard_nsmul_mem_indCyclicCoprime k ℓ x⟩

end Layer4

end TauCetiRoadmap.RepresentationTheory.ModularInduction
