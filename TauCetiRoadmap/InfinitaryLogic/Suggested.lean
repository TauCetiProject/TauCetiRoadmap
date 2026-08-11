import Mathlib

/-!
# Infinitary syntax, back-and-forth, and Scott analysis: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, library spine,
layer-by-layer build (Layers 0–3), standing hypotheses, worked examples, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for *particular* milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement here
neither finishes a layer nor the roadmap.

This file holds the **Layer 0/1** target shapes whose types are already expressible against the
pinned Mathlib: the fixed-carrier infinitary syntax `BoundedFormulaInf L ι α n` — ONE inductive,
with `Lω₁ω` recovered as the definitional specialization `BoundedFormulaω := BoundedFormulaInf L ℕ`
— its `Realize` semantics, the carrier-generic finitary embedding `toInf`, the minimal
carrier-coding/transport signatures (`IndexCoding`, `iInfAlong`/`iSupAlong`, `reindex`), and
potential isomorphism stated with Mathlib's back-and-forth vocabulary (`FGEquiv`,
`IsExtensionPair`), with Karp's theorem in its common-carrier form. These elaborate against
Mathlib and the milestone theorems are stated with `sorry` (allowed in this human-owned roadmap
library).

The earlier revision of this file prototyped **parallel inductives** (a ℕ-indexed `BoundedFormulaω`
alongside a universe-indexed `BoundedFormulaInf` with per-node index types). That design is
**retracted**: the fixed-carrier single inductive suggested by Aaron Liu on the Zulip thread
(linked in `README.md`) was tested and is strictly better — the `(uι + 1)` universe bump
disappears, the `ι := ℕ` specialization lands at exactly the finitary `BoundedFormula` universe,
and Karp's backward direction needs only one carrier admitting codings of both structures, not
per-node index types. See the design-evidence PR linked from `README.md`.

Layer-2+ shapes are kept in `README.md` fenced code blocks until grounded: Layer 2 (the countable
coded-formula proxy `FormulaCode` and the refinement-counting bridge) and Layer 3 (Scott rank,
canonical Scott formulas, and Scott's isomorphism theorem). The roadmap intentionally stops there:
model existence, admissible sets / Barwise, invariant DST, Morley counting, Morley–Hanf, many-sorted
model theory, and Lκλ are out of scope here (separate roadmap PRs).

Names here are target shapes, not final namespace commitments; audit them against Mathlib conventions
before implementation.

These are roadmap-local target shapes; the implementation in `TauCeti/` may refine names and
namespaces, but the statements below pin the intended early milestones and the dependency order.
-/

set_option autoImplicit false

universe u v w u' uι uκ

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

/-- **Layer 0, coded conjunction.** An `ι`-indexed conjunction at carrier `κ`, along a coding.
This replaces the earlier `Encodable` adapters `esup`/`einf` (`iInfAlong (.ofEncodable ι)` is the
countable case) and, at the sum codings into `M ⊕ N`, provides the separating conjunctions Karp's
backward direction needs. -/
def iInfAlong (c : IndexCoding ι κ) (φs : ι → BoundedFormulaInf L κ α n) :
    BoundedFormulaInf L κ α n :=
  iInf (c.pad ⊤ φs)

/-- **Layer 0, coded disjunction.** -/
def iSupAlong (c : IndexCoding ι κ) (φs : ι → BoundedFormulaInf L κ α n) :
    BoundedFormulaInf L κ α n :=
  iSup (c.pad ⊥ φs)

/-- **Layer 0, carrier transport.** Whole-formula transport along a coding — the replacement for
a universe-lifting operation and the embedding triangle of the retracted two-inductive design.
The target laws (functoriality `reindex_id`/`reindex_trans`, the equivalence-coding round trip,
and realization preservation) are pinned in `README.md` Layer 0. -/
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
Lω₁ω case; no lifting layer and no embedding triangle. -/
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

/-- **Layer 1, L∞ω-equivalence at a fixed carrier.** Agreement on all sentences with branching
carrier `κ`. The full-equivalence notion quantifies over carriers OUTSIDE the syntax
(`∀ κ : Type w, InfEquivAt L κ M N`), replacing the retracted design's per-node index types. -/
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

/-- **Layer 1 (basic API).** Potential isomorphism is transitive — the system of composites
`g ∘ f` (over `f` in the first system and `g` in the second with `f.cod ≤ g.dom`) is a
back-and-forth system. Domain extension is *f then g*: extend `f` to include the element, then
extend `g` over the finitely many generators of the enlarged `f.cod`. Codomain extension is
*g, f, then g*: extend `g` so its codomain contains the requested element, extend `f` so its
codomain contains that element's `g`-preimage, then extend `g` again over the generators of the
enlarged `f.cod`. (Mathlib has no `PartialEquiv.comp`; implementation will introduce a small
composition-under-`f.cod ≤ g.dom` helper.) -/
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
potential isomorphism coincides with isomorphism. Forward is the `S`-relative back-and-forth
dovetailing — Mathlib's `equiv_between_cg` is the `S = Set.univ` case, and its engine
`Order.sequenceOfCofinals` is the reusable tool; the converse is `potentialIso_of_equiv`. -/
theorem countable_potentialIso_iff_iso (M N : Type) [L.Structure M] [L.Structure N]
    [Countable M] [Countable N] :
    PotentialIso (L := L) M N ↔ Nonempty (M ≃[L] N) := by
  sorry

end TauCetiRoadmap.InfinitaryLogic
