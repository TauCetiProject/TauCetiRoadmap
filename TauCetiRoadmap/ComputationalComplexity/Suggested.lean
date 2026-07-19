import Mathlib

/-!
# Computational complexity theory: target signatures

**`README.md` is the definitive roadmap document.** The narrative plan — the bitstring
machine model, the encoding framework, the complexity classes, the inclusions, and the
Cook–Levin / Karp program — lives there. This file is **not** the roadmap and is **not
exhaustive**: it records suggested Lean forms for *particular* milestones, so that
contributors and reviewers converge on names and signatures. Discharging every statement
here neither finishes a section nor the roadmap; what the area asks for is what `README.md`
says.

Everything here elaborates against the pinned Mathlib. Mathlib has
`Turing.TM2ComputableInPolyTime` (in `Mathlib/Computability/TuringMachine/Computable.lean`),
which pairs a bundled two-stack Turing machine with a `Polynomial ℕ` step bound and a proof
that it computes `f` on the given input/output encodings; we specialize it to bitstring
(`List Bool`) encodings via `BitstringEncoding`. Mathlib has **no** complexity classes, **no**
polynomial-time many-one reductions, **no** polynomial hierarchy, and **no** Cook–Levin
theorem; those are what this roadmap builds.

Statements are pinned with `sorry` where their proof is a milestone (allowed in this
human-owned roadmap library — these are goals, not proofs). The `def`s fix the objects the
roadmap is *about* so the statements are expressible at all; the implementation in `TauCeti/`
may refine names and namespaces.
-/

noncomputable section

open Turing

namespace TauCetiRoadmap.ComputationalComplexity

/-! ## Bitstrings and their encodings -/

/-- The input/output type of the machine model: finite binary strings. -/
abbrev Bitstring : Type := List Bool

/-- A canonical encoding of a type as bitstrings (`List Bool`). Different references may pick
different encodings of a type, but all sensible ones are polynomial-time transcodable, so the
particular choice is immaterial as long as it is consistent. -/
class BitstringEncoding (α : Type*) where
  /-- The encoding function. -/
  encode : α → Bitstring
  /-- The decoding function; `none` on bitstrings that encode nothing. -/
  decode : Bitstring → Option α
  /-- Decoding is a left inverse of encoding. -/
  decode_encode : ∀ x, decode (encode x) = some x

/-- Bitstrings encode themselves. -/
instance : BitstringEncoding Bitstring where
  encode := id
  decode := some
  decode_encode _ := rfl

/-- `Bool` encodes as a single bit. -/
instance : BitstringEncoding Bool where
  encode b := [b]
  decode
    | [b] => some b
    | _ => none
  decode_encode _ := rfl

/-- A self-delimiting transform: prefix each bit of `l` with a `true` continuation marker and
end with `false`, so a `delimit`-ed block can be parsed out of a longer string. This is the
building block for encoding composite types (`Prod`, `List`, …); see `README.md`. -/
def delimit : Bitstring → Bitstring
  | [] => [false]
  | b :: l => true :: b :: delimit l

/-- Concatenate a self-delimited first argument with a second, so `x` and `w` can be recovered
from `pair x w`. Used to feed an (input, witness) pair to a verifier without a generic `Prod`
encoding. -/
def pair (x w : Bitstring) : Bitstring := delimit x ++ w

/-! ## Polynomial-time computability -/

/-- A function is polynomial-time computable when some bitstring-encoded two-stack Turing
machine computes it within a polynomial step bound. -/
def IsPolyTime {α β : Type} [BitstringEncoding α] [BitstringEncoding β] (f : α → β) : Prop :=
  Nonempty (TM2ComputableInPolyTime
    (BitstringEncoding.encode (α := α)) (BitstringEncoding.encode (α := β)) f)

/-- **Milestone.** The identity is polynomial-time (immediate from Mathlib's
`idComputableInPolyTime`, once the encoding alphabet is `Bool`). -/
theorem isPolyTime_id {α : Type} [BitstringEncoding α] : IsPolyTime (id : α → α) := by
  sorry

/-- **Milestone: closure under composition.** This is the load-bearing early result — every
downstream fact (transitivity of reductions, well-behavedness of the witness operators, the
Karp reductions) depends on it, and it is genuinely absent from Mathlib. -/
theorem isPolyTime_comp {α β γ : Type}
    [BitstringEncoding α] [BitstringEncoding β] [BitstringEncoding γ]
    {g : β → γ} {f : α → β} (hg : IsPolyTime g) (hf : IsPolyTime f) :
    IsPolyTime (g ∘ f) := by
  sorry

/-! ## Decision problems and complexity classes -/

/-- A decision problem: a predicate on bitstrings. -/
abbrev BitstringDecisionProblem : Type := Bitstring → Bool

/-- A complexity class is a set of decision problems. -/
abbrev ComplexityClass : Type := Set BitstringDecisionProblem

/-- The complement class: the problems whose pointwise negation lies in `C`. -/
def complement (C : ComplexityClass) : ComplexityClass :=
  { L | (fun x => !L x) ∈ C }

/-- **`P`**: decision problems decidable in deterministic polynomial time. -/
def P : ComplexityClass := { L | IsPolyTime L }

/-- **`∃ᴾ C`**: problems decidable with polynomially long membership witnesses checked by a
verifier in `C`. The verifier reads the delimited `(input, witness)` pair. -/
def existsP (C : ComplexityClass) : ComplexityClass :=
  { L | ∃ (p : Polynomial ℕ) (V : BitstringDecisionProblem), V ∈ C ∧
      ∀ x, L x = true ↔ ∃ w : Bitstring, w.length ≤ p.eval x.length ∧ V (pair x w) = true }

/-- **`∀ᴾ C`**: problems decidable with polynomially long non-membership witnesses. -/
def forallP (C : ComplexityClass) : ComplexityClass :=
  { L | ∃ (p : Polynomial ℕ) (V : BitstringDecisionProblem), V ∈ C ∧
      ∀ x, L x = true ↔ ∀ w : Bitstring, w.length ≤ p.eval x.length → V (pair x w) = true }

/-- **`NP`** as `∃ᴾ P`. -/
def NP : ComplexityClass := existsP P

/-- **`coNP`** as `∀ᴾ P`. -/
def coNP : ComplexityClass := forallP P

/-- The `n`th `Σ` level of the polynomial hierarchy, `Σᴾ 0 = P` and `Σᴾ (n+1) = ∃ᴾ (Πᴾ n)`,
with `Πᴾ n` inlined as the complement of `Σᴾ n`. -/
def sigmaP : ℕ → ComplexityClass
  | 0 => P
  | (n + 1) => existsP (complement (sigmaP n))

/-- The `n`th `Π` level, `Πᴾ n = (Σᴾ n)ᶜ`. -/
def piP (n : ℕ) : ComplexityClass := complement (sigmaP n)

/-- **`PH`**, the union of all levels of the polynomial hierarchy. -/
def PH : ComplexityClass := ⋃ n, sigmaP n

/-! ## Basic inclusions -/

/-- **Milestone.** `Σᴾ 1 = NP`, a definitional sanity check on the hierarchy. -/
theorem sigmaP_one : sigmaP 1 = NP := by
  sorry

/-- **Milestone.** `P ⊆ NP` (trivial witness, ignored by the verifier). -/
theorem p_subset_np : P ⊆ NP := by
  sorry

/-- **Milestone.** `P ⊆ coNP`. -/
theorem p_subset_conp : P ⊆ coNP := by
  sorry

/-! ## Reductions, NP-hardness, and NP-completeness -/

/-- A polynomial-time many-one reduction from `A` to `B`: a polynomial-time map on bitstrings
that carries membership in `A` to membership in `B`. -/
def PolyTimeReduction (A B : BitstringDecisionProblem) : Prop :=
  ∃ f : Bitstring → Bitstring, IsPolyTime f ∧ ∀ x, A x = B (f x)

/-- **Milestone.** Reductions compose (rests on `isPolyTime_comp`). -/
theorem polyTimeReduction_trans {A B C : BitstringDecisionProblem}
    (hAB : PolyTimeReduction A B) (hBC : PolyTimeReduction B C) :
    PolyTimeReduction A C := by
  sorry

/-- `L` is **NP-hard** when every problem in `NP` reduces to it. -/
def NPHard (L : BitstringDecisionProblem) : Prop := ∀ A ∈ NP, PolyTimeReduction A L

/-- `L` is **NP-complete** when it is in `NP` and NP-hard. -/
def NPComplete (L : BitstringDecisionProblem) : Prop := L ∈ NP ∧ NPHard L

/-- **Summit (Cook–Levin), schematic.** Some explicit NP-complete problem exists; the roadmap
realizes this as the NP-completeness of Boolean satisfiability, which requires the encoding of
CNF formulas as bitstrings developed in `README.md`. Stated here only as the existence claim
the summit discharges. -/
theorem exists_npComplete : ∃ L : BitstringDecisionProblem, NPComplete L := by
  sorry

end TauCetiRoadmap.ComputationalComplexity
