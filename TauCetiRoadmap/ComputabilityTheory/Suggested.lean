import Mathlib

/-!
# Computability theory and finite-injury constructions: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems, and the targets of its layers, against the pinned Mathlib, on its own prototypes of the
carriers (README, Convention 16): set oracles, single-oracle programs with a fuelled evaluator that
records the use, the numberings `Phi` and `W`, enumeration stages, the jump and low sets, simple
sets, approximations and the injury objects. Each prototype is the same mathematical object as the
Tau Ceti carrier the README names beside it; the fuelled evaluator agrees with Tau Ceti's bounded
runs in its limit semantics and its stage conventions, not stage by stage. An implementation
states the theorems on Tau Ceti's carriers.

The headline theorems are `friedberg_muchnik` (Layer 7); `sacks_splitting`, with its uniform form
`sacks_splitting_uniform_indices`, `exists_simple_avoiding` and `low_incomparable_split` (Layer 8);
and `post_sigma`, `post_delta` and `limitLemma` (Layers 3 and 4). Every headline theorem is
statable at the pins. Several statements restate, on the prototypes, results that Tau Ceti proves;
the README lists them under Scope and ownership.

All definitions have bodies, and every `sorry` is the proof of a theorem. The finite examples of
Layer 6 and the zero restraint of large indices in Layer 8 are proved from the definitions. A few
statements are derived from other stated theorems; such a proof is conditional on the statements it
uses. The set notation `A ≤ᵀ B` expands to Mathlib's reducibility of partial functions between
the characteristic functions; it introduces no second notion of reducibility.

Reference: [S] R. I. Soare, *Recursively Enumerable Sets and Degrees*, Springer, 1987.
-/

namespace TauCetiRoadmap.ComputabilityTheory

open scoped BigOperators

/-! ## Layer 0: oracle computations and the use principle -/

/-- A set oracle supplies a total 0/1 answer, including negative answers. -/
noncomputable def characteristic (A : Set ℕ) (x : ℕ) : ℕ := by
  classical
  exact if x ∈ A then 1 else 0

/-- A total natural-valued oracle, viewed as a Mathlib partial function. -/
def totalOracle (O : ℕ → ℕ) : ℕ →. ℕ := fun x => Part.some (O x)

/-- The total characteristic function, viewed as a Mathlib partial function. -/
noncomputable def oracle (A : Set ℕ) : ℕ →. ℕ :=
  fun x => Part.some (characteristic A x)

/-- The set oracle is the total oracle of the characteristic function. -/
theorem oracle_eq_totalOracle (A : Set ℕ) : oracle A = totalOracle (characteristic A) := rfl

local notation:50 A " ≤ᵀ " B => _root_.TuringReducible (oracle A) (oracle B)
local notation:50 A " ≡ᵀ " B => _root_.TuringEquivalent (oracle A) (oracle B)

namespace Oracle.Single

/-- Oracle programs: the basic functions, a query to the oracle, pairing, composition, primitive
recursion and unbounded search. -/
inductive Code where
  | zero
  | succ
  | left
  | right
  | oracle
  | pair (f g : Code)
  | comp (f g : Code)
  | prec (f g : Code)
  | rfind' (f : Code)
  deriving DecidableEq

namespace Code

/-- A numeric coding of oracle programs. -/
def encode : Code → ℕ
  | .zero => 0
  | .succ => 1
  | .left => 2
  | .right => 3
  | .oracle => 4
  | .pair f g => 4 * Nat.pair (encode f) (encode g) + 5
  | .comp f g => 4 * Nat.pair (encode f) (encode g) + 6
  | .prec f g => 4 * Nat.pair (encode f) (encode g) + 7
  | .rfind' f => 4 * encode f + 8

/-- Fuel makes decoding a structural recursion even on arbitrary numeric inputs. -/
def decodeFuel : ℕ → ℕ → Option Code
  | 0, _ => none
  | _ + 1, 0 => some .zero
  | _ + 1, 1 => some .succ
  | _ + 1, 2 => some .left
  | _ + 1, 3 => some .right
  | _ + 1, 4 => some .oracle
  | k + 1, n + 5 =>
      let m := n / 4
      match n % 4 with
      | 0 => do
          let f ← decodeFuel k m.unpair.1
          let g ← decodeFuel k m.unpair.2
          pure (.pair f g)
      | 1 => do
          let f ← decodeFuel k m.unpair.1
          let g ← decodeFuel k m.unpair.2
          pure (.comp f g)
      | 2 => do
          let f ← decodeFuel k m.unpair.1
          let g ← decodeFuel k m.unpair.2
          pure (.prec f g)
      | _ => .rfind' <$> decodeFuel k m

/-- All numeric indices decode; adequacy includes the two round trips below. -/
def ofNat (n : ℕ) : Code := (decodeFuel (n + 1) n).getD .zero

/-- Decoding inverts the numbering of programs. -/
theorem ofNat_encode (c : Code) : ofNat (encode c) = c := by
  sorry

/-- Every number is the number of a program: the numbering is a bijection. -/
theorem encode_ofNat (n : ℕ) : encode (ofNat n) = n := by
  sorry

/-- A successful run records an output and an exclusive oracle-use bound. -/
structure Halt where
  output : ℕ
  use : ℕ
  deriving DecidableEq

/-- Bounded minimization. A test with no answer stops the search rather than being skipped. -/
def search (test : ℕ → Option Halt) : ℕ → ℕ → ℕ → Option Halt
  | 0, _, _ => none
  | k + 1, n, used =>
      match test n with
      | none => none
      | some d =>
          let used' := max used d.use
          if d.output = 0 then some ⟨n, used'⟩ else search test k (n + 1) used'

/--
Raw bounded evaluation against partial *answers*. `none` at a query means no supplied answer,
not a negative answer. Termination is structural in fuel. This evaluator is a mathematical
algorithm; no `partial`, `opaque`, or assumed evaluation relation is used.
-/
def run : ℕ → (ℕ → Option ℕ) → Code → ℕ → Option Halt
  | 0, _, _, _ => none
  | s + 1, O, c, x =>
      match c with
      | .zero => some ⟨0, 0⟩
      | .succ => some ⟨x + 1, 0⟩
      | .left => some ⟨x.unpair.1, 0⟩
      | .right => some ⟨x.unpair.2, 0⟩
      | .oracle => (O x).map fun y => ⟨y, x + 1⟩
      | .pair f g => do
          let df ← run s O f x
          let dg ← run s O g x
          pure ⟨Nat.pair df.output dg.output, max df.use dg.use⟩
      | .comp f g => do
          let dg ← run s O g x
          let df ← run s O f dg.output
          pure ⟨df.output, max dg.use df.use⟩
      | .prec f g =>
          let a := x.unpair.1
          let n := x.unpair.2
          Nat.rec (run s O f a)
            (fun j previous => do
              let d ← previous
              let d' ← run s O g (Nat.pair a (Nat.pair j d.output))
              pure ⟨d'.output, max d.use d'.use⟩) n
      | .rfind' f =>
          search (fun n => run s O f (Nat.pair x.unpair.1 n))
            (s + 1) x.unpair.2 0

/-- The induced partial function; determinism is a theorem about the evaluator. -/
noncomputable def eval (O : ℕ → ℕ) (c : Code) (x : ℕ) : Part ℕ where
  Dom := ∃ s d, run s (fun n => some (O n)) c x = some d
  get h :=
    have hs : ∃ s, (run s (fun n => some (O n)) c x).isSome := h.imp fun _ ⟨_, hd⟩ => by simp [hd]
    ((run (Nat.find hs) (fun n => some (O n)) c x).get (Nat.find_spec hs)).output

/-- One finite-oracle bounded run, with Soare's external stage bounds. -/
def stage (s : ℕ) (σ : List ℕ) (e x : ℕ) : Option Halt :=
  match run s (fun n => σ[n]?) (ofNat e) x with
  | none => none
  | some d =>
      if e < s ∧ x < s ∧ d.output < s ∧ d.use ≤ s then some d else none

/-- The initial segment on addresses strictly below `n`. -/
noncomputable def initialSegment (Z : Set ℕ) (n : ℕ) : List ℕ :=
  List.ofFn fun i : Fin n => characteristic Z i

/-- Bounded evaluation on the complete set oracle, exposed through a finite prefix. -/
noncomputable def stageAt (s : ℕ) (Z : Set ℕ) (e x : ℕ) : Option Halt :=
  stage s (initialSegment Z s) e x

/-- Stage use, zero when there is no convergent computation [S, III.1.7]. A convergent
computation can also have use zero. -/
noncomputable def stageUse (s : ℕ) (Z : Set ℕ) (e x : ℕ) : ℕ :=
  ((stageAt s Z e x).map Halt.use).getD 0

/-- The query-free embedding of Mathlib's ordinary codes. -/
def embed : Nat.Partrec.Code → Code
  | .zero => .zero
  | .succ => .succ
  | .left => .left
  | .right => .right
  | .pair f g => .pair (embed f) (embed g)
  | .comp f g => .comp (embed f) (embed g)
  | .prec f g => .prec (embed f) (embed g)
  | .rfind' f => .rfind' (embed f)

/-- The embedding of an ordinary program evaluates, against every oracle, to the ordinary
program. -/
theorem eval_embed (O : ℕ → ℕ) (c : Nat.Partrec.Code) (x : ℕ) :
    eval O (embed c) x = c.eval x := by
  sorry

/-- A successful run persists, with the same result, at every larger fuel. -/
theorem run_persistent {s t : ℕ} {O : ℕ → Option ℕ} {c : Code} {x : ℕ} {d : Halt}
    (hst : s ≤ t) (h : run s O c x = some d) : run t O c x = some d := by
  sorry

/-- Equality of all answers below the recorded use suffices, even for partial answers. -/
theorem run_use {s : ℕ} {O P : ℕ → Option ℕ} {c : Code} {x : ℕ} {d : Halt}
    (h : run s O c x = some d) (hOP : ∀ z, z < d.use → O z = P z) :
    run s P c x = some d := by
  sorry

/-- The output and the use of a successful run do not depend on the fuel. -/
theorem run_unique {s t : ℕ} {O : ℕ → Option ℕ} {c : Code} {x : ℕ} {d d' : Halt}
    (h : run s O c x = some d) (h' : run t O c x = some d') : d = d' := by
  sorry

/-- Soare's stage bounds: a stage computation has index, input and output below the stage, and
use at most the stage and at most the length of the string. -/
theorem stage_bounds {s e x : ℕ} {σ : List ℕ} {d : Halt}
    (h : stage s σ e x = some d) :
    e < s ∧ x < s ∧ d.output < s ∧ d.use ≤ s ∧ d.use ≤ σ.length := by
  sorry

/-- Bounded simulation is computable, with the program given by its index. -/
theorem stage_computable :
    Computable (fun p : ℕ × (List ℕ × (ℕ × ℕ)) =>
      (stage p.1 p.2.1 p.2.2.1 p.2.2.2).map fun d => (d.output, d.use)) := by
  sorry

/-- A stage computation against a fixed set persists, with the same result, at every larger
stage. -/
theorem stageAt_persistent {s t : ℕ} {Z : Set ℕ} {e x : ℕ} {d : Halt}
    (hst : s ≤ t) (h : stageAt s Z e x = some d) : stageAt t Z e x = some d := by
  sorry

/-- The use principle for stage computations: a set agreeing below the use gives the same stage
computation. -/
theorem stageAt_agreement {s : ℕ} {Z Y : Set ℕ} {e x : ℕ} {d : Halt}
    (h : stageAt s Z e x = some d)
    (hZY : ∀ z, z < d.use → (z ∈ Z ↔ z ∈ Y)) :
    stageAt s Y e x = some d := by
  sorry

end Code
end Oracle.Single

open Oracle.Single

/-- The chosen acceptable numbering of computations relative to a total natural-valued oracle. -/
noncomputable def PhiTotal (O : ℕ → ℕ) (e : ℕ) : ℕ →. ℕ :=
  Code.eval O (Code.ofNat e)

/-- The set-oracle numbering, the 0/1-valued specialization of `PhiTotal`. -/
noncomputable def Phi (Z : Set ℕ) (e : ℕ) : ℕ →. ℕ :=
  PhiTotal (characteristic Z) e

/-- `W^Z_e`, the domain of `Φ^Z_e`. -/
def W (Z : Set ℕ) (e : ℕ) : Set ℕ := {x | (Phi Z e x).Dom}

/-- Raw bounded domain approximation; serialization is a separate theorem. -/
noncomputable def WStage (Z : Set ℕ) (e s : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range s).filter fun x => (Code.stageAt s Z e x).isSome

/-- A value of `Φ^Z_e` at `x` is the output of a stage computation. -/
theorem mem_phi_iff_stage (Z : Set ℕ) (e x y : ℕ) :
    y ∈ Phi Z e x ↔ ∃ s d, Code.stageAt s Z e x = some d ∧ d.output = y := by
  sorry

/-- Extensional adequacy for a fixed total oracle, for arbitrary partial functions. Nonreducibility
results use the direction from `RecursiveIn` to codes; positive algorithms use the converse. -/
theorem recursiveIn_iff_code_total (O : ℕ → ℕ) (f : ℕ →. ℕ) :
    RecursiveIn {totalOracle O} f ↔ ∃ e, PhiTotal O e = f := by
  sorry

/-- Adequacy for set oracles, the 0/1-valued specialization. -/
theorem recursiveIn_iff_code (Z : Set ℕ) (f : ℕ →. ℕ) :
    RecursiveIn {oracle Z} f ↔ ∃ e, Phi Z e = f :=
  recursiveIn_iff_code_total (characteristic Z) f

/-- One universal program, the same for every oracle. -/
theorem universal_oracle_program :
    ∃ u, ∀ (O : ℕ → ℕ) (e x : ℕ), PhiTotal O u (Nat.pair e x) = PhiTotal O e x := by
  sorry

/-- The translation from Mathlib's ordinary codes is computable on encoded programs. With
`Code.eval_embed` it is a translation of numberings that is correct for every oracle. -/
theorem embed_computable :
    Computable (fun c : Nat.Partrec.Code => Code.encode (Code.embed c)) := by
  sorry

/-- The s-m-n theorem, with a computable parameter compiler independent of the oracle. -/
theorem smn_uniform :
    ∃ c : ℕ → ℕ → ℕ, Computable (fun p : ℕ × ℕ => c p.1 p.2) ∧
      ∀ (Z : Set ℕ) (e a x : ℕ), Phi Z (c e a) x = Phi Z e (Nat.pair a x) := by
  sorry

/-- The recursion theorem, uniform in the oracle: for computable `f` some index `e` has
`Φ^Z_e = Φ^Z_{f e}` for every set `Z`. -/
theorem fixed_point_uniform_in_oracle (f : ℕ → ℕ) (hf : Computable f) :
    ∃ e, ∀ Z : Set ℕ, Phi Z e = Phi Z (f e) := by
  sorry

/-- Pointwise adequacy does not give one program for a family of oracle-computable functions. Each
`fun _ => if Z = ∅ then 1 else 0` is a constant, but a program halting on `∅` with use `u` gives the
same output on `{u}`. -/
theorem no_uniform_program_for_emptiness :
    ¬ ∃ e, ∀ Z : Set ℕ,
      Phi Z e = fun _ => Part.some (by classical exact if Z = ∅ then 1 else 0) := by
  sorry

/-! ## Layer 1: c.e. sets and effective presentations of enumerations -/

/-- Relative c.e.-ness specializes the existing `RecursiveIn` predicate. -/
def REPredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  RecursiveIn {oracle Z} (fun x => Part.assert (p x) fun _ => Part.some ())

/-- Decidability relative to `Z`: a decision procedure computable in `Z`. -/
def ComputablePredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  ∃ d : DecidablePred p,
    ComputableIn {oracle Z} (fun x => @decide (p x) (d x))

/-- C.e. relative to the empty set is Mathlib's c.e. -/
theorem rePredIn_empty_iff (p : ℕ → Prop) : REPredIn ∅ p ↔ REPred p := by
  sorry

/-- Computable relative to the empty set is Mathlib's computable. -/
theorem computablePredIn_empty_iff (p : ℕ → Prop) :
    ComputablePredIn ∅ p ↔ ComputablePred p := by
  sorry

/-- A set is c.e. in `Z` iff it is `W^Z_e` for some index `e`. -/
theorem rePredIn_iff_W (Z C : Set ℕ) :
    REPredIn Z (fun x => x ∈ C) ↔ ∃ e, W Z e = C := by
  sorry

/-- The stages of `W^Z_e` increase. -/
theorem WStage_mono (Z : Set ℕ) (e : ℕ) : Monotone (WStage Z e) := by
  sorry

/-- `W^Z_e` is the union of its stages. -/
theorem mem_W_iff_mem_stage (Z : Set ℕ) (e x : ℕ) :
    x ∈ W Z e ↔ ∃ s, x ∈ WStage Z e s := by
  sorry

/-- The canonical index `∑ x ∈ F, 2 ^ x` of a finite set [S, II.2]. -/
def finiteCode (F : Finset ℕ) : ℕ := ∑ x ∈ F, 2 ^ x

/-- A concrete decoder; a set bit of `n` has index less than `n`. -/
def finiteDecode (n : ℕ) : Finset ℕ :=
  (Finset.range n).filter fun x => n.testBit x = true

/-- Decoding inverts the canonical code of a finite set. -/
theorem finiteDecode_finiteCode (F : Finset ℕ) : finiteDecode (finiteCode F) = F := by
  sorry

/-- Every number is the canonical code of a finite set. -/
theorem finiteCode_finiteDecode (n : ℕ) : finiteCode (finiteDecode n) = n := by
  sorry

/-- Membership in the finite set with a given code is computable. -/
theorem finiteDecode_membership_computable :
    ComputablePred (fun p : ℕ × ℕ => p.2 ∈ finiteDecode p.1) := by
  sorry

/-- The canonical code of the set of entries of a list is computable from the list. -/
theorem finiteCode_list_computable :
    Computable (fun xs : List ℕ => finiteCode xs.toFinset) := by
  sorry

/-- The union of the finite contents at the ends of all stages. -/
def stageLimit (A : ℕ → Finset ℕ) : Set ℕ := {x | ∃ s, x ∈ A s}

/-- Entries made at stage `s + 1`; restraints for this transition are read at `s`. -/
def fresh (A : ℕ → Finset ℕ) (s : ℕ) : Finset ℕ := A (s + 1) \ A s

/-- An enumeration by finite stages: empty at stage `0`, increasing, and with canonical codes
computable in the stage. -/
structure CEApproximation where
  stage : ℕ → Finset ℕ
  stage_zero : stage 0 = ∅
  monotone : Monotone stage
  computable : Computable (fun s => finiteCode (stage s))

/-- A set is c.e. iff it is the limit of an enumeration by computable increasing finite stages
starting empty. -/
theorem re_iff_finiteStages (C : Set ℕ) :
    REPred (fun x => x ∈ C) ↔ ∃ A : CEApproximation, stageLimit A.stage = C := by
  sorry

/-- Serialization with pauses, covering finite and empty sets uniformly. -/
theorem serialized_ce_approximation (A : CEApproximation) :
    ∃ B : CEApproximation,
      stageLimit B.stage = stageLimit A.stage ∧ ∀ s, (fresh B.stage s).card ≤ 1 := by
  sorry

/-- Under increasing stages a number enters at most once. -/
theorem unique_entry_stage {A : ℕ → Finset ℕ} (hA : Monotone A)
    {s t x : ℕ} (hs : x ∈ fresh A s) (ht : x ∈ fresh A t) : s = t := by
  sorry

/-- Under increasing stages, the stages eventually agree with the limit below any bound. -/
theorem finite_prefix_stabilizes {A : ℕ → Finset ℕ} (hA : Monotone A) (u : ℕ) :
    ∃ s₀, ∀ s, s₀ ≤ s → ∀ x, x < u → (x ∈ A s ↔ x ∈ stageLimit A) := by
  sorry

/-! ## Layer 2: numberings, reductions, joins and searches -/

/-- The parity join `A ⊕ B = {2x | x ∈ A} ∪ {2x + 1 | x ∈ B}`. -/
def join (A B : Set ℕ) : Set ℕ :=
  {n | if n % 2 = 0 then n / 2 ∈ A else n / 2 ∈ B}

/-- The column containing the potential witnesses for requirement `e`. -/
def column (e : ℕ) : Set ℕ := {n | n.unpair.2 = e}

/-- Every column `ω^[e]` is infinite. -/
theorem column_infinite (e : ℕ) : (column e).Infinite := by
  sorry

/-- The parity join is a least upper bound: it reduces to `C` exactly when both sets do. -/
theorem join_le_iff (A B C : Set ℕ) :
    (join A B ≤ᵀ C) ↔ (A ≤ᵀ C) ∧ (B ≤ᵀ C) := by
  sorry

/-- [S, VII.3.3]. The reductions use the enumerations of both halves. -/
theorem ce_split_reductions (B A₀ A₁ : Set ℕ)
    (h₀ : REPred (fun x => x ∈ A₀)) (h₁ : REPred (fun x => x ∈ A₁))
    (hd : Disjoint A₀ A₁) (hu : A₀ ∪ A₁ = B) :
    (A₀ ≤ᵀ B) ∧ (A₁ ≤ᵀ B) ∧ (B ≡ᵀ join A₀ A₁) := by
  sorry

/-! ## Layer 3: the jump, the arithmetical hierarchy and index sets -/

/-- Soare's diagonal halting set. -/
def jump (Z : Set ℕ) : Set ℕ := {e | e ∈ W Z e}

/-- Soare's paired halting set uses the coordinate order `(input, index)`. -/
def K₀ (Z : Set ℕ) : Set ℕ := {n | n.unpair.1 ∈ W Z n.unpair.2}

/-- The iterated jump `Z⁽ⁿ⁾`. -/
def iterateJump : ℕ → Set ℕ → Set ℕ
  | 0, Z => Z
  | n + 1, Z => jump (iterateJump n Z)

/-- `A` is low if `A' ≡ᵀ ∅'`. -/
def Low (A : Set ℕ) : Prop := jump A ≡ᵀ jump ∅

/-- `Z <_T Z′`: a set reduces to its jump, and the jump does not reduce to the set. -/
theorem jump_strict (Z : Set ℕ) : (Z ≤ᵀ jump Z) ∧ ¬ (jump Z ≤ᵀ Z) := by
  sorry

/-- The jump is monotone under Turing reducibility. -/
theorem jump_monotone {Z Y : Set ℕ} (h : Z ≤ᵀ Y) : jump Z ≤ᵀ jump Y := by
  sorry

/-- The paired and the diagonal halting sets are Turing equivalent. -/
theorem paired_halting_equiv (Z : Set ℕ) : K₀ Z ≡ᵀ jump Z := by
  sorry

/-- Every set c.e. in `Z` many-one reduces to `Z′`. -/
theorem relative_ce_reduces_jump {Z C : Set ℕ}
    (hC : REPredIn Z (fun x => x ∈ C)) :
    ManyOneReducible (fun x => x ∈ C) (fun x => x ∈ jump Z) := by
  sorry

/-- `Σ⁰ₙ(Z)` by alternating number quantifiers over a `Z`-computable matrix. -/
def SigmaIn : ℕ → Set ℕ → (ℕ → Prop) → Prop
  | 0, Z, p => ComputablePredIn Z p
  | n + 1, Z, p =>
      ∃ q : ℕ → Prop,
        SigmaIn n Z (fun z => ¬ q z) ∧ ∀ x, p x ↔ ∃ y, q (Nat.pair x y)

/-- `Π⁰ₙ(Z)`: the predicates whose negation is `Σ⁰ₙ(Z)`. -/
def PiIn (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  SigmaIn n Z (fun x => ¬ p x)

/-- `Δ⁰ₙ(Z) = Σ⁰ₙ(Z) ∩ Π⁰ₙ(Z)`. -/
def DeltaIn (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  SigmaIn n Z p ∧ PiIn n Z p

/-- Post's theorem, relativized: `Σ⁰ₙ₊₁(Z)` is the class of predicates c.e. in `Z⁽ⁿ⁾`. -/
theorem post_sigma (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) :
    SigmaIn (n + 1) Z p ↔ REPredIn (iterateJump n Z) p := by
  sorry

/-- Post's theorem, relativized: `Δ⁰ₙ₊₁(Z)` is the class of predicates computable in `Z⁽ⁿ⁾`. -/
theorem post_delta (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) :
    DeltaIn (n + 1) Z p ↔ ComputablePredIn (iterateJump n Z) p := by
  sorry

/-! ## Layer 4: moduli, limit approximation and stabilization information -/

/-- `a x s` is the stage-`s` approximation to the value at argument `x`. -/
def EventuallyAgrees (a : ℕ → ℕ → ℕ) (f : ℕ → ℕ) : Prop :=
  ∀ x, ∃ s₀, ∀ s, s₀ ≤ s → a x s = f x

/-- `m` is a modulus of the approximation `a` of `f`: from stage `m x` on, the approximation at `x`
equals `f x`. -/
def IsModulus (a : ℕ → ℕ → ℕ) (f m : ℕ → ℕ) : Prop :=
  ∀ x s, m x ≤ s → a x s = f x

/-- The Limit Lemma [S, III.3.3], relativized: a total function is computable in `Z′` iff it is the
pointwise eventually constant limit of an approximation computable in `Z`. -/
theorem limitLemma (Z : Set ℕ) (f : ℕ → ℕ) :
    ComputableIn {oracle (jump Z)} f ↔
      ∃ a : ℕ → ℕ → ℕ,
        ComputableIn {oracle Z} (fun p : ℕ × ℕ => a p.1 p.2) ∧
          EventuallyAgrees a f := by
  sorry

/-- The Modulus Lemma [S, III.3.2], forward direction: a function computable in a c.e. set `Z` has
a computable approximation with a modulus computable in `Z`. -/
theorem modulus_of_ce_oracle (Z : Set ℕ) (hZ : REPred (fun x => x ∈ Z))
    (f : ℕ → ℕ) (hf : ComputableIn {oracle Z} f) :
    ∃ (a : ℕ → ℕ → ℕ) (m : ℕ → ℕ),
      Computable (fun p : ℕ × ℕ => a p.1 p.2) ∧
      ComputableIn {oracle Z} m ∧ IsModulus a f m := by
  sorry

/-- A computable approximation with a computable modulus has a computable limit. -/
theorem computable_of_computable_modulus (a : ℕ → ℕ → ℕ) (f m : ℕ → ℕ)
    (ha : Computable (fun p : ℕ × ℕ => a p.1 p.2)) (hm : Computable m)
    (h : IsModulus a f m) : Computable f := by
  sorry

/-- A convergent computation relative to the pointwise limit of oracles `Z s` is seen at all
large stages. -/
theorem eventually_stage_of_limit_computation (Z : ℕ → Set ℕ) (Zlim : Set ℕ)
    (hZ : ∀ n, ∃ s₀, ∀ s, s₀ ≤ s → (n ∈ Z s ↔ n ∈ Zlim))
    {e x y : ℕ} (h : y ∈ Phi Zlim e x) :
    ∃ (s₀ : ℕ) (d : Code.Halt), d.output = y ∧
      ∀ s, s₀ ≤ s → Code.stageAt s (Z s) e x = some d := by
  sorry

/-! ## Layer 5: diagonalization, simple sets and the Kleene–Post construction -/

/-- An immune set: infinite, with every c.e. subset finite. -/
def Immune (B : Set ℕ) : Prop :=
  B.Infinite ∧ ∀ C : Set ℕ, REPred (fun x => x ∈ C) → C ⊆ B → C.Finite

/-- A simple set: c.e., with immune complement. -/
def Simple (A : Set ℕ) : Prop := REPred (fun x => x ∈ A) ∧ Immune Aᶜ

/-- Disjoint sets that no computable set separates. -/
def ComputablyInseparable (A B : Set ℕ) : Prop :=
  Disjoint A B ∧
    ¬ ∃ C : Set ℕ, ComputablePred (fun x => x ∈ C) ∧ A ⊆ C ∧ Disjoint B C

/-- There are two computably inseparable c.e. sets. -/
theorem exists_computablyInseparable_ce :
    ∃ A B : Set ℕ, REPred (fun x => x ∈ A) ∧ REPred (fun x => x ∈ B) ∧
      ComputablyInseparable A B := by
  sorry

/-- The requirement characterization: a c.e. set is simple iff its complement is infinite and it
meets every infinite `W_e`. -/
theorem simple_iff_requirements (A : Set ℕ) :
    Simple A ↔ REPred (fun x => x ∈ A) ∧ Aᶜ.Infinite ∧
      ∀ e, (W ∅ e).Infinite → (W ∅ e ∩ A).Nonempty := by
  sorry

/-- A simple set exists. -/
theorem exists_simple : ∃ A : Set ℕ, Simple A := by
  sorry

/-- A simple set is not computable. -/
theorem simple_not_computable {A : Set ℕ} (hA : Simple A) :
    ¬ ComputablePred (fun x => x ∈ A) := by
  sorry

/-- Kleene–Post [S, VI.1.2]: there are two sets below `∅′`, neither Turing reducible to the other. -/
theorem kleene_post :
    ∃ A B : Set ℕ, (A ≤ᵀ jump ∅) ∧ (B ≤ᵀ jump ∅) ∧
      ¬ (A ≤ᵀ B) ∧ ¬ (B ≤ᵀ A) := by
  sorry

/-- A low simple set exists [S, VII.1.1]. -/
theorem exists_low_simple : ∃ A : Set ℕ, Simple A ∧ Low A := by
  sorry

/-- A c.e. set strictly between `∅` and `∅′`: not computable, reducible to `∅′`, and not
computing `∅′`. -/
theorem exists_intermediate_ce_degree :
    ∃ A : Set ℕ, REPred (fun x => x ∈ A) ∧
      ¬ ComputablePred (fun x => x ∈ A) ∧ (A ≤ᵀ jump ∅) ∧ ¬ (jump ∅ ≤ᵀ A) := by
  sorry

/-! ## Layer 6: injury sets, events, restraints and finite-injury reasoning -/

/-- The finite batch of numbers injuring `e` in the transition to stage `s + 1`. -/
def injuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ) : Finset ℕ :=
  (fresh A s).filter fun x => (r e s).any fun b => decide (x ≤ b)

/-- Use-prefix breaches: fresh entries strictly below an active restraint. A separate object from
the inclusive injury batch. -/
def useBreachesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ) : Finset ℕ :=
  (fresh A s).filter fun x => (r e s).any fun b => decide (x < b)

/-- Fresh entries at the active restraint boundary; inactive restraint has no boundary. -/
def boundaryInjuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (e s : ℕ) : Finset ℕ :=
  (fresh A s).filter fun x => r e s = some x

/-- The number set of use-prefix breaches. -/
def useBreachSet (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {x | ∃ s, x ∈ useBreachesAt A r e s}

/-- Soare's injury set `I_e` [S, VII.1, p.112], a set of numbers. -/
def injurySet (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {x | ∃ s, x ∈ injuriesAt A r e s}

/-- The first coordinate is the pre-stage; the injury occurs at its successor. -/
def injuryEvents (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set (ℕ × ℕ) :=
  {p | p.2 ∈ injuriesAt A r e p.1}

/-- The stages `s + 1` at which some number injures `e`. -/
def injuryStages (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {t | ∃ s, t = s + 1 ∧ (injuriesAt A r e s).Nonempty}

/-- Finite history through the end of stage `n`. -/
def injuriesThrough (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e n : ℕ) : Finset ℕ :=
  (Finset.range n).biUnion fun s => injuriesAt A r e s

/-- The injury set of `e` depends only on the stages and on the restraint of `e`. -/
theorem injurySet_congr {A B : ℕ → Finset ℕ}
    {r q : ℕ → ℕ → Option ℕ} {e : ℕ}
    (hA : ∀ s, A s = B s) (hr : ∀ s, r e s = q e s) :
    injurySet A r e = injurySet B q e := by
  sorry

/-- The injury numbers are the second coordinates of the injury events. -/
theorem injurySet_eq_image (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    injurySet A r e = Prod.snd '' injuryEvents A r e := by
  sorry

/-- The injury stages are the successors of the first coordinates of the injury events. -/
theorem injuryStages_eq_image (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    injuryStages A r e = (fun p : ℕ × ℕ => p.1 + 1) '' injuryEvents A r e := by
  sorry

/-- An injury batch is the union of the use-prefix breaches and the boundary entries. -/
theorem injuriesAt_eq_breach_union_boundary (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e s : ℕ) :
    injuriesAt A r e s = useBreachesAt A r e s ∪ boundaryInjuriesAt A r e s := by
  sorry

/-- Use-prefix breaches and boundary entries are disjoint. -/
theorem breaches_disjoint_boundary (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e s : ℕ) :
    Disjoint (useBreachesAt A r e s) (boundaryInjuriesAt A r e s) := by
  sorry

/-- Every use-prefix breach is an injury. -/
theorem useBreachSet_subset_injurySet (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    useBreachSet A r e ⊆ injurySet A r e := by
  sorry

/-- Eventual boundedness already gives finitely many injuring numbers, without monotone stages. -/
theorem finite_injurySet_of_eventually_bounded_restraint (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ)
    (hr : ∃ b s₀, ∀ s, s₀ ≤ s → ∀ a, r e s = some a → a ≤ b) :
    (injurySet A r e).Finite := by
  sorry

/-- Stabilization implies boundedness; only the further injury-stage conclusion needs
monotonicity. -/
theorem finite_injurySet_of_restraint_stabilizes (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ)
    (hr : ∃ (b : Option ℕ) (s₀ : ℕ), ∀ s, s₀ ≤ s → r e s = b) :
    (injurySet A r e).Finite := by
  sorry

/-- Under increasing stages, there are finitely many use-prefix breaches iff eventually none. -/
theorem finite_useBreachSet_iff_eventually_empty (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    (useBreachSet A r e).Finite ↔
      ∃ s₀, ∀ s, s₀ ≤ s → useBreachesAt A r e s = ∅ := by
  sorry

/-- Membership in an injury batch: a fresh entry at or below an active restraint. -/
theorem mem_injuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s x : ℕ) :
    x ∈ injuriesAt A r e s ↔
      x ∈ A (s + 1) ∧ x ∉ A s ∧ ∃ b, r e s = some b ∧ x ≤ b := by
  sorry

/-- An inactive restraint has no injuries. -/
theorem injuriesAt_none (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ)
    (h : r e s = none) : injuriesAt A r e s = ∅ := by
  sorry

/-- A fresh entry exactly at an active restraint is an injury. -/
theorem boundary_mem_injuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    {e s b : ℕ} (hr : r e s = some b) (hx : b ∈ fresh A s) :
    b ∈ injuriesAt A r e s := by
  sorry

/-- `s + 1` is an injury stage iff the batch read at stage `s` is nonempty. -/
theorem succ_mem_injuryStages (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ) :
    s + 1 ∈ injuryStages A r e ↔ (injuriesAt A r e s).Nonempty := by
  sorry

/-- Stage `0` is never an injury stage. -/
theorem zero_not_mem_injuryStages (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    0 ∉ injuryStages A r e := by
  sorry

/-- The injuries through stage `n` increase with `n`. -/
theorem injuriesThrough_mono (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    Monotone (injuriesThrough A r e) := by
  sorry

/-- A number is an injury iff it is among the injuries through some stage. -/
theorem mem_injurySet_iff_through (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e x : ℕ) :
    x ∈ injurySet A r e ↔ ∃ n, x ∈ injuriesThrough A r e n := by
  sorry

/-- Under monotone stages a number injures `e` at most once. -/
theorem injury_number_projection_injective (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    Set.InjOn (fun p : ℕ × ℕ => p.2) (injuryEvents A r e) := by
  sorry

/-- Under increasing stages, there are finitely many injury numbers iff finitely many injury
stages. -/
theorem finite_injurySet_iff_finite_injuryStages (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    (injurySet A r e).Finite ↔ (injuryStages A r e).Finite := by
  sorry

/-- Under increasing stages, the injury set is finite iff eventually no batch has an injury. -/
theorem finite_injurySet_iff_eventually_empty (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    (injurySet A r e).Finite ↔ ∃ s₀, ∀ s, s₀ ≤ s → injuriesAt A r e s = ∅ := by
  sorry

/-- `ncard` is used only with a finiteness premise: its value on infinite sets is not a bound. -/
theorem injuryStages_ncard_le (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (e : ℕ) (hA : Monotone A) (hI : (injurySet A r e).Finite) :
    (injuryStages A r e).ncard ≤ (injurySet A r e).ncard := by
  sorry

/-- With increasing stages, finite injury and at most one injuring entry at each stage, there are
as many injury stages as injury numbers. -/
theorem injuryStages_ncard_eq_of_single_entry (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A)
    (hI : (injurySet A r e).Finite) (hone : ∀ s, (injuriesAt A r e s).card ≤ 1) :
    (injuryStages A r e).ncard = (injurySet A r e).ncard := by
  sorry

/-- Membership in the injury batches is computable uniformly in the requirement index. -/
theorem injury_membership_computable (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (hA : Computable (fun s => finiteCode (A s)))
    (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    ComputablePred (fun p : ℕ × (ℕ × ℕ) => p.2.2 ∈ injuriesAt A r p.1 p.2.1) := by
  sorry

/-- The injury sets are c.e. uniformly in the requirement. -/
theorem injurySet_uniformly_ce (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (hA : Computable (fun s => finiteCode (A s))) (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    REPred (fun p : ℕ × ℕ => p.2 ∈ injurySet A r p.1) := by
  sorry

/-- The injury-stage sets are uniformly computable. -/
theorem injuryStages_uniformly_computable (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ)
    (hA : Computable (fun s => finiteCode (A s)))
    (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    ComputablePred (fun p : ℕ × ℕ => p.2 ∈ injuryStages A r p.1) := by
  sorry

/-- The injury-stage sets are c.e. uniformly in the requirement. -/
theorem injuryStages_uniformly_ce (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (hA : Computable (fun s => finiteCode (A s))) (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    REPred (fun p : ℕ × ℕ => p.2 ∈ injuryStages A r p.1) := by
  sorry

/-- The fresh entries attributed to contributor `i`. -/
def contributions (A : ℕ → Finset ℕ) (owner : ℕ → ℕ → ℕ) (i : ℕ) : Set ℕ :=
  {x | ∃ s, x ∈ fresh A s ∧ owner s x = i}

/-- Cause counting: if every injuring entry is attributed to a contributor of higher priority, and
contributor `i` supplies at most `budget i` distinct entries, then the injury set is finite with
at most `∑ i < e, budget i` elements. -/
theorem injury_budget (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (owner : ℕ → ℕ → ℕ) (budget : ℕ → ℕ) (e : ℕ)
    (htrace : ∀ s x, x ∈ injuriesAt A r e s → owner s x < e)
    (hfinite : ∀ i, i < e → (contributions A owner i).Finite)
    (hcard : ∀ i, i < e → (contributions A owner i).ncard ≤ budget i) :
    (injurySet A r e).Finite ∧
      (injurySet A r e).ncard ≤ ∑ i ∈ Finset.range e, budget i := by
  sorry

/-- A labelled event retains the monitored oracle even when both contain the same number. -/
def monitoredInjuryEvents {κ : Type*} (A : κ → ℕ → Finset ℕ)
    (target : ℕ → κ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set (κ × (ℕ × ℕ)) :=
  {p | p.1 = target e ∧ p.2 ∈ injuryEvents (A (target e)) r e}

/-- Membership in the labelled events of `e`: an injury in the stages of its target set. -/
theorem monitoredInjuryEvents_mem {κ : Type*} (A : κ → ℕ → Finset ℕ)
    (target : ℕ → κ) (r : ℕ → ℕ → Option ℕ) (e s x : ℕ) :
    (target e, (s, x)) ∈ monitoredInjuryEvents A target r e ↔
      x ∈ injuriesAt (A (target e)) r e s := by
  simp [monitoredInjuryEvents, injuryEvents]

/-- If nothing below `u` enters after stage `s`, the limit agrees with `A s` below `u`. -/
theorem limit_agrees_of_no_fresh_below (A : ℕ → Finset ℕ) (hA : Monotone A)
    (s u : ℕ) (h : ∀ t, s ≤ t → ∀ z, z < u → z ∉ fresh A t) :
    ∀ z, z < u → (z ∈ A s ↔ z ∈ stageLimit A) := by
  sorry

/-- A computation is preserved if its use stays inside the live protected interval and that
interval is never injured. -/
theorem computation_preserved_by_live_restraint
    (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (hA : Monotone A)
    {s e x req : ℕ} {d : Code.Halt}
    (hcomp : Code.stageAt s (A s : Set ℕ) e x = some d)
    (hquiet : ∀ t, s ≤ t → injuriesAt A r req t = ∅)
    (hcovers : ∀ t, s ≤ t → ∀ z, z < d.use →
      ∃ b, r req t = some b ∧ z ≤ b) :
    d.output ∈ Phi (stageLimit A) e x := by
  sorry

/-- Absence of use-prefix breaches suffices when the live restraint is at least the use. -/
theorem computation_preserved_without_use_breaches
    (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (hA : Monotone A)
    {s e x req : ℕ} {d : Code.Halt}
    (hcomp : Code.stageAt s (A s : Set ℕ) e x = some d)
    (hquiet : ∀ t, s ≤ t → useBreachesAt A r req t = ∅)
    (hcovers : ∀ t, s ≤ t → ∃ b, r req t = some b ∧ d.use ≤ b) :
    d.output ∈ Phi (stageLimit A) e x := by
  sorry

/-- The stages at which requirement `e` acts. -/
def attentionStages (action : ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {t | ∃ s, t = s + 1 ∧ action s = some e}

/-- The usual blanket-reset convention for requirements below an acting priority. -/
def initializationStages (action : ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {t | ∃ s i, t = s + 1 ∧ action s = some i ∧ i < e}

/-- Pure priority induction; clients separately prove locality and satisfaction. -/
theorem all_attention_finite_of_local (action : ℕ → Option ℕ)
    (hlocal : ∀ e, (∀ i, i < e → (attentionStages action i).Finite) →
      (attentionStages action e).Finite) :
    ∀ e, (attentionStages action e).Finite := by
  sorry

/-- A requirement whose higher priorities act finitely often is initialized finitely often. -/
theorem initialization_finite_of_attention (action : ℕ → Option ℕ) (e : ℕ)
    (h : ∀ i, i < e → (attentionStages action i).Finite) :
    (initializationStages action e).Finite := by
  sorry

namespace Examples

/-- Stages in which `0` enters at stage `1`. -/
def zeroThenZero : ℕ → Finset ℕ
  | 0 => ∅
  | _ + 1 => {0}

/-- Stages in which `0` and `1` enter together at stage `1`. -/
def zeroThenPair : ℕ → Finset ℕ
  | 0 => ∅
  | _ + 1 => {0, 1}

/-- Stages in which `1` enters at stage `1`. -/
def zeroThenBoundary : ℕ → Finset ℕ
  | 0 => ∅
  | _ + 1 => {1}

/-- The inactive restraint everywhere. -/
def allInactive : ℕ → ℕ → Option ℕ := fun _ _ => none

/-- The restraint `some 0` everywhere. -/
def allZero : ℕ → ℕ → Option ℕ := fun _ _ => some 0

/-- The restraint `some 1` everywhere. -/
def allOne : ℕ → ℕ → Option ℕ := fun _ _ => some 1

/-- Stages that are not monotone: `0` is present exactly at the odd stages. -/
def oscillatingZero (s : ℕ) : Finset ℕ := if s % 2 = 0 then ∅ else {0}

/-- The growing restraint `r e s = some s`. -/
def growingRestraint : ℕ → ℕ → Option ℕ := fun _ s => some s

/-- Stages in which `0` enters at stage `2`. -/
def lateZero : ℕ → Finset ℕ
  | 0 => ∅
  | 1 => ∅
  | _ + 2 => {0}

/-- The restraint `some 1` at stage `0`, inactive afterwards. -/
def droppedRestraint (_e s : ℕ) : Option ℕ := if s = 0 then some 1 else none

/-- The stages `A s = {0, …, s - 1}`. -/
def initialSegments (s : ℕ) : Finset ℕ := Finset.range s

/-- The standard enumeration of `K`: stage `s` holds the indices `e < s` whose diagonal stage
computation converges at stage `s`. -/
noncomputable def haltingStages (s : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range s).filter fun e => (Code.stageAt s ∅ e e).isSome

/-- The restraint `r e s = some e`. -/
def perIndexRestraint (e _s : ℕ) : Option ℕ := some e

/-- Requirement `0` acts at stage `1`, and nothing acts afterwards. -/
def resetOnce : ℕ → Option ℕ
  | 0 => some 0
  | _ + 1 => none

/-- An inactive restraint: a fresh `0` is not an injury. -/
example : injurySet zeroThenZero allInactive 0 = ∅ := by
  ext x
  simp [injurySet, injuriesAt, allInactive]

/-- The restraint `some 0`: a fresh `0` is an injury. -/
example : injurySet zeroThenZero allZero 0 = {0} := by
  ext x
  simp only [injurySet, injuriesAt, fresh, allZero, Set.mem_ofPred_eq, Finset.mem_filter,
      Finset.mem_sdiff, Option.any_some, decide_eq_true_eq, Set.mem_singleton_iff]
  constructor
  · rintro ⟨s, -, hx⟩
    omega
  · rintro rfl
    exact ⟨0, ⟨by simp [zeroThenZero], by simp [zeroThenZero]⟩, le_rfl⟩

/-- A fresh entry exactly at the restraint is an injury. -/
example : injurySet zeroThenBoundary allOne 0 = {1} := by
  ext x
  simp only [injurySet, injuriesAt, fresh, allOne, Set.mem_ofPred_eq, Finset.mem_filter,
      Finset.mem_sdiff, Option.any_some, decide_eq_true_eq, Set.mem_singleton_iff]
  constructor
  · rintro ⟨s, ⟨h, -⟩, -⟩
    simpa [zeroThenBoundary] using h
  · rintro rfl
    exact ⟨0, ⟨by simp [zeroThenBoundary], by simp [zeroThenBoundary]⟩, le_rfl⟩

/-- Address one is outside the exclusive prefix of length one. -/
example : Code.initialSegment (zeroThenBoundary 0 : Set ℕ) 1 =
    Code.initialSegment (stageLimit zeroThenBoundary) 1 := by
  have h : (0 : ℕ) ∉ stageLimit zeroThenBoundary := by
    rintro ⟨s, hs⟩
    cases s <;> simp [zeroThenBoundary] at hs
  simp [Code.initialSegment, characteristic, zeroThenBoundary, h]

/-- Two injuring numbers at one stage give two injury numbers and one injury stage. -/
example : injurySet zeroThenPair allOne 0 = {0, 1} ∧
    injuryStages zeroThenPair allOne 0 = {1} := by
  refine ⟨?_, ?_⟩
  · ext x
    simp only [injurySet, injuriesAt, fresh, allOne, Set.mem_ofPred_eq, Finset.mem_filter,
      Finset.mem_sdiff, Option.any_some, decide_eq_true_eq, Set.mem_insert_iff,
      Set.mem_singleton_iff]
    constructor
    · rintro ⟨s, ⟨h, -⟩, -⟩
      simpa [zeroThenPair] using h
    · intro hx
      refine ⟨0, ⟨by simpa [zeroThenPair] using hx, by simp [zeroThenPair]⟩, ?_⟩
      omega
  · ext t
    simp only [injuryStages, Set.mem_ofPred_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨s, rfl, x, hx⟩
      cases s with
      | zero => rfl
      | succ s => simp [injuriesAt, fresh, zeroThenPair] at hx
    · rintro rfl
      exact ⟨0, rfl, 0, by simp [injuriesAt, fresh, zeroThenPair, allOne]⟩

/-- Dropping stage monotonicity destroys the finite-numbers/finite-stages equivalence. -/
example : injurySet oscillatingZero allZero 0 = {0} ∧
    (injuryStages oscillatingZero allZero 0).Infinite := by
  refine ⟨?_, ?_⟩
  · ext x
    simp only [injurySet, injuriesAt, fresh, allZero, Set.mem_ofPred_eq, Finset.mem_filter,
      Finset.mem_sdiff, Option.any_some, decide_eq_true_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨s, -, hx⟩
      omega
    · rintro rfl
      exact ⟨0, ⟨by simp [oscillatingZero], by simp [oscillatingZero]⟩, le_rfl⟩
  · refine Set.infinite_of_injective_forall_mem (f := fun k : ℕ => 2 * k + 1)
      (fun a b h => by simp only at h; omega) fun k => ⟨2 * k, rfl, 0, ?_⟩
    simp [injuriesAt, fresh, oscillatingZero, allZero, Nat.add_mod]

/-- No injury, and yet the restraint is never constant. -/
example : injurySet (fun _ => ∅) growingRestraint 0 = ∅ ∧
    ¬ ∃ b s₀, ∀ s, s₀ ≤ s → growingRestraint 0 s = b := by
  refine ⟨?_, ?_⟩
  · ext x
    simp [injurySet, injuriesAt, fresh]
  · rintro ⟨b, s₀, h⟩
    have := (h s₀ le_rfl).trans (h (s₀ + 1) (by omega)).symm
    simp [growingRestraint] at this

/-- No use-prefix breaches, yet infinitely many boundary injuries under a growing restraint. -/
example : useBreachSet initialSegments growingRestraint 0 = ∅ ∧
    injurySet initialSegments growingRestraint 0 = Set.univ := by
  refine ⟨?_, ?_⟩
  · ext x
    simp only [useBreachSet, useBreachesAt, fresh, initialSegments, growingRestraint,
      Set.mem_ofPred_eq, Finset.mem_filter, Finset.mem_sdiff, Finset.mem_range, Option.any_some,
      decide_eq_true_eq, Set.mem_empty_iff_false, iff_false, not_exists]
    omega
  · ext x
    simp only [injurySet, injuriesAt, fresh, initialSegments, growingRestraint,
      Set.mem_ofPred_eq, Finset.mem_filter, Finset.mem_sdiff, Finset.mem_range, Option.any_some,
      decide_eq_true_eq, Set.mem_univ, iff_true]
    exact ⟨x, by omega⟩

/-- No injury, and yet the string of length one changes after the restraint has dropped. -/
example : injurySet lateZero droppedRestraint 0 = ∅ ∧
    Code.initialSegment (lateZero 0 : Set ℕ) 1 ≠ Code.initialSegment (stageLimit lateZero) 1 := by
  refine ⟨?_, ?_⟩
  · ext x
    simp only [injurySet, injuriesAt, fresh, Set.mem_ofPred_eq, Finset.mem_filter,
      Finset.mem_sdiff, Set.mem_empty_iff_false, iff_false, not_exists]
    rintro s ⟨⟨h₁, h₂⟩, h₃⟩
    rcases s with _ | _ | s
    · simp [lateZero] at h₁
    · simp [droppedRestraint] at h₃
    · simp [lateZero] at h₁ h₂
      exact h₂ h₁
  · have h : (0 : ℕ) ∈ stageLimit lateZero := ⟨2, by simp [lateZero]⟩
    simp [Code.initialSegment, characteristic, lateZero, h]

/-- An initialization without any injury. -/
example : initializationStages resetOnce 1 = {1} ∧
    injuryStages (fun _ => ∅) allOne 1 = ∅ := by
  refine ⟨?_, ?_⟩
  · ext t
    simp only [initializationStages, Set.mem_ofPred_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨s, i, rfl, hs, hi⟩
      cases s with
      | zero => rfl
      | succ s => simp [resetOnce] at hs
    · rintro rfl
      exact ⟨0, 0, rfl, rfl, by omega⟩
  · ext t
    simp [injuryStages, injuriesAt, fresh]

/-- A zero-use successful computation and an unanswered query are different. -/
example : Code.run 1 (fun _ => none) .zero 0 = some ⟨0, 0⟩ ∧
    Code.run 1 (fun _ => none) .oracle 0 = none := by
  exact ⟨rfl, rfl⟩

/-- Finite fibres do not supply a uniform decision procedure for the injury-number family. Unlike
the other examples, this one is not a direct check of the definitions: it needs the adequacy of the
numbering (L0) and the undecidability of `K` (L3.1). -/
theorem finite_injurySet_haltingStages_and_not_computablePred :
    (∀ e, (injurySet haltingStages perIndexRestraint e).Finite) ∧
    ¬ ComputablePred (fun p : ℕ × ℕ =>
      p.2 ∈ injurySet haltingStages perIndexRestraint p.1) := by
  sorry

/-- Zero is a supplied negative answer; it still has a positive oracle use. -/
example : Code.run 1 (fun _ => some 0) .oracle 0 = some ⟨0, 1⟩ := by
  rfl

end Examples

/-! ## Layer 7: the original Friedberg–Muchnik construction -/

/-- The Friedberg–Muchnik theorem [S, VII.2.1]: there are two c.e. sets, neither Turing reducible
to the other. -/
theorem friedberg_muchnik :
    ∃ A B : Set ℕ, REPred (fun x => x ∈ A) ∧ REPred (fun x => x ∈ B) ∧
      ¬ (A ≤ᵀ B) ∧ ¬ (B ≤ᵀ A) := by
  sorry

/-! ## Layer 8: agreement preservation and Sacks's constructions -/

/-- Stage agreement: the stage computation of `Φ^A_e` at `x` converges with output `C x`. -/
noncomputable def agreesAt (s : ℕ) (A C : Set ℕ) (e x : ℕ) : Bool :=
  match Code.stageAt s A e x with
  | none => false
  | some d => decide (d.output = characteristic C x)

/-- Bounded evaluation fails at `s`, so the search always has a result at most `s`. -/
noncomputable def agreementLength (s : ℕ) (A C : Set ℕ) (e : ℕ) : ℕ :=
  ((List.range (s + 1)).find? fun x => !(agreesAt s A C e x)).getD s

/-- Include the use at the first disagreement, as in Soare VII.3, p.122. -/
noncomputable def agreementRestraint (s : ℕ) (A C : Set ℕ) (e : ℕ) : ℕ :=
  (Finset.range (agreementLength s A C e + 1)).sup fun x => Code.stageUse s A e x

/-- Sacks's restraint `r(e, s)`, always active, from the two stage sequences. -/
noncomputable def sacksRestraint (A C : ℕ → Finset ℕ) (e s : ℕ) : Option ℕ :=
  some (agreementRestraint s (A s : Set ℕ) (C s : Set ℕ) e)

/-- The length of agreement is at most `s`; every smaller argument agrees, and the length itself
does not. -/
theorem agreementLength_spec (s : ℕ) (A C : Set ℕ) (e : ℕ) :
    agreementLength s A C e ≤ s ∧
      (∀ x, x < agreementLength s A C e → agreesAt s A C e x = true) ∧
      agreesAt s A C e (agreementLength s A C e) = false := by
  sorry

/-- Every use up to and including the first disagreement lies under the restraint. -/
theorem stageUse_le_agreementRestraint (s : ℕ) (A C : Set ℕ) (e : ℕ) {x : ℕ}
    (hx : x ≤ agreementLength s A C e) :
    Code.stageUse s A e x ≤ agreementRestraint s A C e :=
  Finset.le_sup (f := fun x => Code.stageUse s A e x) (Finset.mem_range.mpr (Nat.lt_succ_of_le hx))

/-- The use at the first disagreement lies under the restraint. -/
theorem first_disagreement_use_le (s : ℕ) (A C : Set ℕ) (e : ℕ) :
    Code.stageUse s A e (agreementLength s A C e) ≤ agreementRestraint s A C e :=
  stageUse_le_agreementRestraint s A C e le_rfl

/-- The length of agreement is computable from computable stages, uniformly in `(e, s)`. -/
theorem agreementLength_computable (A C : ℕ → Finset ℕ)
    (hA : Computable (fun s => finiteCode (A s)))
    (hC : Computable (fun s => finiteCode (C s))) :
    Computable (fun p : ℕ × ℕ => agreementLength p.2 (A p.2 : Set ℕ) (C p.2 : Set ℕ) p.1) := by
  sorry

/-- The Sacks restraint is computable from computable stages, uniformly in `(e, s)`. -/
theorem sacksRestraint_computable (A C : ℕ → Finset ℕ)
    (hA : Computable (fun s => finiteCode (A s)))
    (hC : Computable (fun s => finiteCode (C s))) :
    Computable (fun p : ℕ × ℕ => sacksRestraint A C p.1 p.2) := by
  sorry

/-- A computation at an argument up to and including the first disagreement, with its output and
use, survives a transition that does not injure the requirement. The target may change. -/
theorem sacks_computation_preserved (A C : ℕ → Finset ℕ) (hA : Monotone A)
    {e s x : ℕ} {d : Code.Halt}
    (hx : x ≤ agreementLength s (A s : Set ℕ) (C s : Set ℕ) e)
    (hd : Code.stageAt s (A s : Set ℕ) e x = some d)
    (hJ : injuriesAt A (sacksRestraint A C) e s = ∅) :
    Code.stageAt (s + 1) (A (s + 1) : Set ℕ) e x = some d := by
  have huse : d.use ≤ agreementRestraint s (A s : Set ℕ) (C s : Set ℕ) e := by
    simpa [Code.stageUse, hd] using
      stageUse_le_agreementRestraint s (A s : Set ℕ) (C s : Set ℕ) e hx
  apply Code.stageAt_persistent (Nat.le_succ s)
  apply Code.stageAt_agreement hd
  intro z hz
  simp only [Finset.mem_coe]
  refine ⟨fun h => hA (Nat.le_succ s) h, fun h => ?_⟩
  by_contra hns
  have hmem : z ∈ injuriesAt A (sacksRestraint A C) e s := by
    simp only [injuriesAt, fresh, sacksRestraint, Finset.mem_filter, Finset.mem_sdiff,
      Option.any_some, decide_eq_true_eq]
    exact ⟨⟨h, hns⟩, by omega⟩
  simp [hJ] at hmem

/-- Agreement is preserved as well when, in addition, the target bit does not change. -/
theorem sacks_agreement_preserved (A C : ℕ → Finset ℕ) (hA : Monotone A) {e s x : ℕ}
    (hx : x ≤ agreementLength s (A s : Set ℕ) (C s : Set ℕ) e)
    (hagree : agreesAt s (A s : Set ℕ) (C s : Set ℕ) e x = true)
    (hJ : injuriesAt A (sacksRestraint A C) e s = ∅)
    (hC : x ∈ C s ↔ x ∈ C (s + 1)) :
    agreesAt (s + 1) (A (s + 1) : Set ℕ) (C (s + 1) : Set ℕ) e x = true := by
  unfold agreesAt at hagree ⊢
  cases hd : Code.stageAt s (A s : Set ℕ) e x with
  | none => simp [hd] at hagree
  | some d =>
    rw [hd] at hagree
    rw [sacks_computation_preserved A C hA hx hd hJ]
    simpa [characteristic, hC] using hagree

/-- If `Φ^A_e = C`, the agreement length tends to infinity. -/
theorem agreement_cofinal_of_computes (A C : ℕ → Finset ℕ)
    (hA : Monotone A) (hC : Monotone C) (e : ℕ)
    (h : Phi (stageLimit A) e = oracle (stageLimit C)) :
    ∀ n, ∃ s₀, ∀ s, s₀ ≤ s → n ≤ agreementLength s (A s : Set ℕ) (C s : Set ℕ) e := by
  sorry

/-- [S, VII.3.1, Lemma 1]. The proof uses the restraint on the first disagreement. -/
theorem nonreduction_of_finite_sacks_injury (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (injurySet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    Phi (stageLimit A.stage) e ≠ oracle (stageLimit C.stage) := by
  sorry

/-- Finite injury and a limiting disagreement give stabilization of the agreement length, and
hence of the restraint. The proof excludes transient convergence at the first limiting
disagreement: once injury has stopped, such a computation would be preserved forever. -/
theorem sacks_agreement_and_restraint_stabilize (A C : CEApproximation) (e : ℕ)
    (hI : (injurySet A.stage (sacksRestraint A.stage C.stage) e).Finite)
    (hNE : Phi (stageLimit A.stage) e ≠ oracle (stageLimit C.stage)) :
    ∃ l b s₀, ∀ s, s₀ ≤ s →
      agreementLength s (A.stage s : Set ℕ) (C.stage s : Set ℕ) e = l ∧
        sacksRestraint A.stage C.stage e s = some b := by
  sorry

/-- Finite injury against a noncomputable target gives an eventually constant restraint. -/
theorem sacks_restraint_stabilizes (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (injurySet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    ∃ b s₀, ∀ s, s₀ ≤ s → sacksRestraint A.stage C.stage e s = some b := by
  obtain ⟨_, b, s₀, h⟩ := sacks_agreement_and_restraint_stabilize A C e hI
    (nonreduction_of_finite_sacks_injury A C e hNC hI)
  exact ⟨b, s₀, fun s hs => (h s hs).2⟩

/-- At stage `s` no index `e ≥ s` has a convergent computation, so its restraint is zero. -/
theorem sacksRestraint_of_le (A C : ℕ → Finset ℕ) {e s : ℕ} (h : s ≤ e) :
    sacksRestraint A C e s = some 0 := by
  have hstage : ∀ (σ : List ℕ) (x : ℕ), Code.stage s σ e x = none := by
    intro σ x
    unfold Code.stage
    split <;> simp_all [Nat.not_lt.mpr h]
  have hagree : ∀ x, agreesAt s (A s : Set ℕ) (C s : Set ℕ) e x = false := by
    intro x
    simp [agreesAt, Code.stageAt, hstage]
  have hlen : agreementLength s (A s : Set ℕ) (C s : Set ℕ) e = 0 := by
    simp [agreementLength, List.range_succ_eq_map, hagree]
  simp [sacksRestraint, agreementRestraint, hlen, Code.stageUse, Code.stageAt, hstage]

/-- The requirement pairs `(e, i)` with `e ≤ s`, in the priority order `2e + i`. -/
def pairsThrough (s : ℕ) : List (ℕ × Bool) :=
  (List.range (s + 1)).flatMap fun e => [(e, false), (e, true)]

/-- The highest-priority pair whose current restraint `r i e` covers `x`, searched over `e ≤ s`. -/
def leastThreat (r : Bool → ℕ → Option ℕ) (s x : ℕ) : Option (ℕ × Bool) :=
  (pairsThrough s).find? fun p => (r p.2 p.1).any fun b => decide (x ≤ b)

/-- The finite search is exhaustive for the Sacks restraints. With inclusive routing `x = 0` is
covered by the zero restraint of every index `e ≥ s`, and the pair `(s, 0)` is among those
searched. -/
theorem leastThreat_sacks (A : Bool → ℕ → Finset ℕ) (C : ℕ → Finset ℕ) (s x : ℕ) :
    let r : Bool → ℕ → Option ℕ := fun i e => sacksRestraint (A i) C e s
    let threat : ℕ × Bool → Prop := fun p => ∃ b, r p.2 p.1 = some b ∧ x ≤ b
    (∀ p, leastThreat r s x = some p →
        threat p ∧ ∀ q : ℕ × Bool, 2 * q.1 + q.2.toNat < 2 * p.1 + p.2.toNat → ¬ threat q) ∧
      (leastThreat r s x = none → ∀ q, ¬ threat q) := by
  sorry

/-- Soare's routing [S, VII.3, p.125]: the side opposite the least threatened pair, and side zero
(`false`) when no pair is threatened. -/
def routeSide (r : Bool → ℕ → Option ℕ) (s x : ℕ) : Bool :=
  match leastThreat r s x with
  | some (_, i) => !i
  | none => false

/-- The two halves at the end of each stage. The transition to `s + 1` reads the restraints from
the stage-`s` halves and the stage-`s` approximation to `C`, and routes each fresh element of
`B`. -/
noncomputable def sacksSplit (B C : ℕ → Finset ℕ) : ℕ → Bool → Finset ℕ
  | 0 => fun _ => ∅
  | s + 1 => fun i =>
      let r : Bool → ℕ → Option ℕ := fun j e =>
        some (agreementRestraint s (sacksSplit B C s j : Set ℕ) (C s : Set ℕ) e)
      sacksSplit B C s i ∪ (fresh B s).filter fun x => routeSide r s x = i

/-- At every stage the two halves together are the stage of `B`. -/
theorem sacksSplit_union (B : CEApproximation) (C : ℕ → Finset ℕ) (s : ℕ) :
    sacksSplit B.stage C s false ∪ sacksSplit B.stage C s true = B.stage s := by
  sorry

/-- At every stage the two halves are disjoint. -/
theorem sacksSplit_disjoint (B : CEApproximation) (C : ℕ → Finset ℕ) (s : ℕ) :
    Disjoint (sacksSplit B.stage C s false) (sacksSplit B.stage C s true) := by
  sorry

/-- The stages of each half are computable. -/
theorem sacksSplit_computable (B C : CEApproximation) (i : Bool) :
    Computable (fun s => finiteCode (sacksSplit B.stage C.stage s i)) := by
  sorry

/-- The three statements proved together by induction on the priority `2e + i` [S, p.125]. -/
theorem sacksSplit_requirement (B C : CEApproximation)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage)) (e : ℕ) (i : Bool) :
    let A := fun s => sacksSplit B.stage C.stage s i
    (injurySet A (sacksRestraint A C.stage) e).Finite ∧
      Phi (stageLimit A) e ≠ oracle (stageLimit C.stage) ∧
      ∃ l b s₀, ∀ s, s₀ ≤ s →
        agreementLength s (A s : Set ℕ) (C.stage s : Set ℕ) e = l ∧
          sacksRestraint A C.stage e s = some b := by
  sorry

/-- The lowness probe compiler [S, pp.125–126], uniform in a supplied bit. The program `g b e`
waits for `Φ^X_e(e)`, returns `b` at input zero, and diverges at every positive input. -/
theorem lowness_probe_compiler :
    ∃ g : Bool → ℕ → ℕ, Computable (fun p : Bool × ℕ => g p.1 p.2) ∧
      ∀ (b : Bool) (X : Set ℕ) (e x y : ℕ),
        y ∈ Phi X (g b e) x ↔ x = 0 ∧ (Phi X e e).Dom ∧ y = b.toNat := by
  sorry

/-- With the bit `b = C(0)`, the probe's agreement length on each half settles at `1` when
`Φ^{A_i}_e(e)` converges and at `0` when it diverges. The bit is a fixed parameter, not computed
from an index for `C`. -/
theorem sacksSplit_probe_length (B C : CEApproximation)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage)) (g : Bool → ℕ → ℕ)
    (hg : ∀ (b : Bool) (X : Set ℕ) (e x y : ℕ),
      y ∈ Phi X (g b e) x ↔ x = 0 ∧ (Phi X e e).Dom ∧ y = b.toNat)
    (b : Bool) (hb : b = true ↔ 0 ∈ stageLimit C.stage) (i : Bool) (e : ℕ) :
    let A := fun s => sacksSplit B.stage C.stage s i
    ∃ s₀, ∀ s, s₀ ≤ s →
      (e ∈ jump (stageLimit A) →
          agreementLength s (A s : Set ℕ) (C.stage s : Set ℕ) (g b e) = 1) ∧
        (e ∉ jump (stageLimit A) →
          agreementLength s (A s : Set ℕ) (C.stage s : Set ℕ) (g b e) = 0) := by
  sorry

/-- The computable approximation to the jump of each half that the lowness proof passes to the
limit lemma. -/
theorem sacksSplit_jump_approximation (B C : CEApproximation)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage)) (g : Bool → ℕ → ℕ)
    (hgc : Computable (fun p : Bool × ℕ => g p.1 p.2))
    (hg : ∀ (b : Bool) (X : Set ℕ) (e x y : ℕ),
      y ∈ Phi X (g b e) x ↔ x = 0 ∧ (Phi X e e).Dom ∧ y = b.toNat)
    (b : Bool) (hb : b = true ↔ 0 ∈ stageLimit C.stage) (i : Bool) :
    let A := fun s => sacksSplit B.stage C.stage s i
    let h := fun e s => decide (0 < agreementLength s (A s : Set ℕ) (C.stage s : Set ℕ) (g b e))
    Computable (fun p : ℕ × ℕ => h p.1 p.2) ∧
      ∀ e, ∃ s₀, ∀ s, s₀ ≤ s → (h e s = true ↔ e ∈ jump (stageLimit A)) := by
  intro A h
  refine ⟨?_, fun e => ?_⟩
  · have hlen := agreementLength_computable A C.stage (sacksSplit_computable B C i) C.computable
    have harg : Computable fun p : ℕ × ℕ => (g b p.1, p.2) :=
      (hgc.comp ((Computable.const b).pair Computable.fst)).pair Computable.snd
    have hpos : Computable fun n : ℕ => decide (0 < n) :=
      (Primrec.nat_lt.comp (Primrec.const 0) Primrec.id).decide.to_comp
    exact (hpos.comp (hlen.comp harg)).of_eq fun _ => rfl
  · obtain ⟨s₀, hs₀⟩ := sacksSplit_probe_length B C hNC g hg b hb i e
    refine ⟨s₀, fun s hs => ?_⟩
    simp only [h, A] at hs₀ ⊢
    by_cases he : e ∈ jump (stageLimit fun s => sacksSplit B.stage C.stage s i)
    · simp [(hs₀ s hs).1 he, he]
    · simp [(hs₀ s hs).2 he, he]

/-- The constructed halves satisfy the full statement of [S, VII.3.2]. -/
theorem sacksSplit_spec (B C : CEApproximation)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage)) :
    let A := fun i => stageLimit fun s => sacksSplit B.stage C.stage s i
    Disjoint (A false) (A true) ∧ A false ∪ A true = stageLimit B.stage ∧
      ∀ i, Low (A i) ∧ ¬ (stageLimit C.stage ≤ᵀ A i) := by
  sorry

/-- Sacks cone avoidance [S, VII.3.1]: for a noncomputable c.e. set `C` some simple set does not
compute `C`. -/
theorem exists_simple_avoiding (C : Set ℕ) (hC : REPred (fun x => x ∈ C))
    (hNC : ¬ ComputablePred (fun x => x ∈ C)) :
    ∃ A : Set ℕ, Simple A ∧ ¬ (C ≤ᵀ A) := by
  sorry

/-- Sacks splitting with low halves [S, VII.3.2]: a c.e. set `B` is the union of two disjoint low
c.e. sets, neither of which computes a given noncomputable c.e. set `C`. `B` may be finite. -/
theorem sacks_splitting (B C : Set ℕ)
    (hB : REPred (fun x => x ∈ B)) (hC : REPred (fun x => x ∈ C))
    (hNC : ¬ ComputablePred (fun x => x ∈ C)) :
    ∃ A₀ A₁ : Set ℕ,
      REPred (fun x => x ∈ A₀) ∧ REPred (fun x => x ∈ A₁) ∧
      Low A₀ ∧ Low A₁ ∧ Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = B ∧
      ¬ (C ≤ᵀ A₀) ∧ ¬ (C ≤ᵀ A₁) := by
  sorry

/-- Uniform output enumeration indices for the displayed stage machine run on the canonical
approximations of `W_b` and `W_c`, with its stage table computable in `(b, c, s, i)`. The
identification holds for all inputs. This does not assert uniform lowness-reduction indices. -/
theorem sacks_splitting_uniform_indices :
    ∃ f : Bool → ℕ → ℕ → ℕ,
      Computable (fun p : Bool × ℕ × ℕ => f p.1 p.2.1 p.2.2) ∧
      Computable (fun p : (ℕ × ℕ) × ℕ × Bool =>
        finiteCode (sacksSplit (WStage ∅ p.1.1) (WStage ∅ p.1.2) p.2.1 p.2.2)) ∧
      ∀ b c i, W ∅ (f i b c) = stageLimit fun s => sacksSplit (WStage ∅ b) (WStage ∅ c) s i := by
  sorry

/-- The split of canonical inputs is a disjoint partition of `W_b` for all `b, c`; its halves are
low and avoid `W_c` when `W_c` is noncomputable. -/
theorem sacksSplit_W_spec (b c : ℕ) :
    let A := fun i => stageLimit fun s => sacksSplit (WStage ∅ b) (WStage ∅ c) s i
    (Disjoint (A false) (A true) ∧ A false ∪ A true = W ∅ b) ∧
      (¬ ComputablePred (fun x => x ∈ W ∅ c) → ∀ i, Low (A i) ∧ ¬ (W ∅ c ≤ᵀ A i)) := by
  sorry

/-- [S, VII.3.4], with the reductions of each half to `B`. -/
theorem low_incomparable_split (B : Set ℕ) (hB : REPred (fun x => x ∈ B))
    (hNB : ¬ ComputablePred (fun x => x ∈ B)) :
    ∃ A₀ A₁ : Set ℕ,
      REPred (fun x => x ∈ A₀) ∧ REPred (fun x => x ∈ A₁) ∧
      Low A₀ ∧ Low A₁ ∧ Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = B ∧
      (A₀ ≤ᵀ B) ∧ (A₁ ≤ᵀ B) ∧ ¬ (B ≤ᵀ A₀) ∧ ¬ (B ≤ᵀ A₁) ∧
      ¬ (A₀ ≤ᵀ A₁) ∧ ¬ (A₁ ≤ᵀ A₀) ∧ (B ≡ᵀ join A₀ A₁) := by
  sorry

/-- Low sets need not have a low join; the split of `K` is the concrete example. -/
theorem low_halves_of_K :
    ∃ A₀ A₁ : Set ℕ,
      REPred (fun x => x ∈ A₀) ∧ REPred (fun x => x ∈ A₁) ∧
      Low A₀ ∧ Low A₁ ∧ Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = jump ∅ ∧
      ¬ Low (join A₀ A₁) := by
  sorry

end TauCetiRoadmap.ComputabilityTheory
