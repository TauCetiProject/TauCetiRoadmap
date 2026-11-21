import Mathlib
import TauCeti.Computability.TuringDegree
import TauCeti.Computability.Join
import TauCeti.Computability.Jump.Basic
import TauCeti.Computability.Jump.Low
import TauCeti.Computability.Simple.Basic
import TauCeti.Computability.Approximation.Modulus
import TauCeti.Computability.Enumeration.Stage
import TauCeti.Computability.Enumeration.Code
import TauCeti.Computability.SingleOracle.Evaln
import TauCeti.Computability.SingleOracle.Stage
import TauCeti.Computability.Priority.Injury.Basic

/-!
# Computability theory and finite-injury constructions: target signatures

`README.md` is the roadmap; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, on Tau Ceti's carriers: the set oracle
`Set.oracle`, the jump `Set.jump` and its iterates, low sets `Set.Low`, simple sets `Set.Simple`,
the parity join `Set.join`, the approximations `TauCeti.Approximation.Converges` and
`TauCeti.Approximation.IsModulus`, enumeration stages with the canonical stages
`Nat.Partrec.Code.domStage`, Soare's stage evaluation `TauCeti.Oracle.Single.Code.evalStage`
against the answers `TauCeti.Oracle.Single.Code.setAnswers` of a set, and the injury sets
`TauCeti.Priority.injurySet`. Its own definitions are the ones these statements need: c.e. and
computable relative to an oracle, the arithmetical pointclasses, and the stage machine of Sacks
splitting.

The headline theorems are `friedberg_muchnik` (L8); `exists_simple_avoiding`,
`sacks_splitting` with its uniform form `sacks_splitting_uniform_indices`, `low_incomparable_split`
and `low_halves_of_K` (L9); `post_sigma` and `post_delta` (L3.2); and `limitLemma`
(L4.3). Beside them stand the Modulus Lemma (L4.2), the Kleene–Post theorem (L5.3), and,
for the splitting construction, Soare's Lemma 1, the stabilization of the length of agreement and
the specification of the constructed halves (L9). Every headline theorem is statable at the
pins. The low simple set of L7 is proved in the pinned Tau Ceti and is not restated here.

Reference: [S] R. I. Soare, *Recursively Enumerable Sets and Degrees*, Springer, 1987.
-/

namespace TauCetiRoadmap.ComputabilityTheory

open TauCeti.Oracle.Single TauCeti.Enumeration

/-! ## L1: c.e. sets and effective presentations of enumerations -/

/-- `p` is c.e. in `Z`: the partial function that halts, with no output, exactly where `p` holds is
recursive in the oracle of `Z`. -/
def REPredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  RecursiveIn {Z.oracle} (fun x => Part.assert (p x) fun _ => Part.some ())

/-- `p` is computable in `Z`: some decision procedure for `p` is computable in the oracle of
`Z`. -/
def ComputablePredIn (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  ∃ d : DecidablePred p, ComputableIn {Z.oracle} fun x => @decide (p x) (d x)

/-! ## L3: the jump, the arithmetical hierarchy, and index sets -/

/-- `Σ⁰ₙ(Z)` by number quantifiers over matrices computable in `Z`: `Σ⁰₀(Z)` is the class
of predicates computable in `Z`, and `p ∈ Σ⁰ₙ₊₁(Z)` when `p x ↔ ∃ y, q ⟨x, y⟩` for some `q` whose
negation is in `Σ⁰ₙ(Z)`. -/
def SigmaIn : ℕ → Set ℕ → (ℕ → Prop) → Prop
  | 0, Z, p => ComputablePredIn Z p
  | n + 1, Z, p =>
      ∃ q : ℕ → Prop, SigmaIn n Z (fun z => ¬ q z) ∧ ∀ x, p x ↔ ∃ y, q (Nat.pair x y)

/-- `Π⁰ₙ(Z)`: the predicates whose negation is `Σ⁰ₙ(Z)`. -/
def PiIn (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  SigmaIn n Z fun x => ¬ p x

/-- `Δ⁰ₙ(Z) = Σ⁰ₙ(Z) ∩ Π⁰ₙ(Z)`. -/
def DeltaIn (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) : Prop :=
  SigmaIn n Z p ∧ PiIn n Z p

/-- **Post's theorem**, relativized: for every set `Z` and every `n`, a predicate is
`Σ⁰ₙ₊₁(Z)` iff it is c.e. in the `n`-th jump `Z⁽ⁿ⁾`. -/
theorem post_sigma (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) :
    SigmaIn (n + 1) Z p ↔ REPredIn (Set.jump^[n] Z) p := by
  sorry

/-- **Post's theorem**, relativized: for every set `Z` and every `n`, a predicate is
`Δ⁰ₙ₊₁(Z)` iff it is computable in `Z⁽ⁿ⁾`. -/
theorem post_delta (n : ℕ) (Z : Set ℕ) (p : ℕ → Prop) :
    DeltaIn (n + 1) Z p ↔ ComputablePredIn (Set.jump^[n] Z) p := by
  sorry

/-! ## L4: moduli, limit approximation, and stabilization information -/

/-- **The Limit Lemma**, relativized [S, III.3.3]: a total function is computable in `Z′` iff it is
the pointwise eventually constant limit of an approximation `a s x`, stage first, computable in
`Z`. -/
theorem limitLemma (Z : Set ℕ) (f : ℕ → ℕ) :
    ComputableIn {Z.jump.oracle} f ↔
      ∃ a : ℕ → ℕ → ℕ, ComputableIn₂ {Z.oracle} a ∧ TauCeti.Approximation.Converges a f := by
  sorry

/-- **The Modulus Lemma** [S, III.3.2], forward direction: a function computable in a c.e. set `Z`
has a computable approximation with a modulus computable in `Z`. -/
theorem modulus_of_ce_oracle (Z : Set ℕ) (hZ : REPred (· ∈ Z)) (f : ℕ → ℕ)
    (hf : ComputableIn {Z.oracle} f) :
    ∃ (a : ℕ → ℕ → ℕ) (m : ℕ → ℕ), Computable₂ a ∧ ComputableIn {Z.oracle} m ∧
      TauCeti.Approximation.IsModulus a f m := by
  sorry

/-! ## L5: diagonalization, simple sets, and finite-extension comparison -/

/-- **Kleene–Post** [S, VI.1.2]: there are two sets, both Turing reducible to `∅′`, neither Turing
reducible to the other. -/
theorem kleene_post :
    ∃ A B : Set ℕ, TuringReducible A.oracle (∅ : Set ℕ).jump.oracle ∧
      TuringReducible B.oracle (∅ : Set ℕ).jump.oracle ∧
      ¬ TuringReducible A.oracle B.oracle ∧ ¬ TuringReducible B.oracle A.oracle := by
  sorry

/-! ## L8: the original Friedberg–Muchnik construction -/

/-- **Friedberg–Muchnik** [S, VII.2.1]: there are two c.e. sets, neither Turing reducible to the
other. -/
theorem friedberg_muchnik :
    ∃ A B : Set ℕ, REPred (· ∈ A) ∧ REPred (· ∈ B) ∧
      ¬ TuringReducible A.oracle B.oracle ∧ ¬ TuringReducible B.oracle A.oracle := by
  sorry

/-! ## L9: agreement preservation and low Sacks splitting -/

/-- Stage agreement: the stage computation `Φ^A_{e,s}(x)`, Tau Ceti's stage evaluation
of program number `e` against the answers of `A`, converges with output `C(x)`. -/
noncomputable def stageAgreesAt (s : ℕ) (A C : Set ℕ) (e x : ℕ) : Bool :=
  match Code.evalStage (Code.setAnswers A) s (Denumerable.ofNat Code e) x with
  | none => false
  | some d => decide (d.output = C.indicator 1 x)

/-- Soare's length of agreement `ℓ(e, s)` for stage computations [S, VII.3, p. 122]: the first
argument at which the stage computation is absent or differs from `C`. A stage computation has
input below `s`, so the search ends at the latest at `s`. -/
noncomputable def stageAgreementLength (s : ℕ) (A C : Set ℕ) (e : ℕ) : ℕ :=
  ((List.range (s + 1)).find? fun x => !(stageAgreesAt s A C e x)).getD s

/-- Soare's restraint `r(e, s)` [S, VII.3, p. 122]: the largest use of the stage computations at
the arguments up to and including the length of agreement, the use of an absent computation being
`0`. -/
noncomputable def stageAgreementRestraint (s : ℕ) (A C : Set ℕ) (e : ℕ) : ℕ :=
  (Finset.range (stageAgreementLength s A C e + 1)).sup fun x =>
    ((Code.evalStage (Code.setAnswers A) s (Denumerable.ofNat Code e) x).map Code.Halt.use).getD 0

/-- Sacks's restraint of requirement `e` at stage `s`, always active, read from the stages `A s`
and `C s`. -/
noncomputable def sacksRestraint (A C : ℕ → Finset ℕ) (e s : ℕ) : Option ℕ :=
  some (stageAgreementRestraint s (A s : Set ℕ) (C s : Set ℕ) e)

/-- **Lemma 1** of [S, VII.3.1]: if `A` and `C` are enumerated by computable increasing finite
stages, `C` is not computable, and requirement `e` is injured only finitely often under Sacks's
restraint, then `Φ^A_e ≠ C`. -/
theorem nonreduction_of_finite_sacks_injury (A C : ℕ → Finset ℕ) (hA : Monotone A)
    (hAc : Computable fun s => Finset.equivBitIndices.symm (A s)) (hC : Monotone C)
    (hCc : Computable fun s => Finset.equivBitIndices.symm (C s)) (e : ℕ)
    (hNC : ¬ ComputablePred (· ∈ stageLimit C))
    (hI : (TauCeti.Priority.injurySet A (sacksRestraint A C) e).Finite) :
    Code.eval (stageLimit A).oracle (Denumerable.ofNat Code e) ≠ (stageLimit C).oracle := by
  sorry

/-- Stabilization: if the stages of `A` and `C` increase, requirement `e` is
injured only finitely often under Sacks's restraint, and `Φ^A_e ≠ C`, then the length of agreement
and the restraint are eventually constant. -/
theorem sacks_agreement_and_restraint_stabilize (A C : ℕ → Finset ℕ) (hA : Monotone A)
    (hC : Monotone C) (e : ℕ)
    (hI : (TauCeti.Priority.injurySet A (sacksRestraint A C) e).Finite)
    (hNE : Code.eval (stageLimit A).oracle (Denumerable.ofNat Code e) ≠ (stageLimit C).oracle) :
    ∃ l b s₀, ∀ s, s₀ ≤ s →
      stageAgreementLength s (A s : Set ℕ) (C s : Set ℕ) e = l ∧
        sacksRestraint A C e s = some b := by
  sorry

/-- The requirement pairs `(e, i)` with `e ≤ s`, in the priority order `2e + i`. -/
def pairsThrough (s : ℕ) : List (ℕ × Bool) :=
  (List.range (s + 1)).flatMap fun e => [(e, false), (e, true)]

/-- The highest-priority pair `(e, i)`, `e ≤ s`, whose current restraint `r i e` covers `x`. -/
def leastThreat (r : Bool → ℕ → Option ℕ) (s x : ℕ) : Option (ℕ × Bool) :=
  (pairsThrough s).find? fun p => (r p.2 p.1).any fun b => decide (x ≤ b)

/-- Soare's routing [S, VII.3, p. 125]: the side opposite the least threatened pair, and side `0`
(`false`) when no pair is threatened. -/
def routeSide (r : Bool → ℕ → Option ℕ) (s x : ℕ) : Bool :=
  match leastThreat r s x with
  | some (_, i) => !i
  | none => false

/-- The two halves of Sacks splitting at the end of each stage [S, VII.3.2]. The transition to
`s + 1` reads the restraints from the stage-`s` halves and the stage-`s` approximation to `C`, and
routes each fresh element of `B` separately. -/
noncomputable def sacksSplit (B C : ℕ → Finset ℕ) : ℕ → Bool → Finset ℕ
  | 0 => fun _ => ∅
  | s + 1 => fun i =>
      let r : Bool → ℕ → Option ℕ := fun j e =>
        some (stageAgreementRestraint s (sacksSplit B C s j : Set ℕ) (C s : Set ℕ) e)
      sacksSplit B C s i ∪ (fresh B s).filter fun x => routeSide r s x = i

/-- The constructed halves satisfy [S, VII.3.2]: for `B` and `C` enumerated by computable
increasing finite stages, `B` starting empty and `C` not computable, the halves are disjoint with
union `B`, both are low, and neither computes `C`. -/
theorem sacksSplit_spec (B C : ℕ → Finset ℕ) (hB : Monotone B) (hB0 : B 0 = ∅)
    (hBc : Computable fun s => Finset.equivBitIndices.symm (B s)) (hC : Monotone C)
    (hCc : Computable fun s => Finset.equivBitIndices.symm (C s))
    (hNC : ¬ ComputablePred (· ∈ stageLimit C)) :
    let A := fun i => stageLimit fun s => sacksSplit B C s i
    Disjoint (A false) (A true) ∧ A false ∪ A true = stageLimit B ∧
      ∀ i, (A i).Low ∧ ¬ TuringReducible (stageLimit C).oracle (A i).oracle := by
  sorry

/-- The split of the canonical stages of `W_b` against those of `W_c`, the stages
`Nat.Partrec.Code.domStage` of the ordinary programs numbered `b` and `c`: for all `b` and `c` the
halves are disjoint with union `W_b`; when `W_c` is not computable they are low and neither computes
`W_c`. -/
theorem sacksSplit_W_spec (b c : ℕ) :
    let B := (Denumerable.ofNat Nat.Partrec.Code b).domStage
    let C := (Denumerable.ofNat Nat.Partrec.Code c).domStage
    let A := fun i => stageLimit fun s => sacksSplit B C s i
    (Disjoint (A false) (A true) ∧ A false ∪ A true = stageLimit B) ∧
      (¬ ComputablePred (· ∈ stageLimit C) →
        ∀ i, (A i).Low ∧ ¬ TuringReducible (stageLimit C).oracle (A i).oracle) := by
  sorry

/-- **Sacks splitting, uniform indices**: total computable maps `f i` sending enumeration indices
`b`, `c` to an index of the half `i` of the split of the canonical stages of `W_b` against those of
`W_c`, for all `b` and `c`, with the stage table computable in `(b, c, s, i)`. No uniform index of
a lowness reduction is asserted. -/
theorem sacks_splitting_uniform_indices :
    ∃ f : Bool → ℕ → ℕ → ℕ,
      Computable (fun p : Bool × ℕ × ℕ => f p.1 p.2.1 p.2.2) ∧
      Computable (fun p : (ℕ × ℕ) × ℕ × Bool => Finset.equivBitIndices.symm
        (sacksSplit (Denumerable.ofNat Nat.Partrec.Code p.1.1).domStage
          (Denumerable.ofNat Nat.Partrec.Code p.1.2).domStage p.2.1 p.2.2)) ∧
      ∀ b c i, {x | ((Denumerable.ofNat Nat.Partrec.Code (f i b c)).eval x).Dom} =
        stageLimit fun s => sacksSplit (Denumerable.ofNat Nat.Partrec.Code b).domStage
          (Denumerable.ofNat Nat.Partrec.Code c).domStage s i := by
  sorry

/-- **Sacks cone avoidance** [S, VII.3.1]: for a c.e. set `C` that is not computable, some simple
set does not compute `C`. -/
theorem exists_simple_avoiding (C : Set ℕ) (hC : REPred (· ∈ C))
    (hNC : ¬ ComputablePred (· ∈ C)) :
    ∃ A : Set ℕ, A.Simple ∧ ¬ TuringReducible C.oracle A.oracle := by
  sorry

/-- **Sacks splitting with low halves** [S, VII.3.2]: if `B` and `C` are c.e. and `C` is not
computable, `B` is the union of two disjoint low c.e. sets, neither of which computes `C`. `B` need
not be infinite. -/
theorem sacks_splitting (B C : Set ℕ) (hB : REPred (· ∈ B)) (hC : REPred (· ∈ C))
    (hNC : ¬ ComputablePred (· ∈ C)) :
    ∃ A₀ A₁ : Set ℕ, REPred (· ∈ A₀) ∧ REPred (· ∈ A₁) ∧ A₀.Low ∧ A₁.Low ∧
      Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = B ∧
      ¬ TuringReducible C.oracle A₀.oracle ∧ ¬ TuringReducible C.oracle A₁.oracle := by
  sorry

/-- [S, VII.3.4]: a c.e. set `B` that is not computable splits into two disjoint low c.e. sets,
each Turing reducible to `B`, neither computing `B` nor the other, with `B` Turing equivalent to
their join. -/
theorem low_incomparable_split (B : Set ℕ) (hB : REPred (· ∈ B))
    (hNB : ¬ ComputablePred (· ∈ B)) :
    ∃ A₀ A₁ : Set ℕ, REPred (· ∈ A₀) ∧ REPred (· ∈ A₁) ∧ A₀.Low ∧ A₁.Low ∧
      Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = B ∧
      TuringReducible A₀.oracle B.oracle ∧ TuringReducible A₁.oracle B.oracle ∧
      ¬ TuringReducible B.oracle A₀.oracle ∧ ¬ TuringReducible B.oracle A₁.oracle ∧
      ¬ TuringReducible A₀.oracle A₁.oracle ∧ ¬ TuringReducible A₁.oracle A₀.oracle ∧
      TuringEquivalent B.oracle (Set.join A₀ A₁).oracle := by
  sorry

/-- The jump does not distribute over joins: `∅′` splits into two disjoint low c.e. sets whose
join is not low. -/
theorem low_halves_of_K :
    ∃ A₀ A₁ : Set ℕ, REPred (· ∈ A₀) ∧ REPred (· ∈ A₁) ∧ A₀.Low ∧ A₁.Low ∧
      Disjoint A₀ A₁ ∧ A₀ ∪ A₁ = (∅ : Set ℕ).jump ∧ ¬ (Set.join A₀ A₁).Low := by
  sorry

end TauCetiRoadmap.ComputabilityTheory
