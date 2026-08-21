import Mathlib.Data.List.Permutation
import Mathlib.Data.List.Rotate
import TauCeti.LinearAlgebra.RootSystem.DynkinType
import TauCetiRoadmap.AlgebraicCodingTheory.Suggested

/-!
# Rank-24 lattice constructions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for load-bearing milestones, so that
contributors and reviewers can test the explicit table, dependent glue coordinates, gluing
interface, and Leech minimum-norm argument. Proving every declaration here would not by itself
complete a layer or the roadmap. `sorry` is permitted in this human-owned roadmap repository:
these are targets, not implementations.

The 23 rootful lattices use the actual discriminant quotients and `ofIsotropicSubgroup` from the
integral-lattices roadmap. The code comparisons use the actual named codes from the
algebraic-coding-theory roadmap. The Leech lattice is the Construction-B half-lattice plus an odd
shift; it is not the rootful `A₁²⁴` Construction-A lattice. The Markdown roadmap remains
definitive.
-/

namespace TauCetiRoadmap.Rank24LatticeConstructions

open scoped BigOperators
open TauCeti
open TauCetiRoadmap.IntegralLattices

universe u

def IsADEComponent (t : DynkinType) : Prop := t.Valid ∧ t.IsSimplyLaced

/-- A component on which the ADE lattice and glue-alphabet constructions are defined. In
particular, invalid low-rank `A`/`D` names and every `B`/`C`/`F`/`G` name are uninhabited here. -/
abbrev ADEComponent := {t : DynkinType // IsADEComponent t}

/-- An ordered list together with the validity and simple-lacedness proof needed by every generic
ADE construction below. -/
structure ADEComponentList where
  values : List DynkinType
  isADE : ∀ t ∈ values, IsADEComponent t

/-! ## The machine-readable 23-row table -/

/-- Indices for the 23 rootful rows, in Conway--Sloane Table 16.1 order. This is an index of
explicit constructions, not the conclusion of a classification theorem. -/
inductive RootfulNiemeierType where
  | d24 | d16e8 | e8_3 | a24 | d12_2 | a17e7 | d10e7_2 | a15d9
  | d8_3 | a12_2 | a11d7e6 | e6_4 | a9_2d6 | d6_4 | a8_3
  | a7_2d5_2 | a6_4 | a5_4d4 | d4_6 | a4_6 | a3_8 | a2_12 | a1_24
  deriving DecidableEq

noncomputable def rootfulNiemeierTypeEquivFin : RootfulNiemeierType ≃ Fin 23 := sorry

noncomputable instance : Finite RootfulNiemeierType :=
  Finite.of_injective rootfulNiemeierTypeEquivFin rootfulNiemeierTypeEquivFin.injective

noncomputable instance : Fintype RootfulNiemeierType := Fintype.ofFinite _

namespace RootfulNiemeierType

/-- The raw ordered components: the order is part of the glue-coordinate convention. -/
def rawComponents : RootfulNiemeierType → List DynkinType
  | .d24 => [.D 24]
  | .d16e8 => [.D 16, .E8]
  | .e8_3 => [.E8, .E8, .E8]
  | .a24 => [.A 24]
  | .d12_2 => [.D 12, .D 12]
  | .a17e7 => [.A 17, .E7]
  | .d10e7_2 => [.D 10, .E7, .E7]
  | .a15d9 => [.A 15, .D 9]
  | .d8_3 => [.D 8, .D 8, .D 8]
  | .a12_2 => [.A 12, .A 12]
  | .a11d7e6 => [.A 11, .D 7, .E6]
  | .e6_4 => [.E6, .E6, .E6, .E6]
  | .a9_2d6 => [.A 9, .A 9, .D 6]
  | .d6_4 => [.D 6, .D 6, .D 6, .D 6]
  | .a8_3 => [.A 8, .A 8, .A 8]
  | .a7_2d5_2 => [.A 7, .A 7, .D 5, .D 5]
  | .a6_4 => [.A 6, .A 6, .A 6, .A 6]
  | .a5_4d4 => [.A 5, .A 5, .A 5, .A 5, .D 4]
  | .d4_6 => [.D 4, .D 4, .D 4, .D 4, .D 4, .D 4]
  | .a4_6 => [.A 4, .A 4, .A 4, .A 4, .A 4, .A 4]
  | .a3_8 => [.A 3, .A 3, .A 3, .A 3, .A 3, .A 3, .A 3, .A 3]
  | .a2_12 => List.replicate 12 (.A 2)
  | .a1_24 => List.replicate 24 (.A 1)

theorem rawComponents_isADE (X : RootfulNiemeierType) :
    ∀ t ∈ X.rawComponents, IsADEComponent t := by
  cases X <;> simp [rawComponents, IsADEComponent]

/-- The table components bundled with the hypotheses required by all ADE-only APIs. -/
def components (X : RootfulNiemeierType) : ADEComponentList where
  values := X.rawComponents
  isADE := X.rawComponents_isADE

def coxeterNumber : RootfulNiemeierType → ℕ
  | .d24 => 46
  | .d16e8 | .e8_3 => 30
  | .a24 => 25
  | .d12_2 => 22
  | .a17e7 | .d10e7_2 => 18
  | .a15d9 => 16
  | .d8_3 => 14
  | .a12_2 => 13
  | .a11d7e6 | .e6_4 => 12
  | .a9_2d6 | .d6_4 => 10
  | .a8_3 => 9
  | .a7_2d5_2 => 8
  | .a6_4 => 7
  | .a5_4d4 | .d4_6 => 6
  | .a4_6 => 5
  | .a3_8 => 4
  | .a2_12 => 3
  | .a1_24 => 2

/-- Cyclic factors, in component order, which present the displayed discriminant group. These are
not asserted to be Smith-normal-form invariant factors. -/
def discriminantCyclicFactors : RootfulNiemeierType → List ℕ
  | .d24 | .d16e8 => [2, 2]
  | .e8_3 => []
  | .a24 => [25]
  | .d12_2 => [2, 2, 2, 2]
  | .a17e7 => [18, 2]
  | .d10e7_2 => [2, 2, 2, 2]
  | .a15d9 => [16, 4]
  | .d8_3 => [2, 2, 2, 2, 2, 2]
  | .a12_2 => [13, 13]
  | .a11d7e6 => [12, 4, 3]
  | .e6_4 => [3, 3, 3, 3]
  | .a9_2d6 => [10, 10, 2, 2]
  | .d6_4 => List.replicate 8 2
  | .a8_3 => [9, 9, 9]
  | .a7_2d5_2 => [8, 8, 4, 4]
  | .a6_4 => [7, 7, 7, 7]
  | .a5_4d4 => [6, 6, 6, 6, 2, 2]
  | .d4_6 => List.replicate 12 2
  | .a4_6 => [5, 5, 5, 5, 5, 5]
  | .a3_8 => List.replicate 8 4
  | .a2_12 => List.replicate 12 3
  | .a1_24 => List.replicate 24 2

def glueOrder : RootfulNiemeierType → ℕ
  | .d24 | .d16e8 => 2
  | .e8_3 => 1
  | .a24 => 5
  | .d12_2 | .d10e7_2 => 4
  | .a17e7 => 6
  | .a15d9 | .d8_3 => 8
  | .a12_2 => 13
  | .a11d7e6 => 12
  | .e6_4 => 9
  | .a9_2d6 => 20
  | .d6_4 => 16
  | .a8_3 => 27
  | .a7_2d5_2 => 32
  | .a6_4 => 49
  | .a5_4d4 => 72
  | .d4_6 => 64
  | .a4_6 => 125
  | .a3_8 => 256
  | .a2_12 => 729
  | .a1_24 => 4096

def rootCount : RootfulNiemeierType → ℕ
  | .d24 => 1104
  | .d16e8 | .e8_3 => 720
  | .a24 => 600
  | .d12_2 => 528
  | .a17e7 | .d10e7_2 => 432
  | .a15d9 => 384
  | .d8_3 => 336
  | .a12_2 => 312
  | .a11d7e6 | .e6_4 => 288
  | .a9_2d6 | .d6_4 => 240
  | .a8_3 => 216
  | .a7_2d5_2 => 192
  | .a6_4 => 168
  | .a5_4d4 | .d4_6 => 144
  | .a4_6 => 120
  | .a3_8 => 96
  | .a2_12 => 72
  | .a1_24 => 48

def ADEcoxeterNumber : ADEComponent → ℕ
  | ⟨.A n, _⟩ => n + 1
  | ⟨.D n, _⟩ => 2 * n - 2
  | ⟨.E6, _⟩ => 12
  | ⟨.E7, _⟩ => 18
  | ⟨.E8, _⟩ => 30
  | ⟨.B _, h⟩ | ⟨.C _, h⟩ | ⟨.F4, h⟩ | ⟨.G2, h⟩ => False.elim h.2

def ADErootCount : ADEComponent → ℕ
  | ⟨.A n, _⟩ => n * (n + 1)
  | ⟨.D n, _⟩ => 2 * n * (n - 1)
  | ⟨.E6, _⟩ => 72
  | ⟨.E7, _⟩ => 126
  | ⟨.E8, _⟩ => 240
  | ⟨.B _, h⟩ | ⟨.C _, h⟩ | ⟨.F4, h⟩ | ⟨.G2, h⟩ => False.elim h.2

/-- The three expansion operations used by the printed table. -/
inductive GluePattern where
  | literal (digits : List ℕ)
  | cyclic (initial block terminal : List ℕ)
  | evenPermutations (digits : List ℕ)
  deriving DecidableEq

/-- How the printed generators are spanned. Every row except `D₄⁶` uses ordinary additive
closure. The `D₄⁶` typography is a basis over the pinned `F₄`, so its scalar orbit is inserted
before taking additive closure. -/
inductive GlueSpanKind where
  | additive
  | f4Linear
  deriving DecidableEq

def glueSpanKind : RootfulNiemeierType → GlueSpanKind
  | .d4_6 => .f4Linear
  | _ => .additive

open GluePattern

/-- A machine-readable transcription of every Conway--Sloane generator pattern. -/
def gluePatterns : RootfulNiemeierType → List GluePattern
  | .d24 => [.literal [1]]
  | .d16e8 => [.literal [1, 0]]
  | .e8_3 => [.literal [0, 0, 0]]
  | .a24 => [.literal [5]]
  | .d12_2 => [.literal [1, 2], .literal [2, 1]]
  | .a17e7 => [.literal [3, 1]]
  | .d10e7_2 => [.literal [1, 1, 0], .literal [3, 0, 1]]
  | .a15d9 => [.literal [2, 1]]
  | .d8_3 => [.cyclic [] [1, 2, 2] []]
  | .a12_2 => [.literal [1, 5]]
  | .a11d7e6 => [.literal [1, 1, 1]]
  | .e6_4 => [.cyclic [1] [0, 1, 2] []]
  | .a9_2d6 => [.literal [2, 4, 0], .literal [5, 0, 1], .literal [0, 5, 3]]
  | .d6_4 => [.evenPermutations [0, 1, 2, 3]]
  | .a8_3 => [.cyclic [] [1, 1, 4] []]
  | .a7_2d5_2 => [.literal [1, 1, 1, 2], .literal [1, 7, 2, 1]]
  | .a6_4 => [.cyclic [1] [2, 1, 6] []]
  | .a5_4d4 =>
      [.cyclic [2] [0, 2, 4] [0], .literal [3, 3, 0, 0, 1],
        .literal [3, 0, 3, 0, 2], .literal [3, 0, 0, 3, 3]]
  | .d4_6 => [.literal [1, 1, 1, 1, 1, 1], .cyclic [0] [0, 2, 3, 3, 2] []]
  | .a4_6 => [.cyclic [1] [0, 1, 4, 4, 1] []]
  | .a3_8 => [.cyclic [3] [2, 0, 0, 1, 0, 1, 1] []]
  | .a2_12 => [.cyclic [2] [1, 1, 2, 1, 1, 1, 2, 2, 2, 1, 2] []]
  | .a1_24 =>
      [.cyclic [1] [0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1] []]

structure GlueTableRow where
  components : ADEComponentList
  coxeterNumber : ℕ
  discriminantCyclicFactors : List ℕ
  generators : List GluePattern
  spanKind : GlueSpanKind
  glueOrder : ℕ
  rootCount : ℕ

/-- Executable data is the implementation input; the Markdown table is its normative display. -/
def niemeierGlueTable (X : RootfulNiemeierType) : GlueTableRow where
  components := X.components
  coxeterNumber := X.coxeterNumber
  discriminantCyclicFactors := X.discriminantCyclicFactors
  generators := X.gluePatterns
  spanKind := X.glueSpanKind
  glueOrder := X.glueOrder
  rootCount := X.rootCount

theorem card_rootfulNiemeierType : Fintype.card RootfulNiemeierType = 23 := sorry

theorem components_rank (X : RootfulNiemeierType) :
    (X.components.values.map DynkinType.rank).sum = 24 := by
  cases X <;> decide

theorem components_coxeterNumber (X : RootfulNiemeierType) :
    ∀ (t : DynkinType) (ht : t ∈ X.components.values),
      ADEcoxeterNumber ⟨t, X.components.isADE t ht⟩ = X.coxeterNumber := sorry

theorem components_rootCount (X : RootfulNiemeierType) :
    (X.components.values.attach.map fun t ↦
      ADErootCount ⟨t.1, X.components.isADE t.1 t.2⟩).sum = X.rootCount := sorry

theorem components_perm_iff (X Y : RootfulNiemeierType) :
    X.components.values.Perm Y.components.values ↔ X = Y := sorry

/-- The determinant order is the square of the proposed glue order. -/
theorem discriminantOrder_eq_glueOrder_sq (X : RootfulNiemeierType) :
    X.discriminantCyclicFactors.prod = X.glueOrder ^ 2 := by
  cases X <;> decide

end RootfulNiemeierType

/-! ## Typed ADE glue coordinates -/

/-- The discriminant-group carrier attached to a valid simply-laced ADE component. The impossible
branches are eliminated by the subtype proof; no non-ADE or invalid component receives a fallback
alphabet. -/
def ADEGlueAlphabet : ADEComponent → Type
  | ⟨.A n, _⟩ => ZMod (n + 1)
  | ⟨.D n, _⟩ => if Even n then ZMod 2 × ZMod 2 else ZMod 4
  | ⟨.E6, _⟩ => ZMod 3
  | ⟨.E7, _⟩ => ZMod 2
  | ⟨.E8, _⟩ => ZMod 1
  | ⟨.B _, h⟩ | ⟨.C _, h⟩ | ⟨.F4, h⟩ | ⟨.G2, h⟩ => False.elim h.2

instance (t : ADEComponent) : AddCommGroup (ADEGlueAlphabet t) := by
  rcases t with ⟨t, h⟩
  cases t with
  | A n => simp only [ADEGlueAlphabet]; infer_instance
  | D n => simp only [ADEGlueAlphabet]; split <;> infer_instance
  | E6 | E7 | E8 => simp only [ADEGlueAlphabet]; infer_instance
  | B _ | C _ | F4 | G2 => exact False.elim h.2

instance (t : ADEComponent) : Finite (ADEGlueAlphabet t) := by
  rcases t with ⟨t, h⟩
  cases t with
  | A n => simp only [ADEGlueAlphabet]; infer_instance
  | D n => simp only [ADEGlueAlphabet]; split <;> infer_instance
  | E6 | E7 | E8 => simp only [ADEGlueAlphabet]; infer_instance
  | B _ | C _ | F4 | G2 => exact False.elim h.2

def ADEComponentList.componentAt (ts : ADEComponentList) (i : Fin ts.values.length) :
    ADEComponent :=
  ⟨ts.values.get i, ts.isADE _ (List.get_mem ts.values i)⟩

/-- One glue digit per ordered, proved-ADE component. -/
abbrev GlueCoordinates (ts : ADEComponentList) :=
  (i : Fin ts.values.length) → ADEGlueAlphabet (ts.componentAt i)

/-- Simple-root coordinates for the rational ambient space of an orthogonal ADE sum. -/
abbrev RootCoordinate (ts : ADEComponentList) :=
  Σ i : Fin ts.values.length, Fin (ts.values.get i).rank

/-- The positive orthogonal sum of valid simply-laced ADE root lattices. -/
noncomputable def rootLattice (ts : ADEComponentList) :
    IntegralLattice (RootCoordinate ts → ℚ) := sorry

/-- A positive-definite form is nondegenerate; the orthogonal sum of ADE root lattices carries
the instance the dual, discriminant and gluing API now asks for. -/
instance (ts : ADEComponentList) : (rootLattice ts).IsNondegenerate := sorry

theorem rootLattice_isEven (ts : ADEComponentList) : (rootLattice ts).IsEven := sorry

theorem rootLattice_isPositiveDefinite (ts : ADEComponentList) :
    (rootLattice ts).IsPositiveDefinite := sorry

/-- The component label formula, including pairings and half-norms. -/
noncomputable def glueQuadraticModule (ts : ADEComponentList) : FiniteQuadraticModule where
  A := GlueCoordinates ts
  addCommGroup := inferInstance
  finite := inferInstance
  pairing := sorry
  symmetric := sorry
  quadratic := sorry
  polar := sorry

/-- The component labels identify the actual discriminant quotient, not merely a group of the same
order. -/
noncomputable def rootLatticeDiscriminantIsometry (ts : ADEComponentList) :
    FiniteQuadraticModule.Isometry
      ((rootLattice ts).discriminantQuadraticModule (rootLattice_isEven ts))
      (glueQuadraticModule ts) := sorry

def glueLabelCount : DynkinType → ℕ
  | .A n => n + 1
  | .D _ => 4
  | .E6 => 3
  | .E7 => 2
  | .E8 => 1
  | _ => 0

/-- A raw digit word has exactly one in-range label per component. -/
def IsValidGlueWord (ts : ADEComponentList) (digits : List ℕ) : Prop :=
  List.Forall₂ (fun t d ↦ d < glueLabelCount t) ts.values digits

/-- Inversion count for a permutation of positions. -/
def positionInversionCount {n : ℕ} : List (Fin n) → ℕ
  | [] => 0
  | i :: is => (is.filter fun j ↦ j < i).length + positionInversionCount is

/-- All even permutations of positions, then evaluation in the supplied word. This remains exact
even if a future word repeats a digit: parity belongs to the position permutation, not the values. -/
def evenPositionPermutations (digits : List ℕ) : List (List ℕ) :=
  ((List.finRange digits.length).permutations.filter fun σ ↦ Even (positionInversionCount σ)).map
    fun σ ↦ σ.map digits.get

/-- Executable expansion of the three source-table constructors. -/
def RootfulNiemeierType.GluePattern.expand :
    RootfulNiemeierType.GluePattern → List (List ℕ)
  | .literal digits => [digits]
  | .cyclic initial block terminal =>
      (List.range block.length).map fun k ↦ initial ++ block.rotate k ++ terminal
  | .evenPermutations digits => evenPositionPermutations digits

@[simp] theorem RootfulNiemeierType.GluePattern.expand_literal (digits : List ℕ) :
    (RootfulNiemeierType.GluePattern.literal digits).expand = [digits] := rfl

@[simp] theorem RootfulNiemeierType.GluePattern.expand_cyclic
    (initial block terminal : List ℕ) :
    (RootfulNiemeierType.GluePattern.cyclic initial block terminal).expand =
      (List.range block.length).map fun k ↦ initial ++ block.rotate k ++ terminal := rfl

@[simp] theorem RootfulNiemeierType.GluePattern.expand_evenPermutations (digits : List ℕ) :
    (RootfulNiemeierType.GluePattern.evenPermutations digits).expand =
      evenPositionPermutations digits := rfl

def RootfulNiemeierType.GluePattern.IsValidFor
    (p : RootfulNiemeierType.GluePattern) (ts : ADEComponentList) : Prop :=
  ∀ digits ∈ p.expand, IsValidGlueWord ts digits

/-- Decode only after proving that the word fits the ordered component alphabets. -/
noncomputable def decodeGlueWord {ts : ADEComponentList} (digits : List ℕ)
    (h : IsValidGlueWord ts digits) : GlueCoordinates ts := sorry

theorem tablePatterns_valid (X : RootfulNiemeierType) :
    ∀ p ∈ X.gluePatterns, p.IsValidFor X.components := sorry

/-- Multiplication by `ω` on the pinned `D₄` labels
`0 ↦ 0`, `1=s ↦ ω`, `2=v ↦ 1`, `3=c ↦ ω²`. -/
def d4MulOmegaDigit : ℕ → ℕ
  | 0 => 0
  | 1 => 3
  | 2 => 1
  | 3 => 2
  | d => d

/-- The three nonzero `F₄` scalar multiples of a raw `D₄` word. -/
def d4F4ScalarOrbit (digits : List ℕ) : List (List ℕ) :=
  [digits, digits.map d4MulOmegaDigit,
    digits.map (d4MulOmegaDigit ∘ d4MulOmegaDigit)]

def RootfulNiemeierType.sourceGeneratorWords (X : RootfulNiemeierType) : List (List ℕ) :=
  X.gluePatterns.flatMap RootfulNiemeierType.GluePattern.expand

/-- Row-aware expansion before ordinary additive closure. Only `D₄⁶` inserts the `F₄` scalar
orbits; this is the semantic difference between its source typography and the other 22 rows. -/
def RootfulNiemeierType.spanGeneratorWords (X : RootfulNiemeierType) : List (List ℕ) :=
  match X.glueSpanKind with
  | .additive => X.sourceGeneratorWords
  | .f4Linear => X.sourceGeneratorWords.flatMap d4F4ScalarOrbit

theorem sourceGeneratorWords_valid (X : RootfulNiemeierType) :
    ∀ digits ∈ X.sourceGeneratorWords, IsValidGlueWord X.components digits := sorry

theorem spanGeneratorWords_valid (X : RootfulNiemeierType) :
    ∀ digits ∈ X.spanGeneratorWords, IsValidGlueWord X.components digits := sorry

noncomputable def decodedSourceGeneratorSet (X : RootfulNiemeierType) :
    Set (GlueCoordinates X.components) :=
  {w | ∃ (digits : List ℕ) (h : IsValidGlueWord X.components digits),
    digits ∈ X.sourceGeneratorWords ∧ decodeGlueWord digits h = w}

noncomputable def decodedSpanGeneratorSet (X : RootfulNiemeierType) :
    Set (GlueCoordinates X.components) :=
  {w | ∃ (digits : List ℕ) (h : IsValidGlueWord X.components digits),
    digits ∈ X.spanGeneratorWords ∧ decodeGlueWord digits h = w}

/-- Ordinary additive closure of the printed words, retained to state the exceptional `D₄⁶`
comparison. -/
noncomputable def sourceTableGlueSubgroup (X : RootfulNiemeierType) :
    AddSubgroup (GlueCoordinates X.components) :=
  AddSubgroup.closure (decodedSourceGeneratorSet X)

/-- The actual row subgroup: row-selected expansion followed by additive closure. -/
noncomputable def tableGlueSubgroup (X : RootfulNiemeierType) :
    AddSubgroup (GlueCoordinates X.components) :=
  AddSubgroup.closure (decodedSpanGeneratorSet X)

noncomputable def d4AllVectorWord : GlueCoordinates RootfulNiemeierType.d4_6.components :=
  decodeGlueWord [2, 2, 2, 2, 2, 2]
    (by simp [IsValidGlueWord, RootfulNiemeierType.components,
      RootfulNiemeierType.rawComponents, glueLabelCount])

/-- The missing binary generator is `[222222]`: adjoining it to the order-32 additive span of the
printed `D₄⁶` words gives exactly the row's `F₄`-linear span. -/
theorem d4_tableGlue_eq_closure_insert_allVector :
    tableGlueSubgroup .d4_6 =
      AddSubgroup.closure
        (Set.insert d4AllVectorWord (sourceTableGlueSubgroup .d4_6 : Set _)) := sorry

theorem natCard_tableGlueSubgroup (X : RootfulNiemeierType) :
    Nat.card (tableGlueSubgroup X) = X.glueOrder := sorry

theorem tableGlueSubgroup_isIsotropic (X : RootfulNiemeierType) :
    (glueQuadraticModule X.components).IsIsotropic (tableGlueSubgroup X) := sorry

theorem tableGlueSubgroup_isLagrangian (X : RootfulNiemeierType) :
    tableGlueSubgroup X =
      (glueQuadraticModule X.components).toFiniteBilinearModule.orthogonalComplement
        (tableGlueSubgroup X) := sorry

/-- The displayed cyclic factors identify the actual coordinate group, rather than recording only
its cardinality. -/
abbrev CyclicFactorCoordinates (ns : List ℕ) :=
  (i : Fin ns.length) → ZMod (ns.get i)

noncomputable def glueCoordinatesEquivCyclicFactors (X : RootfulNiemeierType) :
    GlueCoordinates X.components ≃+
      CyclicFactorCoordinates X.discriminantCyclicFactors := sorry

/-- The attained shortest norm in the dual coset with the given component labels. -/
noncomputable def glueCosetMinNorm (ts : ADEComponentList) (w : GlueCoordinates ts) : ℚ :=
  sorry

/-- The formula is a true minimum in the actual dual-lattice coset. -/
theorem rootLattice_cosetMinNorm (ts : ADEComponentList) (w : GlueCoordinates ts) :
    IsLeast
      {q : ℚ | ∃ x : (rootLattice ts).dual,
        (rootLatticeDiscriminantIsometry ts).toAddEquiv
            ((rootLattice ts).carrierInDual.mkQ x) = w ∧
          q = (rootLattice ts).form x x}
      (glueCosetMinNorm ts w) := sorry

theorem tableGlue_nonzero_cosetMinNorm (X : RootfulNiemeierType)
    (w : GlueCoordinates X.components) (hw : w ∈ tableGlueSubgroup X) (hw0 : w ≠ 0) :
    4 ≤ glueCosetMinNorm X.components w := sorry

/-! ## The 23 rootful constructions -/

/-- Transport the table subgroup into the actual root-lattice discriminant quotient. -/
noncomputable def glueInDiscriminant (X : RootfulNiemeierType) :
    AddSubgroup (rootLattice X.components).DiscriminantGroup :=
  (tableGlueSubgroup X).map
    (rootLatticeDiscriminantIsometry X.components).toAddEquiv.symm.toAddMonoidHom

theorem glueInDiscriminant_isIsotropic (X : RootfulNiemeierType) :
    ((rootLattice X.components).discriminantQuadraticModule
      (rootLattice_isEven X.components)).IsIsotropic (glueInDiscriminant X) := sorry

noncomputable def rootfulLattice (X : RootfulNiemeierType) :
    IntegralLattice (RootCoordinate X.components → ℚ) :=
  (rootLattice X.components).ofIsotropicSubgroup
    (rootLattice_isEven X.components) (glueInDiscriminant X)
    (glueInDiscriminant_isIsotropic X)

/-- The span of the norm-two vectors, as an ambient integral submodule. -/
def rootSubmodule {V : Type u} [AddCommGroup V] [Module ℚ V] (L : IntegralLattice V) :
    Submodule ℤ V :=
  Submodule.span ℤ {x : V | x ∈ L.carrier ∧ L.form x x = 2}

def IsRootless {V : Type u} [AddCommGroup V] [Module ℚ V]
    (L : IntegralLattice V) : Prop :=
  ¬ ∃ x : V, x ∈ L.carrier ∧ L.form x x = 2

theorem rootfulLattice_isEven (X : RootfulNiemeierType) :
    (rootfulLattice X).IsEven := sorry

theorem rootfulLattice_isUnimodular (X : RootfulNiemeierType) :
    (rootfulLattice X).IsUnimodular := sorry

theorem rootfulLattice_isPositiveDefinite (X : RootfulNiemeierType) :
    (rootfulLattice X).IsPositiveDefinite := sorry

theorem rootfulLattice_rank (X : RootfulNiemeierType) :
    Module.finrank ℚ (RootCoordinate X.components → ℚ) = 24 := sorry

/-- The critical no-new-roots statement is an equality of carriers, not a root count. -/
theorem rootSubmodule_rootfulLattice (X : RootfulNiemeierType) :
    rootSubmodule (rootfulLattice X) = (rootLattice X.components).carrier := sorry

/-! ## Independent code and mixed-alphabet checks -/

open TauCetiRoadmap.AlgebraicCodingTheory

/-- Destination-to-source permutation from the dependency's systematic binary-Golay coordinates
to the printed cyclic-table coordinates. -/
def a1DestinationToSourceFun : Fin 24 → Fin 24 :=
  ![0, 1, 2, 6, 5, 13, 10, 15, 17, 4, 18, 19,
    11, 7, 14, 12, 3, 8, 23, 20, 22, 9, 21, 16]

noncomputable def a1DestinationToSource : Equiv.Perm (Fin 24) :=
  Equiv.ofBijective a1DestinationToSourceFun (by decide)

theorem a1DestinationToSource_values :
    List.ofFn (fun i ↦ (a1DestinationToSource i).val) =
      [0, 1, 2, 6, 5, 13, 10, 15, 17, 4, 18, 19,
        11, 7, 14, 12, 3, 8, 23, 20, 22, 9, 21, 16] := by decide

noncomputable def a1TableToGolayMonomial :
    MonomialEquiv (F := ZMod 2) (ι := Fin 24) (Fin 12 ⊕ Fin 12) where
  reindex := a1DestinationToSource.symm.trans (@finSumFinEquiv 12 12).symm
  scale := fun _ ↦ 1

/-- Canonical `A₁²⁴` labels before applying the displayed coordinate permutation. -/
noncomputable def a1CanonicalLabelIsometry :
    FiniteQuadraticModule.Isometry
      (glueQuadraticModule RootfulNiemeierType.a1_24.components)
      (coordinateQuadraticModule (Fin 24) 2 (by decide) (by decide)) := sorry

/-- The binary comparison is a finite-quadratic-module isometry whose additive map is the exact
permutation above (all scalings are one). -/
noncomputable def a1GlueQuadraticIsometry :
    FiniteQuadraticModule.Isometry
      (glueQuadraticModule RootfulNiemeierType.a1_24.components)
      (coordinateQuadraticModule (Fin 12 ⊕ Fin 12) 2 (by decide) (by decide)) where
  toAddEquiv := a1CanonicalLabelIsometry.toAddEquiv.trans
    a1TableToGolayMonomial.toLinearEquiv.toAddEquiv
  map_quadratic := sorry

noncomputable abbrev a1GlueEquivGolay := a1GlueQuadraticIsometry.toAddEquiv

theorem a1_tableGlue_eq_extendedBinaryGolay :
    (tableGlueSubgroup .a1_24).map a1GlueEquivGolay.toAddMonoidHom =
      extendedBinaryGolay.toAddSubgroup := sorry

noncomputable def a1RootfulIsometryGolayConstructionA :
    IntegralLattice.Isometry (rootfulLattice .a1_24) golayConstructionA := sorry

/-- Destination-to-source permutation for the ternary Golay acceptance calculation. -/
def a2DestinationToSourceFun : Fin 12 → Fin 12 :=
  ![0, 4, 7, 10, 9, 5, 1, 8, 6, 11, 3, 2]

noncomputable def a2DestinationToSource : Equiv.Perm (Fin 12) :=
  Equiv.ofBijective a2DestinationToSourceFun (by decide)

theorem a2DestinationToSource_values :
    List.ofFn (fun i ↦ (a2DestinationToSource i).val) =
      [0, 4, 7, 10, 9, 5, 1, 8, 6, 11, 3, 2] := by decide

def a2Scaling : Fin 12 → ZMod 3 :=
  ![1, 2, 2, 1, 1, 1, 1, 2, 2, 1, 2, 1]

theorem a2Scaling_ne_zero (i : Fin 12) : a2Scaling i ≠ 0 := by
  fin_cases i <;> decide

def a2ScalingUnit (i : Fin 12) : (ZMod 3)ˣ :=
  Units.mk0 (a2Scaling i) (a2Scaling_ne_zero i)

noncomputable def a2TableToGolayMonomial :
    MonomialEquiv (F := ZMod 3) (ι := Fin 12) (Fin 6 ⊕ Fin 6) where
  reindex := a2DestinationToSource.symm.trans (@finSumFinEquiv 6 6).symm
  scale := fun i ↦ a2ScalingUnit (finSumFinEquiv i)

noncomputable def a2CanonicalLabelIsometry :
    FiniteQuadraticModule.Isometry
      (glueQuadraticModule RootfulNiemeierType.a2_12.components)
      (a2CoordinateQuadraticModule (Fin 12)) := sorry

/-- The scalings are `±1`, so their squares are one; the displayed monomial map therefore
preserves the `A₂` half-norm and its polar pairing. -/
noncomputable def a2GlueQuadraticIsometry :
    FiniteQuadraticModule.Isometry
      (glueQuadraticModule RootfulNiemeierType.a2_12.components)
      (a2CoordinateQuadraticModule (Fin 6 ⊕ Fin 6)) where
  toAddEquiv := a2CanonicalLabelIsometry.toAddEquiv.trans
    a2TableToGolayMonomial.toLinearEquiv.toAddEquiv
  map_quadratic := sorry

noncomputable abbrev a2GlueEquivTernaryGolay := a2GlueQuadraticIsometry.toAddEquiv

theorem a2_tableGlue_eq_extendedTernaryGolay :
    (tableGlueSubgroup .a2_12).map a2GlueEquivTernaryGolay.toAddMonoidHom =
      extendedTernaryGolay.toAddSubgroup := sorry

/-- The raw Conway--Sloane digit-to-field convention: `1=s↦ω`, `2=v↦1`, `3=c↦ω²`. -/
noncomputable def d4LabelToF4Digit : ℕ → F4
  | 0 => 0
  | 1 => omega
  | 2 => 1
  | 3 => omega ^ 2
  | _ => 0

noncomputable def d4AllSpinorWord : GlueCoordinates RootfulNiemeierType.d4_6.components :=
  decodeGlueWord [1, 1, 1, 1, 1, 1]
    (by simp [IsValidGlueWord, RootfulNiemeierType.components,
      RootfulNiemeierType.rawComponents, glueLabelCount])

noncomputable def d4AllConjugateSpinorWord :
    GlueCoordinates RootfulNiemeierType.d4_6.components :=
  decodeGlueWord [3, 3, 3, 3, 3, 3]
    (by simp [IsValidGlueWord, RootfulNiemeierType.components,
      RootfulNiemeierType.rawComponents, glueLabelCount])

/-- Canonical unscaled identification of the six `D₄` discriminant alphabets with `F₄`. -/
noncomputable def d4CanonicalLabelIsometry :
    FiniteQuadraticModule.Isometry
      (glueQuadraticModule RootfulNiemeierType.d4_6.components)
      (d4CoordinateQuadraticModule (Fin 6)) := sorry

theorem d4CanonicalLabelIsometry_convention :
    d4CanonicalLabelIsometry.toAddEquiv d4AllSpinorWord = (fun _ ↦ omega) ∧
      d4CanonicalLabelIsometry.toAddEquiv d4AllVectorWord = (fun _ ↦ 1) ∧
      d4CanonicalLabelIsometry.toAddEquiv d4AllConjugateSpinorWord =
        (fun _ ↦ omega ^ 2) := sorry

/-- Multiplication by `ω` transported back to the printed `D₄` labels. -/
noncomputable def d4OmegaAction
    (w : GlueCoordinates RootfulNiemeierType.d4_6.components) :
    GlueCoordinates RootfulNiemeierType.d4_6.components :=
  d4CanonicalLabelIsometry.toAddEquiv.symm
    (fun i ↦ omega * d4CanonicalLabelIsometry.toAddEquiv w i)

theorem natCard_d4_sourceTableGlueSubgroup :
    Nat.card (sourceTableGlueSubgroup .d4_6) = 32 := sorry

theorem natCard_d4_tableGlueSubgroup : Nat.card (tableGlueSubgroup .d4_6) = 64 :=
  natCard_tableGlueSubgroup .d4_6

theorem d4_tableGlueSubgroup_closed_omega
    (w : GlueCoordinates RootfulNiemeierType.d4_6.components)
    (hw : w ∈ tableGlueSubgroup .d4_6) :
    d4OmegaAction w ∈ tableGlueSubgroup .d4_6 := sorry

/-- Destination scalings for the exact table-to-hexacode comparison; the coordinate order is the
identity. -/
noncomputable def d4Scaling : Fin 6 → F4 :=
  ![omega, omega, 1, omega ^ 2, omega ^ 2, 1]

theorem d4Scaling_ne_zero (i : Fin 6) : d4Scaling i ≠ 0 := sorry

noncomputable def d4ScalingUnit (i : Fin 6) : F4ˣ :=
  Units.mk0 (d4Scaling i) (d4Scaling_ne_zero i)

noncomputable def d4TableToHexacodeMonomial :
    MonomialEquiv (F := F4) (ι := Fin 6) (Fin 6) where
  reindex := Equiv.refl _
  scale := d4ScalingUnit

/-- Every displayed scale is nonzero and hence has cube one in `F₄`; consequently the monomial
map preserves both Hamming half-norm and the traced-Hermitian polar pairing. -/
noncomputable def d4GlueQuadraticIsometry :
    FiniteQuadraticModule.Isometry
      (glueQuadraticModule RootfulNiemeierType.d4_6.components)
      (d4CoordinateQuadraticModule (Fin 6)) where
  toAddEquiv := d4CanonicalLabelIsometry.toAddEquiv.trans
    d4TableToHexacodeMonomial.toLinearEquiv.toAddEquiv
  map_quadratic := sorry

noncomputable abbrev d4GlueEquivHexacode := d4GlueQuadraticIsometry.toAddEquiv

theorem d4_tableGlue_eq_hexacode :
    (tableGlueSubgroup .d4_6).map d4GlueEquivHexacode.toAddMonoidHom =
      hexacode.toAddSubgroup := sorry

theorem a11d7e6_glue_cyclic_order :
    Nat.card (tableGlueSubgroup .a11d7e6) = 12 := sorry

/-! ## Construction B, the odd shift, and the Leech lattice -/

abbrev LeechCoordinate := Fin 12 ⊕ Fin 12

/-- The index-two Construction-B carrier inside binary-Golay Construction A. -/
noncomputable def constructionBCarrier : Submodule ℤ (LeechCoordinate → ℚ) := sorry

theorem mem_constructionBCarrier_iff (x : LeechCoordinate → ℚ) :
    x ∈ constructionBCarrier ↔
      ∃ z : LeechCoordinate → ℤ,
        (∀ i, x i = (z i : ℚ)) ∧
        (fun i ↦ (z i : ZMod 2)) ∈ extendedBinaryGolay ∧
        ∃ k : ℤ, ∑ i, z i = 4 * k := sorry

noncomputable def constructionB : IntegralLattice (LeechCoordinate → ℚ) where
  carrier := constructionBCarrier
  isLattice := sorry
  form := golayConstructionA.form
  isSymm := golayConstructionA.isSymm
  integral := sorry

/-- `constructionB` reuses the ambient Construction-A form, so it inherits nondegeneracy. -/
instance : constructionB.IsNondegenerate := sorry

theorem constructionB_isEven : constructionB.IsEven := sorry

/-- Construction B has index two in the unimodular Construction-A lattice. -/
theorem constructionB_index_two :
    Nat.card
      (golayConstructionA.carrier ⧸
        constructionBCarrier.comap golayConstructionA.carrier.subtype) = 2 := sorry

theorem constructionB_discriminantGroup_order :
    Nat.card constructionB.DiscriminantGroup = 4 := sorry

def leechInfinity : LeechCoordinate := Sum.inl 0

/-- In rational coordinates this is `(-3/2,1/2,…,1/2)`. -/
noncomputable def leechShift : LeechCoordinate → ℚ := fun i ↦
  if i = leechInfinity then -(3 : ℚ) / 2 else 1 / 2

theorem leechShift_norm : constructionB.form leechShift leechShift = 4 := sorry

noncomputable def leechShiftInDual : constructionB.dual := sorry

noncomputable def leechShiftClass : constructionB.DiscriminantGroup :=
  constructionB.carrierInDual.mkQ leechShiftInDual

noncomputable def leechShiftSubgroup : AddSubgroup constructionB.DiscriminantGroup :=
  AddSubgroup.closure {leechShiftClass}

theorem leechShiftSubgroup_order : Nat.card leechShiftSubgroup = 2 := sorry

theorem leechShiftSubgroup_isIsotropic :
    (constructionB.discriminantQuadraticModule constructionB_isEven).IsIsotropic
      leechShiftSubgroup := sorry

noncomputable def leechLattice : IntegralLattice (LeechCoordinate → ℚ) :=
  constructionB.ofIsotropicSubgroup constructionB_isEven leechShiftSubgroup
    leechShiftSubgroup_isIsotropic

/-- A division-free statement of the standard integral congruence model. -/
def SatisfiesLeechCongruences (x : LeechCoordinate → ℚ) : Prop :=
  ∃ (a : LeechCoordinate → ℤ) (m : ℤ) (b : LeechCoordinate → ℤ),
    (m = 0 ∨ m = 1) ∧
      (∀ i, x i = (a i : ℚ) / 2) ∧
      (∀ i, a i = m + 2 * b i) ∧
      (fun i ↦ (b i : ZMod 2)) ∈ extendedBinaryGolay ∧
      ∃ k : ℤ, ∑ i, a i = 4 * m + 8 * k

theorem mem_leechLattice_iff (x : LeechCoordinate → ℚ) :
    x ∈ leechLattice.carrier ↔ SatisfiesLeechCongruences x := sorry

/-- The arithmetic core of the four-case proof in the roadmap. -/
theorem leechCongruences_rawNorm_ge
    (a b : LeechCoordinate → ℤ) (m : ℤ)
    (hm : m = 0 ∨ m = 1)
    (hab : ∀ i, a i = m + 2 * b i)
    (hcode : (fun i ↦ (b i : ZMod 2)) ∈ extendedBinaryGolay)
    (hsum : ∃ k : ℤ, ∑ i, a i = 4 * m + 8 * k)
    (ha : a ≠ 0) :
    32 ≤ ∑ i, a i ^ 2 := sorry

theorem leechLattice_isEven : leechLattice.IsEven := sorry

theorem leechLattice_isUnimodular : leechLattice.IsUnimodular := sorry

theorem leechLattice_isPositiveDefinite : leechLattice.IsPositiveDefinite := sorry

theorem leechLattice_rank : Module.finrank ℚ (LeechCoordinate → ℚ) = 24 := sorry

/-- The four parity/weight cases in the roadmap prove the sharp lower bound without theta series. -/
theorem leechLattice_norm_ge_four (x : leechLattice.carrier)
    (hx : x.val ≠ (0 : LeechCoordinate → ℚ)) :
    4 ≤ leechLattice.form x x := sorry

theorem leechLattice_minimum_attained :
    ∃ x : leechLattice.carrier, (x : LeechCoordinate → ℚ) ≠ 0 ∧
      leechLattice.form x x = 4 := sorry

theorem leechLattice_isRootless : IsRootless leechLattice := sorry

end TauCetiRoadmap.Rank24LatticeConstructions
