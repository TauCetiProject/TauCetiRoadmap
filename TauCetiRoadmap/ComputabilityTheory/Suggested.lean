import Mathlib.Computability.Halting
import Mathlib.Computability.Primrec.List
import Mathlib.Computability.Reduce
import Mathlib.Computability.TuringDegree
import Mathlib.Data.Finset.Lattice.Fold
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Data.Set.Card
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Computability theory and finite-injury constructions: suggested signatures

**`README.md` is the definitive roadmap document** — its narrative plan, library spine,
layer-by-layer build, standing hypotheses, worked examples, and references are the
specification. This file is **not** the roadmap and is **not exhaustive**: it records suggested
Lean `sorry`-forms (allowed in this human-owned roadmap library) for particular milestones, so
that contributors and reviewers converge on names and signatures; discharging every statement
here neither finishes a layer nor the roadmap.

All definitions below have bodies. Every `sorry` is the proof of a stated theorem or example,
never the body of a predicate or of an evaluator. The finite examples after L6, and the zero
restraint of large indices in L9, are proved directly from the definitions as a check on them.
A few further statements are derived from other stated theorems; such a proof is conditional on
the admitted statements it uses.
The operational code prototype is deliberately concrete so that its use and adequacy obligations
can be read against actual semantics.

Names and namespaces are provisional. `Oracle.Single.Code` follows the shape of Mathlib
PR #38973 inside this roadmap-only namespace, not a competing root namespace. Integrators must
adopt the current Mathlib/Tau Ceti API. The set notation below expands directly to Mathlib's
partial-function reducibility; it introduces no second notion of reducibility.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.ComputabilityTheory

open scoped BigOperators

/-! ## Set oracles and the existing extensional predicates -/

/-- A set oracle supplies a total 0/1 answer, including negative answers. -/
noncomputable def characteristic (A : Set ℕ) (x : ℕ) : ℕ := by
  classical
  exact if x ∈ A then 1 else 0

/-- A total natural-valued oracle, viewed as a Mathlib partial function. -/
def totalOracle (O : ℕ → ℕ) : ℕ →. ℕ := fun x => Part.some (O x)

/-- The total characteristic function, viewed as a Mathlib partial function. -/
noncomputable def oracle (A : Set ℕ) : ℕ →. ℕ :=
  fun x => Part.some (characteristic A x)

theorem oracle_eq_totalOracle (A : Set ℕ) : oracle A = totalOracle (characteristic A) := rfl

local notation:50 A " ≤ᵀ " B => _root_.TuringReducible (oracle A) (oracle B)
local notation:50 A " ≡ᵀ " B => _root_.TuringEquivalent (oracle A) (oracle B)

/-- Relative c.e.-ness specializes the existing `RecursiveIn` predicate. -/
def REPredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  RecursiveIn {oracle Z} (fun x => Part.assert (p x) fun _ => Part.some ())

/-- Decidability relative to `Z`: a decision procedure computable in `Z`. -/
def ComputablePredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  ∃ d : DecidablePred p,
    ComputableIn {oracle Z} (fun x => @decide (p x) (d x))

theorem rePredIn_empty_iff (p : ℕ → Prop) : REPredIn ∅ p ↔ REPred p := by
  sorry

theorem computablePredIn_empty_iff (p : ℕ → Prop) :
    ComputablePredIn ∅ p ↔ ComputablePred p := by
  sorry

/-- The parity join `A ⊕ B = {2x | x ∈ A} ∪ {2x + 1 | x ∈ B}`. -/
def join (A B : Set ℕ) : Set ℕ :=
  {n | if n % 2 = 0 then n / 2 ∈ A else n / 2 ∈ B}

/-- The column containing the potential witnesses for requirement `e`. -/
def column (e : ℕ) : Set ℕ := {n | n.unpair.2 = e}

theorem column_infinite (e : ℕ) : (column e).Infinite := by
  sorry

/-- The set-level least upper bound. Mathlib PR #37062 proposes the join of partial functions and
the `SemilatticeSup` instance on `TuringDegree` that this specializes. -/
theorem join_le_iff (A B C : Set ℕ) :
    (join A B ≤ᵀ C) ↔ (A ≤ᵀ C) ∧ (B ≤ᵀ C) := by
  sorry

/-- [S, VII.3.3]. The reductions use the enumerations of both halves. -/
theorem ce_split_reductions (B A₀ A₁ : Set ℕ)
    (h₀ : REPred (fun x => x ∈ A₀)) (h₁ : REPred (fun x => x ∈ A₁))
    (hd : Disjoint A₀ A₁) (hu : A₀ ∪ A₁ = B) :
    (A₀ ≤ᵀ B) ∧ (A₁ ≤ᵀ B) ∧ (B ≡ᵀ join A₀ A₁) := by
  sorry

/-! ## L0: concrete oracle codes, finite evaluation, outputs, and uses -/

namespace Oracle.Single

/-- Oracle programs, in the shape of the single-oracle code of Mathlib PR #38973. -/
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

theorem ofNat_encode (c : Code) : ofNat (encode c) = c := by
  sorry

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
  get h := (Classical.choose (Classical.choose_spec h)).output

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

theorem eval_embed (O : ℕ → ℕ) (c : Nat.Partrec.Code) (x : ℕ) :
    eval O (embed c) x = c.eval x := by
  sorry

theorem run_persistent {s t : ℕ} {O : ℕ → Option ℕ} {c : Code} {x : ℕ} {d : Halt}
    (hst : s ≤ t) (h : run s O c x = some d) : run t O c x = some d := by
  sorry

/-- Equality of all answers below the recorded use suffices, even for partial answers. -/
theorem run_use {s : ℕ} {O P : ℕ → Option ℕ} {c : Code} {x : ℕ} {d : Halt}
    (h : run s O c x = some d) (hOP : ∀ z, z < d.use → O z = P z) :
    run s P c x = some d := by
  sorry

theorem run_unique {s t : ℕ} {O : ℕ → Option ℕ} {c : Code} {x : ℕ} {d d' : Halt}
    (h : run s O c x = some d) (h' : run t O c x = some d') : d = d' := by
  sorry

theorem stage_bounds {s e x : ℕ} {σ : List ℕ} {d : Halt}
    (h : stage s σ e x = some d) :
    e < s ∧ x < s ∧ d.output < s ∧ d.use ≤ s ∧ d.use ≤ σ.length := by
  sorry

/-- Bounded simulation is computable, with the program given by its index. -/
theorem stage_computable :
    Computable (fun p : ℕ × (List ℕ × (ℕ × ℕ)) =>
      (stage p.1 p.2.1 p.2.2.1 p.2.2.2).map fun d => (d.output, d.use)) := by
  sorry

theorem stageAt_persistent {s t : ℕ} {Z : Set ℕ} {e x : ℕ} {d : Halt}
    (hst : s ≤ t) (h : stageAt s Z e x = some d) : stageAt t Z e x = some d := by
  sorry

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

theorem rePredIn_iff_W (Z C : Set ℕ) :
    REPredIn Z (fun x => x ∈ C) ↔ ∃ e, W Z e = C := by
  sorry

theorem WStage_mono (Z : Set ℕ) (e : ℕ) : Monotone (WStage Z e) := by
  sorry

theorem mem_W_iff_mem_stage (Z : Set ℕ) (e x : ℕ) :
    x ∈ W Z e ↔ ∃ s, x ∈ WStage Z e s := by
  sorry

/-- A compiler independent of the oracle; stronger arity and injectivity forms are in the README. -/
theorem smn_uniform :
    ∃ c : ℕ → ℕ → ℕ, Computable (fun p : ℕ × ℕ => c p.1 p.2) ∧
      ∀ (Z : Set ℕ) (e a x : ℕ), Phi Z (c e a) x = Phi Z e (Nat.pair a x) := by
  sorry

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

/-! ## L1: finite stages and c.e. limits -/

/-- The canonical index `∑ x ∈ F, 2 ^ x` of a finite set [S, II.2]. -/
def finiteCode (F : Finset ℕ) : ℕ := ∑ x ∈ F, 2 ^ x

/-- A concrete decoder; a set bit of `n` has index less than `n`. -/
def finiteDecode (n : ℕ) : Finset ℕ :=
  (Finset.range n).filter fun x => n.testBit x = true

theorem finiteDecode_finiteCode (F : Finset ℕ) : finiteDecode (finiteCode F) = F := by
  sorry

theorem finiteCode_finiteDecode (n : ℕ) : finiteCode (finiteDecode n) = n := by
  sorry

theorem finiteDecode_membership_computable :
    ComputablePred (fun p : ℕ × ℕ => p.2 ∈ finiteDecode p.1) := by
  sorry

theorem finiteCode_list_computable :
    Computable (fun xs : List ℕ => finiteCode xs.toFinset) := by
  sorry


/-- The union of the finite contents at the ends of all stages. -/
def stageLimit (A : ℕ → Finset ℕ) : Set ℕ := {x | ∃ s, x ∈ A s}

/-- Entries made at stage `s + 1`; restraints for this transition are read at `s`. -/
def fresh (A : ℕ → Finset ℕ) (s : ℕ) : Finset ℕ := A (s + 1) \ A s

/--
An actual finite-stage enumeration, with its effectivity certificate on explicit finite-set codes.
A generic library can install a compatible `Primcodable (Finset ℕ)` after proving the coding
lemmas; this prototype neither assumes that instance nor fills it with `sorry`.
-/
structure CEApproximation where
  stage : ℕ → Finset ℕ
  stage_zero : stage 0 = ∅
  monotone : Monotone stage
  computable : Computable (fun s => finiteCode (stage s))

theorem re_iff_finiteStages (C : Set ℕ) :
    REPred (fun x => x ∈ C) ↔ ∃ A : CEApproximation, stageLimit A.stage = C := by
  sorry

/-- Serialization with pauses, covering finite and empty sets uniformly. -/
theorem serialized_ce_approximation (A : CEApproximation) :
    ∃ B : CEApproximation,
      stageLimit B.stage = stageLimit A.stage ∧ ∀ s, (fresh B.stage s).card ≤ 1 := by
  sorry

theorem unique_entry_stage {A : ℕ → Finset ℕ} (hA : Monotone A)
    {s t x : ℕ} (hs : x ∈ fresh A s) (ht : x ∈ fresh A t) : s = t := by
  sorry

theorem finite_prefix_stabilizes {A : ℕ → Finset ℕ} (hA : Monotone A) (u : ℕ) :
    ∃ s₀, ∀ s, s₀ ≤ s → ∀ x, x < u → (x ∈ A s ↔ x ∈ stageLimit A) := by
  sorry

/-! ## L3–L4: concrete jump, normal-form hierarchy, and limit approximation -/

/-- Soare's diagonal halting set. -/
def jump (Z : Set ℕ) : Set ℕ := {e | e ∈ W Z e}

/-- Soare's paired halting set uses the coordinate order `(input, index)`. -/
def K₀ (Z : Set ℕ) : Set ℕ := {n | n.unpair.1 ∈ W Z n.unpair.2}

def iterateJump : ℕ → Set ℕ → Set ℕ
  | 0, Z => Z
  | n + 1, Z => jump (iterateJump n Z)

/-- `A` is low if `A' ≡ᵀ ∅'`. -/
def Low (A : Set ℕ) : Prop := jump A ≡ᵀ jump ∅

theorem jump_strict (Z : Set ℕ) : (Z ≤ᵀ jump Z) ∧ ¬ (jump Z ≤ᵀ Z) := by
  sorry

theorem jump_monotone {Z Y : Set ℕ} (h : Z ≤ᵀ Y) : jump Z ≤ᵀ jump Y := by
  sorry

theorem paired_halting_equiv (Z : Set ℕ) : K₀ Z ≡ᵀ jump Z := by
  sorry

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

def PiIn (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  SigmaIn n Z (fun x => ¬ p x)

def DeltaIn (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  SigmaIn n Z p ∧ PiIn n Z p

theorem post_sigma (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) :
    SigmaIn (n + 1) Z p ↔ REPredIn (iterateJump n Z) p := by
  sorry

theorem post_delta (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) :
    DeltaIn (n + 1) Z p ↔ ComputablePredIn (iterateJump n Z) p := by
  sorry

/-- `a x s` is the stage-`s` approximation to the value at argument `x`. -/
def EventuallyAgrees (a : ℕ → ℕ → ℕ) (f : ℕ → ℕ) : Prop :=
  ∀ x, ∃ s₀, ∀ s, s₀ ≤ s → a x s = f x

def IsModulus (a : ℕ → ℕ → ℕ) (f m : ℕ → ℕ) : Prop :=
  ∀ x s, m x ≤ s → a x s = f x

theorem limitLemma (Z : Set ℕ) (f : ℕ → ℕ) :
    ComputableIn {oracle (jump Z)} f ↔
      ∃ a : ℕ → ℕ → ℕ,
        ComputableIn {oracle Z} (fun p : ℕ × ℕ => a p.1 p.2) ∧
          EventuallyAgrees a f := by
  sorry

/-- One implication of the Modulus Lemma; the full equivalence is a README target. -/
theorem modulus_of_ce_oracle (Z : Set ℕ) (hZ : REPred (fun x => x ∈ Z))
    (f : ℕ → ℕ) (hf : ComputableIn {oracle Z} f) :
    ∃ (a : ℕ → ℕ → ℕ) (m : ℕ → ℕ),
      Computable (fun p : ℕ × ℕ => a p.1 p.2) ∧
      ComputableIn {oracle Z} m ∧ IsModulus a f m := by
  sorry

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

/-! ## L5: inseparable sets, simple sets and Kleene–Post -/

def Immune (B : Set ℕ) : Prop :=
  B.Infinite ∧ ∀ C : Set ℕ, REPred (fun x => x ∈ C) → C ⊆ B → C.Finite

def Simple (A : Set ℕ) : Prop := REPred (fun x => x ∈ A) ∧ Immune Aᶜ

def ComputablyInseparable (A B : Set ℕ) : Prop :=
  Disjoint A B ∧
    ¬ ∃ C : Set ℕ, ComputablePred (fun x => x ∈ C) ∧ A ⊆ C ∧ Disjoint B C

theorem exists_computablyInseparable_ce :
    ∃ A B : Set ℕ, REPred (fun x => x ∈ A) ∧ REPred (fun x => x ∈ B) ∧
      ComputablyInseparable A B := by
  sorry

theorem simple_iff_requirements (A : Set ℕ) :
    Simple A ↔ REPred (fun x => x ∈ A) ∧ Aᶜ.Infinite ∧
      ∀ e, (W ∅ e).Infinite → (W ∅ e ∩ A).Nonempty := by
  sorry

theorem exists_simple : ∃ A : Set ℕ, Simple A := by
  sorry

theorem simple_not_computable {A : Set ℕ} (hA : Simple A) :
    ¬ ComputablePred (fun x => x ∈ A) := by
  sorry

theorem kleene_post :
    ∃ A B : Set ℕ, (A ≤ᵀ jump ∅) ∧ (B ≤ᵀ jump ∅) ∧
      ¬ (A ≤ᵀ B) ∧ ¬ (B ≤ᵀ A) := by
  sorry

/-! ## L6: the injury API. No oracle evaluator is needed for these definitions. -/

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

theorem injurySet_congr {A B : ℕ → Finset ℕ}
    {r q : ℕ → ℕ → Option ℕ} {e : ℕ}
    (hA : ∀ s, A s = B s) (hr : ∀ s, r e s = q e s) :
    injurySet A r e = injurySet B q e := by
  sorry

theorem injurySet_eq_image (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    injurySet A r e = Prod.snd '' injuryEvents A r e := by
  sorry

theorem injuryStages_eq_image (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    injuryStages A r e = (fun p : ℕ × ℕ => p.1 + 1) '' injuryEvents A r e := by
  sorry

theorem injuriesAt_eq_breach_union_boundary (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e s : ℕ) :
    injuriesAt A r e s = useBreachesAt A r e s ∪ boundaryInjuriesAt A r e s := by
  sorry

theorem breaches_disjoint_boundary (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e s : ℕ) :
    Disjoint (useBreachesAt A r e s) (boundaryInjuriesAt A r e s) := by
  sorry

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

theorem finite_useBreachSet_iff_eventually_empty (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    (useBreachSet A r e).Finite ↔
      ∃ s₀, ∀ s, s₀ ≤ s → useBreachesAt A r e s = ∅ := by
  sorry

theorem mem_injuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s x : ℕ) :
    x ∈ injuriesAt A r e s ↔
      x ∈ A (s + 1) ∧ x ∉ A s ∧ ∃ b, r e s = some b ∧ x ≤ b := by
  sorry

theorem injuriesAt_none (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ)
    (h : r e s = none) : injuriesAt A r e s = ∅ := by
  sorry

theorem boundary_mem_injuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    {e s b : ℕ} (hr : r e s = some b) (hx : b ∈ fresh A s) :
    b ∈ injuriesAt A r e s := by
  sorry

theorem succ_mem_injuryStages (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ) :
    s + 1 ∈ injuryStages A r e ↔ (injuriesAt A r e s).Nonempty := by
  sorry

theorem zero_not_mem_injuryStages (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    0 ∉ injuryStages A r e := by
  sorry

theorem injuriesThrough_mono (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) :
    Monotone (injuriesThrough A r e) := by
  sorry

theorem mem_injurySet_iff_through (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e x : ℕ) :
    x ∈ injurySet A r e ↔ ∃ n, x ∈ injuriesThrough A r e n := by
  sorry

/-- Under monotone stages a number injures `e` at most once. -/
theorem injury_number_projection_injective (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    Set.InjOn (fun p : ℕ × ℕ => p.2) (injuryEvents A r e) := by
  sorry

theorem finite_injurySet_iff_finite_injuryStages (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    (injurySet A r e).Finite ↔ (injuryStages A r e).Finite := by
  sorry

theorem finite_injurySet_iff_eventually_empty (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (e : ℕ) (hA : Monotone A) :
    (injurySet A r e).Finite ↔ ∃ s₀, ∀ s, s₀ ≤ s → injuriesAt A r e s = ∅ := by
  sorry

/-- `ncard` is used only with a finiteness premise: its value on infinite sets is not a bound. -/
theorem injuryStages_ncard_le (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (e : ℕ) (hA : Monotone A) (hI : (injurySet A r e).Finite) :
    (injuryStages A r e).ncard ≤ (injurySet A r e).ncard := by
  sorry

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

theorem injuryStages_uniformly_ce (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (hA : Computable (fun s => finiteCode (A s))) (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    REPred (fun p : ℕ × ℕ => p.2 ∈ injuryStages A r p.1) := by
  sorry

/-- The fresh entries attributed to contributor `i`. -/
def contributions (A : ℕ → Finset ℕ) (owner : ℕ → ℕ → ℕ) (i : ℕ) : Set ℕ :=
  {x | ∃ s, x ∈ fresh A s ∧ owner s x = i}

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

theorem initialization_finite_of_attention (action : ℕ → Option ℕ) (e : ℕ)
    (h : ∀ i, i < e → (attentionStages action i).Finite) :
    (initializationStages action e).Finite := by
  sorry

/-! ## L6 examples -/

namespace Examples

def zeroThenZero : ℕ → Finset ℕ
  | 0 => ∅
  | _ + 1 => {0}

def zeroThenPair : ℕ → Finset ℕ
  | 0 => ∅
  | _ + 1 => {0, 1}

def zeroThenBoundary : ℕ → Finset ℕ
  | 0 => ∅
  | _ + 1 => {1}

def allInactive : ℕ → ℕ → Option ℕ := fun _ _ => none

def allZero : ℕ → ℕ → Option ℕ := fun _ _ => some 0

def allOne : ℕ → ℕ → Option ℕ := fun _ _ => some 1

def oscillatingZero (s : ℕ) : Finset ℕ := if s % 2 = 0 then ∅ else {0}

def growingRestraint : ℕ → ℕ → Option ℕ := fun _ s => some s

def lateZero : ℕ → Finset ℕ
  | 0 => ∅
  | 1 => ∅
  | _ + 2 => {0}

def droppedRestraint (_e s : ℕ) : Option ℕ := if s = 0 then some 1 else none

def initialSegments (s : ℕ) : Finset ℕ := Finset.range s

noncomputable def haltingStages (s : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range s).filter fun e => (Code.stageAt s ∅ e e).isSome

def perIndexRestraint (e _s : ℕ) : Option ℕ := some e

def resetOnce : ℕ → Option ℕ
  | 0 => some 0
  | _ + 1 => none

example : injurySet zeroThenZero allInactive 0 = ∅ := by
  ext x
  simp [injurySet, injuriesAt, allInactive]

example : injurySet zeroThenZero allZero 0 = {0} := by
  ext x
  simp only [injurySet, injuriesAt, fresh, allZero, Set.mem_ofPred_eq, Finset.mem_filter,
      Finset.mem_sdiff, Option.any_some, decide_eq_true_eq, Set.mem_singleton_iff]
  constructor
  · rintro ⟨s, -, hx⟩
    omega
  · rintro rfl
    exact ⟨0, ⟨by simp [zeroThenZero], by simp [zeroThenZero]⟩, le_rfl⟩

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
example : (∀ e, (injurySet haltingStages perIndexRestraint e).Finite) ∧
    ¬ ComputablePred (fun p : ℕ × ℕ =>
      p.2 ∈ injurySet haltingStages perIndexRestraint p.1) := by
  sorry

/-- Zero is a supplied negative answer; it still has a positive oracle use. -/
example : Code.run 1 (fun _ => some 0) .oracle 0 = some ⟨0, 1⟩ := by
  rfl

end Examples

/-! ## L9: agreement length, restraint and Sacks splitting -/

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

theorem first_disagreement_use_le (s : ℕ) (A C : Set ℕ) (e : ℕ) :
    Code.stageUse s A e (agreementLength s A C e) ≤ agreementRestraint s A C e :=
  stageUse_le_agreementRestraint s A C e le_rfl

theorem agreementLength_computable (A C : ℕ → Finset ℕ)
    (hA : Computable (fun s => finiteCode (A s)))
    (hC : Computable (fun s => finiteCode (C s))) :
    Computable (fun p : ℕ × ℕ => agreementLength p.2 (A p.2 : Set ℕ) (C p.2 : Set ℕ) p.1) := by
  sorry

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

theorem sacksSplit_union (B : CEApproximation) (C : ℕ → Finset ℕ) (s : ℕ) :
    sacksSplit B.stage C s false ∪ sacksSplit B.stage C s true = B.stage s := by
  sorry

theorem sacksSplit_disjoint (B : CEApproximation) (C : ℕ → Finset ℕ) (s : ℕ) :
    Disjoint (sacksSplit B.stage C s false) (sacksSplit B.stage C s true) := by
  sorry

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

/-- The constructed halves satisfy the full statement of [S, VII.3.2]. -/
theorem sacksSplit_spec (B C : CEApproximation)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage)) :
    let A := fun i => stageLimit fun s => sacksSplit B.stage C.stage s i
    Disjoint (A false) (A true) ∧ A false ∪ A true = stageLimit B.stage ∧
      ∀ i, Low (A i) ∧ ¬ (stageLimit C.stage ≤ᵀ A i) := by
  sorry

/-! ## L7–L9: construction endpoints -/

/-- [S, VII.1.1]. The README also specifies the construction and its injury bound. -/
theorem exists_low_simple : ∃ A : Set ℕ, Simple A ∧ Low A := by
  sorry

theorem exists_intermediate_ce_degree :
    ∃ A : Set ℕ, REPred (fun x => x ∈ A) ∧
      ¬ ComputablePred (fun x => x ∈ A) ∧ (A ≤ᵀ jump ∅) ∧ ¬ (jump ∅ ≤ᵀ A) := by
  sorry

/-- [S, VII.2.1]. -/
theorem friedberg_muchnik :
    ∃ A B : Set ℕ, REPred (fun x => x ∈ A) ∧ REPred (fun x => x ∈ B) ∧
      ¬ (A ≤ᵀ B) ∧ ¬ (B ≤ᵀ A) := by
  sorry

/-- [S, VII.3.1]. -/
theorem exists_simple_avoiding (C : Set ℕ) (hC : REPred (fun x => x ∈ C))
    (hNC : ¬ ComputablePred (fun x => x ∈ C)) :
    ∃ A : Set ℕ, Simple A ∧ ¬ (C ≤ᵀ A) := by
  sorry

/-- [S, VII.3.2]. `B` may be finite. -/
theorem sacks_splitting (B C : Set ℕ)
    (hB : REPred (fun x => x ∈ B)) (hC : REPred (fun x => x ∈ C))
    (hNC : ¬ ComputablePred (fun x => x ∈ C)) :
    ∃ A₀ A₁ : Set ℕ,
      REPred (fun x => x ∈ A₀) ∧ REPred (fun x => x ∈ A₁) ∧
      Low A₀ ∧ Low A₁ ∧ Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = B ∧
      ¬ (C ≤ᵀ A₀) ∧ ¬ (C ≤ᵀ A₁) := by
  sorry

/-- Uniform output enumeration indices. This does not assert uniform lowness-reduction indices. -/
theorem sacks_splitting_uniform_indices :
    ∃ f₀ f₁ : ℕ → ℕ → ℕ,
      Computable (fun p : ℕ × ℕ => f₀ p.1 p.2) ∧
      Computable (fun p : ℕ × ℕ => f₁ p.1 p.2) ∧
      ∀ b c, ¬ ComputablePred (fun x => x ∈ W ∅ c) →
        let A₀ := W ∅ (f₀ b c)
        let A₁ := W ∅ (f₁ b c)
        Low A₀ ∧ Low A₁ ∧ Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = W ∅ b ∧
          ¬ (W ∅ c ≤ᵀ A₀) ∧ ¬ (W ∅ c ≤ᵀ A₁) := by
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
