module

public import Mathlib
public import TauCeti.ModelTheory.Algebra.Group.Basic
public import TauCeti.ModelTheory.BackAndForth.Karp
public import TauCeti.ModelTheory.BackAndForth.PotentialIso

/-!
# Saturation, quantifier elimination and decidable theories: suggested signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification.

The file pins the carriers of Layers 0–3: saturated structures `IsSaturated`, back-and-forth
families `IsBackAndForth`, quantifier elimination and model completeness, and the language
`orderedGroup` of ordered abelian groups in multiplicative notation with its Presburger expansion
`zGroupLang`. Quantifier elimination is stated with local copies of `IsQFEquivalent` and
`HasQuantifierElimination` shaped as in mathlib4#41113; when that series lands they are replaced
by Mathlib's `FirstOrder.Language.Theory.IsQFEquivalent` and
`FirstOrder.Language.Theory.HasQuantifierElimination`.

Layer 4 (effective codings of formulas and decidability) is stated in `README.md` only: the pinned
Mathlib has no `Primcodable` instance for formulas and no proof calculus, and the calculus is
SequentCalculusAndCutElimination's, which is not on main.

Suggested homes: `TauCeti/ModelTheory/Saturation.lean`, `TauCeti/ModelTheory/BackAndForth/Family.lean`,
`TauCeti/ModelTheory/ModelComplete.lean` and `TauCeti/ModelTheory/Algebra/OrderedGroup/`.
-/

@[expose] public section

universe u v w w'

open Cardinal

namespace TauCetiRoadmap.SaturationAndQuantifierElimination

open FirstOrder FirstOrder.Language

/-! ## Layer 0: saturated structures -/

section Layer0

variable {L : FirstOrder.Language.{u, v}}

/-- **0.1** A structure `M` is `κ`-saturated when every complete `1`-type over a set `A` of fewer
than `κ` parameters is realized in `M`. A type over `A` is a complete type of the complete
`L[[A]]`-theory of `M`, with the constants of `A` named by themselves. -/
def IsSaturated (κ : Cardinal.{w}) (M : Type w) [L.Structure M] [Nonempty M] : Prop :=
  ∀ A : Set M, #A < κ → ∀ p : (L[[A]].completeTheory M).CompleteType (Fin 1),
    ∃ v : Fin 1 → M, (L[[A]].completeTheory M).typeOf v = p

variable {M : Type w} [L.Structure M] [Nonempty M]

theorem IsSaturated.mono {κ κ' : Cardinal.{w}} (h : κ' ≤ κ) (hM : IsSaturated (L := L) κ M) :
    IsSaturated (L := L) κ' M :=
  sorry

/-- **0.1** A `κ`-saturated structure realizes every complete `n`-type over fewer than `κ`
parameters, for every finite `n`. -/
theorem IsSaturated.exists_typeOf_eq {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ)
    (hM : IsSaturated (L := L) κ M) (A : Set M) (hA : #A < κ) (n : ℕ)
    (p : (L[[A]].completeTheory M).CompleteType (Fin n)) :
    ∃ v : Fin n → M, (L[[A]].completeTheory M).typeOf v = p :=
  sorry

/-- **0.2** Universality: a structure elementarily equivalent to a `κ`-saturated `M`, of
cardinality at most `κ`, embeds elementarily into `M`. -/
theorem IsSaturated.exists_elementaryEmbedding {κ : Cardinal.{w}} (hκ : ℵ₀ ≤ κ)
    (hM : IsSaturated (L := L) κ M) {N : Type w'} [L.Structure N] [Nonempty N]
    (hNM : N ≅[L] M) (hN : Cardinal.lift.{w} #N ≤ Cardinal.lift.{w'} κ) :
    Nonempty (N ↪ₑ[L] M) :=
  sorry

/-- **0.3** Every structure has a `κ`-saturated elementary extension. -/
theorem exists_elementaryEmbedding_isSaturated (M : Type w) [L.Structure M] [Nonempty M]
    (κ : Cardinal.{max u v w}) :
    ∃ (N : Type (max u v w)) (_ : L.Structure N) (_ : Nonempty N),
      IsSaturated (L := L) κ N ∧ Nonempty (M ↪ₑ[L] N) :=
  sorry

/-- **0.4** Keisler: over a countable language, an ultraproduct along an ultrafilter that is not
countably complete is `ℵ₁`-saturated. -/
theorem isSaturated_aleph_one_product [Countable L.Symbols] {ι : Type w} (U : Ultrafilter ι)
    (hU : ¬ CountableInterFilter (U : Filter ι)) (M : ι → Type w) [∀ i, L.Structure (M i)]
    [∀ i, Nonempty (M i)] :
    IsSaturated (L := L) (aleph 1) ((U : Filter ι).Product M) :=
  sorry

/-- **0.5** Elementarily equivalent saturated structures of the same infinite cardinality are
isomorphic. -/
theorem IsSaturated.nonempty_equiv [Infinite M] {N : Type w} [L.Structure N] [Nonempty N]
    (hM : IsSaturated (L := L) #M M) (hN : IsSaturated (L := L) #N N) (hcard : #M = #N)
    (h : M ≅[L] N) : Nonempty (M ≃[L] N) :=
  sorry

end Layer0

/-! ## Layer 1: back-and-forth families -/

section Layer1

variable {L : FirstOrder.Language.{u, v}} {M : Type w} [L.Structure M] {N : Type w'} [L.Structure N]

/-- **1.1** A back-and-forth family: a nonempty set of partial isomorphisms from `M` to `N` in which
every member extends, inside the family, to any prescribed element of `M` (forth) and of `N`
(back). The domains carry no size condition. -/
structure IsBackAndForth (F : Set (M ≃ₚ[L] N)) : Prop where
  nonempty : F.Nonempty
  forth : ∀ f ∈ F, ∀ m : M, ∃ g ∈ F, f ≤ g ∧ m ∈ g.dom
  back : ∀ f ∈ F, ∀ n : N, ∃ g ∈ F, f ≤ g ∧ n ∈ g.cod

/-- **1.2** Every member of a back-and-forth family is partial elementary. -/
theorem IsBackAndForth.realize_iff {F : Set (M ≃ₚ[L] N)} (hF : IsBackAndForth F) {f : M ≃ₚ[L] N}
    (hf : f ∈ F) {α : Type*} (φ : L.Formula α) (v : α → f.dom) :
    φ.Realize (fun i => (v i : M)) ↔ φ.Realize (fun i => (f.toEquiv (v i) : N)) :=
  sorry

/-- **1.2** Structures linked by a back-and-forth family are elementarily equivalent. -/
theorem IsBackAndForth.elementarilyEquivalent {F : Set (M ≃ₚ[L] N)} (hF : IsBackAndForth F) :
    M ≅[L] N :=
  sorry

/-- **1.2** A member of a back-and-forth family defined on all of `M` is an elementary embedding. -/
theorem IsBackAndForth.realize_toEmbeddingOfEqTop {F : Set (M ≃ₚ[L] N)} (hF : IsBackAndForth F)
    {f : M ≃ₚ[L] N} (hf : f ∈ F) (htop : f.dom = ⊤) {α : Type*} (φ : L.Formula α) (v : α → M) :
    φ.Realize (f.toEmbeddingOfEqTop htop ∘ v) ↔ φ.Realize v :=
  sorry

/-- **1.3** Comparison with Tau Ceti's potential isomorphisms: the finitely generated restrictions
of a back-and-forth family form a potential isomorphism. -/
theorem IsBackAndForth.potentialIso {F : Set (M ≃ₚ[L] N)} (hF : IsBackAndForth F) :
    TauCeti.PotentialIso (L := L) M N :=
  sorry

end Layer1

/-! ## Layer 2: quantifier elimination and model completeness -/

section Layer2

variable {L : FirstOrder.Language.{u, v}}

/-- **2.1** A formula is equivalent over `T` to a quantifier-free formula. Local copy of the
declaration of mathlib4#41113. -/
def IsQFEquivalent (T : L.Theory) {α : Type*} (φ : L.Formula α) : Prop :=
  ∃ ψ : L.Formula α, ψ.IsQF ∧ φ ⇔[T] ψ

/-- **2.1** Quantifier elimination. Local copy of the declaration of mathlib4#41113. -/
def HasQuantifierElimination (T : L.Theory) : Prop :=
  ∀ {α : Type} (φ : L.Formula α), IsQFEquivalent T φ

/-- **2.2** Elimination of one existential quantifier from quantifier-free formulas suffices
(mathlib4#41115; Tent–Ziegler Lem. 3.2.4). -/
theorem hasQuantifierElimination_iff_ex_isQFEquivalent_of_isQF {T : L.Theory} :
    HasQuantifierElimination T ↔
      ∀ {α : Type} [Finite α] (θ : L.BoundedFormula α 1), θ.IsQF → IsQFEquivalent T θ.ex :=
  sorry

/-- **2.3** The saturated extension test: `T` eliminates quantifiers if, for all models `M`, `N`
with `N` `ℵ₀`-saturated, every embedding into `N` of a finitely generated substructure `A` of `M`
extends to the substructure generated by `A` and any one further element of `M`. -/
theorem hasQuantifierElimination_of_isSaturated_extend {T : L.Theory}
    (h : ∀ (M N : Type (max u v)) [L.Structure M] [L.Structure N] [M ⊨ T] [N ⊨ T]
      [Nonempty M] [Nonempty N], IsSaturated (L := L) ℵ₀ N →
      ∀ (A : L.Substructure M), A.FG → ∀ (f : A ↪[L] N) (m : M),
        ∃ g : (A ⊔ Substructure.closure L {m} : L.Substructure M) ↪[L] N,
          ∀ a : A, g ⟨a, le_sup_left (α := L.Substructure M) a.2⟩ = f a) :
    HasQuantifierElimination T :=
  sorry

/-- **2.4** Quantifier elimination and a common substructure of any two models give completeness
(Tent–Ziegler Lem. 3.2.2). -/
theorem HasQuantifierElimination.isComplete {T : L.Theory} (hT : HasQuantifierElimination T)
    (hsat : T.IsSatisfiable)
    (hcommon : ∀ (M N : Type (max u v)) [L.Structure M] [L.Structure N] [M ⊨ T] [N ⊨ T],
      ∃ (A : Type (max u v)) (_ : L.Structure A), Nonempty (A ↪[L] M) ∧ Nonempty (A ↪[L] N)) :
    T.IsComplete :=
  sorry

/-- **2.5** A theory is model complete when every embedding between two of its models is
elementary. -/
def IsModelComplete (T : L.Theory) : Prop :=
  ∀ (M N : Type (max u v)) [L.Structure M] [L.Structure N] [M ⊨ T] [N ⊨ T] (f : M ↪[L] N)
    {α : Type} (φ : L.Formula α) (x : α → M), φ.Realize (f ∘ x) ↔ φ.Realize x

/-- **2.5** Robinson's test: `T` is model complete if and only if every formula is equivalent over
`T` to a universal one (Tent–Ziegler Lem. 3.2.7). -/
theorem isModelComplete_iff_forall_isUniversal {T : L.Theory} :
    IsModelComplete T ↔
      ∀ {α : Type} (φ : L.Formula α), ∃ ψ : L.Formula α, ψ.IsUniversal ∧ φ ⇔[T] ψ :=
  sorry

/-- **2.5** Robinson's test, the embedding form: `T` is model complete if and only if every
existential formula with parameters in a model `M` that holds in an extension `N ⊨ T` already holds
in `M`. -/
theorem isModelComplete_iff_forall_isExistential {T : L.Theory} :
    IsModelComplete T ↔
      ∀ (M N : Type (max u v)) [L.Structure M] [L.Structure N] [M ⊨ T] [N ⊨ T] (f : M ↪[L] N)
        {α : Type} (φ : L.Formula α), φ.IsExistential → ∀ x : α → M,
          φ.Realize (f ∘ x) → φ.Realize x :=
  sorry

theorem HasQuantifierElimination.isModelComplete {T : L.Theory}
    (hT : HasQuantifierElimination T) : IsModelComplete T :=
  sorry

/-- **2.6** A model complete theory with a model that embeds into every model is complete. -/
theorem IsModelComplete.isComplete {T : L.Theory} (hT : IsModelComplete T)
    (P : Type (max u v)) [L.Structure P] [P ⊨ T] [Nonempty P]
    (hP : ∀ (M : Type (max u v)) [L.Structure M] [M ⊨ T] [Nonempty M], Nonempty (P ↪[L] M)) :
    T.IsComplete :=
  sorry

end Layer2

/-! ## Layer 3: ordered abelian groups -/

section Layer3

/-- **3.1** The language of ordered groups, written multiplicatively: Tau Ceti's language of groups
together with Mathlib's language of orders. -/
abbrev orderedGroup : Language := Language.group.sum Language.order

/-- **3.1** The `orderedGroup`-structure of an ordered group: the group symbols from
`TauCeti.Group.structureOfGroup` and `≤` from `FirstOrder.Language.orderStructure`. -/
@[instance_reducible] def orderedGroupStructure (Γ : Type*) [Group Γ] [LE Γ] :
    orderedGroup.Structure Γ :=
  @Language.sumStructure _ _ Γ (TauCeti.Group.structureOfGroup Γ) (orderStructure Γ)

attribute [local instance] orderedGroupStructure

/-- **3.3** A `ℤ`-group: an ordered abelian group with a least element `ϖ > 1` such that, for every
`n > 0`, every element is `ϖ^k · δ^n` for some `k < n`. Equivalently `[Γ : Γⁿ] = n` with
representatives `1, ϖ, …, ϖ^(n-1)`. -/
def IsZGroup (Γ : Type*) [CommGroup Γ] [LinearOrder Γ] : Prop :=
  ∃ ϖ : Γ, 1 < ϖ ∧ (∀ γ : Γ, 1 < γ → ϖ ≤ γ) ∧
    ∀ n : ℕ, 0 < n → ∀ γ : Γ, ∃ k < n, ∃ δ : Γ, γ = ϖ ^ k * δ ^ n

/-- **3.2** Nontrivial divisible ordered abelian groups are elementarily equivalent. -/
theorem elementarilyEquivalent_of_rootableBy (Γ Γ' : Type*) [CommGroup Γ] [LinearOrder Γ]
    [IsOrderedMonoid Γ] [Nontrivial Γ] [RootableBy Γ ℕ] [CommGroup Γ'] [LinearOrder Γ']
    [IsOrderedMonoid Γ'] [Nontrivial Γ'] [RootableBy Γ' ℕ] :
    Γ ≅[orderedGroup] Γ' :=
  sorry

/-- **3.2** The theory of nontrivial divisible ordered abelian groups eliminates quantifiers; it is
the complete theory of `Multiplicative ℚ`. -/
theorem hasQuantifierElimination_completeTheory_multiplicative_rat :
    HasQuantifierElimination (orderedGroup.completeTheory (Multiplicative ℚ)) :=
  sorry

/-- **3.3** An ordered abelian group is elementarily equivalent to `Multiplicative ℤ` if and only
if it is a `ℤ`-group. -/
theorem elementarilyEquivalent_multiplicative_int_iff (Γ : Type*) [CommGroup Γ] [LinearOrder Γ]
    [IsOrderedMonoid Γ] :
    Γ ≅[orderedGroup] Multiplicative ℤ ↔ IsZGroup Γ :=
  sorry

/-- The relation symbols of the Presburger expansion: a unary predicate `Dₙ` for every `n`. -/
inductive DivRel : ℕ → Type
  | dvd (n : ℕ) : DivRel 1

/-- The function symbols of the Presburger expansion: one constant `ϖ`. -/
inductive PiConst : ℕ → Type
  | pi : PiConst 0

/-- **3.3** The Presburger expansion of `orderedGroup`: a constant `ϖ` and the predicates
`Dₙ(x) :↔ ∃ y, yⁿ = x`. -/
abbrev zGroupLang : Language := orderedGroup.sum ⟨PiConst, DivRel⟩

/-- **3.3** The `zGroupLang`-structure of an ordered group with a chosen element `ϖ`. -/
@[instance_reducible] def zGroupStructure (Γ : Type*) [Group Γ] [LE Γ] (ϖ : Γ) :
    zGroupLang.Structure Γ :=
  @Language.sumStructure _ _ Γ (orderedGroupStructure Γ)
    { funMap := fun {n} f _ => match n, f with | _, .pi => ϖ
      RelMap := fun {n} r x => match n, r with | _, .dvd k => ∃ y : Γ, y ^ k = x 0 }

/-- **3.3** In the Presburger expansion, the complete theory of `ℤ` eliminates quantifiers. -/
theorem hasQuantifierElimination_completeTheory_multiplicative_int :
    letI := zGroupStructure (Multiplicative ℤ) (Multiplicative.ofAdd 1)
    HasQuantifierElimination (zGroupLang.completeTheory (Multiplicative ℤ)) :=
  sorry

end Layer3

end TauCetiRoadmap.SaturationAndQuantifierElimination
