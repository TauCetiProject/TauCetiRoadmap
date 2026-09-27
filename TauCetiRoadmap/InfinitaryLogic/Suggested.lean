import Mathlib

/-!
# Infinitary syntax, back-and-forth, and Scott analysis: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, library spine,
layer-by-layer build (Layers 0–3), standing hypotheses, worked examples, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

This file records representative Layer 0–3 signatures. Names and namespaces are provisional.
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
arbitrary — one embedding for all carriers and universes, with the abbreviation
`BoundedFormula.toOmega := toInf (ι := ℕ)` as the Lω₁ω case. -/
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
theorem countable_potentialIso_iff_iso (M N : Type w) [L.Structure M] [L.Structure N]
    [Countable M] [Countable N] :
    PotentialIso (L := L) M N ↔ Nonempty (M ≃[L] N) := by
  sorry

/-- **Layer 2, internal stabilization.** At level `α` the back-and-forth refinement of `M`'s own
tuples has stopped changing: one step of refinement, simultaneously for every tuple length. Both
tuples lie in `M`. -/
def SelfStabilizesCompletely (M : Type w) [L.Structure M] (α : Ordinal) : Prop :=
  ∀ (n : ℕ) (a a' : Fin n → M),
    BFEquiv (L := L) α n a a' ↔ BFEquiv (L := L) (Order.succ α) n a a'

/-- **Layer 2 milestone, upward propagation.** Stabilization at `α` makes `BFEquiv α` between
tuples of `M` imply `BFEquiv β` for every `β ≥ α`. -/
theorem SelfStabilizesCompletely.bfEquiv_of_le {M : Type w} [L.Structure M] {α β : Ordinal}
    (h : SelfStabilizesCompletely (L := L) M α) (hαβ : α ≤ β) {n : ℕ} {a a' : Fin n → M}
    (ha : BFEquiv (L := L) α n a a') : BFEquiv (L := L) β n a a' := by
  sorry

/-- **Layer 2 milestone, stabilization below `ω₁`.** A countable structure's own back-and-forth
refinement stabilizes at a countable ordinal. Only `[Countable M]` is needed. -/
theorem exists_complete_self_stabilization (M : Type w) [L.Structure M] [Countable M] :
    ∃ α < (Ordinal.omega 1 : Ordinal.{w}), SelfStabilizesCompletely (L := L) M α := by
  sorry

/-- **Layer 2 milestone, stabilization without countability.** Every structure `M : Type w`
stabilizes at some ordinal of `Ordinal.{w}`: the pairs of tuples that are `BFEquiv` at some level
but not at every level are `w`-small many, so their least failure levels have a supremum in
`Ordinal.{w}`. There is no bound below `ω₁` in general. -/
theorem exists_selfStabilizesCompletely (M : Type w) [L.Structure M] :
    ∃ α : Ordinal.{w}, SelfStabilizesCompletely (L := L) M α := by
  sorry

namespace BoundedFormulaInf

variable {ι : Type uι} {α : Type u'} {n : ℕ}

/-- Negation. -/
protected def not (φ : BoundedFormulaInf L ι α n) : BoundedFormulaInf L ι α n := imp φ falsum

/-- Binary conjunction, by De Morgan. -/
protected def and (φ ψ : BoundedFormulaInf L ι α n) : BoundedFormulaInf L ι α n :=
  (φ.imp ψ.not).not

/-- Existential quantification over the last bound position. -/
protected def ex (φ : BoundedFormulaInf L ι α (n + 1)) : BoundedFormulaInf L ι α n :=
  φ.not.all.not

end BoundedFormulaInf

/-- The `Encodable` coding of `ι` into `ℕ`, along an explicitly supplied encoding. -/
def IndexCoding.ofEncodableWith {ι : Type uι} (e : Encodable ι) : IndexCoding ι ℕ :=
  ⟨e.encode, e.decode, e.encodek⟩

instance AtomicIdx.countable [Countable (Σ l, L.Relations l)] {n : ℕ} :
    Countable (AtomicIdx L n) := by
  have (l : ℕ) : Countable (L.Relations l) :=
    Function.Injective.countable (f := fun R => (⟨l, R⟩ : Σ l, L.Relations l))
      (fun _ _ h => by injection h)
  refine Countable.of_equiv (Fin n × Fin n ⊕ (Σ l, L.Relations l × (Fin l → Fin n))) ?_
  exact
    { toFun := fun | .inl ⟨i, j⟩ => .eq i j | .inr ⟨_, R, f⟩ => .rel R f
      invFun := fun | .eq i j => .inl ⟨i, j⟩ | .rel R f => .inr ⟨_, R, f⟩
      left_inv := fun | .inl ⟨_, _⟩ => rfl | .inr ⟨_, _, _⟩ => rfl
      right_inv := fun | .eq _ _ => rfl | .rel _ _ => rfl }

/-- The atomic formula of an index, on the bound positions of an `n`-tuple. -/
def AtomicIdx.formula {n : ℕ} : AtomicIdx L n → BoundedFormulaω L Empty n
  | .eq i j => .equal (Term.var (Sum.inr i)) (Term.var (Sum.inr j))
  | .rel R f => .rel R fun k => Term.var (Sum.inr (f k))

/-- **Layer 3, the atomic diagram** of a tuple: over every atomic index, the atomic formula if it
holds of `a` and its negation otherwise. Countable because the language's relations are. -/
noncomputable def atomicDiagram [Countable (Σ l, L.Relations l)] {M : Type w} [L.Structure M]
    {n : ℕ} (a : Fin n → M) : BoundedFormulaω L Empty n := by
  classical
  exact BoundedFormulaInf.iInfAlong
    (IndexCoding.ofEncodableWith (Encodable.ofCountable (AtomicIdx L n)))
    fun idx => if idx.holds a then idx.formula else idx.formula.not

/-- **Layer 3, the canonical Scott formulas** `θ^M_{α,a}`, with the tuple in bound positions. The
recursion mirrors `BFEquiv`: the atomic diagram at `0`; at a successor, the previous formula, the
forth clause `⋀_{c ∈ M} ∃ y, θ_{β, a c}`, and the back clause `∀ y, ⋁_{c ∈ M} θ_{β, a c}`; at a
limit `β < ω₁`, the conjunction of the earlier stages. Every index family is coded into the fixed
carrier `ℕ`. Limits `≥ ω₁` never arise in Scott analysis and get `⊤`. -/
noncomputable def scottFormula [Countable (Σ l, L.Relations l)] {M : Type w} [L.Structure M]
    [Countable M] {n : ℕ} (a : Fin n → M) (α : Ordinal.{w}) : BoundedFormulaω L Empty n := by
  classical
  let cM : IndexCoding M ℕ := IndexCoding.ofEncodableWith (Encodable.ofCountable M)
  exact Ordinal.limitRecOn (motive := fun _ => (k : ℕ) → (Fin k → M) → BoundedFormulaω L Empty k) α
    (fun _ a' => atomicDiagram a')
    (fun _ ih k a' =>
      (ih k a').and
        ((BoundedFormulaInf.iInfAlong cM fun m => (ih (k + 1) (snoc a' m)).ex).and
          (BoundedFormulaInf.iSupAlong cM fun m => ih (k + 1) (snoc a' m)).all))
    (fun β _ ih k a' =>
      if hβ : β < Ordinal.omega 1 then
        haveI : Countable (Set.Iio β) := (Cardinal.countable_Iio_of_lt_omega_one hβ).to_subtype
        BoundedFormulaInf.iInfAlong
          (IndexCoding.ofEncodableWith (Encodable.ofCountable (Set.Iio β)))
          fun γ => ih γ.1 γ.2 k a'
      else ⊤)
    n a

/-- **Layer 3 milestone, the characteristic theorem of the Scott formulas.** Against **every**
structure `N` — of any cardinality and in any universe — a tuple `b` satisfies `θ^M_{α,a}` exactly
when it is `BFEquiv α` to `a`, for every `α < ω₁`. -/
theorem realize_scottFormula_iff_bfEquiv [Countable (Σ l, L.Relations l)] {M : Type w}
    [L.Structure M] [Countable M] {N : Type w'} [L.Structure N] {n : ℕ} (a : Fin n → M)
    (b : Fin n → N) {α : Ordinal.{w}} (hα : α < Ordinal.omega 1) :
    (scottFormula (L := L) a α).Realize Empty.elim b ↔ BFEquiv (L := L) α n a b := by
  sorry

/-- Universal closure over all bound positions. -/
def BoundedFormulaInf.alls {ι : Type uι} {α : Type u'} :
    {n : ℕ} → BoundedFormulaInf L ι α n → BoundedFormulaInf L ι α 0
  | 0, φ => φ
  | _ + 1, φ => alls φ.all

/-- Satisfaction of a sentence in a structure. -/
def SentenceInf.Realize {ι : Type uι} (φ : SentenceInf L ι) (M : Type w) [L.Structure M] : Prop :=
  BoundedFormulaInf.Realize φ Empty.elim (Fin.elim0 : Fin 0 → M)

/-- **Layer 3, the Scott sentence at a level `α`.** The Scott formula of the empty tuple at `α`,
together with, for every tuple `a` of `M`, the universal closure of `θ^M_{α,a} → θ^M_{α+1,a}`.
At an internally stabilizing `α < ω₁` this pins `M` among countable structures. -/
noncomputable def scottSentenceAt [Countable (Σ l, L.Relations l)] (M : Type w) [L.Structure M]
    [Countable M] (α : Ordinal.{w}) : Sentenceω L := by
  classical
  exact (scottFormula (L := L) (Fin.elim0 : Fin 0 → M) α).and
    (BoundedFormulaInf.iInfAlong
      (IndexCoding.ofEncodableWith (Encodable.ofCountable (Σ n, Fin n → M)))
      fun p => ((scottFormula (L := L) p.2 α).imp (scottFormula (L := L) p.2 (Order.succ α))).alls)

/-- **Layer 3 milestone.** `M` satisfies its Scott sentence at any internally stabilizing
`α < ω₁`. -/
theorem realize_scottSentenceAt_self [Countable (Σ l, L.Relations l)] (M : Type w)
    [L.Structure M] [Countable M] {α : Ordinal.{w}} (hα : α < Ordinal.omega 1)
    (hs : SelfStabilizesCompletely (L := L) M α) :
    (scottSentenceAt (L := L) M α).Realize M := by
  sorry

/-- **Layer 3 milestone, models carry a back-and-forth system.** In any model `N` of the Scott
sentence at `α < ω₁`, the pairs of tuples related by `BFEquiv α` form a tuple back-and-forth system.
No stabilization and no countability of `N` is needed. -/
theorem isTupleBFSystem_of_realize_scottSentenceAt [Countable (Σ l, L.Relations l)]
    {M N : Type w} [L.Structure M] [L.Structure N] [Countable M] {α : Ordinal.{w}}
    (hα : α < Ordinal.omega 1) (hN : (scottSentenceAt (L := L) M α).Realize N) :
    IsTupleBFSystem (L := L) {p : Σ n : ℕ, (Fin n → M) × (Fin n → N) |
      BFEquiv (L := L) α p.1 p.2.1 p.2.2} := by
  sorry

/-- **Layer 3 milestone.** Among countable structures, the Scott sentence at an internally
stabilizing `α < ω₁` characterizes `M` up to isomorphism: combine
`isTupleBFSystem_of_realize_scottSentenceAt`, `potentialIso_iff_exists_isTupleBFSystem`, and
`countable_potentialIso_iff_iso`. -/
theorem realize_scottSentenceAt_iff [L.IsRelational] [Countable (Σ l, L.Relations l)]
    (M : Type w) [L.Structure M] [Countable M] {α : Ordinal.{w}} (hα : α < Ordinal.omega 1)
    (hs : SelfStabilizesCompletely (L := L) M α) (N : Type w) [L.Structure N] [Countable N] :
    (scottSentenceAt (L := L) M α).Realize N ↔ Nonempty (M ≃[L] N) := by
  sorry

/-- **Layer 2, the least internal stabilization ordinal** `s(M)`. -/
noncomputable def selfStabilizationOrdinal (M : Type w) [L.Structure M] : Ordinal.{w} :=
  sInf {α | SelfStabilizesCompletely (L := L) M α}

/-- **Layer 2 milestone, the infimum is attained.** `M` stabilizes at `s(M)` itself: the set of
stabilizing levels is nonempty by `exists_selfStabilizesCompletely`, and ordinals are
well-ordered. -/
theorem selfStabilizesCompletely_selfStabilizationOrdinal (M : Type w) [L.Structure M] :
    SelfStabilizesCompletely (L := L) M (selfStabilizationOrdinal (L := L) M) := by
  sorry

/-- **Layer 2 milestone.** For countable `M`, `s(M) < ω₁`, by
`exists_complete_self_stabilization`. -/
theorem selfStabilizationOrdinal_lt_omega_one (M : Type w) [L.Structure M] [Countable M] :
    selfStabilizationOrdinal (L := L) M < Ordinal.omega 1 := by
  sorry

/-- **Layer 3, the Scott sentence of `M`**, at the least internal stabilization ordinal. -/
noncomputable def scottSentence [Countable (Σ l, L.Relations l)] (M : Type w) [L.Structure M]
    [Countable M] : Sentenceω L :=
  scottSentenceAt (L := L) M (selfStabilizationOrdinal (L := L) M)

/-- **Layer 3, the v1 summit: Scott's isomorphism theorem.** For a countable relational language,
every countable structure has an Lω₁ω sentence true in exactly the countable structures
isomorphic to it. -/
theorem scott_isomorphism [L.IsRelational] [Countable (Σ l, L.Relations l)] (M : Type w)
    [L.Structure M] [Countable M] :
    (scottSentence (L := L) M).Realize M ∧
      ∀ (N : Type w) [L.Structure N] [Countable N],
        ((scottSentence (L := L) M).Realize N ↔ Nonempty (M ≃[L] N)) := by
  sorry

/-- **Layer 3, the orbit-stable levels of a tuple**: the levels `α` at which every tuple of `M`
that is `BFEquiv α` to `a` is `BFEquiv` to it at **every** level. -/
def orbitStable {M : Type w} [L.Structure M] {n : ℕ} (a : Fin n → M) : Set Ordinal.{w} :=
  {α | ∀ b : Fin n → M, BFEquiv (L := L) α n a b → ∀ γ : Ordinal.{w}, BFEquiv (L := L) γ n a b}

/-- **Layer 3, the orbit rank of a tuple**: its least orbit-stable level. For countable `M` this is
the least level at which the back-and-forth class of `a` is its automorphism orbit. -/
noncomputable def orbitRank {M : Type w} [L.Structure M] {n : ℕ} (a : Fin n → M) : Ordinal.{w} :=
  sInf (orbitStable (L := L) a)

/-- **Layer 3 milestone, the infimum is attained.** The orbit rank is itself orbit-stable: every
stabilizing level of `M` is orbit-stable for `a` (by upward propagation and monotonicity), so
`orbitStable a` is nonempty, and ordinals are well-ordered. -/
theorem orbitRank_mem_orbitStable {M : Type w} [L.Structure M] {n : ℕ} (a : Fin n → M) :
    orbitRank (L := L) a ∈ orbitStable (L := L) a := by
  sorry

/-- **Layer 3, the Scott rank convention** `SR(M) = sup_a (orbitRank a + 1)`, over tuples of every
length. -/
noncomputable def internalScottRank (M : Type w) [L.Structure M] : Ordinal.{w} :=
  ⨆ x : (Σ n : ℕ, Fin n → M), orbitRank (L := L) x.2 + 1

/-- **Layer 3 milestone, comparison with stabilization.** Simultaneous internal stabilization is
stabilization of every tuple's back-and-forth class: `s(M) = sup_a orbitRank a`. It follows from
upward propagation, the two attainment theorems, and the supremum property; no countability is
needed. -/
theorem selfStabilizationOrdinal_eq_iSup_orbitRank (M : Type w) [L.Structure M] :
    selfStabilizationOrdinal (L := L) M = ⨆ x : (Σ n : ℕ, Fin n → M), orbitRank (L := L) x.2 := by
  sorry

/-- **Layer 3 milestone.** `s(M) ≤ SR(M)`. -/
theorem selfStabilizationOrdinal_le_internalScottRank (M : Type w) [L.Structure M] :
    selfStabilizationOrdinal (L := L) M ≤ internalScottRank (L := L) M := by
  sorry

/-- **Layer 3 milestone.** `SR(M) ≤ s(M) + 1`. -/
theorem internalScottRank_le_succ_selfStabilizationOrdinal (M : Type w) [L.Structure M] :
    internalScottRank (L := L) M ≤ Order.succ (selfStabilizationOrdinal (L := L) M) := by
  sorry

/-- **Layer 3 milestone, the rank bound.** A countable structure has Scott rank below `ω₁`. -/
theorem internalScottRank_lt_omega_one (M : Type w) [L.Structure M] [Countable M] :
    internalScottRank (L := L) M < Ordinal.omega 1 := by
  sorry

/-- **Layer 3 acceptance check.** Every pure set, finite or infinite, has Scott rank `1`: tuples
with the same equality pattern are related by a permutation, so every orbit rank is `0`. -/
theorem internalScottRank_pureSet (M : Type w) [Language.empty.Structure M] :
    internalScottRank (L := Language.empty) M = 1 := by
  sorry

/-- **Layer 3 acceptance check, a structure that is not homogeneous.** The disjoint union of a
complete graph on two vertices and one on three has Scott rank `3`. A vertex of each component is
`BFEquiv 1` but not `BFEquiv 2` to the other, so a vertex has orbit rank `2`, and every tuple's
class is its orbit at level `2`. -/
theorem internalScottRank_completeGraph_two_sum_three :
    letI := ((⊤ : SimpleGraph (Fin 2)) ⊕g (⊤ : SimpleGraph (Fin 3))).structure
    internalScottRank (L := Language.graph) (Fin 2 ⊕ Fin 3) = 3 := by
  sorry

end TauCetiRoadmap.InfinitaryLogic
