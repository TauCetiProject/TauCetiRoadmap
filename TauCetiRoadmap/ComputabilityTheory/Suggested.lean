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
never the body of a predicate or of an evaluator. The operational code prototype is deliberately
concrete so that its use and adequacy obligations can be read against actual semantics.

Names and namespaces are provisional. `Oracle.Single.Code` follows the shape of Mathlib
PR #38973 inside this roadmap-only namespace, not a competing root namespace. Integrators must
adopt the current Mathlib/Tau Ceti API. The set notation below expands directly to Mathlib's
partial-function reducibility; it introduces no second notion of reducibility.

This draft has not been elaborated in Lean. See the package-root HANDOFF.md for the exact
validation state and commands. In particular, its coding/effectivity signatures and the
primitive-coding integration must be checked against the repository pin before submission.
-/

set_option autoImplicit false

namespace TauCetiRoadmap.ComputabilityTheory

open scoped BigOperators

/-! ## Set oracles and the existing extensional predicates -/

/-- A set oracle supplies a total 0/1 answer, including negative answers. -/
noncomputable def characteristic (A : Set ℕ) (x : ℕ) : ℕ := by
  classical
  exact if x ∈ A then 1 else 0

/-- The total characteristic function, viewed as a Mathlib partial function. -/
noncomputable def oracle (A : Set ℕ) : ℕ →. ℕ :=
  fun x => Part.some (characteristic A x)

local notation:50 A " ≤ᵀ " B => _root_.TuringReducible (oracle A) (oracle B)
local notation:50 A " ≡ᵀ " B => _root_.TuringEquivalent (oracle A) (oracle B)

/-- Relative c.e.-ness specializes the existing `RecursiveIn` predicate. -/
def REPredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  RecursiveIn {oracle Z} (fun x => Part.assert (p x) fun _ => Part.some ())

/-- Relative decidability means an actual computable characteristic procedure. -/
def ComputablePredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  ∃ d : DecidablePred p,
    ComputableIn {oracle Z} (fun x => @decide (p x) (d x))

theorem rePredIn_empty_iff (p : ℕ → Prop) : REPredIn ∅ p ↔ REPred p := by
  sorry

theorem computablePredIn_empty_iff (p : ℕ → Prop) :
    ComputablePredIn ∅ p ↔ ComputablePred p := by
  sorry

/-- Soare's parity join, not ordinary union. -/
def join (A B : Set ℕ) : Set ℕ :=
  {n | if n % 2 = 0 then n / 2 ∈ A else n / 2 ∈ B}

/-- The column containing the potential witnesses for requirement `e`. -/
def column (e : ℕ) : Set ℕ := {n | n.unpair.2 = e}

theorem column_infinite (e : ℕ) : (column e).Infinite := by
  sorry

theorem join_le_iff (A B C : Set ℕ) :
    (join A B ≤ᵀ C) ↔ (A ≤ᵀ C) ∧ (B ≤ᵀ C) := by
  sorry

/-- The enumeration hypotheses, not inclusion alone, supply these reductions. -/
theorem ce_split_reductions (B A₀ A₁ : Set ℕ)
    (h₀ : REPred (fun x => x ∈ A₀)) (h₁ : REPred (fun x => x ∈ A₁))
    (hd : Disjoint A₀ A₁) (hu : A₀ ∪ A₁ = B) :
    (A₀ ≤ᵀ B) ∧ (A₁ ≤ᵀ B) ∧ (B ≡ᵀ join A₀ A₁) := by
  sorry

/-! ## L0: concrete oracle codes, finite evaluation, outputs, and uses -/

namespace Oracle.Single

/-- Shape aligned with the single-oracle Mathlib proposal. -/
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

/-- A fully specified numeric coding for this prototype. -/
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

/-- Sequential bounded minimization: an unanswered earlier test is not skipped. -/
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

/-- Stage use is zero on nonconvergence, not an indication that use zero diverges. -/
noncomputable def stageUse (s : ℕ) (Z : Set ℕ) (e x : ℕ) : ℕ :=
  ((stageAt s Z e x).map Halt.use).getD 0

/-- Code translation uses the existing ordinary syntax, not a new ordinary machine. -/
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

/-- Bounded simulation returns encoded data, so the computability statement needs no code instance. -/
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

/-- The chosen acceptable numbering of set-oracle computations. -/
noncomputable def Phi (Z : Set ℕ) (e : ℕ) : ℕ →. ℕ :=
  Code.eval (characteristic Z) (Code.ofNat e)

/-- The represented c.e. domain, not an arbitrary supplied family of sets. -/
def W (Z : Set ℕ) (e : ℕ) : Set ℕ := {x | (Phi Z e x).Dom}

/-- Raw bounded domain approximation; serialization is a separate theorem. -/
noncomputable def WStage (Z : Set ℕ) (e s : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range s).filter fun x => (Code.stageAt s Z e x).isSome

theorem mem_phi_iff_stage (Z : Set ℕ) (e x y : ℕ) :
    y ∈ Phi Z e x ↔ ∃ s d, Code.stageAt s Z e x = some d ∧ d.output = y := by
  sorry

/-- Both directions are required; a negative theorem cannot use a too-weak private machine. -/
theorem recursiveIn_iff_code (Z : Set ℕ) (f : ℕ →. ℕ) :
    RecursiveIn {oracle Z} f ↔ ∃ e, Phi Z e = f := by
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

/-! ## L1: finite stages and c.e. limits -/

/-- Canonical binary code of a finite set of numbers. It does not require a Finset coding instance. -/
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

/-- Allows pauses, and therefore covers finite and empty inputs uniformly. -/
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

/-- Lowness is not merely an unspecified upper-bound oracle interface. -/
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

/-- Alternating number-quantifier normal forms; jumps do not appear in this definition. -/
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

/-- Every genuine limit computation is eventually seen along pointwise-convergent oracles. -/
theorem eventually_stage_of_limit_computation (Z : ℕ → Set ℕ) (Zlim : Set ℕ)
    (hZ : ∀ n, ∃ s₀, ∀ s, s₀ ≤ s → (n ∈ Z s ↔ n ∈ Zlim))
    {e x y : ℕ} (h : y ∈ Phi Zlim e x) :
    ∃ (s₀ : ℕ) (d : Code.Halt), d.output = y ∧
      ∀ s, s₀ ≤ s → Code.stageAt s (Z s) e x = some d := by
  sorry

/-! ## L5: ordinary definitions and independently meaningful construction goals -/

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

/-- Auxiliary strict use-prefix breaches; not a redefinition of the inclusive injury batch. -/
def useBreachesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e s : ℕ) : Finset ℕ :=
  (fresh A s).filter fun x => (r e s).any fun b => decide (x < b)

/-- Fresh entries at the active restraint boundary; inactive restraint has no boundary. -/
def boundaryInjuriesAt (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (e s : ℕ) : Finset ℕ :=
  (fresh A s).filter fun x => r e s = some x

/-- Number-valued strict-breach set used for the first step of the Sacks induction. -/
def useBreachSet (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {x | ∃ s, x ∈ useBreachesAt A r e s}

/-- Soare's injury set is a set of numbers, not a set of stages. -/
def injurySet (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set ℕ :=
  {x | ∃ s, x ∈ injuriesAt A r e s}

/-- The first coordinate is the pre-stage; the injury occurs at its successor. -/
def injuryEvents (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (e : ℕ) : Set (ℕ × ℕ) :=
  {p | p.2 ∈ injuriesAt A r e p.1}

/-- Actual stage labels, so stage zero never belongs. -/
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

/-- Stabilization implies boundedness; only the further injury-stage conclusion needs monotonicity. -/
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

/-- Repeated injuries of one number are ruled out by entry monotonicity, not by definition. -/
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

/-- Computability is uniform in the requirement index, not just separately for each `e`. -/
theorem injury_membership_computable (A : ℕ → Finset ℕ)
    (r : ℕ → ℕ → Option ℕ) (hA : Computable (fun s => finiteCode (A s)))
    (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    ComputablePred (fun p : ℕ × (ℕ × ℕ) => p.2.2 ∈ injuriesAt A r p.1 p.2.1) := by
  sorry

theorem injurySet_uniformly_ce (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ)
    (hA : Computable (fun s => finiteCode (A s))) (hr : Computable (fun p : ℕ × ℕ => r p.1 p.2)) :
    REPred (fun p : ℕ × ℕ => p.2 ∈ injurySet A r p.1) := by
  sorry

/-- A stage label has a computable finite injury test, not just a c.e. one. -/
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

/-- Contributions are attached to actual entries, not a free-standing ledger. -/
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

/-- This is the semantic telescope used to turn restraints into preserved computations. -/
theorem limit_agrees_of_no_fresh_below (A : ℕ → Finset ℕ) (hA : Monotone A)
    (s u : ℕ) (h : ∀ t, s ≤ t → ∀ z, z < u → z ∉ fresh A t) :
    ∀ z, z < u → (z ∈ A s ↔ z ∈ stageLimit A) := by
  sorry

/-- No injury is useful only while the live protected interval still covers the recorded use. -/
theorem computation_preserved_by_live_restraint
    (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (hA : Monotone A)
    {s e x req : ℕ} {d : Code.Halt}
    (hcomp : Code.stageAt s (A s : Set ℕ) e x = some d)
    (hquiet : ∀ t, s ≤ t → injuriesAt A r req t = ∅)
    (hcovers : ∀ t, s ≤ t → ∀ z, z < d.use →
      ∃ b, r req t = some b ∧ z ≤ b) :
    d.output ∈ Phi (stageLimit A) e x := by
  sorry

/-- Strict breaches suffice when the current numerical bound covers the exclusive use. -/
theorem computation_preserved_without_use_breaches
    (A : ℕ → Finset ℕ) (r : ℕ → ℕ → Option ℕ) (hA : Monotone A)
    {s e x req : ℕ} {d : Code.Halt}
    (hcomp : Code.stageAt s (A s : Set ℕ) e x = some d)
    (hquiet : ∀ t, s ≤ t → useBreachesAt A r req t = ∅)
    (hcovers : ∀ t, s ≤ t → ∃ b, r req t = some b ∧ d.use ≤ b) :
    d.output ∈ Phi (stageLimit A) e x := by
  sorry

/-- Actual attention stages; this is not the number-valued injury set. -/
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

/-! ## L6 examples: concrete data rather than an abstract field named `injured`. -/

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
  sorry

example : injurySet zeroThenZero allZero 0 = {0} := by
  sorry

example : injurySet zeroThenBoundary allOne 0 = {1} := by
  sorry

/-- Address one is outside the exclusive prefix of length one. -/
example : Code.initialSegment (zeroThenBoundary 0 : Set ℕ) 1 =
    Code.initialSegment (stageLimit zeroThenBoundary) 1 := by
  sorry

example : injurySet zeroThenPair allOne 0 = {0, 1} ∧
    injuryStages zeroThenPair allOne 0 = {1} := by
  sorry

/-- Dropping stage monotonicity destroys the finite-numbers/finite-stages equivalence. -/
example : injurySet oscillatingZero allZero 0 = {0} ∧
    (injuryStages oscillatingZero allZero 0).Infinite := by
  sorry

example : injurySet (fun _ => ∅) growingRestraint 0 = ∅ ∧
    ¬ ∃ b s₀, ∀ s, s₀ ≤ s → growingRestraint 0 s = b := by
  sorry

/-- Strict routing alone does not imply finite inclusive injury for arbitrary restraints. -/
example : useBreachSet initialSegments growingRestraint 0 = ∅ ∧
    injurySet initialSegments growingRestraint 0 = Set.univ := by
  sorry

example : injurySet lateZero droppedRestraint 0 = ∅ ∧
    Code.initialSegment (lateZero 0 : Set ℕ) 1 ≠ Code.initialSegment (stageLimit lateZero) 1 := by
  sorry

example : initializationStages resetOnce 1 = {1} ∧
    injuryStages (fun _ => ∅) allOne 1 = ∅ := by
  sorry

/-- A zero-use successful computation and an unanswered query are different. -/
example : Code.run 1 (fun _ => none) .zero 0 = some ⟨0, 0⟩ ∧
    Code.run 1 (fun _ => none) .oracle 0 = none := by
  exact ⟨rfl, rfl⟩

/-- Finite fibres do not supply a uniform decision procedure for the injury-number family. -/
example : (∀ e, (injurySet haltingStages perIndexRestraint e).Finite) ∧
    ¬ ComputablePred (fun p : ℕ × ℕ =>
      p.2 ∈ injurySet haltingStages perIndexRestraint p.1) := by
  sorry

/-- Zero is a supplied negative answer; it still has a positive oracle use. -/
example : Code.run 1 (fun _ => some 0) .oracle 0 = some ⟨0, 1⟩ := by
  rfl

end Examples

/-! ## L9: the first-disagreement endpoint is present in the definition. -/

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

/-- The actual restraint computed from the two stage sequences. -/
noncomputable def sacksRestraint (A C : ℕ → Finset ℕ) (e s : ℕ) : Option ℕ :=
  some (agreementRestraint s (A s : Set ℕ) (C s : Set ℕ) e)

theorem agreementLength_spec (s : ℕ) (A C : Set ℕ) (e : ℕ) :
    agreementLength s A C e ≤ s ∧
      (∀ x, x < agreementLength s A C e → agreesAt s A C e x = true) ∧
      agreesAt s A C e (agreementLength s A C e) = false := by
  sorry

theorem first_disagreement_use_le (s : ℕ) (A C : Set ℕ) (e : ℕ) :
    Code.stageUse s A e (agreementLength s A C e) ≤ agreementRestraint s A C e := by
  sorry

theorem sacksRestraint_computable (A C : ℕ → Finset ℕ)
    (hA : Computable (fun s => finiteCode (A s)))
    (hC : Computable (fun s => finiteCode (C s))) :
    Computable (fun p : ℕ × ℕ => sacksRestraint A C p.1 p.2) := by
  sorry

/-- No hypothetical stabilization modulus is supplied to this statement. -/
theorem agreement_cofinal_of_computes (A C : ℕ → Finset ℕ)
    (hA : Monotone A) (hC : Monotone C) (e : ℕ)
    (h : Phi (stageLimit A) e = oracle (stageLimit C)) :
    ∀ n, ∃ s₀, ∀ s, s₀ ≤ s → n ≤ agreementLength s (A s : Set ℕ) (C s : Set ℕ) e := by
  sorry

/-- Primary Sacks preservation theorem: actual strict breaches are sufficient. -/
theorem nonreduction_of_finite_sacks_use_breaches (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (useBreachSet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    Phi (stageLimit A.stage) e ≠ oracle (stageLimit C.stage) := by
  sorry

theorem sacks_restraint_stabilizes_of_finite_use_breaches
    (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (useBreachSet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    ∃ b s₀, ∀ s, s₀ ≤ s → sacksRestraint A.stage C.stage e s = some b := by
  sorry

/-- The inclusive/strict endpoint bridge uses the proved stabilization of this restraint. -/
theorem finite_sacks_injury_of_finite_use_breaches (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (useBreachSet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    (injurySet A.stage (sacksRestraint A.stage C.stage) e).Finite := by
  sorry

/-- The use of the first disagreement is needed in the preservation proof of this lemma. -/
theorem nonreduction_of_finite_sacks_injury (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (injurySet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    Phi (stageLimit A.stage) e ≠ oracle (stageLimit C.stage) := by
  sorry

theorem sacks_restraint_stabilizes (A C : CEApproximation) (e : ℕ)
    (hNC : ¬ ComputablePred (fun x => x ∈ stageLimit C.stage))
    (hI : (injurySet A.stage (sacksRestraint A.stage C.stage) e).Finite) :
    ∃ b s₀, ∀ s, s₀ ≤ s → sacksRestraint A.stage C.stage e s = some b := by
  sorry

/-! ## L7–L9: unconditional construction endpoints over the concrete definitions -/

/-- Soare VII.1.1; the README additionally specifies the construction and injury bound. -/
theorem exists_low_simple : ∃ A : Set ℕ, Simple A ∧ Low A := by
  sorry

theorem exists_intermediate_ce_degree :
    ∃ A : Set ℕ, REPred (fun x => x ∈ A) ∧
      ¬ ComputablePred (fun x => x ∈ A) ∧ (A ≤ᵀ jump ∅) ∧ ¬ (jump ∅ ≤ᵀ A) := by
  sorry

/-- Soare VII.2.1, in Mathlib's reducibility, not only a private code model. -/
theorem friedberg_muchnik :
    ∃ A B : Set ℕ, REPred (fun x => x ∈ A) ∧ REPred (fun x => x ∈ B) ∧
      ¬ (A ≤ᵀ B) ∧ ¬ (B ≤ᵀ A) := by
  sorry

/-- Soare VII.3.1, a separate client of agreement preservation. -/
theorem exists_simple_avoiding (C : Set ℕ) (hC : REPred (fun x => x ∈ C))
    (hNC : ¬ ComputablePred (fun x => x ∈ C)) :
    ∃ A : Set ℕ, Simple A ∧ ¬ (C ≤ᵀ A) := by
  sorry

/-- Full low-half, cone-avoiding statement of Soare VII.3.2; `B` may be finite. -/
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

/-- Soare VII.3.4 with the lower reductions displayed, not left to subset reasoning. -/
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
