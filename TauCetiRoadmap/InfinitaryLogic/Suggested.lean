import Mathlib

/-!
# Infinitary syntax, back-and-forth, and Scott analysis: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, library spine,
layer-by-layer build (Layers 0–3), standing hypotheses, worked examples, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

This file records the currently proposed Layer 0/1 signatures. Layer 2/3 targets remain in
`README.md` until their dependencies are expressible. Names and namespaces are provisional.
-/

set_option autoImplicit false

universe u v w w' u' uι uκ

namespace TauCetiRoadmap.InfinitaryLogic

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure Fin

variable (L : FirstOrder.Language.{u, v})

/-- **Layer 0, the fixed-carrier infinitary syntax.** First-order formulas extended with
conjunctions and disjunctions branching over ONE fixed carrier `ι` per formula. The universe is
`max u v u' uι` — no `+ 1` bump — and `Lω₁ω` is the definitional `ι := ℕ` specialization below,
not a second inductive. -/
inductive BoundedFormulaInf (ι : Type uι) (α : Type u') : ℕ → Type max u v u' uι where
  | falsum {n} : BoundedFormulaInf ι α n
  | equal {n} (t₁ t₂ : L.Term (α ⊕ Fin n)) : BoundedFormulaInf ι α n
  | rel {n l : ℕ} (R : L.Relations l) (ts : Fin l → L.Term (α ⊕ Fin n)) : BoundedFormulaInf ι α n
  | imp {n} (φ ψ : BoundedFormulaInf ι α n) : BoundedFormulaInf ι α n
  | all {n} (φ : BoundedFormulaInf ι α (n + 1)) : BoundedFormulaInf ι α n
  | iSup {n} (φs : ι → BoundedFormulaInf ι α n) : BoundedFormulaInf ι α n
  | iInf {n} (φs : ι → BoundedFormulaInf ι α n) : BoundedFormulaInf ι α n

/-- **Layer 0, Lω₁ω.** The definitional `ι := ℕ` specialization — an `abbrev`, so every
`BoundedFormulaInf` operation applies to it directly, and its universe is exactly that of the
finitary `BoundedFormula`. -/
abbrev BoundedFormulaω (α : Type u') (n : ℕ) := BoundedFormulaInf L ℕ α n

/-- L∞ω formulas with no bound variables in scope. -/
abbrev FormulaInf (ι : Type uι) (α : Type u') := BoundedFormulaInf L ι α 0

/-- L∞ω sentences. -/
abbrev SentenceInf (ι : Type uι) := FormulaInf L ι Empty

/-- Lω₁ω formulas with no bound variables in scope. -/
abbrev Formulaω (α : Type u') := FormulaInf L ℕ α

/-- Lω₁ω sentences. -/
abbrev Sentenceω := SentenceInf L ℕ

variable {L}

namespace BoundedFormulaInf

variable {ι : Type uι} {α : Type u'} {n : ℕ}

instance : Inhabited (BoundedFormulaInf L ι α n) := ⟨falsum⟩

instance : Bot (BoundedFormulaInf L ι α n) := ⟨falsum⟩

/-- The true formula, defined as `⊥ → ⊥`. -/
protected def top : BoundedFormulaInf L ι α n := imp falsum falsum

instance : Top (BoundedFormulaInf L ι α n) := ⟨BoundedFormulaInf.top⟩

/-- **Layer 0, semantics.** One recursion serves every carrier; the realization lemmas for
`iSup`/`iInf` are each a single statement generic in the carrier and its universe. -/
def Realize {M : Type w} [L.Structure M] :
    {n : ℕ} → BoundedFormulaInf L ι α n → (α → M) → (Fin n → M) → Prop
  | _, falsum, _, _ => False
  | _, equal t₁ t₂, v, xs => t₁.realize (Sum.elim v xs) = t₂.realize (Sum.elim v xs)
  | _, rel R ts, v, xs => RelMap R fun i => (ts i).realize (Sum.elim v xs)
  | _, imp φ ψ, v, xs => Realize φ v xs → Realize ψ v xs
  | _, all φ, v, xs => ∀ x : M, Realize φ v (snoc xs x)
  | _, iSup φs, v, xs => ∃ i, Realize (φs i) v xs
  | _, iInf φs, v, xs => ∀ i, Realize (φs i) v xs

end BoundedFormulaInf

/-- **Layer 0, carrier codings.** An injection of `ι` into `κ` with a decoder that is a left
inverse on encoded values (mirroring `Encodable`, the codomain-`ℕ` special case). Codings are how
an `ι`-indexed connective is expressed at a larger carrier and how whole formulas are transported
between carriers. -/
structure IndexCoding (ι : Type uι) (κ : Type uκ) where
  encode : ι → κ
  decode : κ → Option ι
  decode_encode : ∀ i, decode (encode i) = some i

namespace IndexCoding

/-- Total extension of a family along a coding: decoded indices select a branch, undecodable ones
get the default. For conjunctions the default is `⊤`, for disjunctions `⊥`, which makes the
padding semantically neutral. -/
def pad {ι : Type uι} {κ : Type uκ} {β : Sort*} (c : IndexCoding ι κ) (default : β)
    (f : ι → β) : κ → β :=
  fun k => (c.decode k).elim default f

end IndexCoding

namespace BoundedFormulaInf

variable {ι : Type uι} {κ : Type uκ} {α : Type u'} {n : ℕ}

/-- **Layer 0, coded conjunction.** An `ι`-indexed conjunction at carrier `κ`, along a coding;
the countable case is `iInfAlong` along an `Encodable`-derived coding. -/
def iInfAlong (c : IndexCoding ι κ) (φs : ι → BoundedFormulaInf L κ α n) :
    BoundedFormulaInf L κ α n :=
  iInf (c.pad ⊤ φs)

/-- **Layer 0, coded disjunction.** -/
def iSupAlong (c : IndexCoding ι κ) (φs : ι → BoundedFormulaInf L κ α n) :
    BoundedFormulaInf L κ α n :=
  iSup (c.pad ⊥ φs)

/-- **Layer 0, carrier transport.** Whole-formula transport along a coding. The target laws
(functoriality `reindex_id`/`reindex_trans`, the equivalence-coding round trip, and realization
preservation) are pinned in `README.md` Layer 0. -/
def reindex (c : IndexCoding ι κ) :
    {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L κ α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal t₁ t₂
  | _, .rel R ts => .rel R ts
  | _, .imp φ ψ => (reindex c φ).imp (reindex c ψ)
  | _, .all φ => (reindex c φ).all
  | _, .iSup φs => iSupAlong c fun i => reindex c (φs i)
  | _, .iInf φs => iInfAlong c fun i => reindex c (φs i)

/-- **Layer 0 milestone, neutral padding.** The `⊤`-padding of a coded conjunction is
semantically invisible, generically in the coding. -/
theorem realize_iInfAlong {M : Type w} [L.Structure M] {c : IndexCoding ι κ}
    {φs : ι → BoundedFormulaInf L κ α n} {v : α → M} {xs : Fin n → M} :
    (iInfAlong c φs).Realize v xs ↔ ∀ i, (φs i).Realize v xs := by
  sorry

/-- **Layer 0 milestone, transport preserves realization.** Being an iff, this transports
semantic equivalence in both directions as well. -/
theorem realize_reindex {M : Type w} [L.Structure M] (c : IndexCoding ι κ)
    (φ : BoundedFormulaInf L ι α n) (v : α → M) (xs : Fin n → M) :
    (reindex c φ).Realize v xs ↔ φ.Realize v xs := by
  sorry

end BoundedFormulaInf

/-- **Layer 0, finitary embedding.** Embed a Mathlib first-order bounded formula into the
infinitary syntax. Since finitary formulas have no infinitary nodes, the target carrier is
arbitrary — one embedding for all carriers and universes, with `toLω := toInf (ι := ℕ)` as the
Lω₁ω case. -/
def toInf {ι : Type uι} {α : Type u'} : {n : ℕ} → L.BoundedFormula α n → BoundedFormulaInf L ι α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal t₁ t₂
  | _, .rel R ts => .rel R ts
  | _, .imp φ ψ => (toInf φ).imp (toInf ψ)
  | _, .all φ => (toInf φ).all

/-- **Layer 0 milestone, realization compatibility.** The carrier-generic finitary embedding
preserves truth. -/
theorem realize_toInf {ι : Type uι} {α : Type u'} {M : Type w} [L.Structure M] {n : ℕ}
    (φ : L.BoundedFormula α n) (v : α → M) (xs : Fin n → M) :
    (toInf (ι := ι) φ).Realize v xs ↔ φ.Realize v xs := by
  sorry

/-- **Layer 0 milestone, the language-size bridge.** For a relational language, Mathlib's single
cardinal bound coincides with the countability instance carried by the Scott/Karp statements. -/
theorem card_le_aleph0_iff_countable_relations [L.IsRelational] :
    L.card ≤ Cardinal.aleph0 ↔ Countable (Σ n, L.Relations n) := by
  sorry

/-- **Layer 1, atomic indices.** The atomic formulas of a relational language in `n` variables:
an equality between two positions, or a relation symbol applied to positions. Nullary relation
symbols (`l = 0`) are included, so a nullary fact is part of the atomic type of every tuple,
the empty tuple included. -/
inductive AtomicIdx (L : FirstOrder.Language.{u, v}) (n : ℕ) : Type max u v where
  | eq (i j : Fin n) : AtomicIdx L n
  | rel {l : ℕ} (R : L.Relations l) (f : Fin l → Fin n) : AtomicIdx L n

/-- Whether an atomic index holds of a tuple. -/
def AtomicIdx.holds {n : ℕ} {M : Type w} [L.Structure M] : AtomicIdx L n → (Fin n → M) → Prop
  | .eq i j, a => a i = a j
  | .rel R f, a => RelMap R (a ∘ f)

/-- Two tuples have the same atomic type. For a relational language this is the full atomic
type. -/
def SameAtomicType {n : ℕ} {M : Type w} {N : Type w'} [L.Structure M] [L.Structure N]
    (a : Fin n → M) (b : Fin n → N) : Prop :=
  ∀ idx : AtomicIdx L n, idx.holds a ↔ idx.holds b

/-- **Layer 1, the back-and-forth recursion.** `BFEquiv α n a b` compares a tuple `a` of `M` with a
tuple `b` of `N`: same atomic type at `0`; at a successor, the previous level **together with**
the forth and back clauses; at a limit, every earlier level. Retaining the previous level at
successors is part of the definition, not a consequence: on empty structures the forth and back
clauses are vacuous, while the atomic types (through nullary relations) may still differ. -/
noncomputable def BFEquiv {M : Type w} {N : Type w'} [L.Structure M] [L.Structure N]
    (α : Ordinal) (n : ℕ) (a : Fin n → M) (b : Fin n → N) : Prop :=
  Ordinal.limitRecOn (motive := fun _ => (k : ℕ) → (Fin k → M) → (Fin k → N) → Prop) α
    (fun _ a' b' => SameAtomicType (L := L) a' b')
    (fun _ ih k a' b' =>
      ih k a' b' ∧
      (∀ m : M, ∃ m' : N, ih (k + 1) (snoc a' m) (snoc b' m')) ∧
      (∀ m' : N, ∃ m : M, ih (k + 1) (snoc a' m) (snoc b' m')))
    (fun _ _ ih k a' b' => ∀ γ (hγ : γ < _), ih γ hγ k a' b')
    n a b

/-- **Layer 1 milestone, the successor law.** -/
theorem BFEquiv.succ {M : Type w} {N : Type w'} [L.Structure M] [L.Structure N] {n : ℕ}
    (α : Ordinal) (a : Fin n → M) (b : Fin n → N) :
    BFEquiv (L := L) (Order.succ α) n a b ↔
      BFEquiv (L := L) α n a b ∧
      (∀ m : M, ∃ m' : N, BFEquiv (L := L) α (n + 1) (snoc a m) (snoc b m')) ∧
      (∀ m' : N, ∃ m : M, BFEquiv (L := L) α (n + 1) (snoc a m) (snoc b m')) := by
  sorry

/-- **Layer 1 milestone, the limit law.** -/
theorem BFEquiv.limit {M : Type w} {N : Type w'} [L.Structure M] [L.Structure N] {n : ℕ}
    {α : Ordinal} (hα : Order.IsSuccLimit α) (a : Fin n → M) (b : Fin n → N) :
    BFEquiv (L := L) α n a b ↔ ∀ β < α, BFEquiv (L := L) β n a b := by
  sorry

/-- **Layer 1 milestone, monotonicity.** Equivalence at a level implies it at every lower level. -/
theorem BFEquiv.monotone {M : Type w} {N : Type w'} [L.Structure M] [L.Structure N] {n : ℕ}
    {α β : Ordinal} (hαβ : α ≤ β) {a : Fin n → M} {b : Fin n → N}
    (h : BFEquiv (L := L) β n a b) : BFEquiv (L := L) α n a b := by
  sorry

/-- **Layer 1, potential isomorphism.** There is a **back-and-forth system**: a nonempty set `S`
of finitely generated partial equivalences, closed under two-sided extension *within `S`*. This is
the model-theoretic content of "winning strategy in the infinite Ehrenfeucht–Fraïssé game".
Mathlib's `IsExtensionPair` — which quantifies over **all** of `L.FGEquiv M N` — is the
`S = Set.univ` instance and is **strictly stronger**, so it cannot be the definition: `(ℕ, <)` is
isomorphic to itself, yet the one-point partial equivalence `1 ↦ 0` extends to nothing whose
domain contains `0`, so `IsExtensionPair` fails there while potential isomorphism holds. -/
def PotentialIso (M : Type w) (N : Type w) [L.Structure M] [L.Structure N] : Prop :=
  ∃ S : Set (L.FGEquiv M N), S.Nonempty ∧
    (∀ f ∈ S, ∀ m : M, ∃ g ∈ S, m ∈ g.1.dom ∧ f ≤ g) ∧
    (∀ f ∈ S, ∀ n : N, ∃ g ∈ S, n ∈ g.1.cod ∧ f ≤ g)

/-- **Layer 1, tuple back-and-forth systems.** The tuple-family presentation of a back-and-forth
system: a set of pairs of equal-length tuples containing the empty pair, preserving atomic type,
and closed under the forth and back extensions. This is the presentation the migration source
uses; it is interchangeable with `PotentialIso` for relational languages. -/
def IsTupleBFSystem {M N : Type w} [L.Structure M] [L.Structure N]
    (S : Set (Σ n : ℕ, (Fin n → M) × (Fin n → N))) : Prop :=
  ⟨0, Fin.elim0, Fin.elim0⟩ ∈ S ∧
  (∀ p ∈ S, SameAtomicType (L := L) p.2.1 p.2.2) ∧
  (∀ p ∈ S, ∀ m : M, ∃ m' : N, (⟨p.1 + 1, snoc p.2.1 m, snoc p.2.2 m'⟩ : Σ _ : ℕ, _) ∈ S) ∧
  (∀ p ∈ S, ∀ m' : N, ∃ m : M, (⟨p.1 + 1, snoc p.2.1 m, snoc p.2.2 m'⟩ : Σ _ : ℕ, _) ∈ S)

/-- **Layer 1 adaptation target, the two presentations agree.** For a relational language, a
finitely generated substructure is the finite set of its generators, so a system of `FGEquiv`s
and a tuple back-and-forth system determine each other. -/
theorem potentialIso_iff_exists_isTupleBFSystem [L.IsRelational] {M N : Type w}
    [L.Structure M] [L.Structure N] :
    PotentialIso (L := L) M N ↔ ∃ S, IsTupleBFSystem (L := L) (M := M) (N := N) S := by
  sorry

/-- **Layer 1, L∞ω-equivalence at a fixed carrier.** Agreement on all sentences with branching
carrier `κ`. The full-equivalence notion quantifies over carriers OUTSIDE the syntax
(`∀ κ : Type w, InfEquivAt L κ M N`). -/
def InfEquivAt (κ : Type uκ) (M N : Type w) [L.Structure M] [L.Structure N] : Prop :=
  ∀ φ : SentenceInf L κ,
    BoundedFormulaInf.Realize φ Empty.elim (Fin.elim0 : Fin 0 → M) ↔
      BoundedFormulaInf.Realize φ Empty.elim (Fin.elim0 : Fin 0 → N)

/-- **Layer 1 milestone, Karp's theorem at a common carrier.** Agreement at ANY single carrier
admitting codings of both structures characterizes potential isomorphism; `M ⊕ N` (with the two
sum codings) is the canonical instance, not a mathematical requirement. The forward direction is
generic in the carrier; the backward direction builds its separating conjunctions with
`iInfAlong`. -/
theorem karp_theorem_at [L.IsRelational] {M N : Type w} [L.Structure M] [L.Structure N]
    {κ : Type w} (cM : IndexCoding M κ) (cN : IndexCoding N κ) :
    PotentialIso (L := L) M N ↔ InfEquivAt (L := L) κ M N := by
  sorry

/-- **Layer 1 (basic API).** An isomorphism is a potential isomorphism: take `S` to be the
restrictions of the isomorphism to finitely generated substructures. This is the easy converse
direction of `countable_potentialIso_iff_iso`. -/
theorem potentialIso_of_equiv {M N : Type w} [L.Structure M] [L.Structure N] (e : M ≃[L] N) :
    PotentialIso (L := L) M N := by
  sorry

/-- **Layer 1 (basic API).** Potential isomorphism is symmetric — flip the system along
`PartialEquiv.symm`. -/
theorem PotentialIso.symm {M N : Type w} [L.Structure M] [L.Structure N]
    (h : PotentialIso (L := L) M N) : PotentialIso (L := L) N M := by
  sorry

/-- **Layer 1 (basic API).** Potential isomorphism is transitive — compose the two back-and-forth
systems. Transitivity uses composition of partial equivalences under the required domain/codomain
compatibility. -/
theorem PotentialIso.trans {M N P : Type w} [L.Structure M] [L.Structure N] [L.Structure P]
    (hMN : PotentialIso (L := L) M N) (hNP : PotentialIso (L := L) N P) :
    PotentialIso (L := L) M P := by
  sorry

/-- **Layer 1, the `IsExtensionPair` bridge.** Mathlib's global extension property (with a partial
equivalence to start from) gives a back-and-forth system — take `S = Set.univ`. This is the
compatibility bridge to Mathlib's `IsExtensionPair` / `equiv_between_cg` vocabulary; it is one
implication, not an equivalence. -/
theorem potentialIso_of_isExtensionPair {M N : Type w} [L.Structure M] [L.Structure N]
    (hMN : L.IsExtensionPair M N) (hNM : L.IsExtensionPair N M)
    (hne : Nonempty (L.FGEquiv M N)) : PotentialIso (L := L) M N := by
  sorry

/-- **Layer 1 milestone, the countable corollary of Karp's theorem.** On countable structures,
potential isomorphism coincides with isomorphism; the converse direction is
`potentialIso_of_equiv`. -/
theorem countable_potentialIso_iff_iso (M N : Type) [L.Structure M] [L.Structure N]
    [Countable M] [Countable N] :
    PotentialIso (L := L) M N ↔ Nonempty (M ≃[L] N) := by
  sorry

end TauCetiRoadmap.InfinitaryLogic
