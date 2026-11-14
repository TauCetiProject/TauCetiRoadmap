module

public import Mathlib
public import TauCeti.Combinatorics.DenseGraphLimits.Sampling.Finite
public import TauCeti.Combinatorics.DenseGraphLimits.Sampling.Infinite
public import TauCeti.Combinatorics.DenseGraphLimits.Sampling.AlmostSure.Basic
public import TauCeti.Algebra.GroupAction.FiniteSupportPerm
public import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Infinite.Mixture
public import TauCeti.Combinatorics.DenseGraphLimits.ExchangeableGraphLaw.Relational.Ergodic
public import TauCeti.Combinatorics.SimpleGraph.Connectivity.VertexConnectivity
public import TauCeti.Combinatorics.SimpleGraph.ExtensionProperty
public import TauCeti.Combinatorics.SimpleGraph.RelationalConfiguration
public import TauCeti.ModelTheory.RelationalConfiguration.ModelsOf
public import TauCeti.ModelTheory.Scott.AtomicDiagram
public import TauCeti.ModelTheory.Scott.RandomGraph
public import TauCeti.ModelTheory.Infinitary.Semantics

/-!
# Random graphs, Fraïssé limits, and first-order asymptotic laws: target signatures

README.md is the definitive specification. This file states target signatures for its definitions
and headline theorems; it is not an exhaustive checklist, and discharging every declaration here
finishes neither a milestone nor the roadmap. The `sorry` forms are proposed targets, not
established proofs.

Every predicate and definition below has an actual body. Quantifier elimination and decidability
are stated as existence of computable maps on a fixed structural coding of formulas, with their
correctness specifications; these computability theorems are the targets, and the README gives the
pattern-elimination route to them. No proposition-valued placeholder names an unstated condition.

Implement general Fraïssé/first-order lemmas in the shared native namespaces, and graph lemmas in
`SimpleGraph` as appropriate.
Use the existing Tau Ceti EF strategies, back-and-forth relations and graph atomic-type bridge;
this file does not redeclare those objects. Direct rank-agreement signatures can state the
endpoint without importing the implementation of those strategies.

The imports consume from Tau Ceti the existing graphon samplers, their ergodicity and mixtures,
the canonical extension predicate `SimpleGraph.HasExtensionProperty`, the Rado graph
`TauCeti.radoGraph` and its countable characterization `TauCeti.nonempty_iso_radoGraph_iff`, the
finite atomic diagrams `TauCeti.firstOrderAtomicDiagram`, and vertex connectivity
`SimpleGraph.IsVertexConnected`. The README specifies the further shared interfaces needed for
implementation.
-/

@[expose] public section

universe u v w w' z x

open MeasureTheory ProbabilityTheory Filter FirstOrder FirstOrder.Language CategoryTheory
open scoped unitInterval BigOperators Topology NNReal

namespace TauCetiRoadmap.RandomGraphs

/-! ## General Fraïssé and rooted interfaces (Milestones 1–3) -/

section Fraisse

variable {L : FirstOrder.Language.{u, v}}

def representativeClass {ι : Type z} (F : ι → Bundled.{w} L.Structure) :
    Set (Bundled.{w} L.Structure) :=
  {M | ∃ i, Nonempty (M ≃[L] F i)}

/-- Strong AP requires the two image sets to meet exactly over the root. -/
def StrongAmalgamation (K : Set (Bundled.{w} L.Structure)) : Prop :=
  ∀ (A B C : Bundled.{w} L.Structure) (f : A ↪[L] B) (g : A ↪[L] C),
    A ∈ K → B ∈ K → C ∈ K →
      ∃ (D : Bundled.{w} L.Structure) (i : B ↪[L] D) (j : C ↪[L] D),
        D ∈ K ∧ i.comp f = j.comp g ∧
          Set.range i ∩ Set.range j = Set.range (i.comp f)

/-- No relation-symbol countability, nonempty-carrier or infinitude premise. -/
theorem exists_isFraisseLimit_of_isFraisse
    [Countable (Σ n, L.Functions n)]
    (K : Set (Bundled.{w} L.Structure)) [IsFraisse K] :
    ∃ (M : Bundled.{w} L.Structure) (_ : Countable M),
      IsFraisseLimit K M := by
  sorry

variable {A : Type x} {M : Type w} {N : Type w'}
  [L.Structure A] [L.Structure M] [L.Structure N]

/-- The target is not required to be countable. -/
theorem exists_embedding_comp_eq_of_isExtensionPair
    (hA : Structure.FG L A) (aM : A ↪[L] M) (aN : A ↪[L] N)
    (hM : Structure.CG L M) (hMN : L.IsExtensionPair M N) :
    ∃ e : M ↪[L] N, e.comp aM = aN := by
  sorry

theorem exists_equiv_comp_eq_of_isExtensionPair
    (hA : Structure.FG L A) (aM : A ↪[L] M) (aN : A ↪[L] N)
    (hM : Structure.CG L M) (hN : Structure.CG L N)
    (hMN : L.IsExtensionPair M N) (hNM : L.IsExtensionPair N M) :
    ∃ e : M ≃[L] N, e.toEmbedding.comp aM = aN := by
  sorry

end Fraisse

/-! ## Native realization and finite rank (Milestones 0, 5) -/

variable {V : Type u} {W : Type v}

/-- A spelling for realization using the existing graph structure. -/
def Satisfies (G : SimpleGraph V) (φ : Language.graph.Sentence) : Prop :=
  letI : Language.graph.Structure V := G.structure
  φ.Realize V

def SatisfiesFormula {m : ℕ} (G : SimpleGraph V)
    (φ : Language.graph.Formula (Fin m)) (a : Fin m → V) : Prop :=
  letI : Language.graph.Structure V := G.structure
  φ.Realize a

/-- Actual recursion on native syntax. Its implementation belongs with the shared FO API. -/
def foRank {L : FirstOrder.Language.{u, v}} {α : Type w} :
    {n : ℕ} → L.BoundedFormula α n → ℕ
  | _, .falsum => 0
  | _, .equal _ _ => 0
  | _, .rel _ _ => 0
  | _, .imp φ ψ => max (foRank φ) (foRank ψ)
  | _, .all φ => foRank φ + 1

theorem foRank_eq_zero_iff_isQF
    {L : FirstOrder.Language.{u, v}} {α : Type w} {n : ℕ}
    (φ : L.BoundedFormula α n) :
    foRank φ = 0 ↔ φ.IsQF := by
  sorry

/-- **Joint measurability of realization.** For a fixed graph formula with finitely many free
variables on a countable discrete carrier, realization is measurable jointly in the graph, the
free-variable assignment and the bound-variable tuple. At fixed assignments, sentences included,
the event is the pullback of Tau Ceti's `TauCeti.RelationalConfiguration.measurableSet_setOf_realize`
(applied to `BoundedFormula.toInf φ`) along `SimpleGraph.toRelationalConfiguration`; the joint
statement is a countable union of rectangles over the assignments. -/
theorem measurableSet_realize_jointly [Countable V] [MeasurableSpace V] [DiscreteMeasurableSpace V]
    {α : Type w} [Finite α] {n : ℕ} (φ : Language.graph.BoundedFormula α n) :
    MeasurableSet {x : SimpleGraph V × (α → V) × (Fin n → V) |
      @BoundedFormula.Realize _ V x.1.structure _ _ φ x.2.1 x.2.2} := by
  sorry

theorem satisfies_iso {G : SimpleGraph V} {H : SimpleGraph W}
    (e : G ≃g H) (φ : Language.graph.Sentence) :
    Satisfies G φ ↔ Satisfies H φ := by
  sorry

noncomputable def sentenceProbability (p : I) (n : ℕ)
    (φ : Language.graph.Sentence) : ℝ :=
  (SimpleGraph.binomialRandom (Fin n) p {G | Satisfies G φ}).toReal

theorem binomialRandom_map_comap [Countable V] [Countable W] (p : I)
    (f : V ↪ W) :
    (SimpleGraph.binomialRandom W p).map (fun G => G.comap f) =
      SimpleGraph.binomialRandom V p := by
  sorry

/-! ## Actual requests, extension syntax and the Rado graph (Milestone 4) -/

def IsExtensionWitness (G : SimpleGraph V) (U Z : Finset V) (x : V) : Prop :=
  x ∉ U ∧ x ∉ Z ∧ (∀ u ∈ U, G.Adj x u) ∧ (∀ z ∈ Z, ¬ G.Adj x z)

def HasExtensionUpTo (G : SimpleGraph V) (d : ℕ) : Prop :=
  ∀ U Z : Finset V, Disjoint U Z → U.card + Z.card ≤ d →
    ∃ x, IsExtensionWitness G U Z x

/-- The canonical predicate omits `x ∉ U`, which adjacency to every vertex of `U` forces in a
loopless graph. -/
theorem hasExtensionProperty_iff (G : SimpleGraph V) :
    G.HasExtensionProperty ↔ ∀ d, HasExtensionUpTo G d := by
  sorry

/-- Full extension supplies arbitrarily many witnesses, so the carrier is infinite. -/
theorem HasExtensionProperty.infinite {G : SimpleGraph V} (hG : G.HasExtensionProperty) :
    Infinite V := by
  sorry

/-- The converse of Tau Ceti's `SimpleGraph.Iso.toLanguageEquiv`: an equivalence of the
graph-language structures is a graph isomorphism. -/
def Language.Equiv.toSimpleGraphIso {G : SimpleGraph V} {H : SimpleGraph W}
    (e : @Language.Equiv Language.graph V W G.structure H.structure) : G ≃g H :=
  letI := G.structure
  letI := H.structure
  ⟨e.toEquiv, fun {a b} => e.map_rel Language.adj ![a, b]⟩

/-- The `(r, s)` extension axiom: for all pairwise distinct `y₀, …, y_{r+s-1}` some `z`, distinct
from every `yᵢ`, is adjacent to the first `r` and not adjacent to the last `s`. -/
noncomputable def extensionSentence (r s : ℕ) : Language.graph.Sentence :=
  let y : Fin (r + s) → Language.graph.Term (Empty ⊕ Fin (r + s + 1)) := fun i =>
    Term.var (Sum.inr i.castSucc)
  let z : Language.graph.Term (Empty ⊕ Fin (r + s + 1)) := Term.var (Sum.inr (Fin.last _))
  let distinct : Language.graph.BoundedFormula Empty (r + s) :=
    BoundedFormula.iInf fun p : {p : Fin (r + s) × Fin (r + s) // p.1 ≠ p.2} =>
      (Term.bdEqual (Term.var (Sum.inr p.1.1)) (Term.var (Sum.inr p.1.2))).not
  let witness : Language.graph.BoundedFormula Empty (r + s + 1) :=
    BoundedFormula.iInf fun i : Fin (r + s) =>
      (if (i : ℕ) < r then Relations.boundedFormula₂ Language.adj z (y i)
        else (Relations.boundedFormula₂ Language.adj z (y i)).not) ⊓ (z.bdEqual (y i)).not
  (distinct.imp witness.ex).alls

theorem satisfies_extensionSentence (G : SimpleGraph V) (r s : ℕ) :
    Satisfies G (extensionSentence r s) ↔
      ∀ U Z : Finset V, Disjoint U Z → U.card = r → Z.card = s →
        ∃ x, IsExtensionWitness G U Z x := by
  sorry

/-- This is the axiom set; its semantic consequence closure is Th(R). -/
noncomputable def radoAxioms : Language.graph.Theory :=
  Language.Theory.simpleGraph ∪ {φ | ∃ r s, φ = extensionSentence r s}

theorem model_radoAxioms_iff (G : SimpleGraph V) :
    @Theory.Model Language.graph V G.structure radoAxioms ↔ G.HasExtensionProperty := by
  sorry

/-- The ordered binary presentation of `TauCeti.radoGraph`. Tau Ceti's `TauCeti.radoGraph_adj`
is the symmetric form `i ≠ j ∧ (j.testBit i ∨ i.testBit j)`. -/
theorem radoGraph_adj (i j : ℕ) :
    TauCeti.radoGraph.Adj i j ↔
      (i < j ∧ Nat.testBit j i = true) ∨
      (j < i ∧ Nat.testBit i j = true) := by
  sorry

/-- Rooted universality into an extension-property graph of arbitrary cardinality. -/
theorem exists_graphEmbedding_over_root {A : Type w} [Finite A] [Countable V]
    (F : SimpleGraph A) (G : SimpleGraph V) (H : SimpleGraph W)
    (aG : F ↪g G) (aH : F ↪g H) (hH : H.HasExtensionProperty) :
    ∃ e : G ↪g H, ∀ x, e (aG x) = aH x := by
  sorry

/-- The class of finite simple graphs, as structures in the graph language. -/
def finiteGraphs : Set (Bundled.{w} Language.graph.Structure) :=
  {M | Finite M ∧ M ⊨ Language.Theory.simpleGraph}

theorem isFraisse_finiteGraphs : IsFraisse finiteGraphs.{w} := by
  sorry

/-- `R` is the Fraïssé limit of the finite simple graphs. -/
theorem isFraisseLimit_radoGraph :
    @IsFraisseLimit Language.graph finiteGraphs.{0} ℕ TauCeti.radoGraph.structure _ _ := by
  sorry

/-! ## Finite-rank agreement and genuine QE targets (Milestone 5) -/

/-- `T_R` is complete. -/
theorem radoAxioms_isComplete : radoAxioms.IsComplete := by
  sorry

/-- `T_R` is `ℵ₀`-categorical. -/
theorem radoAxioms_aleph0_categorical : Cardinal.Categorical Cardinal.aleph0.{w} radoAxioms := by
  sorry

/-- The semantic consequences of `T_R` are exactly the sentences true in `R`. -/
theorem radoAxioms_models_iff (φ : Language.graph.Sentence) :
    radoAxioms ⊨ᵇ φ ↔ Satisfies TauCeti.radoGraph φ := by
  sorry

/-- Primeness: `R` embeds elementarily into every model of `T_R`, of any cardinality. -/
theorem nonempty_elementaryEmbedding_radoGraph (M : Type w) [Language.graph.Structure M]
    (hM : M ⊨ radoAxioms) :
    Nonempty (@ElementaryEmbedding Language.graph ℕ M TauCeti.radoGraph.structure _) := by
  sorry

/-- Primeness after naming a finite tuple: when a tuple of `R` and a tuple of an
extension-property graph of any cardinality have the same equality and adjacency pattern, some
elementary embedding of `R` sends the first to the second. -/
theorem exists_elementaryEmbedding_radoGraph_comp_eq {m : ℕ} (H : SimpleGraph W)
    (hH : H.HasExtensionProperty) (a : Fin m → ℕ) (b : Fin m → W)
    (heq : ∀ i j, a i = a j ↔ b i = b j)
    (hadj : ∀ i j, TauCeti.radoGraph.Adj (a i) (a j) ↔ H.Adj (b i) (b j)) :
    ∃ e : @ElementaryEmbedding Language.graph ℕ W TauCeti.radoGraph.structure H.structure,
      ∀ i, e (a i) = b i := by
  sorry

theorem satisfies_iff_of_extension
    (G : SimpleGraph V) (H : SimpleGraph W) (d : ℕ)
    (hG : HasExtensionUpTo G d) (hH : HasExtensionUpTo H d)
    (φ : Language.graph.Sentence) (hφ : foRank φ ≤ d + 1) :
    Satisfies G φ ↔ Satisfies H φ := by
  sorry

/-- Equality patterns handle repeated coordinates. The root consumes part of the budget. -/
theorem formula_iff_of_extension {m q : ℕ}
    (G : SimpleGraph V) (H : SimpleGraph W)
    (a : Fin m → V) (b : Fin m → W)
    (heq : ∀ i j, a i = a j ↔ b i = b j)
    (hadj : ∀ i j, G.Adj (a i) (a j) ↔ H.Adj (b i) (b j))
    (hq : 1 ≤ q)
    (hG : HasExtensionUpTo G (m + q - 1))
    (hH : HasExtensionUpTo H (m + q - 1))
    (φ : Language.graph.Formula (Fin m)) (hφ : foRank φ ≤ q) :
    SatisfiesFormula G φ a ↔ SatisfiesFormula H φ b := by
  sorry

/-- The finite axiom set of budget `d`: the simple-graph axioms and the `E_{r,s}` with
`r + s ≤ d`. -/
noncomputable def radoAxiomsUpTo (d : ℕ) : Language.graph.Theory :=
  Language.Theory.simpleGraph ∪ {φ | ∃ r s, r + s ≤ d ∧ φ = extensionSentence r s}

/-- Finite consequences: a sentence of rank at most `d + 1` holds in `R` exactly when it follows
from the finite axiom set of budget `d`. -/
theorem radoAxiomsUpTo_models_iff (d : ℕ) (φ : Language.graph.Sentence)
    (hφ : foRank φ ≤ d + 1) :
    radoAxiomsUpTo d ⊨ᵇ φ ↔ Satisfies TauCeti.radoGraph φ := by
  sorry

/-! ### Effective syntax for graph formulas

Computable quantifier elimination and decidability are stated over a fixed structural coding of
graph formulas by natural numbers: Mathlib's list encoding `BoundedFormula.encoding`, followed by
an explicit numbering of its symbol alphabet. The coding is not `Encodable.ofCountable`, whose
classical enumeration carries no effective content. The context type is a parameter; for
`Fin m` the code does not depend on `m`, which the maps receive separately. -/

instance : IsEmpty (Σ l, Language.graph.Functions l) :=
  ⟨fun ⟨_, f⟩ => (f : Empty).elim⟩

instance : Encodable (Σ l, Language.graph.Functions l) := IsEmpty.toEncodable

/-- The graph language has the single relation symbol `adj`. -/
def graphRelationsEquiv : (Σ l, Language.graph.Relations l) ≃ Unit where
  toFun _ := ()
  invFun _ := ⟨2, Language.adj⟩
  left_inv := by rintro ⟨_, ⟨⟩⟩; rfl
  right_inv _ := rfl

instance : Encodable (Σ l, Language.graph.Relations l) := Encodable.ofEquiv _ graphRelationsEquiv

/-- The finite graph signature, needed by Tau Ceti's `TauCeti.firstOrderAtomicDiagram`. -/
instance : Finite (Σ l, Language.graph.Relations l) := Finite.of_equiv _ graphRelationsEquiv.symm

/-- The symbol alphabet of Mathlib's list encoding of graph formulas over `α`. -/
abbrev GraphAlphabet (α : Type) :=
  (Σ k, Language.graph.Term (α ⊕ Fin k)) ⊕ ((Σ l, Language.graph.Relations l) ⊕ ℕ)

/-- The code of a graph formula with free variables in `α` and `n` bound positions. -/
def boundedCode {α : Type} [Encodable α] {n : ℕ} (φ : Language.graph.BoundedFormula α n) : ℕ :=
  Encodable.encode (φ.listEncode : List (GraphAlphabet α))

/-- Decoding at a given context and number of bound positions. Mathlib's list decoder ignores
trailing symbols, so the candidate is kept only if re-encoding it reproduces `c`; every other
number decodes to `none`. -/
def boundedDecode (α : Type) [Encodable α] (n : ℕ) (c : ℕ) :
    Option (Language.graph.BoundedFormula α n) :=
  ((Encodable.decode c : Option (List (GraphAlphabet α))).bind fun l =>
    (BoundedFormula.encoding.decode l).bind fun φ =>
      if h : φ.1 = n then some (h ▸ φ.2) else none).filter fun φ => boundedCode φ == c

theorem boundedDecode_boundedCode {α : Type} [Encodable α] {n : ℕ}
    (φ : Language.graph.BoundedFormula α n) : boundedDecode α n (boundedCode φ) = some φ := by
  have h := BoundedFormula.encoding.decode_encode (⟨n, φ⟩ : Σ n, Language.graph.BoundedFormula α n)
  simp only [BoundedFormula.encoding_encode, BoundedFormula.encoding_decode] at h
  simp [boundedCode, boundedDecode, h]

/-- `boundedDecode` succeeds exactly on codes of formulas. -/
theorem boundedDecode_eq_some_iff {α : Type} [Encodable α] {n c : ℕ}
    {φ : Language.graph.BoundedFormula α n} : boundedDecode α n c = some φ ↔ boundedCode φ = c := by
  refine ⟨fun h => ?_, fun h => h ▸ boundedDecode_boundedCode φ⟩
  simp only [boundedDecode, Option.filter_eq_some_iff, beq_iff_eq] at h
  exact h.2

/-- **Effective syntax, constructors.** The codes of `⊥`, of equality and adjacency atoms between
variables (given by their codes in `Fin m ⊕ Fin n`), of implications and of universal
quantifications are computable from the codes of their parts, uniformly in `m` and `n`. -/
theorem computable_boundedCode_constructors :
    ∃ (bot : ℕ → ℕ) (eq adj : ℕ × ℕ × ℕ → ℕ) (imp : ℕ → ℕ → ℕ) (all : ℕ → ℕ),
      Computable bot ∧ Computable eq ∧ Computable adj ∧ Computable₂ imp ∧ Computable all ∧
      ∀ {m n : ℕ}, bot n = boundedCode (⊥ : Language.graph.BoundedFormula (Fin m) n) ∧
        (∀ x y : Fin m ⊕ Fin n,
          eq (n, Encodable.encode x, Encodable.encode y) =
              boundedCode ((Term.var x).bdEqual (Term.var y)) ∧
            adj (n, Encodable.encode x, Encodable.encode y) =
              boundedCode (Relations.boundedFormula₂ Language.adj (Term.var x) (Term.var y))) ∧
        (∀ φ ψ : Language.graph.BoundedFormula (Fin m) n,
          imp (boundedCode φ) (boundedCode ψ) = boundedCode (φ.imp ψ)) ∧
        ∀ φ : Language.graph.BoundedFormula (Fin m) (n + 1),
          all (boundedCode φ) = boundedCode φ.all := by
  sorry

open BoundedFormula in
/-- **Effective syntax, case analysis.** The outermost constructor of a formula and the codes of
its immediate subformulas are computable from its code, uniformly in `m` and `n`. -/
theorem computable_boundedCode_cases :
    ∃ (tag left right : ℕ → ℕ), Computable tag ∧ Computable left ∧ Computable right ∧
      ∀ {m n : ℕ} (φ : Language.graph.BoundedFormula (Fin m) n),
        match φ with
        | falsum => tag (boundedCode φ) = 0
        | equal _ _ => tag (boundedCode φ) = 1
        | rel _ _ => tag (boundedCode φ) = 2
        | imp φ₁ φ₂ => tag (boundedCode φ) = 3 ∧ left (boundedCode φ) = boundedCode φ₁ ∧
            right (boundedCode φ) = boundedCode φ₂
        | all ψ => tag (boundedCode φ) = 4 ∧ left (boundedCode φ) = boundedCode ψ := by
  sorry

/-- **Computable quantifier elimination modulo `T_R`.** A computable map on codes, taking the
context size `m` as input, that sends the code of each formula over `Fin m` to the code of a
quantifier-free formula with the same realizations in every model of `radoAxioms`. Its
correctness yields the theory-level `HasQuantifierElimination` of the Mathlib
quantifier-elimination proposal. The values on numbers that are not formula codes are
unconstrained. -/
theorem exists_computable_quantifierElimination :
    ∃ Q : ℕ → ℕ → ℕ, Computable₂ Q ∧
      ∀ (m : ℕ) (φ : Language.graph.Formula (Fin m)),
        ∃ ψ : Language.graph.Formula (Fin m), Q m (boundedCode φ) = boundedCode ψ ∧ ψ.IsQF ∧
          ∀ (M : Type w) [Language.graph.Structure M], M ⊨ radoAxioms →
            ∀ a : Fin m → M, ψ.Realize a ↔ φ.Realize a := by
  sorry

/-- **Decidability of the Rado theory.** A computable test on codes of sentences that answers
truth in the Rado graph. -/
theorem exists_computable_decide_rado :
    ∃ D : ℕ → Bool, Computable D ∧
      ∀ φ : Language.graph.Sentence, D (boundedCode φ) = true ↔ Satisfies TauCeti.radoGraph φ := by
  sorry

noncomputable def radoTruth (φ : Language.graph.Sentence) : ℝ := by
  classical
  exact if Satisfies TauCeti.radoGraph φ then 1 else 0

/-- Atomic isolation in Mathlib's type space: the basic open set of a tuple's finite diagram
(Tau Ceti's `firstOrderAtomicDiagram`, its bound positions made free) is the singleton of the
tuple's complete type. Equality patterns count: in `R` the pairs `(0, 0)` and `(0, 1)` have
different diagrams and isolate different types. -/
theorem typesWith_firstOrderAtomicDiagram_eq_singleton {M : Type w} [Language.graph.Structure M]
    [Nonempty M] [M ⊨ radoAxioms] {m : ℕ} (a : Fin m → M) :
    radoAxioms.typesWith (Formula.equivSentence
        ((TauCeti.firstOrderAtomicDiagram a).toFormula.relabel (Sum.elim Empty.elim id))) =
      {radoAxioms.typeOf a} := by
  sorry

/-! ## Witness counts and explicit error profiles (Milestones 6–7) -/

def witnessProbability (p : I) (r s : ℕ) : ℝ :=
  (p : ℝ) ^ r * (1 - (p : ℝ)) ^ s

noncomputable def witnessCount (G : SimpleGraph V) (U Z C : Finset V) : ℕ := by
  classical
  exact (C.filter (IsExtensionWitness G U Z)).card

theorem witnessCount_mass [Countable V] (p : I) (U Z C : Finset V)
    (hUZ : Disjoint U Z) (hCU : Disjoint C U) (hCZ : Disjoint C Z) (j : ℕ) :
    (SimpleGraph.binomialRandom V p {G | witnessCount G U Z C = j}).toReal =
      (Nat.choose C.card j : ℝ) *
        witnessProbability p U.card Z.card ^ j *
        (1 - witnessProbability p U.card Z.card) ^ (C.card - j) := by
  sorry

theorem no_witness_mass [Countable V] (p : I) (U Z C : Finset V)
    (hUZ : Disjoint U Z) (hCU : Disjoint C U) (hCZ : Disjoint C Z) :
    (SimpleGraph.binomialRandom V p
      {G | ∀ x ∈ C, ¬ IsExtensionWitness G U Z x}).toReal =
        (1 - witnessProbability p U.card Z.card) ^ C.card := by
  sorry

/-- A total finite sum; the probability-bound theorem requires d ≤ n. -/
noncomputable def extensionError (p : I) (d n : ℕ) : ℝ :=
  ∑ t ∈ Finset.range (d + 1), ∑ r ∈ Finset.range (t + 1),
    (Nat.choose n t : ℝ) * (Nat.choose t r : ℝ) *
      (1 - witnessProbability p r (t - r)) ^ (n - t)

theorem extension_failure_le (p : I) (d n : ℕ) (hdn : d ≤ n) :
    (SimpleGraph.binomialRandom (Fin n) p
      {G | ¬ HasExtensionUpTo G d}).toReal ≤ extensionError p d n := by
  sorry

theorem extensionError_le_exp (p : I) (d n : ℕ) (hn : max 1 d ≤ n) :
    extensionError p d n ≤
      (d + 1 : ℝ) * 2 ^ d * (n : ℝ) ^ d *
        Real.exp (-((n : ℝ) - d) * (min (p : ℝ) (1 - (p : ℝ))) ^ d) := by
  sorry

theorem summable_extensionError (p : I) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) (d : ℕ) :
    Summable (fun n => extensionError p d n) := by
  sorry

theorem sentenceProbability_error (p : I) (φ : Language.graph.Sentence)
    (d n : ℕ) (hφ : foRank φ ≤ d + 1) (hdn : d ≤ n) :
    |sentenceProbability p n φ - radoTruth φ| ≤ extensionError p d n := by
  sorry

theorem firstOrder_zero_one (p : I) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) (φ : Language.graph.Sentence) :
    Tendsto (fun n => sentenceProbability p n φ) atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- Fixed-rank convergence; this hypothesis alone does not assert summability. -/
theorem firstOrder_limit_varying_bounded_rank
    (p : ℕ → I) (d : ℕ) (hd : 1 ≤ d)
    (hgrowth : Tendsto
      (fun n : ℕ =>
        ((n : ℝ) - d) * (min (p n : ℝ) (1 - (p n : ℝ))) ^ d -
          (d : ℝ) * Real.log ((n : ℝ) + 2)) atTop atTop)
    (φ : Language.graph.Sentence) (hφ : foRank φ ≤ d + 1) :
    Tendsto (fun n => sentenceProbability (p n) n φ) atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- All-rank varying parameters: `min (p n) (1 - p n)` decays more slowly than every power of
`n`. The parameters need not converge. -/
theorem firstOrder_limit_varying (p : ℕ → I)
    (hp : ∀ a : ℝ, 0 < a →
      Tendsto (fun n : ℕ => (n : ℝ) ^ a * min (p n : ℝ) (1 - (p n : ℝ))) atTop atTop)
    (φ : Language.graph.Sentence) :
    Tendsto (fun n => sentenceProbability (p n) n φ) atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- A single probability space; no independence across sample sizes. -/
theorem ae_eventually_all_bounded_rank
    {Ω : Type w} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (p : I) (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1)
    (X : ∀ n : ℕ, Ω → SimpleGraph (Fin n))
    (hX : ∀ n, Measurable (X n))
    (hlaw : ∀ n, μ.map (X n) = SimpleGraph.binomialRandom (Fin n) p) :
    ∀ᵐ ω ∂μ, ∀ d : ℕ, ∀ᶠ n : ℕ in atTop,
      ∀ φ : Language.graph.Sentence, foRank φ ≤ d + 1 →
        (Satisfies (X n ω) φ ↔ Satisfies TauCeti.radoGraph φ) := by
  sorry

/-- The joint statement for varying parameters under the all-rank condition. -/
theorem ae_eventually_all_bounded_rank_varying
    {Ω : Type w} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (p : ℕ → I)
    (hp : ∀ a : ℝ, 0 < a →
      Tendsto (fun n : ℕ => (n : ℝ) ^ a * min (p n : ℝ) (1 - (p n : ℝ))) atTop atTop)
    (X : ∀ n : ℕ, Ω → SimpleGraph (Fin n))
    (hX : ∀ n, Measurable (X n))
    (hlaw : ∀ n, μ.map (X n) = SimpleGraph.binomialRandom (Fin n) (p n)) :
    ∀ᵐ ω ∂μ, ∀ d : ℕ, ∀ᶠ n : ℕ in atTop,
      ∀ φ : Language.graph.Sentence, foRank φ ≤ d + 1 →
        (Satisfies (X n ω) φ ↔ Satisfies TauCeti.radoGraph φ) := by
  sorry

/-! ## Rooted formulas (Milestone 8)

Fin (m + n) makes the first m named vertices available at every index.
The full conditioned law and finite-pattern-mixture API are specified in the README.
-/

def firstVertices (m n : ℕ) : Fin m ↪ Fin (m + n) :=
  Fin.castAddEmb n

def rootEvent {m n : ℕ} (H : SimpleGraph (Fin m)) :
    Set (SimpleGraph (Fin (m + n))) :=
  {G | G.comap (firstVertices m n) = H}

noncomputable def rootedProbability {m : ℕ} (p : I) (n : ℕ)
    (H : SimpleGraph (Fin m)) (φ : Language.graph.Formula (Fin m)) : ℝ :=
  let μ := SimpleGraph.binomialRandom (Fin (m + n)) p
  (μ {G | G ∈ rootEvent H ∧ SatisfiesFormula G φ (firstVertices m n)}).toReal /
    (μ (rootEvent H)).toReal

theorem rootEvent_pos {m : ℕ} (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1)
    (n : ℕ) (H : SimpleGraph (Fin m)) :
    0 < (SimpleGraph.binomialRandom (Fin (m + n)) p (rootEvent H)).toReal := by
  sorry

noncomputable def rootedTruth {m : ℕ} (φ : Language.graph.Formula (Fin m))
    (a : Fin m → ℕ) : ℝ := by
  classical
  exact if SatisfiesFormula TauCeti.radoGraph φ a then 1 else 0

theorem rooted_firstOrder_limit {m : ℕ} (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1)
    (H : SimpleGraph (Fin m)) (a : H ↪g TauCeti.radoGraph)
    (φ : Language.graph.Formula (Fin m)) :
    Tendsto (fun n => rootedProbability p n H φ) atTop
      (𝓝 (rootedTruth φ a)) := by
  classical
  sorry

/-- The unconditioned fixed-tuple limit, a finite mixture over the root patterns `H`, each placed
in `R` by a chosen copy `a H`. For `φ = Adj(x₀, x₁)` the limit is `p`. -/
theorem firstOrder_limit_firstVertices {m : ℕ} (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1)
    (a : ∀ H : SimpleGraph (Fin m), H ↪g TauCeti.radoGraph)
    (φ : Language.graph.Formula (Fin m)) :
    Tendsto (fun n => (SimpleGraph.binomialRandom (Fin (m + n)) p
        {G | SatisfiesFormula G φ (firstVertices m n)}).toReal) atTop
      (𝓝 (∑ H : SimpleGraph (Fin m), (p : ℝ) ^ H.edgeSet.ncard *
        (1 - (p : ℝ)) ^ (m.choose 2 - H.edgeSet.ncard) * rootedTruth φ (a H))) := by
  sorry

/-! ## Graph properties (Milestone 8.2) -/

/-- Every fixed finite graph occurs as an induced subgraph asymptotically almost surely. -/
theorem tendsto_binomialRandom_nonempty_embedding {k : ℕ} (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) (F : SimpleGraph (Fin k)) :
    Tendsto (fun n => (SimpleGraph.binomialRandom (Fin n) p {G | Nonempty (F ↪g G)}).toReal)
      atTop (𝓝 1) := by
  sorry

/-- Cliques and independent sets of each fixed size, in Mathlib's clique vocabulary. -/
theorem tendsto_binomialRandom_not_cliqueFree (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) (k : ℕ) :
    Tendsto (fun n => (SimpleGraph.binomialRandom (Fin n) p
        {G | ¬ G.CliqueFree k ∧ ¬ Gᶜ.CliqueFree k}).toReal) atTop (𝓝 1) := by
  sorry

open scoped Classical in
/-- Every vertex has at least `k` neighbours and at least `k` nonneighbours. -/
theorem tendsto_binomialRandom_le_degree (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) (k : ℕ) :
    Tendsto (fun n => (SimpleGraph.binomialRandom (Fin n) p
        {G | ∀ v, k ≤ G.degree v ∧ k ≤ Gᶜ.degree v}).toReal) atTop (𝓝 1) := by
  sorry

/-- The graph and its complement have diameter exactly `2` (so both are connected): the
common-neighbour bound and an exhibited nonedge. -/
theorem tendsto_binomialRandom_diam_eq_two (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) :
    Tendsto (fun n => (SimpleGraph.binomialRandom (Fin n) p
        {G | G.diam = 2 ∧ Gᶜ.diam = 2}).toReal) atTop (𝓝 1) := by
  sorry

/-- Vertex connectivity at least `k`, in Tau Ceti's `IsVertexConnected` convention (more than `k`
vertices, and connected after deleting fewer than `k`). -/
theorem tendsto_binomialRandom_isVertexConnected (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) (k : ℕ) :
    Tendsto (fun n => (SimpleGraph.binomialRandom (Fin n) p
        {G | G.IsVertexConnected k}).toReal) atTop (𝓝 1) := by
  sorry

/-! ## Infinite laws and existing graphon samplers (Milestone 9) -/

open TauCeti.DenseGraphLimits

theorem ae_isomorphic_rado (p : I) (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) :
    ∀ᵐ G ∂SimpleGraph.binomialRandom ℕ p, Nonempty (G ≃g TauCeti.radoGraph) := by
  sorry

section Graphons

variable {Ω : Type w} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]

theorem infiniteSampleLaw_const (p : I) :
    infiniteSampleLaw (Graphon.const μ p) = SimpleGraph.binomialRandom ℕ p := by
  sorry

theorem infiniteSampleLaw_ae_rado (K : Graphon Ω μ)
    (hK : ∀ᵐ z ∂μ.prod μ, 0 < K z.1 z.2 ∧ K z.1 z.2 < 1) :
    ∀ᵐ G ∂infiniteSampleLaw K, Nonempty (G ≃g TauCeti.radoGraph) := by
  sorry

theorem graphon_extension_failure_le (K : Graphon Ω μ)
    (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1 / 2)
    (hK : ∀ᵐ z ∂μ.prod μ, ε ≤ K z.1 z.2 ∧ K z.1 z.2 ≤ 1 - ε)
    (d n : ℕ) (hdn : d ≤ n) :
    (sampleGraph K n {G | ¬ HasExtensionUpTo G d}).toReal ≤
      ∑ t ∈ Finset.range (d + 1),
        (Nat.choose n t : ℝ) * 2 ^ t * (1 - ε ^ t) ^ (n - t) := by
  sorry

theorem graphon_firstOrder_limit (K : Graphon Ω μ)
    (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1 / 2)
    (hK : ∀ᵐ z ∂μ.prod μ, ε ≤ K z.1 z.2 ∧ K z.1 z.2 ≤ 1 - ε)
    (φ : Language.graph.Sentence) :
    Tendsto (fun n => (sampleGraph K n {G | Satisfies G φ}).toReal)
      atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- For a fixed graphon, a measurable event invariant under the finitely supported permutations
of `ℕ` has probability `0` or `1`. -/
theorem infiniteSampleLaw_zero_one_of_invariant (K : Graphon Ω μ)
    (S : Set (SimpleGraph ℕ)) (hS : MeasurableSet S)
    (hinv : ∀ g ∈ Equiv.Perm.finitary ℕ, ∀ G : SimpleGraph ℕ, G.comap ⇑g ∈ S ↔ G ∈ S) :
    infiniteSampleLaw K S = 0 ∨ infiniteSampleLaw K S = 1 := by
  sorry

/-- An infinite-law theorem; it has no finite-sample convergence conclusion. -/
theorem infiniteSampleLaw_sentence_zero_one (K : Graphon Ω μ)
    (φ : Language.graph.Sentence) :
    infiniteSampleLaw K {G | Satisfies G φ} = 0 ∨
      infiniteSampleLaw K {G | Satisfies G φ} = 1 := by
  sorry

end Graphons

/-- Evaluated mixtures: under the graphon mixture with mixing measure `P`, the probability of a
sentence is the `P`-integral of its probabilities under the graphon samples, each `0` or `1`. -/
theorem bind_infiniteSampleLawOnSpace_satisfies (P : ProbabilityMeasure GraphonSpaceI)
    (φ : Language.graph.Sentence) :
    (P : Measure GraphonSpaceI).bind infiniteSampleLawOnSpace {G | Satisfies G φ} =
      ∫⁻ x, infiniteSampleLawOnSpace x {G | Satisfies G φ} ∂(P : Measure GraphonSpaceI) := by
  sorry

/-- Real division by zero gives value zero at n = 0, 1. -/
noncomputable def windowEdgeDensity (G : SimpleGraph ℕ) (n : ℕ) : ℝ :=
  2 * ((G.restrictFin n).edgeSet.ncard : ℝ) / ((n * (n - 1) : ℕ) : ℝ)

theorem ae_windowEdgeDensity (p : I) :
    ∀ᵐ G ∂SimpleGraph.binomialRandom ℕ p,
      Tendsto (windowEdgeDensity G) atTop (𝓝 (p : ℝ)) := by
  sorry

/-- A concrete measurable separator, not an isomorphism-invariant event. -/
theorem binomialRandom_singular_separator (p q : I) (hpq : p ≠ q) :
    ∃ S : Set (SimpleGraph ℕ), MeasurableSet S ∧
      SimpleGraph.binomialRandom ℕ p S = 1 ∧
      SimpleGraph.binomialRandom ℕ q S = 0 := by
  sorry

/-! ## Infinitary distinctions (Milestone 10)

The sentences are Tau Ceti's `L_{ω₁,ω}` sentences `Language.graph.Sentenceω`, with first-order
conjuncts and disjuncts embedded by `BoundedFormula.toInf`. -/

/-- Realization of an `L_{ω₁,ω}` graph sentence, using the existing graph structure. -/
def SatisfiesInf (G : SimpleGraph V) (φ : Language.graph.Sentenceω) : Prop :=
  letI : Language.graph.Structure V := G.structure
  SentenceInf.Realize φ V

/-- `Θ_R`, the countable conjunction of all extension axioms `E_{r,s}`. -/
noncomputable def radoSentenceInf : Language.graph.Sentenceω :=
  BoundedFormulaInf.iInf fun k => (extensionSentence k.unpair.1 k.unpair.2).toInf

theorem satisfiesInf_radoSentenceInf_iff (G : SimpleGraph V) :
    SatisfiesInf G radoSentenceInf ↔ G.HasExtensionProperty := by
  sorry

theorem binomialRandom_radoSentenceInf (p : I) (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) :
    SimpleGraph.binomialRandom ℕ p {G | SatisfiesInf G radoSentenceInf} = 1 := by
  sorry

/-- On a finite carrier `Θ_R` has probability zero, for every `p`. -/
theorem binomialRandom_radoSentenceInf_of_finite [Finite V] (p : I) :
    SimpleGraph.binomialRandom V p {G | SatisfiesInf G radoSentenceInf} = 0 := by
  sorry

/-- `CardEq m`: the carrier has exactly `m` elements. -/
def cardEq (m : ℕ) : Language.graph.Sentence :=
  Sentence.cardGe Language.graph m ⊓ (Sentence.cardGe Language.graph (m + 1)).not

/-- `Θ_even`, the countable disjunction of `CardEq (2 m)`. -/
def evenSentenceInf : Language.graph.Sentenceω :=
  BoundedFormulaInf.iSup fun m => (cardEq (2 * m)).toInf

theorem binomialRandom_evenSentenceInf (p : I) (n : ℕ) :
    SimpleGraph.binomialRandom (Fin n) p {G | SatisfiesInf G evenSentenceInf} =
      if Even n then 1 else 0 := by
  sorry

/-- The finite probabilities of `Θ_even` have no limit. -/
theorem not_tendsto_binomialRandom_evenSentenceInf (p : I) (l : ℝ) :
    ¬ Tendsto (fun n =>
        (SimpleGraph.binomialRandom (Fin n) p {G | SatisfiesInf G evenSentenceInf}).toReal)
      atTop (𝓝 l) := by
  sorry

/-! ## Concrete FO formulas and Poisson endpoints (Milestones 8, 11) -/

def triangleSentence : Language.graph.Sentence :=
  let e01 : Language.graph.BoundedFormula Empty 3 :=
    .rel Language.adj ![.var (Sum.inr 0), .var (Sum.inr 1)]
  let e02 : Language.graph.BoundedFormula Empty 3 :=
    .rel Language.adj ![.var (Sum.inr 0), .var (Sum.inr 2)]
  let e12 : Language.graph.BoundedFormula Empty 3 :=
    .rel Language.adj ![.var (Sum.inr 1), .var (Sum.inr 2)]
  (e01 ⊓ e02 ⊓ e12).ex.ex.ex

def noIsolatedSentence : Language.graph.Sentence :=
  let edge : Language.graph.BoundedFormula Empty 2 :=
    .rel Language.adj ![.var (Sum.inr 0), .var (Sum.inr 1)]
  edge.ex.all

noncomputable def triangleCount [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact (G.cliqueFinset 3).card

noncomputable def isolatedCount [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact (Finset.univ.filter (fun x => ∀ y, ¬ G.Adj x y)).card

theorem satisfies_triangleSentence [Fintype V] (G : SimpleGraph V) :
    Satisfies G triangleSentence ↔ 0 < triangleCount G := by
  sorry

theorem satisfies_noIsolatedSentence [Fintype V] (G : SimpleGraph V) :
    Satisfies G noIsolatedSentence ↔ isolatedCount G = 0 := by
  sorry

/-- This convergence criterion is proved as part of the roadmap. -/
theorem poisson_pointMass_limit_of_factorial_moments
    (ν : ℕ → Measure ℕ) [∀ n, IsProbabilityMeasure (ν n)] (r : ℝ≥0)
    (hfinite : ∀ n k,
      Integrable (fun x : ℕ => (x.descFactorial k : ℝ)) (ν n))
    (hmom : ∀ k : ℕ,
      Tendsto (fun n => ∫ x : ℕ, (x.descFactorial k : ℝ) ∂ν n)
        atTop (𝓝 ((r : ℝ) ^ k))) :
    ∀ j : ℕ, Tendsto (fun n => (ν n {j}).toReal) atTop
      (𝓝 ((ProbabilityTheory.poissonMeasure r {j}).toReal)) := by
  sorry

/-- **The criterion in total variation**, with the countable discrete formula
`½ ∑ⱼ |ν n {j} − Poisson(r) {j}|`. The case `r = 0` is included. -/
theorem poisson_totalVariation_limit_of_factorial_moments
    (ν : ℕ → Measure ℕ) [∀ n, IsProbabilityMeasure (ν n)] (r : ℝ≥0)
    (hfinite : ∀ n k,
      Integrable (fun x : ℕ => (x.descFactorial k : ℝ)) (ν n))
    (hmom : ∀ k : ℕ,
      Tendsto (fun n => ∫ x : ℕ, (x.descFactorial k : ℝ) ∂ν n)
        atTop (𝓝 ((r : ℝ) ^ k))) :
    Tendsto (fun n => (1 / 2 : ℝ) * ∑' j : ℕ,
        |(ν n {j}).toReal - (ProbabilityTheory.poissonMeasure r {j}).toReal|)
      atTop (𝓝 0) := by
  sorry

theorem triangle_factorialMoment_limit (p : ℕ → I) (c : ℝ≥0)
    (hp : Tendsto (fun n : ℕ => (n : ℝ) * (p n : ℝ)) atTop (𝓝 (c : ℝ)))
    (k : ℕ) :
    Tendsto
      (fun n => ∫ G : SimpleGraph (Fin n),
        ((triangleCount G).descFactorial k : ℝ)
          ∂SimpleGraph.binomialRandom (Fin n) (p n))
      atTop (𝓝 (((c : ℝ) ^ 3 / 6) ^ k)) := by
  sorry

theorem triangle_poisson_mass_limit (p : ℕ → I) (c : ℝ≥0)
    (hp : Tendsto (fun n : ℕ => (n : ℝ) * (p n : ℝ)) atTop (𝓝 (c : ℝ)))
    (j : ℕ) :
    Tendsto
      (fun n => (SimpleGraph.binomialRandom (Fin n) (p n)
        {G | triangleCount G = j}).toReal)
      atTop (𝓝 ((ProbabilityTheory.poissonMeasure (c ^ 3 / 6) {j}).toReal)) := by
  sorry

theorem sparse_triangle_sentence_limit (p : ℕ → I) (c : ℝ≥0)
    (hp : Tendsto (fun n : ℕ => (n : ℝ) * (p n : ℝ)) atTop (𝓝 (c : ℝ))) :
    Tendsto (fun n => sentenceProbability (p n) n triangleSentence)
      atTop (𝓝 (1 - Real.exp (-((c : ℝ) ^ 3 / 6)))) := by
  sorry

/-- The product graphon `(x, y) ↦ x y` on the unit interval. -/
def productGraphon : Graphon I (volume : Measure I) where
  toFun x y := (x : ℝ) * (y : ℝ)
  symm' x y := mul_comm _ _
  meas' := (continuous_subtype_val.comp continuous_fst).mul
    (continuous_subtype_val.comp continuous_snd) |>.measurable
  bdd' := ⟨1, fun x y => abs_le.mpr ⟨by linarith [(unitInterval.mul_mem x.2 y.2).1],
    (unitInterval.mul_mem x.2 y.2).2⟩⟩
  mem01' x y := unitInterval.mul_mem x.2 y.2

/-- The expected number of isolated vertices of the `xy` graphon sample is `2(1 - 2⁻ⁿ)` for every
`n`, including `n = 0` (empty sum, both sides `0`); the values at `n = 1, 2, 3` are `1, 3/2, 7/4`. -/
theorem productGraphon_isolated_expectation (n : ℕ) :
    (∫ G : SimpleGraph (Fin n), (isolatedCount G : ℝ) ∂sampleGraph productGraphon n) =
      2 * (1 - (1 / 2 : ℝ) ^ n) := by
  sorry

theorem productGraphon_isolated_factorialMoment_limit (k : ℕ) :
    Tendsto
      (fun n => ∫ G : SimpleGraph (Fin n),
        ((isolatedCount G).descFactorial k : ℝ) ∂sampleGraph productGraphon n)
      atTop (𝓝 ((2 : ℝ) ^ k)) := by
  sorry

theorem productGraphon_isolated_poisson_mass_limit (j : ℕ) :
    Tendsto
      (fun n => (sampleGraph productGraphon n {G | isolatedCount G = j}).toReal)
      atTop (𝓝 ((ProbabilityTheory.poissonMeasure 2 {j}).toReal)) := by
  sorry

theorem productGraphon_noIsolated_limit :
    Tendsto
      (fun n => (sampleGraph productGraphon n
        {G | Satisfies G noIsolatedSentence}).toReal)
      atTop (𝓝 (Real.exp (-2))) := by
  sorry

theorem productGraphon_ae_isomorphic_rado :
    ∀ᵐ G ∂infiniteSampleLaw productGraphon, Nonempty (G ≃g TauCeti.radoGraph) := by
  sorry

end TauCetiRoadmap.RandomGraphs

end
