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
pinned Mathlib: the two infinitary syntaxes built over `FirstOrder.Language` — `BoundedFormulaω`
(Lω₁ω, with ℕ-indexed `iSup`/`iInf` and the `Encodable` adapters `esup`/`einf`) and
`BoundedFormulaInf` (L∞ω, with universe-indexed `iSup`/`iInf`) — their `Realize` semantics, the
finitary embedding `toLω`, and potential isomorphism stated with Mathlib's back-and-forth
vocabulary (`FGEquiv`, `IsExtensionPair`). These elaborate against Mathlib and the milestone
theorems are stated with `sorry` (allowed in this human-owned roadmap library).

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

universe u v w u' uι

namespace TauCetiRoadmap.InfinitaryLogic

open FirstOrder FirstOrder.Language FirstOrder.Language.Structure Fin

variable (L : FirstOrder.Language.{u, v})

/-- **Layer 0, Lω₁ω syntax.** First-order formulas extended with ℕ-indexed conjunctions and
disjunctions. Arbitrary countable families enter through the `Encodable` adapters `esup`/`einf`. -/
inductive BoundedFormulaω (α : Type u') : ℕ → Type max u v u' where
  | falsum {n} : BoundedFormulaω α n
  | equal {n} (t₁ t₂ : L.Term (α ⊕ Fin n)) : BoundedFormulaω α n
  | rel {n l : ℕ} (R : L.Relations l) (ts : Fin l → L.Term (α ⊕ Fin n)) : BoundedFormulaω α n
  | imp {n} (φ ψ : BoundedFormulaω α n) : BoundedFormulaω α n
  | all {n} (φ : BoundedFormulaω α (n + 1)) : BoundedFormulaω α n
  | iSup {n} (φs : ℕ → BoundedFormulaω α n) : BoundedFormulaω α n
  | iInf {n} (φs : ℕ → BoundedFormulaω α n) : BoundedFormulaω α n

/-- Lω₁ω formulas with no bound variables in scope. -/
abbrev Formulaω (α : Type u') := BoundedFormulaω L α 0

/-- Lω₁ω sentences. -/
abbrev Sentenceω := Formulaω L Empty

/-- **Layer 0, L∞ω syntax.** First-order formulas extended with conjunctions and disjunctions
indexed by an arbitrary type `ι : Type uι`. The index universe is a parameter, so Karp's backward
direction can index by the structure universe. -/
inductive BoundedFormulaInf (α : Type u') : ℕ → Type max u v u' (uι + 1) where
  | falsum {n} : BoundedFormulaInf α n
  | equal {n} (t₁ t₂ : L.Term (α ⊕ Fin n)) : BoundedFormulaInf α n
  | rel {n l : ℕ} (R : L.Relations l) (ts : Fin l → L.Term (α ⊕ Fin n)) : BoundedFormulaInf α n
  | imp {n} (φ ψ : BoundedFormulaInf α n) : BoundedFormulaInf α n
  | all {n} (φ : BoundedFormulaInf α (n + 1)) : BoundedFormulaInf α n
  | iSup {n} {ι : Type uι} (φs : ι → BoundedFormulaInf α n) : BoundedFormulaInf α n
  | iInf {n} {ι : Type uι} (φs : ι → BoundedFormulaInf α n) : BoundedFormulaInf α n

/-- L∞ω formulas with no bound variables in scope. -/
abbrev FormulaInf (α : Type u') := BoundedFormulaInf L α 0

/-- L∞ω sentences. -/
abbrev SentenceInf := FormulaInf L Empty

variable {L}

namespace BoundedFormulaω

instance {α : Type u'} {n : ℕ} : Inhabited (BoundedFormulaω L α n) := ⟨falsum⟩

instance {α : Type u'} {n : ℕ} : Bot (BoundedFormulaω L α n) := ⟨falsum⟩

/-- The true formula, defined as `⊥ → ⊥`. -/
protected def top {α : Type u'} {n : ℕ} : BoundedFormulaω L α n := imp falsum falsum

instance {α : Type u'} {n : ℕ} : Top (BoundedFormulaω L α n) := ⟨BoundedFormulaω.top⟩

/-- **Layer 0, `Encodable` conjunction adapter.** Extends ℕ-indexed `iInf` to arbitrary countable
index types by encoding. -/
def einf {α : Type u'} {n : ℕ} {ι : Type*} [Encodable ι] (φs : ι → BoundedFormulaω L α n) :
    BoundedFormulaω L α n :=
  iInf fun k => match Encodable.decode (α := ι) k with
    | some i => φs i
    | none => ⊤

/-- **Layer 0, `Encodable` disjunction adapter.** Extends ℕ-indexed `iSup` to arbitrary countable
index types by encoding. -/
def esup {α : Type u'} {n : ℕ} {ι : Type*} [Encodable ι] (φs : ι → BoundedFormulaω L α n) :
    BoundedFormulaω L α n :=
  iSup fun k => match Encodable.decode (α := ι) k with
    | some i => φs i
    | none => ⊥

/-- **Layer 0, Lω₁ω semantics.** Evaluate a bounded Lω₁ω formula in a structure. -/
def Realize {α : Type u'} {M : Type w} [L.Structure M] :
    {n : ℕ} → BoundedFormulaω L α n → (α → M) → (Fin n → M) → Prop
  | _, falsum, _, _ => False
  | _, equal t₁ t₂, v, xs => t₁.realize (Sum.elim v xs) = t₂.realize (Sum.elim v xs)
  | _, rel R ts, v, xs => RelMap R fun i => (ts i).realize (Sum.elim v xs)
  | _, imp φ ψ, v, xs => Realize φ v xs → Realize ψ v xs
  | _, all φ, v, xs => ∀ x : M, Realize φ v (snoc xs x)
  | _, iSup φs, v, xs => ∃ i, Realize (φs i) v xs
  | _, iInf φs, v, xs => ∀ i, Realize (φs i) v xs

end BoundedFormulaω

namespace BoundedFormulaInf

/-- **Layer 0, L∞ω semantics.** Evaluate a bounded L∞ω formula in a structure. -/
def Realize {α : Type u'} {M : Type w} [L.Structure M] :
    {n : ℕ} → BoundedFormulaInf L α n → (α → M) → (Fin n → M) → Prop
  | _, falsum, _, _ => False
  | _, equal t₁ t₂, v, xs => t₁.realize (Sum.elim v xs) = t₂.realize (Sum.elim v xs)
  | _, rel R ts, v, xs => RelMap R fun i => (ts i).realize (Sum.elim v xs)
  | _, imp φ ψ, v, xs => Realize φ v xs → Realize ψ v xs
  | _, all φ, v, xs => ∀ x : M, Realize φ v (snoc xs x)
  | _, iSup φs, v, xs => ∃ i, Realize (φs i) v xs
  | _, iInf φs, v, xs => ∀ i, Realize (φs i) v xs

end BoundedFormulaInf

/-- **Layer 0, finitary embedding.** Embed a Mathlib first-order bounded formula into Lω₁ω. The
companion milestone `realize_toLω` is the realization-compatibility lemma. -/
def toLω {α : Type u'} : {n : ℕ} → L.BoundedFormula α n → BoundedFormulaω L α n
  | _, .falsum => .falsum
  | _, .equal t₁ t₂ => .equal t₁ t₂
  | _, .rel R ts => .rel R ts
  | _, .imp φ ψ => (toLω φ).imp (toLω ψ)
  | _, .all φ => (toLω φ).all

/-- **Layer 0 milestone, realization compatibility.** The finitary embedding preserves truth. -/
theorem realize_toLω {α : Type u'} {M : Type w} [L.Structure M] {n : ℕ}
    (φ : L.BoundedFormula α n) (v : α → M) (xs : Fin n → M) :
    (toLω φ).Realize v xs ↔ φ.Realize v xs := by
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
`Order.sequenceOfCofinals` is the reusable tool; the converse restricts an isomorphism to finitely
generated substructures. (The full Karp theorem — L∞ω-equivalence ↔ potential isomorphism at the
structure-universe index — is stated in `README.md`, where the index-universe convention is
pinned.) -/
theorem countable_potentialIso_iff_iso (M N : Type) [L.Structure M] [L.Structure N]
    [Countable M] [Countable N] :
    PotentialIso (L := L) M N ↔ Nonempty (M ≃[L] N) := by
  sorry

end TauCetiRoadmap.InfinitaryLogic
