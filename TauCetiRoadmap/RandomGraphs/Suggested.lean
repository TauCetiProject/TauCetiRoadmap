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

/-! ## General Fraïssé and rooted interfaces (Layers 1–3) -/

section Fraisse

variable {L : FirstOrder.Language.{u, v}}

/-- **Fraïssé existence.** In a language with countably many function symbols, every Fraïssé class
`K` of finitely generated structures has a countable Fraïssé limit in the same universe. There is no
countability assumption on the relation symbols, and the limit may be finite or empty. -/
theorem exists_isFraisseLimit_of_isFraisse
    [Countable (Σ n, L.Functions n)]
    (K : Set (Bundled.{w} L.Structure)) [IsFraisse K] :
    ∃ (M : Bundled.{w} L.Structure) (_ : Countable M),
      IsFraisseLimit K M := by
  sorry

variable {A : Type x} {M : Type w} {N : Type w'}
  [L.Structure A] [L.Structure M] [L.Structure N]

/-- **Rooted embedding.** If `M` is countably generated and `(M, N)` is an extension pair, every
pair of embeddings `aM : A ↪ M`, `aN : A ↪ N` of a finitely generated root extends: some embedding
`e : M ↪ N` satisfies `e ∘ aM = aN`. The target `N` need not be countable. -/
theorem exists_embedding_comp_eq_of_isExtensionPair
    (hA : Structure.FG L A) (aM : A ↪[L] M) (aN : A ↪[L] N)
    (hM : Structure.CG L M) (hMN : L.IsExtensionPair M N) :
    ∃ e : M ↪[L] N, e.comp aM = aN := by
  sorry

/-- **Rooted isomorphism.** If `M` and `N` are countably generated and each is an extension pair for
the other, every pair of embeddings `aM : A ↪ M`, `aN : A ↪ N` of a finitely generated root extends
to an isomorphism `e : M ≃ N` with `e ∘ aM = aN`. -/
theorem exists_equiv_comp_eq_of_isExtensionPair
    (hA : Structure.FG L A) (aM : A ↪[L] M) (aN : A ↪[L] N)
    (hM : Structure.CG L M) (hN : Structure.CG L N)
    (hMN : L.IsExtensionPair M N) (hNM : L.IsExtensionPair N M) :
    ∃ e : M ≃[L] N, e.toEmbedding.comp aM = aN := by
  sorry

end Fraisse

/-! ## Native realization and finite rank (Layers 0, 5) -/

variable {V : Type u} {W : Type v}

/-- A simple graph satisfies a graph sentence when its graph-language structure `G.structure`
realizes it. -/
def Satisfies (G : SimpleGraph V) (φ : Language.graph.Sentence) : Prop :=
  letI : Language.graph.Structure V := G.structure
  φ.Realize V

/-- A simple graph satisfies a graph formula with free variables in `Fin m` at the tuple `a` when
`G.structure` realizes it at `a`. -/
def SatisfiesFormula {m : ℕ} (G : SimpleGraph V)
    (φ : Language.graph.Formula (Fin m)) (a : Fin m → V) : Prop :=
  letI : Language.graph.Structure V := G.structure
  φ.Realize a

/-- The natural-valued quantifier rank of a first-order formula: `0` on `⊥`, equalities and relation
atoms, the maximum of the two ranks on an implication, and one more than the body's rank on a
universal quantification. -/
def foRank {L : FirstOrder.Language.{u, v}} {α : Type w} :
    {n : ℕ} → L.BoundedFormula α n → ℕ
  | _, .falsum => 0
  | _, .equal _ _ => 0
  | _, .rel _ _ => 0
  | _, .imp φ ψ => max (foRank φ) (foRank ψ)
  | _, .all φ => foRank φ + 1

/-- A formula has quantifier rank `0` exactly when it is quantifier-free in the sense of Mathlib's
`IsQF`. -/
theorem foRank_eq_zero_iff_isQF
    {L : FirstOrder.Language.{u, v}} {α : Type w} {n : ℕ}
    (φ : L.BoundedFormula α n) :
    foRank φ = 0 ↔ φ.IsQF := by
  sorry

/-- **Joint measurability of realization.** For a fixed graph formula with finitely many free
variables on a countable discrete carrier, realization is measurable jointly in the graph, the
free-variable assignment and the bound-variable tuple: a countable union over the assignments of
the rectangles formed by singletons and the fixed-assignment graph events. Those events are
CountableStructureSpaces' (Layer 2), the pullback along the graph coding of
`TauCeti.RelationalConfiguration.measurableSet_setOf_realize` at `BoundedFormula.toInf φ`; this
file does not restate them. -/
theorem measurableSet_realize_jointly [Countable V] [MeasurableSpace V] [DiscreteMeasurableSpace V]
    {α : Type w} [Finite α] {n : ℕ} (φ : Language.graph.BoundedFormula α n) :
    MeasurableSet {x : SimpleGraph V × (α → V) × (Fin n → V) |
      @BoundedFormula.Realize _ V x.1.structure _ _ φ x.2.1 x.2.2} := by
  sorry

/-- The probability that the binomial random graph `G(n, p)` on `Fin n` satisfies the sentence `φ`,
as a real number. -/
noncomputable def sentenceProbability (p : I) (n : ℕ)
    (φ : Language.graph.Sentence) : ℝ :=
  (SimpleGraph.binomialRandom (Fin n) p {G | Satisfies G φ}).toReal

/-- Restricting the binomial random graph on a countable `W` along an injection `f : V ↪ W` gives
the binomial random graph on `V` with the same edge probability. -/
theorem binomialRandom_map_comap [Countable V] [Countable W] (p : I)
    (f : V ↪ W) :
    (SimpleGraph.binomialRandom W p).map (fun G => G.comap f) =
      SimpleGraph.binomialRandom V p := by
  sorry

/-! ## Actual requests, extension syntax and the Rado graph (Layer 4) -/

/-- `x` is an extension witness for the request `(U, Z)` in `G`: it lies outside `U` and `Z`, is
adjacent to every vertex of `U`, and to no vertex of `Z`. -/
def IsExtensionWitness (G : SimpleGraph V) (U Z : Finset V) (x : V) : Prop :=
  x ∉ U ∧ x ∉ Z ∧ (∀ u ∈ U, G.Adj x u) ∧ (∀ z ∈ Z, ¬ G.Adj x z)

/-- Bounded extension `EP_{≤d}`: every request `(U, Z)` of disjoint finite vertex sets with
`|U| + |Z| ≤ d` has an extension witness. The empty request is included, so `EP_{≤0}` says the
carrier is nonempty. -/
def HasExtensionUpTo (G : SimpleGraph V) (d : ℕ) : Prop :=
  ∀ U Z : Finset V, Disjoint U Z → U.card + Z.card ≤ d →
    ∃ x, IsExtensionWitness G U Z x

/-- Full extension is bounded extension at every budget. The canonical predicate
`SimpleGraph.HasExtensionProperty` omits the condition that the witness lies outside `U`, which
adjacency to every vertex of `U` forces in a loopless graph. -/
theorem hasExtensionProperty_iff (G : SimpleGraph V) :
    G.HasExtensionProperty ↔ ∀ d, HasExtensionUpTo G d := by
  sorry

/-- A graph with the full extension property has an infinite vertex set: every request has
arbitrarily many distinct witnesses. -/
theorem HasExtensionProperty.infinite {G : SimpleGraph V} (hG : G.HasExtensionProperty) :
    Infinite V := by
  sorry

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

/-- A graph satisfies `E_{r,s}` exactly when every request `(U, Z)` of disjoint vertex sets with
`|U| = r` and `|Z| = s` has an extension witness. -/
theorem satisfies_extensionSentence (G : SimpleGraph V) (r s : ℕ) :
    Satisfies G (extensionSentence r s) ↔
      ∀ U Z : Finset V, Disjoint U Z → U.card = r → Z.card = s →
        ∃ x, IsExtensionWitness G U Z x := by
  sorry

/-- The Rado axioms `T_R`: the simple-graph axioms together with every extension axiom `E_{r,s}`.
Its models are the graphs with the full extension property, and its semantic consequences are the
sentences true in the Rado graph. -/
noncomputable def radoAxioms : Language.graph.Theory :=
  Language.Theory.simpleGraph ∪ {φ | ∃ r s, φ = extensionSentence r s}

/-- A graph structure `G.structure` is a model of `T_R` exactly when `G` has the full extension
property. -/
theorem model_radoAxioms_iff (G : SimpleGraph V) :
    @Theory.Model Language.graph V G.structure radoAxioms ↔ G.HasExtensionProperty := by
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

/-- The finite simple graphs form a Fraïssé class: they are hereditary, have joint embedding and
amalgamation (by the free amalgam), are essentially countable and contain the empty graph. -/
theorem isFraisse_finiteGraphs : IsFraisse finiteGraphs.{w} := by
  sorry

/-- `R` is the Fraïssé limit of the finite simple graphs. -/
theorem isFraisseLimit_radoGraph :
    @IsFraisseLimit Language.graph finiteGraphs.{0} ℕ TauCeti.radoGraph.structure _ _ := by
  sorry


/-- The graph-language extension property of the graph-characterization proposal: for disjoint
finite sets `A` and `B` of vertices, some vertex outside `A ∪ B` is adjacent to every vertex of `A`
and to none of `B`. -/
def Language.graph.ExtensionProperty (M : Type w) [Language.graph.Structure M] [DecidableEq M] :
    Prop :=
  ∀ {A B : Finset M}, Disjoint A B → ∃ x ∉ A ∪ B,
    (∀ a ∈ A, Structure.RelMap Language.adj ![x, a]) ∧
      ∀ b ∈ B, ¬ Structure.RelMap Language.adj ![x, b]

/-- Every countable simple-graph structure embeds into a simple-graph structure with the extension
property, of any cardinality. -/
theorem Language.graph.ExtensionProperty.embedding_from_countable {M : Type w} {N : Type w'}
    [Language.graph.Structure M] [M ⊨ Language.Theory.simpleGraph] [DecidableEq M]
    [Language.graph.Structure N] [N ⊨ Language.Theory.simpleGraph] [Countable N]
    (h : Language.graph.ExtensionProperty M) : Nonempty (N ↪[Language.graph] M) := by
  sorry

/-- A countable simple-graph structure with the extension property is the Fraïssé limit of the
finite simple graphs (the proposal's class, with its two conditions in the other order). -/
theorem Language.graph.ExtensionProperty.isFraisseLimit_finite_graphs {M : Type w}
    [Language.graph.Structure M] [M ⊨ Language.Theory.simpleGraph] [DecidableEq M] [Countable M]
    (h : Language.graph.ExtensionProperty M) : IsFraisseLimit finiteGraphs.{w} M := by
  sorry

/-- A formula is quantifier-free equivalent modulo `T` when some quantifier-free formula in the same
free variables has the same realizations in every model of `T`. -/
def Language.Theory.IsQFEquivalent {L : FirstOrder.Language.{u, v}} (T : L.Theory) {α : Type w}
    (φ : L.Formula α) : Prop :=
  ∃ ψ : L.Formula α, ψ.IsQF ∧ φ ⇔[T] ψ

/-- A theory has quantifier elimination when every formula is quantifier-free equivalent modulo
it. -/
def Language.Theory.HasQuantifierElimination {L : FirstOrder.Language.{u, v}} (T : L.Theory) :
    Prop :=
  ∀ {α : Type} (φ : L.Formula α), Language.Theory.IsQFEquivalent T φ

/-! ## Finite-rank agreement and genuine QE targets (Layer 5) -/

/-- `T_R` is complete. -/
theorem radoAxioms_isComplete : radoAxioms.IsComplete := by
  sorry

/-- `T_R` is `ℵ₀`-categorical: its countably infinite models are isomorphic. -/
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

/-- **Bounded-rank agreement.** Two graphs with bounded extension at budget `d` agree on every
sentence of quantifier rank at most `d + 1`. -/
theorem satisfies_iff_of_extension
    (G : SimpleGraph V) (H : SimpleGraph W) (d : ℕ)
    (hG : HasExtensionUpTo G d) (hH : HasExtensionUpTo H d)
    (φ : Language.graph.Sentence) (hφ : foRank φ ≤ d + 1) :
    Satisfies G φ ↔ Satisfies H φ := by
  sorry

/-- **Rooted bounded-rank agreement.** Let tuples `a` in `G` and `b` in `H` of length `m` have the
same equality and adjacency pattern, repeated coordinates allowed. If both graphs have bounded
extension at budget `m + q - 1` with `q ≥ 1`, then `a` and `b` satisfy the same formulas of rank at
most `q`. The named tuple consumes part of the budget. -/
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

/-! ### Effective syntax for first-order formulas

Computable quantifier elimination and decidability are stated over a structural coding of formulas
by natural numbers: Mathlib's list encoding `BoundedFormula.listEncode`, followed by the `Encodable`
numbering of its symbol alphabet. The coding is stated for a general language `L`. Its effective
content needs an effective presentation of `L`: `Primcodable` symbol families, with the arity of a
symbol computable from its code. An `Encodable` instance such as `Encodable.ofCountable` carries no
effective content. The free-variable context `Fin m` and the bound positions `Fin n` are coded by
their values, so the codes are uniform in `m` and `n`. The graph language is the instance used by
the quantifier-elimination and decision theorems below. -/

section Coding

/-- The symbol alphabet of Mathlib's list encoding of `L`-formulas with free variables in `α`: a
term over `α ⊕ Fin k` for some `k`, a relation symbol, or a natural-number tag. -/
abbrev FormulaAlphabet (L : FirstOrder.Language.{u, v}) (α : Type w) :=
  (Σ k, L.Term (α ⊕ Fin k)) ⊕ ((Σ l, L.Relations l) ⊕ ℕ)

variable {L : FirstOrder.Language.{u, v}}

section Encodable

variable [Encodable (Σ l, L.Functions l)] [Encodable (Σ l, L.Relations l)]

/-- The code of an `L`-formula with free variables in `α` and `n` bound positions: the number of
its list encoding. -/
def boundedCode {α : Type w} [Encodable α] {n : ℕ} (φ : L.BoundedFormula α n) : ℕ :=
  Encodable.encode (φ.listEncode : List (FormulaAlphabet L α))

/-- Decoding at a given context and number of bound positions. Mathlib's list decoder ignores
trailing symbols, so the candidate is kept only if re-encoding it reproduces `c`; every other
number decodes to `none`. -/
def boundedDecode (L : FirstOrder.Language.{u, v}) [Encodable (Σ l, L.Functions l)]
    [Encodable (Σ l, L.Relations l)] (α : Type w) [Encodable α] (n : ℕ) (c : ℕ) :
    Option (L.BoundedFormula α n) :=
  ((Encodable.decode c : Option (List (FormulaAlphabet L α))).bind fun l =>
    (BoundedFormula.encoding.decode l).bind fun φ =>
      if h : φ.1 = n then some (h ▸ φ.2) else none).filter fun φ => boundedCode φ == c

/-- Decoding the code of a formula returns that formula. -/
theorem boundedDecode_boundedCode {α : Type w} [Encodable α] {n : ℕ}
    (φ : L.BoundedFormula α n) : boundedDecode L α n (boundedCode φ) = some φ := by
  have h := BoundedFormula.encoding.decode_encode (⟨n, φ⟩ : Σ n, L.BoundedFormula α n)
  simp only [BoundedFormula.encoding_encode, BoundedFormula.encoding_decode] at h
  simp [boundedCode, boundedDecode, h]

/-- `boundedDecode` succeeds exactly on codes of formulas. -/
theorem boundedDecode_eq_some_iff {α : Type w} [Encodable α] {n c : ℕ}
    {φ : L.BoundedFormula α n} : boundedDecode L α n c = some φ ↔ boundedCode φ = c := by
  refine ⟨fun h => ?_, fun h => h ▸ boundedDecode_boundedCode φ⟩
  simp only [boundedDecode, Option.filter_eq_some_iff, beq_iff_eq] at h
  exact h.2

end Encodable

section Effective

variable [Primcodable (Σ l, L.Functions l)] [Primcodable (Σ l, L.Relations l)]

open Encodable in
/-- **Effective syntax of terms.** For an effectively presented language, the codes of terms over
`Fin m ⊕ Fin n` are built and taken apart computably, uniformly in `m` and `n`: a variable from
the code of the variable, an application from the code of its function symbol and the list of
codes of its arguments; conversely the kind of a term (`0` for a variable, `1` for an
application), the code of its variable or symbol, and the codes of its arguments. -/
theorem computable_termCode
    (hfun : Computable (Sigma.fst : (Σ l, L.Functions l) → ℕ)) :
    ∃ (mkVar : ℕ → ℕ) (mkFunc : ℕ → List ℕ → ℕ) (tag head : ℕ → ℕ) (args : ℕ → List ℕ),
      Computable mkVar ∧ Computable₂ mkFunc ∧ Computable tag ∧ Computable head ∧ Computable args ∧
      ∀ {m n : ℕ} (t : L.Term (Fin m ⊕ Fin n)),
        match t with
        | .var x => mkVar (encode x) = encode t ∧ tag (encode t) = 0 ∧ head (encode t) = encode x
        | @Term.func _ _ l f ts =>
            mkFunc (encode (⟨l, f⟩ : Σ l, L.Functions l)) (List.ofFn fun i => encode (ts i)) =
                encode t ∧
              tag (encode t) = 1 ∧ head (encode t) = encode (⟨l, f⟩ : Σ l, L.Functions l) ∧
              args (encode t) = List.ofFn fun i => encode (ts i) := by
  sorry

open Encodable BoundedFormula in
/-- **Effective syntax of formulas.** For an effectively presented language, the codes of formulas
over `Fin m` with `n` bound positions are built and taken apart computably, uniformly in `m` and
`n`: `⊥` from `n`, an equality from `n` and the codes of its two terms, a relation application
from `n`, the code of its symbol and the codes of its arguments, an implication from the codes of
its two parts, and a universal quantification from the code of its body. Conversely the outermost
constructor (tagged `0` to `4` in that order), the codes of the immediate subformulas, the code of
the relation symbol and the codes of the terms of an atom are computable from the code. -/
theorem computable_boundedCode
    (hfun : Computable (Sigma.fst : (Σ l, L.Functions l) → ℕ))
    (hrel : Computable (Sigma.fst : (Σ l, L.Relations l) → ℕ)) :
    ∃ (mkBot : ℕ → ℕ) (mkEq : ℕ × ℕ × ℕ → ℕ) (mkRel : ℕ × ℕ × List ℕ → ℕ)
      (mkImp : ℕ → ℕ → ℕ) (mkAll : ℕ → ℕ) (tag left right : ℕ → ℕ) (args : ℕ → List ℕ),
      Computable mkBot ∧ Computable mkEq ∧ Computable mkRel ∧ Computable₂ mkImp ∧
      Computable mkAll ∧
      Computable tag ∧ Computable left ∧ Computable right ∧ Computable args ∧
      ∀ {m n : ℕ} (φ : L.BoundedFormula (Fin m) n),
        match φ with
        | falsum => mkBot n = boundedCode φ ∧ tag (boundedCode φ) = 0
        | equal t₁ t₂ => mkEq (n, encode t₁, encode t₂) = boundedCode φ ∧
            tag (boundedCode φ) = 1 ∧ args (boundedCode φ) = [encode t₁, encode t₂]
        | @rel _ _ _ l R ts =>
            mkRel (n, encode (⟨l, R⟩ : Σ l, L.Relations l), List.ofFn fun i => encode (ts i)) =
                boundedCode φ ∧
              tag (boundedCode φ) = 2 ∧
              left (boundedCode φ) = encode (⟨l, R⟩ : Σ l, L.Relations l) ∧
              args (boundedCode φ) = List.ofFn fun i => encode (ts i)
        | imp φ₁ φ₂ => mkImp (boundedCode φ₁) (boundedCode φ₂) = boundedCode φ ∧
            tag (boundedCode φ) = 3 ∧ left (boundedCode φ) = boundedCode φ₁ ∧
            right (boundedCode φ) = boundedCode φ₂
        | all ψ => mkAll (boundedCode ψ) = boundedCode φ ∧ tag (boundedCode φ) = 4 ∧
            left (boundedCode φ) = boundedCode ψ := by
  sorry

end Effective

end Coding

/-! ### The graph language as an effectively presented language -/

/-- The graph language has no function symbols. -/
instance : IsEmpty (Σ l, Language.graph.Functions l) :=
  ⟨fun ⟨_, f⟩ => (f : Empty).elim⟩

/-- The empty family of graph function symbols, numbered through `Empty`. -/
instance : Primcodable (Σ l, Language.graph.Functions l) :=
  Primcodable.ofEquiv Empty (Equiv.equivEmpty _)

/-- The graph language has the single relation symbol `adj`. -/
def graphRelationsEquiv : (Σ l, Language.graph.Relations l) ≃ Unit where
  toFun _ := ()
  invFun _ := ⟨2, Language.adj⟩
  left_inv := by rintro ⟨_, ⟨⟩⟩; rfl
  right_inv _ := rfl

/-- The one graph relation symbol, numbered through `Unit`. -/
instance : Primcodable (Σ l, Language.graph.Relations l) :=
  Primcodable.ofEquiv Unit graphRelationsEquiv

/-- The finite graph signature, needed by Tau Ceti's `TauCeti.firstOrderAtomicDiagram`. -/
instance : Finite (Σ l, Language.graph.Relations l) := Finite.of_equiv _ graphRelationsEquiv.symm

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

/-- **Theory-level quantifier elimination** for `T_R`, in the quantifier-elimination proposal's
vocabulary, for formulas in any type of free variables. It follows from the computable map by the
proposal's reduction to finite variable types, and does not replace that map. -/
theorem radoAxioms_hasQuantifierElimination :
    Language.Theory.HasQuantifierElimination radoAxioms := by
  sorry

/-- **Decidability of the Rado theory.** A computable test on codes of sentences that answers
truth in the Rado graph. -/
theorem exists_computable_decide_rado :
    ∃ D : ℕ → Bool, Computable D ∧
      ∀ φ : Language.graph.Sentence, D (boundedCode φ) = true ↔ Satisfies TauCeti.radoGraph φ := by
  sorry

/-- The truth value of a sentence in the Rado graph, as `1` or `0`. -/
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

/-! ## Witness counts and explicit error profiles (Layers 6–7) -/

/-- The probability `p^r (1 - p)^s` that a given outside vertex witnesses a request with `r`
positive and `s` negative vertices. -/
def witnessProbability (p : I) (r s : ℕ) : ℝ :=
  (p : ℝ) ^ r * (1 - (p : ℝ)) ^ s

/-- The number of extension witnesses for the request `(U, Z)` in the candidate set `C`. -/
noncomputable def witnessCount (G : SimpleGraph V) (U Z C : Finset V) : ℕ := by
  classical
  exact (C.filter (IsExtensionWitness G U Z)).card

/-- For a candidate set `C` disjoint from the disjoint request sets `U` and `Z`, the number of
witnesses in `C` is binomial with parameters `|C|` and `q = p^|U| (1 - p)^|Z|`: it equals `j` with
probability `C(|C|, j) q^j (1 - q)^(|C| - j)`. -/
theorem witnessCount_mass [Countable V] (p : I) (U Z C : Finset V)
    (hUZ : Disjoint U Z) (hCU : Disjoint C U) (hCZ : Disjoint C Z) (j : ℕ) :
    (SimpleGraph.binomialRandom V p {G | witnessCount G U Z C = j}).toReal =
      (Nat.choose C.card j : ℝ) *
        witnessProbability p U.card Z.card ^ j *
        (1 - witnessProbability p U.card Z.card) ^ (C.card - j) := by
  sorry

/-- For a candidate set `C` disjoint from the disjoint request sets `U` and `Z`, no vertex of `C` is
a witness with probability `(1 - p^|U| (1 - p)^|Z|)^|C|`. -/
theorem no_witness_mass [Countable V] (p : I) (U Z C : Finset V)
    (hUZ : Disjoint U Z) (hCU : Disjoint C U) (hCZ : Disjoint C Z) :
    (SimpleGraph.binomialRandom V p
      {G | ∀ x ∈ C, ¬ IsExtensionWitness G U Z x}).toReal =
        (1 - witnessProbability p U.card Z.card) ^ C.card := by
  sorry

/-- The rank-budget failure bound
`B_d(n, p) = Σ_{t ≤ d} Σ_{r ≤ t} C(n, t) C(t, r) (1 - p^r (1 - p)^(t - r))^(n - t)`, a finite real
sum defined for all `n`; the probability bound `extension_failure_le` uses it for `d ≤ n`. -/
noncomputable def extensionError (p : I) (d n : ℕ) : ℝ :=
  ∑ t ∈ Finset.range (d + 1), ∑ r ∈ Finset.range (t + 1),
    (Nat.choose n t : ℝ) * (Nat.choose t r : ℝ) *
      (1 - witnessProbability p r (t - r)) ^ (n - t)

/-- For `d ≤ n`, the probability that `G(n, p)` fails bounded extension at budget `d` is at most
`B_d(n, p)`. -/
theorem extension_failure_le (p : I) (d n : ℕ) (hdn : d ≤ n) :
    (SimpleGraph.binomialRandom (Fin n) p
      {G | ¬ HasExtensionUpTo G d}).toReal ≤ extensionError p d n := by
  sorry

/-- For `n ≥ max 1 d`, with `δ = min(p, 1 - p)`, `B_d(n, p) ≤ (d + 1) 2^d n^d exp(-(n - d) δ^d)`. -/
theorem extensionError_le_exp (p : I) (d n : ℕ) (hn : max 1 d ≤ n) :
    extensionError p d n ≤
      (d + 1 : ℝ) * 2 ^ d * (n : ℝ) ^ d *
        Real.exp (-((n : ℝ) - d) * (min (p : ℝ) (1 - (p : ℝ))) ^ d) := by
  sorry

/-- For fixed `0 < p < 1` and each budget `d`, the bounds `B_d(n, p)` are summable in `n`. -/
theorem summable_extensionError (p : I) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) (d : ℕ) :
    Summable (fun n => extensionError p d n) := by
  sorry

/-- **Uniform error bound.** For a sentence of rank at most `d + 1` and `d ≤ n`, the probability
that `G(n, p)` satisfies it differs from its Rado truth value by at most `B_d(n, p)`. -/
theorem sentenceProbability_error (p : I) (φ : Language.graph.Sentence)
    (d n : ℕ) (hφ : foRank φ ≤ d + 1) (hdn : d ≤ n) :
    |sentenceProbability p n φ - radoTruth φ| ≤ extensionError p d n := by
  sorry

/-- **The zero–one law.** For fixed `0 < p < 1`, the probability that `G(n, p)` satisfies a sentence
tends to its truth value in the Rado graph. -/
theorem firstOrder_zero_one (p : I) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) (φ : Language.graph.Sentence) :
    Tendsto (fun n => sentenceProbability p n φ) atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- **Finite models.** A sentence true in the Rado graph has a finite simple-graph model of every
sufficiently large size. The size bound is needed: `∀x∃y Adj(x, y)` holds in the Rado graph and in
`Kₙ` for `n ≥ 2`, but not in `K₁`. -/
theorem eventually_exists_finite_model (φ : Language.graph.Sentence)
    (hφ : Satisfies TauCeti.radoGraph φ) :
    ∀ᶠ n in atTop, ∃ G : SimpleGraph (Fin n), Satisfies G φ := by
  sorry

/-- **Bounded-rank varying parameters.** For `d ≥ 1`, if `(n - d) δ_n^d - d log(n + 2) → ∞` with
`δ_n = min(p_n, 1 - p_n)`, then for every sentence of rank at most `d + 1` the probability under
`G(n, p_n)` tends to its Rado truth value. This hypothesis alone gives no summability of the failure
probabilities. -/
theorem firstOrder_limit_varying_bounded_rank
    (p : ℕ → I) (d : ℕ) (hd : 1 ≤ d)
    (hgrowth : Tendsto
      (fun n : ℕ =>
        ((n : ℝ) - d) * (min (p n : ℝ) (1 - (p n : ℝ))) ^ d -
          (d : ℝ) * Real.log ((n : ℝ) + 2)) atTop atTop)
    (φ : Language.graph.Sentence) (hφ : foRank φ ≤ d + 1) :
    Tendsto (fun n => sentenceProbability (p n) n φ) atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- **All-rank varying parameters.** If `n^a min(p_n, 1 - p_n) → ∞` for every `a > 0`, then for
every sentence the probability under `G(n, p_n)` tends to its Rado truth value. The parameters need
not converge. -/
theorem firstOrder_limit_varying (p : ℕ → I)
    (hp : ∀ a : ℝ, 0 < a →
      Tendsto (fun n : ℕ => (n : ℝ) ^ a * min (p n : ℝ) (1 - (p n : ℝ))) atTop atTop)
    (φ : Language.graph.Sentence) :
    Tendsto (fun n => sentenceProbability (p n) n φ) atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- **Joint stabilization.** Let `X n` be random graphs on one probability space with the laws
`G(n, p)`, `0 < p < 1`, with no assumption on their joint law. Almost surely, for every rank bound
`d`, eventually every sentence of rank at most `d + 1` has the same truth value in `X n` as in the
Rado graph. -/
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

/-- **Joint stabilization for varying parameters.** The conclusion of
`ae_eventually_all_bounded_rank` holds for random graphs with the laws `G(n, p_n)` when
`n^a min(p_n, 1 - p_n) → ∞` for every `a > 0`. -/
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

/-! ## Rooted formulas (Layer 8)

Fin (m + n) makes the first m named vertices available at every index.
The full conditioned law and finite-pattern-mixture API are specified in the README.
-/

/-- The first `m` vertices of `Fin (m + n)`, as an embedding of `Fin m`. -/
def firstVertices (m n : ℕ) : Fin m ↪ Fin (m + n) :=
  Fin.castAddEmb n

/-- The graphs on `Fin (m + n)` that induce the prescribed graph `H` on the first `m` vertices. -/
def rootEvent {m n : ℕ} (H : SimpleGraph (Fin m)) :
    Set (SimpleGraph (Fin (m + n))) :=
  {G | G.comap (firstVertices m n) = H}

/-- The conditional probability, under `G(m + n, p)` and given that the first `m` vertices induce
`H`, that the formula `φ` holds at the first `m` vertices. -/
noncomputable def rootedProbability {m : ℕ} (p : I) (n : ℕ)
    (H : SimpleGraph (Fin m)) (φ : Language.graph.Formula (Fin m)) : ℝ :=
  let μ := SimpleGraph.binomialRandom (Fin (m + n)) p
  (μ {G | G ∈ rootEvent H ∧ SatisfiesFormula G φ (firstVertices m n)}).toReal /
    (μ (rootEvent H)).toReal

/-- For `0 < p < 1`, the event that the first `m` vertices induce a prescribed graph has positive
probability. -/
theorem rootEvent_pos {m : ℕ} (p : I)
    (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1)
    (n : ℕ) (H : SimpleGraph (Fin m)) :
    0 < (SimpleGraph.binomialRandom (Fin (m + n)) p (rootEvent H)).toReal := by
  sorry

/-- The truth value of a formula at a tuple of the Rado graph, as `1` or `0`. -/
noncomputable def rootedTruth {m : ℕ} (φ : Language.graph.Formula (Fin m))
    (a : Fin m → ℕ) : ℝ := by
  classical
  exact if SatisfiesFormula TauCeti.radoGraph φ a then 1 else 0

/-- **Rooted limit.** For `0 < p < 1`, conditioned on the first `m` vertices inducing `H`, the
probability that `φ` holds at them tends to the truth of `φ` at any induced copy of `H` in the Rado
graph. -/
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

/-! ## Graph properties (Layer 8.2) -/

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

/-! ## Infinite laws and existing graphon samplers (Layer 9) -/

open TauCeti.DenseGraphLimits

/-- For `0 < p < 1`, the binomial random graph on `ℕ` is almost surely isomorphic to the Rado
graph. -/
theorem ae_isomorphic_rado (p : I) (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) :
    ∀ᵐ G ∂SimpleGraph.binomialRandom ℕ p, Nonempty (G ≃g TauCeti.radoGraph) := by
  sorry

section Graphons

variable {Ω : Type w} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]

/-- The infinite sample of the constant graphon with value `p` is the binomial random graph
`G(ℕ, p)`. -/
theorem infiniteSampleLaw_const (p : I) :
    infiniteSampleLaw (Graphon.const μ p) = SimpleGraph.binomialRandom ℕ p := by
  sorry

/-- If `0 < K < 1` almost everywhere for the product measure, the infinite sample of the graphon `K`
is almost surely isomorphic to the Rado graph. -/
theorem infiniteSampleLaw_ae_rado (K : Graphon Ω μ)
    (hK : ∀ᵐ z ∂μ.prod μ, 0 < K z.1 z.2 ∧ K z.1 z.2 < 1) :
    ∀ᵐ G ∂infiniteSampleLaw K, Nonempty (G ≃g TauCeti.radoGraph) := by
  sorry

/-- If `ε ≤ K ≤ 1 - ε` almost everywhere, with `0 < ε ≤ 1/2`, then for `d ≤ n` the probability that
the finite sample of size `n` fails bounded extension at budget `d` is at most
`Σ_{t ≤ d} C(n, t) 2^t (1 - ε^t)^(n - t)`. -/
theorem graphon_extension_failure_le (K : Graphon Ω μ)
    (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1 / 2)
    (hK : ∀ᵐ z ∂μ.prod μ, ε ≤ K z.1 z.2 ∧ K z.1 z.2 ≤ 1 - ε)
    (d n : ℕ) (hdn : d ≤ n) :
    (sampleGraph K n {G | ¬ HasExtensionUpTo G d}).toReal ≤
      ∑ t ∈ Finset.range (d + 1),
        (Nat.choose n t : ℝ) * 2 ^ t * (1 - ε ^ t) ^ (n - t) := by
  sorry

/-- **Zero–one law for uniformly nondegenerate graphons.** If `ε ≤ K ≤ 1 - ε` almost everywhere,
with `0 < ε ≤ 1/2`, then the probability that the finite sample of size `n` satisfies a sentence
tends to its Rado truth value. -/
theorem graphon_firstOrder_limit (K : Graphon Ω μ)
    (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1 / 2)
    (hK : ∀ᵐ z ∂μ.prod μ, ε ≤ K z.1 z.2 ∧ K z.1 z.2 ≤ 1 - ε)
    (φ : Language.graph.Sentence) :
    Tendsto (fun n => (sampleGraph K n {G | Satisfies G φ}).toReal)
      atTop (𝓝 (radoTruth φ)) := by
  sorry

/-- **Joint stabilization for uniformly nondegenerate graphons.** If `ε ≤ K ≤ 1 - ε` almost
everywhere, with `0 < ε ≤ 1/2`, and `X n` are random graphs on one probability space with the finite
sample laws `sampleGraph K n`, with no assumption on their joint law, then almost surely, for every
rank bound `d`, eventually every sentence of rank at most `d + 1` has the same truth value in
`X n` as in the Rado graph. -/
theorem graphon_ae_eventually_all_bounded_rank (K : Graphon Ω μ)
    (ε : ℝ) (hε0 : 0 < ε) (hε1 : ε ≤ 1 / 2)
    (hK : ∀ᵐ z ∂μ.prod μ, ε ≤ K z.1 z.2 ∧ K z.1 z.2 ≤ 1 - ε)
    {Ξ : Type w'} [MeasurableSpace Ξ] (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (X : ∀ n : ℕ, Ξ → SimpleGraph (Fin n))
    (hX : ∀ n, Measurable (X n))
    (hlaw : ∀ n, ν.map (X n) = sampleGraph K n) :
    ∀ᵐ ξ ∂ν, ∀ d : ℕ, ∀ᶠ n : ℕ in atTop,
      ∀ φ : Language.graph.Sentence, foRank φ ≤ d + 1 →
        (Satisfies (X n ξ) φ ↔ Satisfies TauCeti.radoGraph φ) := by
  sorry

/-- For a fixed graphon, a measurable event invariant under the finitely supported permutations
of `ℕ` has probability `0` or `1`. -/
theorem infiniteSampleLaw_zero_one_of_invariant (K : Graphon Ω μ)
    (S : Set (SimpleGraph ℕ)) (hS : MeasurableSet S)
    (hinv : ∀ g ∈ Equiv.Perm.finitary ℕ, ∀ G : SimpleGraph ℕ, G.comap ⇑g ∈ S ↔ G ∈ S) :
    infiniteSampleLaw K S = 0 ∨ infiniteSampleLaw K S = 1 := by
  sorry

/-- Under the infinite sample law of a fixed graphon, every first-order sentence has probability `0`
or `1`. -/
theorem infiniteSampleLaw_sentence_zero_one (K : Graphon Ω μ)
    (φ : Language.graph.Sentence) :
    infiniteSampleLaw K {G | Satisfies G φ} = 0 ∨
      infiniteSampleLaw K {G | Satisfies G φ} = 1 := by
  sorry

end Graphons

/-- The edge density `2 |E(G ↾ n)| / (n (n - 1))` of the first `n` vertices, which is `0` at
`n = 0, 1` (real division by zero). -/
noncomputable def windowEdgeDensity (G : SimpleGraph ℕ) (n : ℕ) : ℝ :=
  2 * ((G.restrictFin n).edgeSet.ncard : ℝ) / ((n * (n - 1) : ℕ) : ℝ)

/-- For every `p ∈ [0, 1]`, the initial-window edge densities of `G(ℕ, p)` converge to `p` almost
surely. -/
theorem ae_windowEdgeDensity (p : I) :
    ∀ᵐ G ∂SimpleGraph.binomialRandom ℕ p,
      Tendsto (windowEdgeDensity G) atTop (𝓝 (p : ℝ)) := by
  sorry

/-- **Mutual singularity.** For `p ≠ q` the labeled laws `G(ℕ, p)` and `G(ℕ, q)` are mutually
singular, in Mathlib's `MeasureTheory.Measure.MutuallySingular`, although for `p, q ∈ (0, 1)` both
are concentrated on the Rado isomorphism class. The witness is the edge-density separator
`{G | windowEdgeDensity G → p}`: it is measurable, has `G(ℕ, p)`-probability one by
`ae_windowEdgeDensity` at `p` and `G(ℕ, q)`-probability zero by the same theorem at `q`. It is
invariant under finitely supported permutations but is not an isomorphism-invariant event. -/
theorem binomialRandom_mutuallySingular (p q : I) (hpq : p ≠ q) :
    SimpleGraph.binomialRandom ℕ p ⟂ₘ SimpleGraph.binomialRandom ℕ q := by
  sorry

/-! ## Infinitary distinctions (Layer 10)

The sentences are Tau Ceti's `L_{ω₁,ω}` sentences `Language.graph.Sentenceω`, with first-order
conjuncts and disjuncts embedded by `BoundedFormula.toInf`. -/

/-- A simple graph satisfies an `L_{ω₁,ω}` graph sentence when its structure `G.structure` realizes
it. -/
def SatisfiesInf (G : SimpleGraph V) (φ : Language.graph.Sentenceω) : Prop :=
  letI : Language.graph.Structure V := G.structure
  SentenceInf.Realize φ V

/-- `Θ_R`, the countable conjunction of all extension axioms `E_{r,s}`. -/
noncomputable def radoSentenceInf : Language.graph.Sentenceω :=
  BoundedFormulaInf.iInf fun k => (extensionSentence k.unpair.1 k.unpair.2).toInf

/-- A graph satisfies `Θ_R` exactly when it has the full extension property. -/
theorem satisfiesInf_radoSentenceInf_iff (G : SimpleGraph V) :
    SatisfiesInf G radoSentenceInf ↔ G.HasExtensionProperty := by
  sorry

/-- For `0 < p < 1`, the binomial random graph on `ℕ` satisfies `Θ_R` with probability `1`. -/
theorem binomialRandom_radoSentenceInf (p : I) (hp0 : 0 < (p : ℝ)) (hp1 : (p : ℝ) < 1) :
    SimpleGraph.binomialRandom ℕ p {G | SatisfiesInf G radoSentenceInf} = 1 := by
  sorry

/-- On a finite carrier, for every `p`, the binomial random graph satisfies `Θ_R` with probability
`0`. -/
theorem binomialRandom_radoSentenceInf_of_finite [Finite V] (p : I) :
    SimpleGraph.binomialRandom V p {G | SatisfiesInf G radoSentenceInf} = 0 := by
  sorry

/-- `CardEq m`: the carrier has exactly `m` elements. -/
def cardEq (m : ℕ) : Language.graph.Sentence :=
  Sentence.cardGe Language.graph m ⊓ (Sentence.cardGe Language.graph (m + 1)).not

/-- `Θ_even`, the countable disjunction of `CardEq (2 m)`. -/
def evenSentenceInf : Language.graph.Sentenceω :=
  BoundedFormulaInf.iSup fun m => (cardEq (2 * m)).toInf

/-- On `Fin n`, for every `p`, the probability of `Θ_even` is `1` when `n` is even and `0` when `n`
is odd. -/
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

/-! ## Concrete FO formulas and Poisson endpoints (Layers 8, 11) -/

/-- The sentence `∃ x y z, Adj(x, y) ∧ Adj(x, z) ∧ Adj(y, z)`: the graph contains a triangle. -/
def triangleSentence : Language.graph.Sentence :=
  let e01 : Language.graph.BoundedFormula Empty 3 :=
    .rel Language.adj ![.var (Sum.inr 0), .var (Sum.inr 1)]
  let e02 : Language.graph.BoundedFormula Empty 3 :=
    .rel Language.adj ![.var (Sum.inr 0), .var (Sum.inr 2)]
  let e12 : Language.graph.BoundedFormula Empty 3 :=
    .rel Language.adj ![.var (Sum.inr 1), .var (Sum.inr 2)]
  (e01 ⊓ e02 ⊓ e12).ex.ex.ex

/-- The sentence `∀ x, ∃ y, Adj(x, y)`: no vertex is isolated. -/
def noIsolatedSentence : Language.graph.Sentence :=
  let edge : Language.graph.BoundedFormula Empty 2 :=
    .rel Language.adj ![.var (Sum.inr 0), .var (Sum.inr 1)]
  edge.ex.all

/-- The number of triangles of a finite graph, counted as three-element cliques. -/
noncomputable def triangleCount [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact (G.cliqueFinset 3).card

/-- The number of isolated vertices of a finite graph. -/
noncomputable def isolatedCount [Fintype V] (G : SimpleGraph V) : ℕ := by
  classical
  exact (Finset.univ.filter (fun x => ∀ y, ¬ G.Adj x y)).card

/-- A finite graph satisfies the triangle sentence exactly when its triangle count is positive. -/
theorem satisfies_triangleSentence [Fintype V] (G : SimpleGraph V) :
    Satisfies G triangleSentence ↔ 0 < triangleCount G := by
  sorry

/-- A finite graph has no isolated vertex in the sense of the sentence exactly when its
isolated-vertex count is `0`. -/
theorem satisfies_noIsolatedSentence [Fintype V] (G : SimpleGraph V) :
    Satisfies G noIsolatedSentence ↔ isolatedCount G = 0 := by
  sorry

/-- **Factorial-moment Poisson criterion.** For probability laws on `ℕ` with finite factorial
moments converging to `λ^k` for every `k`, every point mass converges to the corresponding
`Poisson(λ)` mass, including `λ = 0`. -/
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

/-- If `n p_n → c`, the `k`-th factorial moment of the triangle count of `G(n, p_n)` tends to
`(c³/6)^k`. -/
theorem triangle_factorialMoment_limit (p : ℕ → I) (c : ℝ≥0)
    (hp : Tendsto (fun n : ℕ => (n : ℝ) * (p n : ℝ)) atTop (𝓝 (c : ℝ)))
    (k : ℕ) :
    Tendsto
      (fun n => ∫ G : SimpleGraph (Fin n),
        ((triangleCount G).descFactorial k : ℝ)
          ∂SimpleGraph.binomialRandom (Fin n) (p n))
      atTop (𝓝 (((c : ℝ) ^ 3 / 6) ^ k)) := by
  sorry

/-- If `n p_n → c`, the triangle count of `G(n, p_n)` converges to `Poisson(c³/6)`: each point mass
converges. -/
theorem triangle_poisson_mass_limit (p : ℕ → I) (c : ℝ≥0)
    (hp : Tendsto (fun n : ℕ => (n : ℝ) * (p n : ℝ)) atTop (𝓝 (c : ℝ)))
    (j : ℕ) :
    Tendsto
      (fun n => (SimpleGraph.binomialRandom (Fin n) (p n)
        {G | triangleCount G = j}).toReal)
      atTop (𝓝 ((ProbabilityTheory.poissonMeasure (c ^ 3 / 6) {j}).toReal)) := by
  sorry

/-- If `n p_n → c`, the probability that `G(n, p_n)` contains a triangle tends to
`1 - exp(-c³/6)`. -/
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

/-- For the graphon `xy`, the `k`-th factorial moment of the number of isolated vertices of the
sample of size `n` tends to `2^k`. -/
theorem productGraphon_isolated_factorialMoment_limit (k : ℕ) :
    Tendsto
      (fun n => ∫ G : SimpleGraph (Fin n),
        ((isolatedCount G).descFactorial k : ℝ) ∂sampleGraph productGraphon n)
      atTop (𝓝 ((2 : ℝ) ^ k)) := by
  sorry

/-- For the graphon `xy`, the number of isolated vertices of the sample of size `n` converges to
`Poisson(2)`: each point mass converges. -/
theorem productGraphon_isolated_poisson_mass_limit (j : ℕ) :
    Tendsto
      (fun n => (sampleGraph productGraphon n {G | isolatedCount G = j}).toReal)
      atTop (𝓝 ((ProbabilityTheory.poissonMeasure 2 {j}).toReal)) := by
  sorry

/-- For the graphon `xy`, the probability that the sample of size `n` has no isolated vertex tends
to `e^(-2)`. -/
theorem productGraphon_noIsolated_limit :
    Tendsto
      (fun n => (sampleGraph productGraphon n
        {G | Satisfies G noIsolatedSentence}).toReal)
      atTop (𝓝 (Real.exp (-2))) := by
  sorry

/-- The infinite sample of the graphon `xy` is almost surely isomorphic to the Rado graph. -/
theorem productGraphon_ae_isomorphic_rado :
    ∀ᵐ G ∂infiniteSampleLaw productGraphon, Nonempty (G ≃g TauCeti.radoGraph) := by
  sorry

end TauCetiRoadmap.RandomGraphs

end
