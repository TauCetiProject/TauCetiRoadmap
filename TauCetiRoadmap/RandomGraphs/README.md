# Roadmap: random graphs, Fraïssé limits, and first-order asymptotic laws

**Summary.** Develop the classical Fraïssé construction and the probability/model-theory
interfaces that identify the first-order asymptotic theory of binomial random graphs with the
theory of the Rado graph. The development includes quantitative bounds, rooted formulas,
almost-sure stabilization on joint samples, and precise comparisons with graphon sampling and
sparse graphs.

The principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin
zero–one law. For every fixed `p ∈ (0, 1)` and every sentence `φ` in the first-order
language of simple graphs,

    lim_{n→∞} Pr(G(n, p) ⊨ φ) = 𝟙[R ⊨ φ],

where `R` is a constructed Rado graph and `𝟙[R ⊨ φ]` is `1` if `R ⊨ φ` and `0` otherwise. A
finite extension property gives a uniform error bound for all sentences of each fixed quantifier
rank. Its summability yields eventual
agreement with `R` almost surely under any joint realization of the prescribed finite laws.

The reusable material is part of the specification: representative families and their ages;
extension-rich chains and direct-limit factorization; rooted embeddings and isomorphisms;
finite edge patterns and witness counts; actual first-order extension sentences; finite-rank
truth preservation; and measurable satisfaction events.

## Scope and ownership

Every layer below is required, and the order of the layers is the dependency order: no layer uses
a later one. The scope includes general classical Fraïssé existence with function symbols,
graph-specific quantifier elimination and primeness, the fixed and varying-parameter binomial
models specified below, uniformly nondegenerate graphons, and the two explicit Poisson examples
in Layer 11.

This roadmap owns representative families and strong amalgamation, extension-rich chains, the
general Fraïssé existence theorem and its rooted consequences; bounded extension `EP_{≤d}`,
witness counts and the first-order extension sentences; the natural-valued quantifier rank and
its bridge to Tau Ceti's ordinal rank; the effective coding of first-order formulas for a general
language, and computable quantifier elimination and decidability for the Rado theory; and the
probabilistic theory of Layers 6–11, including the factorial-moment Poisson criterion. Its
suppliers are listed under [Exact supplier contracts](#exact-supplier-contracts), and what it
leaves to other roadmaps under [Out of scope](#out-of-scope).

## How to read the build

Each row is one layer: what it builds and what it consumes. Each layer ends with its worked
examples, which check that the API describes real structures and are discharged alongside it,
and with its dependencies.

| Layer | Builds | Consumes |
| --- | --- | --- |
| 0 | Native graph, language, finite-pattern and satisfaction interfaces | Mathlib graph/model-theory/measure APIs; Tau Ceti graph coding; CountableStructureSpaces Layer 0 |
| 1 | Representative families, ages and separate ordinary/strong amalgamation | Mathlib Fraïssé predicates; 0 for graph examples |
| 2 | Extension-rich chains and general Fraïssé existence | 1; Mathlib direct limits |
| 3 | Rooted universality and uniqueness; finite, empty and rational-order examples | 1–2; Mathlib partial equivalences and order theory |
| 4 | Extension axioms, a concrete Rado graph and its Fraïssé identification | 0–3; Tau Ceti extension property and Rado graph |
| 5 | Finite rank, EF truth preservation, complete Rado theory, QE, the effective formula coding, decidability and graph-specific primeness | 0, 3, 4; Tau Ceti finite games, back-and-forth and atomic diagrams |
| 6 | Exact witness laws and quantitative extension-failure bounds | 0, 4; native Bernoulli/binomial probability |
| 7 | Finite FO limits, uniform rank bounds and joint almost-sure stabilization | 5–6; Borel–Cantelli |
| 8 | Rooted logical limits and worked asymptotic graph properties | 3–7; native connectivity/clique APIs |
| 9 | Infinite random graphs, graphon compatibility and invariant-event laws | 0, 4–7; DenseGraphLimits and Exchangeability |
| 10 | Actual infinitary comparison and nonconvergence examples | 4, 7, 9; InfinitaryLogic syntax |
| 11 | A reusable Poisson criterion; sparse triangles and a graphon FO counterexample | 0, 6, 9; finite counting, integration, native Poisson law |

## Conventions

1. **Graphs and maps.** Use `SimpleGraph V`, `G.comap f`, induced graph embeddings and graph
   isomorphisms. An embedding preserves and reflects adjacency. Ordinary graph homomorphisms
   do not serve as embeddings in ages or amalgamation squares.
2. **Probability.** Use `SimpleGraph.binomialRandom V p` with `p : unitInterval`.
   Probability-law identities on a general carrier assume it is countable. The finite
   carrier is `Fin n`, including `n = 0`; the infinite carrier is `ℕ`.
   Keep the full parameter interval for the law and elementary identities. Assume `0 < p < 1`
   precisely for the dense random-graph conclusions that need it.
3. **Logic.** Use `FirstOrder.Language.graph`, `SimpleGraph.structure`,
   `FirstOrder.Language.Theory.simpleGraph`, and Mathlib's actual bounded formulas,
   realization and theory predicates. No new graph language or independent semantics.
   Raw realization on an empty finite carrier remains meaningful. Invocations of a
   nonempty-model completeness API must supply nonemptiness.
4. **Fraïssé generality.** Finitely generated means `Structure.FG`, and may have an infinite
   carrier. The general existence theorem assumes countably many function symbols, not
   countably many relation symbols. The limit may be finite or empty. Keep its original
   carrier universe; transport an infinite countable limit to `ℕ` in a separate corollary.
   The rooted extension theorems use countable generation where sufficient.
5. **Extension budgets.** For disjoint finite vertex sets `U, V`, an extension witness is
   outside `U ∪ V`, adjacent to all of `U` and to none of `V`.
   Write `EP_{≤d}(G)` for the assertion that every such request with
   `|U| + |V| ≤ d` has a witness. The empty request is included, so
   `EP_{≤0}` means that the vertex carrier is nonempty.
   Write `EP(G)` for the property with no bound on the finite request.
6. **Rank.** First-order quantifier rank is natural-valued: atoms and falsum have rank `0`,
   implication takes the maximum, and a quantifier increases rank by `1`. Derived Boolean
   connectives have the corresponding maximum rule.
   `EP_{≤d}` suffices for agreement on sentences of rank at most `d + 1`.
7. **Two probability notions.** “Asymptotically almost surely” means a sequence of finite-law
   probabilities tends to `1`. An almost-sure assertion involving all sample sizes explicitly
   names a common probability space and random graphs on that space.
8. **Invariant events.** State invariance under finitely supported permutations when using
   the ergodic array API. First-order sentence satisfaction is invariant under all
   permutations. Natural-initial-window density events need only have the former invariance.

## Exact supplier contracts

The following are suppliers, not requests to rebuild their objects.

| Supplier | Consumed material |
| --- | --- |
| [Mathlib binomial graphs](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Probability/Combinatorics/BinomialRandomGraph/Defs.lean) | `binomialRandom`, its Bernoulli-product presentation, probability-measure instance, endpoint Dirac laws and `binomialRandom_singleton` |
| [Mathlib graph structures](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/ModelTheory/Graph.lean) | Canonical language, structure/theory adapters, and both graph/structure round trips |
| [Mathlib Fraïssé theory](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/ModelTheory/Fraisse.lean) | `age`, `Hereditary`, `JointEmbedding`, `Amalgamation`, `IsFraisse`, `IsFraisseLimit`, `age_directLimit` and uniqueness |
| [Mathlib partial equivalences](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/ModelTheory/PartialEquiv.lean) | `FGEquiv`, `IsExtensionPair`, `embedding_from_cg`, `equiv_between_cg` |
| [Mathlib complete types](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/ModelTheory/Types.lean) | `T.CompleteType`, `typeOf` and `typesWith` |
| [Mathlib type-space topology](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/ModelTheory/Topology/Types.lean) | The topology on `T.CompleteType α` generated by the sets `typesWith`, its basis, and the open, closed and clopen results for them, used for first-order isolation |
| [Mathlib order structures](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/ModelTheory/Order.lean) | Finite linear orders, DLO extension pairs, their Fraïssé identification and categoricity |
| [InfinitaryLogic, Layer 1](../../Completed/InfinitaryLogic/README.md) | Finite EF strategies, ordinal back-and-forth and selected-family potential isomorphism |
| [InfinitaryLogic, random-graph worked example](../../Completed/InfinitaryLogic/README.md) | The canonical full extension predicate `SimpleGraph.HasExtensionProperty` with `SimpleGraph.HasExtensionProperty.exists_adj_iff` (a witness outside a listed tuple realizing any adjacency pattern compatible with its repetitions); the Rado graph `TauCeti.radoGraph` with `TauCeti.hasExtensionProperty_radoGraph` (`Combinatorics/SimpleGraph/ExtensionProperty.lean`); the extension-pair bridge `SimpleGraph.HasExtensionProperty.isExtensionPair`, countable uniqueness `SimpleGraph.HasExtensionProperty.nonempty_iso`, the characterization `TauCeti.nonempty_iso_radoGraph_iff` of the countable graphs isomorphic to the Rado graph, and the infinitary characterization `SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`: for a countable graph with the extension property, its Scott sentence holds in a graph of any cardinality exactly when that graph has the extension property (`ModelTheory/Scott/RandomGraph.lean`); files at Tau Ceti `2fd255d99` |
| [Tau Ceti `ModelTheory/Scott/AtomicDiagram.lean`](https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/ModelTheory/Scott/AtomicDiagram.lean) at `2fd255d99` (the finite companion of the parent's infinitary `atomicDiagram`) | `TauCeti.AtomicIdx.toFormula : AtomicIdx L n → L.BoundedFormula Empty n`; for `[Finite (Σ k, L.Relations k)]`, `TauCeti.firstOrderAtomicDiagram (a : Fin n → M) : L.BoundedFormula Empty n`, the finite conjunction `BoundedFormula.iInf` over `AtomicIdx L n` of the tests true of `a` and the negations of those false of it (`firstOrderAtomicDiagram_def`); and, for relational `L`, `realize_firstOrderAtomicDiagram_iff_sameAtomicType : (firstOrderAtomicDiagram a).Realize v b ↔ SameAtomicType a b` for `b : Fin n → N` in any structure. The tuple occupies bound positions |
| [Tau Ceti `ModelTheory/RelationalConfiguration/ModelsOf.lean`](https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean) and [`Combinatorics/SimpleGraph/RelationalConfiguration.lean`](https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean) at `2fd255d99` | `TauCeti.RelationalConfiguration.measurableSet_setOf_realize`: on a countable carrier, the configurations realizing an infinitary formula with countable branching, at fixed free- and bound-variable assignments, form a measurable set; `RelationalConfiguration.toStructure_ofStructure`; the graph coding `SimpleGraph.toRelationalConfiguration` with `SimpleGraph.measurable_toRelationalConfiguration` and, on a countable carrier, `SimpleGraph.measurableEmbedding_toRelationalConfiguration`. They do not state that the coding decodes to `G.structure`; that identity is CountableStructureSpaces' target `toStructure_toRelationalConfiguration`, and the resulting fixed-assignment graph event is a target of 0.3 |
| CountableStructureSpaces, Layer 0 | `toStructure_toRelationalConfiguration`: the decoded structure of `G.toRelationalConfiguration` is `G.structure`. Consumed in 0.3 for the fixed-assignment graph events |
| [DenseGraphLimits, Layers 9a–c](../../Completed/DenseGraphLimits/README.md) | Finite and infinite graphon sampling, finite restrictions, exchangeable graph laws, dissociation, mixtures and sampling convergence |
| [Exchangeability, array layers](../../Completed/Exchangeability/README.md) | Generic array exchangeability, dissociation and ergodic/extreme-measure machinery |
| [GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md) | Vertex connectivity `SimpleGraph.IsVertexConnected` (Tau Ceti `Combinatorics/SimpleGraph/Connectivity/VertexConnectivity.lean`; `k : ℕ∞`, more than `k` vertices and connected after deleting fewer than `k`), deletion, separators and their graph interfaces |
| [StandardDistributions](../StandardDistributions/README.md) | Bernoulli/binomial/Poisson laws and their ordinary distribution API |

Individual implementation modules to reuse include
`TauCeti.Combinatorics.SimpleGraph.Measurable`,
`TauCeti.Combinatorics.DenseGraphLimits.Sampling.Finite`,
`Sampling.Consistency`, `Sampling.Infinite`, `Sampling.AlmostSure.Basic`,
and the `ExchangeableGraphLaw` array, infinite-law and mixture modules under that same
`DenseGraphLimits` prefix. In particular:

- `sampleGraph_const` identifies the constant graphon sampler with `binomialRandom`.
- `infiniteSampleLaw_map_restrictFin` supplies the actual joint-to-finite marginal identity.
- `tendsto_homDensityFin_infiniteSampleLaw_ae` supplies the sampling strong law.
- `graphonMixtureLawEquiv_law` and
  `InfiniteExchangeableGraphLaw.existsUnique_bind_infiniteSampleLawOnSpace`
  supply the measure-level mixture identity.

The common logical modules are
`TauCeti.ModelTheory.BackAndForth.Game.Finite`,
`TauCeti.ModelTheory.BackAndForth.Graph`,
`TauCeti.ModelTheory.BackAndForth.Equivalence`, and
`TauCeti.ModelTheory.Infinitary.QuantifierRank`.
Use `TauCeti.EFStrategy`, `TauCeti.BFEquiv`,
`SimpleGraph.sameAtomicType_iff` and `SimpleGraph.Iso.toLanguageEquiv`, and the finite-round
soundness of `TauCeti.EFStrategy.bfEquiv` with `TauCeti.BFEquiv.realize_iff_of_qrank_le`
(`TauCeti.ModelTheory.BackAndForth.Karp`).
Layer 5 adds the natural-valued first-order rank and its identification with the ordinal
rank of `BoundedFormula.toInf` to these shared APIs; it does not introduce another game,
back-and-forth relation or soundness theorem.

The full extension predicate and the Rado graph belong to the InfinitaryLogic worked example;
this roadmap consumes them and does not maintain a second extension predicate or Rado graph.
Its additions on that side are bounded extension `EP_{≤d}`, witness-count
interfaces, actual first-order extension sentences, the general Fraïssé construction with its
rooted consequences, the effective coding of first-order formulas for a general language,
computable quantifier elimination, and the probabilistic theory.

The following Mathlib proposals fix the shape of corresponding targets here. They are built in
Tau Ceti now, named and stated as these proposals do, and replaced by Mathlib's declarations
when equivalents land. The proposals place them under `FirstOrder.Language`; `Suggested.lean`
declares them with the proposals' statements, under the same paths relative to its namespace.

- The
  [graph-characterization proposal](https://github.com/leanprover-community/mathlib4/pull/20649):
  the graph-language extension property `Language.graph.ExtensionProperty`,
  `Language.graph.ExtensionProperty.embedding_from_countable`, and
  `Language.graph.ExtensionProperty.isFraisseLimit_finite_graphs`, identifying a countable structure
  with the property as the Fraïssé limit of finite simple graphs (Layer 4).
- The
  [quantifier-elimination proposal](https://github.com/leanprover-community/mathlib4/pull/41113):
  `Language.Theory.IsQFEquivalent` and `Language.Theory.HasQuantifierElimination`, with the
  reduction to finite variable types; its
  [extension-pair companion](https://github.com/leanprover-community/mathlib4/pull/41115) derives
  quantifier elimination from extension pairs (Layer 5).

Graph-specific adapters and probabilistic consequences belong here. Generic samplers,
representation theorems and general EF machinery retain their existing owners.
Each implementation consumes the narrow supplier it needs, not an entire supplier roadmap.

## Layer 0 — Native graph and logical probability interfaces

*Needs:* Mathlib `SimpleGraph.binomialRandom` with its Bernoulli-product presentation, the graph
language and structure adapters, bounded formulas and realization; Tau Ceti
`SimpleGraph.Iso.toLanguageEquiv`, the measurable structure of
`TauCeti.Combinatorics.SimpleGraph.Measurable`,
`TauCeti.RelationalConfiguration.measurableSet_setOf_realize`,
`SimpleGraph.toRelationalConfiguration` with `SimpleGraph.measurable_toRelationalConfiguration` and
`SimpleGraph.measurableEmbedding_toRelationalConfiguration`, and `BoundedFormula.realize_toInf`;
CountableStructureSpaces Layer 0 (`toStructure_toRelationalConfiguration`).

### 0.1 Graph/language transport

Complete the correspondence between induced graph embeddings and embeddings of the canonical
graph-language structures, and between graph isomorphisms and language equivalences. Include
application, identity, composition, inverse, restriction and round-trip lemmas. Relate finite
induced subgraphs to finitely generated substructures in the relational graph language.

Expose the equality-and-adjacency description of the atomic type of a tuple, including
repeated coordinates. Establish formula and sentence realization invariance under these maps,
using Mathlib's realization transport. An embedding preserves quantifier-free formulas;
preservation of arbitrary formulas needs the later Rado/QE hypotheses.

### 0.2 Finite patterns and restriction laws

For disjoint finite sets `A, B` of unordered, non-diagonal vertex pairs, prove

    Pr(A ⊆ E(G), B ∩ E(G) = ∅) = p^|A| (1 - p)^|B|.

Give its edge-coordinate independence formulation, including groups of coordinates on disjoint sets
of pairs. Prove that restriction along an injective map has the smaller native binomial law
(`binomialRandom_map_comap`, for countable carriers). Include relabeling, complement (`p ↦ 1 - p`),
disjoint induced restrictions, and exact probabilities of any prescribed finite induced graph. Empty
patterns, zero or one vertex, and `p = 0, 1` are required examples.

Use the native Bernoulli-product and finite-graph point-mass results to prove these laws.
Do not introduce a second random-graph measure.

### 0.3 Satisfaction as an event

Give the countable vertex carrier its discrete measurable structure and the finite
assignment spaces their product measurable structures.

Tau Ceti supplies the configuration events and the graph coding but does not state their link:
that the decoded structure of `G.toRelationalConfiguration` is `G.structure`. That identity,
`toStructure_toRelationalConfiguration`, is a target of the CountableStructureSpaces roadmap
(its Layer 0), which owns it; this roadmap consumes it. From it, prove the
fixed-assignment graph event (`measurableSet_setOf_realize_graph`). For a countable carrier `V`, a
graph formula `φ` and fixed free- and bound-variable assignments, the set of graphs `G` whose
structure `G.structure` realizes `φ` there is the preimage, under the measurable map
`SimpleGraph.toRelationalConfiguration` (`SimpleGraph.measurable_toRelationalConfiguration`; a
measurable embedding by `SimpleGraph.measurableEmbedding_toRelationalConfiguration`), of the
configuration event of `BoundedFormula.toInf φ`. That event is measurable by
`TauCeti.RelationalConfiguration.measurableSet_setOf_realize`, which covers every infinitary
formula with countable branching, and `BoundedFormula.realize_toInf` with
`toStructure_toRelationalConfiguration` identifies the two realizations. The sentence events used
by the satisfaction probabilities below are the case of empty assignments. On `ℕ`, the event of
`∃x∃y Adj(x,y)` is the countable union over pairs `u ≠ v` of the cylinders `{G | G.Adj u v}`.

The further target here is joint measurability. For a fixed graph formula with finitely many free
variables, prove that realization is measurable on the product of the graph space with the
free- and bound-variable assignment spaces (`measurableSet_realize_jointly`). From the
fixed-assignment events this is a countable union over the assignments, each term a measurable
rectangle with a singleton; it needs measurable singletons in the product structure on the
assignment spaces, and countability of the carrier alone is not a substitute for that
structure. Prove invariance of the events under graph isomorphism and relabeling.

Define the finite satisfaction probability directly by evaluating
`binomialRandom (Fin n) p` on the native realization event. Expose real and `ℝ≥0∞`
forms, bounds in `[0, 1]`, negation/complement, finite Boolean combinations, and restriction
transport of the law. Distinguish these event identities from any unsupported claim that
satisfaction itself commutes with restriction.

**Checks** (`Satisfies`).

- `∃x∃y Adj(x, y)` holds in `K₂` and fails in the edgeless graph on `Fin 2`.
- `∀x ⊥` holds on `Fin 0`, where raw realization is still meaningful, and fails in `K₁`.
- `∃x Adj(x, x)` fails in every simple graph, `K₁` and `K₂` included.

**Checks** (`SatisfiesFormula`).

- `Adj(x₀, x₁)` holds in `K₂` at `(0, 1)` and fails at `(0, 0)`, since simple graphs are loopless.
- `x₀ = x₁` holds at `(0, 0)` and fails at `(0, 1)`.
- `∃y Adj(x₀, y)` holds at the vertex `0` of `K₂` and fails at the vertex of `K₁`.

**Checks** (`sentenceProbability`).

- For `∃x∃y Adj(x, y)` the values at `n = 0, 1, 2` are `0, 0, p`.
- At `n = 2` the endpoints `p = 0` and `p = 1` give `0` and `1` for the same sentence.
- For `∀x ⊥` the value is `1` at `n = 0` and `0` for every `n ≥ 1`, whatever `p` is.

API: `Satisfies` and `SatisfiesFormula` unfold to Mathlib's realization under `G.structure`,
commute with the Boolean connectives, and are invariant under graph isomorphism through
`SimpleGraph.Iso.toLanguageEquiv` and Mathlib's realization transport; `sentenceProbability`
carries the real and `ℝ≥0∞` forms, bounds, complement and restriction laws listed above.

### Examples

- The vertex swap of `K₂` is an automorphism, and realization transport along it gives each
  sentence the same truth value on both sides.
- For two specified pairs, one required present and one required absent, the pattern probability
  is `p (1 - p)`, which is `1/4` at `p = 1/2`; the empty pattern has probability `1`, and at
  `p = 0` and `p = 1` the pattern has probability `0`.
- Restricting `G(Fin 3, p)` along an injection `Fin 2 ↪ Fin 3` gives `G(Fin 2, p)`: the edge of
  `Fin 2` has probability `p` on both sides.

### Dependencies

Mathlib's binomial random graphs, graph language and bounded-formula realization; Tau Ceti's graph
coding, configuration events and `SimpleGraph.Iso.toLanguageEquiv`; CountableStructureSpaces
Layer 0 for `toStructure_toRelationalConfiguration`. These interfaces supply the extension-axiom
probabilities of Layer 6 and the graphon mixture evaluations of Layer 9, and the graph-language
adapters identify the age of the Rado graph in Layer 4.

## Layer 1 — Representative families and amalgamation

*Needs:* Mathlib `age`, `Hereditary`, `JointEmbedding`, `Amalgamation`, `IsFraisse` and the
quotient-by-isomorphism convention; Layer 0 for the finite-graph free amalgam.

For a family `F_i` of actual finitely generated structures, define its isomorphism closure
`{A : ∃ i, A ≅ F_i}`. Prove membership, reindexing, duplicate-representative
invariance, equivalence transport and the equivalence between representative-family and
isomorphism-closed-class formulations of HP, JEP and AP.

Provide countable representative families for essentially countable nonempty classes using
Mathlib's quotient-by-isomorphism convention. Conversely, a countable family gives an
essentially countable isomorphism closure. Do not require a decision procedure for
isomorphism or a canonical representative.

Build factorization APIs for a finite tuple, a finitely generated substructure and an
embedding from a finitely generated structure into a structure whose age is covered by
the family. Return actual embeddings and the equations that recover the original tuple
or map after composition.

Ordinary AP remains Mathlib's `Amalgamation`. Introduce strong AP separately: in addition
to the commuting square, the two target images intersect exactly in the common-root image.
Prove strong AP implies AP, is invariant under representative changes, and holds for
finite graphs and finite linear orders.

For finite graphs construct the free amalgam explicitly: identify the common induced root
and introduce no edges between the two new parts. Prove the native embedding, intersection
and edge-description facts. For finite linear orders give a strong amalgam respecting both
orders; the order chosen between new points is construction data.

**Checks** (isomorphism closure).

- The closure of the empty family is empty.
- The closure of the family consisting of two copies of `K₁` is the class of one-vertex
  graph-language structures whose vertex is not adjacent to itself, the same as for the family with
  one copy: duplicate representatives change nothing.
- `K₂` is not in that closure, since it has two vertices.

**Checks** (strong AP).

- Finite graphs: two edges sharing a root vertex amalgamate freely in three vertices, and the two
  images meet exactly in the root.
- Finite linear orders: the extensions `a < b` and `a < c` of the root `a` amalgamate as
  `a < b < c`, with `b ≠ c`.
- Finite sets of size at most `1`, in the empty language, have AP but not strong AP: the two
  one-element extensions of the empty root would need two distinct new points.

### Examples

Finite sets of size at most `m` have ordinary AP.
For `m ≥ 1` they need not have strong AP: two `m`-element extensions of a common
`(m - 1)`-element root cannot have disjoint new images in an `m`-element amalgam.
This example pins the distinction; the class at `m = 0` consists of empty structures.

### Dependencies

Mathlib's `age`, `Hereditary`, `JointEmbedding`, `Amalgamation` and `IsFraisse`; Layer 0 for the
finite-graph free amalgam. Layers 2–4 use the representative families and factorization.

## Layer 2 — Extension-rich chains and Fraïssé existence

*Needs:* Layer 1; Mathlib direct limits, `DirectLimit.exists_fg_substructure_in_Sigma`,
`age_directLimit` and `IsFraisseLimit` with its uniqueness.

### 2.1 Chains, factorization and extension requests

Use sequences of embeddings and Mathlib's direct limits. Supply transition, canonical-map,
composition and range lemmas. That every finitely generated substructure of the direct limit lies in
a stage image is Mathlib's `FirstOrder.Language.DirectLimit.exists_fg_substructure_in_Sigma`; use it
rather than restating it. Prove that an embedding from a finitely generated structure factors
through a stage with the literal equation

    ι_i ∘ g = e.

Identify the age of the direct limit with the union of the stage ages, reusing
`age_directLimit`. Derive countability from countable stages.

An extension request consists of a stage `D_i`, a finitely generated target `B` in the
representative class, and an embedding `f : D_i ↪ B`. A sequence serves the
request when some `j ≥ i` admits `g : B ↪ D_j` with

    g ∘ f = d_{i,j}.

Expose this extension property and representative coverage as mathematical properties
of the sequence. Prove the direct-limit finite-extension property, ultrahomogeneity and
exact age from them. The public API must also serve requests over a finitely generated
substructure of a stage, by factorization and amalgamation.

### 2.2 Construction

For a countable nonempty family of countable finitely generated representatives satisfying
the representative versions of HP, JEP and AP, construct such a sequence. The argument
enumerates outgoing embeddings and schedules requests so that each is eventually served;
joint embedding supplies representative coverage without losing the commuting square.
Prove the required countability of embedding sets from finite generation and the
countability of the target carrier. No relation-symbol countability is used here.

Give a theorem over the representative family and the general theorem over Mathlib's
native `IsFraisse` (`exists_isFraisseLimit_of_isFraisse`):

```lean
theorem exists_isFraisseLimit_of_isFraisse
    [Countable (Σ n, L.Functions n)]
    (K : Set (Bundled.{w} L.Structure))
    [IsFraisse K] :
    ∃ (M : Bundled.{w} L.Structure) (_ : Countable M),
      IsFraisseLimit K M
```

Hodges (*Model Theory*, §7.1) proves Fraïssé's theorem (Theorem 7.1.2, p. 326) for a countable
signature and a nonempty, at most countable set of finitely generated structures with HP, JEP and
AP, building the limit as the union of a chain (Lemma 7.1.6 with condition (1.8), pp. 328–329);
Theorem 7.1.7 (p. 329) is the converse. The theorem here assumes only countably many function
symbols, proceeds through representative families, and keeps the original carrier universe.

Combine this with existing necessity and uniqueness. Supply infinitude when the class
contains arbitrarily large finite subsets of its members, and the resulting transport
of an infinite countable limit to `ℕ`. The existence theorem itself adds neither
`Infinite M` nor `Nonempty M`.

### Examples

- In the language of successor and predecessor, the structure on `ℤ` is generated by `{0}` and
  has an infinite carrier. Verify this and use it as a root/factorization example.
- The finite-set examples from Layer 1 verify finite and empty limits without encoding them into
  an infinite carrier: in the empty language the classes of sets of size at most `0` and at most
  `2` have limits with `0` and `2` elements.
- The chain `Fin 0 ⊂ Fin 1 ⊂ Fin 2 ⊂ ⋯` of finite sets has direct limit `ℕ`, and the embedding of
  a two-element set onto `{0, 1}` factors through stage `2`.

### Dependencies

Layer 1; Mathlib's direct limits, `DirectLimit.exists_fg_substructure_in_Sigma`, `age_directLimit`
and the uniqueness of Fraïssé limits. Layers 3 and 4 use the existence theorem.

## Layer 3 — Rooted extension, universality and comparison

*Needs:* Layers 1–2; Mathlib `IsExtensionPair`, `embedding_from_cg`, `equiv_between_cg`, and
for the examples `isFraisse_finite_linear_order` and `isFraisseLimit_of_countable_nonempty_dlo`.

Given a finitely generated root `A` and actual embeddings
`a_M : A ↪ M`, `a_N : A ↪ N`, prove the rooted forms of
Mathlib's countably-generated back-and-forth construction.

- If `M` is countably generated and `M, N` form an `IsExtensionPair`, produce
  `e : M ↪ N` with `e ∘ a_M = a_N` (`exists_embedding_comp_eq_of_isExtensionPair`).
- With countable generation of `N` and the reverse extension property, produce an
  isomorphism with the same equation (`exists_equiv_comp_eq_of_isExtensionPair`).

The supplied root is the initial partial isomorphism. Keep it in the conclusion; do not
replace it by the unrooted assertion that some isomorphism exists. Do not assume an empty
partial isomorphism exists in languages with incompatible constants or nullary facts.

Hodges's Lemmas 7.1.3–7.1.4 (pp. 326–327) extend a prescribed embedding of a finitely generated
substructure to an embedding, or to an isomorphism, for structures that are at most countable and
weakly homogeneous. The hypothesis here is Mathlib's `IsExtensionPair`, and the rooted embedding
allows a target of any cardinality.

Derive extension-pair criteria from age inclusion and extension of representative
embeddings. Export rooted universality for every countably generated source whose age
is contained in the class. Its target need not be countable. Derive rooted uniqueness of
two Fraïssé limits, and finite-tuple versions with exact evaluation equations.

The selected-family rooted strengthening of `PotentialIso` is a separate extension of
the InfinitaryLogic API. These Fraïssé targets use the stated `IsExtensionPair`
theorems and do not assume that strengthening as an unstated supplier.

### Examples

1. Recover the `Fin m` limits and extend prescribed injections/bijections over finite roots.
   With root `A = M` finite and `a_M` the identity, the equation forces `e = a_N`.
2. Instantiate the new representative and rooted APIs for finite linear orders and
   `(ℚ, <)`. Compare with Mathlib's existing
   `isFraisse_finite_linear_order` and `isFraisseLimit_of_countable_nonempty_dlo`. In `(ℚ, <)`
   the root `0 ↦ 0`, `1 ↦ 2` extends to the order isomorphism `x ↦ 2x`.
3. Use an arbitrary finite induced graph as a prescribed root in the Rado applications
   of Layers 4, 5 and 8.

### Dependencies

Layers 1–2; Mathlib's `IsExtensionPair`, `embedding_from_cg` and `equiv_between_cg`, and for the
examples `isFraisse_finite_linear_order` and `isFraisseLimit_of_countable_nonempty_dlo`. Layers 4, 5
and 8 use rooted universality.

## Layer 4 — Graph extension axioms and the Rado graph

### 4.1 Combinatorial and syntactic extension

*Needs:* Layer 0; Tau Ceti `SimpleGraph.HasExtensionProperty`,
`SimpleGraph.HasExtensionProperty.exists_adj_iff` and `SimpleGraph.Iso.toLanguageEquiv`.

Define the witness predicate and `EP_{≤d}` by their actual finite-set conditions. Full extension
`EP` is the canonical `SimpleGraph.HasExtensionProperty`. That predicate omits the condition that
the witness lies outside `U`, which adjacency to every vertex of `U` already forces in a loopless
graph; prove `EP ↔ ∀ d, EP_{≤d}` against it (`hasExtensionProperty_iff`). Give monotonicity in the
bound, isomorphism and complement transport, restriction of requests, and avoidance of an additional
prescribed finite set. The supplier's `SimpleGraph.HasExtensionProperty.exists_adj_iff`
(`Combinatorics/SimpleGraph/ExtensionProperty.lean`) gives one witness outside a listed tuple. Prove
that full extension supplies arbitrarily many distinct witnesses for every request, and conclude
`HasExtensionProperty.infinite`: the carrier is infinite.

Prove the adapter between the graph-facing and graph-language forms: under `SimpleGraph.structure`,
`G.HasExtensionProperty` holds exactly when the graph-language extension property holds, stated as
`Language.graph.ExtensionProperty` in the graph-characterization proposal (a witness outside `A ∪ B`
related by the adjacency symbol to all of `A` and none of `B`). Give the converse of Tau Ceti's
`SimpleGraph.Iso.toLanguageEquiv`, turning an equivalence of the structures `G.structure` and
`H.structure` into a graph isomorphism `G ≃g H` with the same underlying bijection, with both round
trips, and transport both forms of the extension property across it.

**Checks** (the converse of `SimpleGraph.Iso.toLanguageEquiv`).

- On `K₂`, the identity equivalence of structures gives the identity isomorphism, and the
  equivalence swapping the two vertices gives the swap automorphism.
- Applied to `SimpleGraph.Iso.toLanguageEquiv e`, it returns `e`: the underlying bijections agree.
- Between `K₂` and the edgeless graph on `Fin 2` there is no structure equivalence, matching the
  absence of a graph isomorphism: adjacency of `0` and `1` holds on one side only.

Construct an actual first-order sentence `E_{r,s}` asserting extension for every injectively listed
`(r + s)`-tuple, with the first `r` entries positive and the last `s` negative. Prove its
realization equivalence with the finite-set condition, in both directions
(`satisfies_extensionSentence`). All coordinates are pairwise distinct in its antecedent; the
witness is distinct from all of them. Include `r = 0`, `s = 0`, and `r = s = 0`.

Construct the finite conjunction expressing `EP_{≤d}` and prove the
correspondence. Expose reordering and permutation of the positive and negative tuples.
No probabilistic theorem may take this semantic correspondence as an unproved parameter.

**Checks** (`IsExtensionWitness`).

- In `K₁`, the vertex `0` witnesses the empty request.
- In `K₁`, no vertex witnesses `U = {0}`, `Z = ∅`: the only vertex lies in `U`.
- In `K₂`, the vertex `1` witnesses `U = {0}`, `Z = ∅`, and no vertex witnesses `U = ∅`,
  `Z = {0}`: the vertex `1` is adjacent to `0`, and `0` lies in `Z`.

**Checks** (`HasExtensionUpTo`).

- On `Fin 0`, budget `0` fails: the empty request has no witness.
- On `K₁`, budget `0` holds and budget `1` fails, since the request with one positive vertex has
  no neighbour to use.
- On the 4-cycle, budget `1` holds and budget `2` fails: two adjacent vertices have no common
  neighbour.

**Checks** (`extensionSentence`).

- On `K₁`, `E_{0,0}` holds while `E_{1,0}` and `E_{0,1}` fail; `E_{0,1}` fails only because the
  witness must differ from the listed vertex.
- On `Fin 0`, `E_{0,0}` fails, as budget `0` does.
- On the 4-cycle, `E_{1,0}` and `E_{0,1}` hold and `E_{2,0}` fails.

**Checks** (`Language.graph.ExtensionProperty`).

- `K₁` fails it: the request `A = {0}`, `B = ∅` has no witness outside `A`.
- In the Rado graph the request `A = {0}`, `B = {1}` has the witness `5`: bit `0` of `5` is `1`
  and bit `1` of `5` is `0`.
- A structure with empty carrier fails it, at the empty request.

API: monotonicity of `HasExtensionUpTo` in the budget, isomorphism and complement transport,
restriction of requests and avoidance of a prescribed finite set, as listed above; for
`extensionSentence`, the realization equivalence and the permutation of the positive and negative
tuples.

### 4.2 Existence and identification

*Needs:* 4.1; Layers 1–3; Tau Ceti `TauCeti.radoGraph`,
`TauCeti.hasExtensionProperty_radoGraph`, `SimpleGraph.HasExtensionProperty.isExtensionPair`,
`SimpleGraph.HasExtensionProperty.nonempty_iso` and `TauCeti.nonempty_iso_radoGraph_iff`.

Prove that the class of all finite simple graph structures (`finiteGraphs`) is Fraïssé using Layer 1
(`isFraisse_finiteGraphs`). Construct its limit using Layer 2 and prove that it satisfies `EP`.
Conversely, a countable graph with `EP` has this age and is ultrahomogeneous, hence is the same
Fraïssé limit. State this converse as
`Language.graph.ExtensionProperty.isFraisseLimit_finite_graphs` of the graph-characterization
proposal, together with `Language.graph.ExtensionProperty.embedding_from_countable`, and transfer
both to `SimpleGraph` through the adapter of 4.1.

Cameron (*The random graph*, Theorem 3 and the paragraph after it, p. 8) states that the finite
graphs form a Fraïssé class with limit `R`. His Theorem 3 is for relational languages, with
joint embedding as amalgamation over the empty structure; Mathlib's `IsFraisse` also asks for a
nonempty class, which the empty graph supplies.

The named graph `R` is the supplier's `TauCeti.radoGraph`, defined by
`SimpleGraph.fromRel fun i j => j.testBit i`, with its extension property
`TauCeti.hasExtensionProperty_radoGraph`. Prove that it agrees with the explicit binary presentation
on `ℕ` (bit `i` of `j` can be `1` only when `i < j`):

    i ~ j  ⟺  (i < j and bit i of j is 1) ∨ (j < i and bit j of i is 1).

Identify `R` with the constructed Fraïssé limit (`isFraisseLimit_radoGraph`).

The supplier provides countable uniqueness (`SimpleGraph.HasExtensionProperty.nonempty_iso`), the
characterization `TauCeti.nonempty_iso_radoGraph_iff` of the countable graphs isomorphic to `R`
(`ModelTheory/Scott/RandomGraph.lean`) and the extension-pair bridge. Export, in addition, the
characterization of `R` as the Fraïssé limit, the complement isomorphism, universality for countable
graphs, rooted universality into any extension-property graph (from Layer 3;
`exists_graphEmbedding_over_root`), and extension of finite induced isomorphisms to automorphisms.
Give explicit finite graph embeddings, including complete, empty, path and cycle graphs.

**Checks** (`finiteGraphs`).

- The empty graph and `K₂` belong to it.
- A one-point structure whose adjacency relation is reflexive does not: it fails the
  simple-graph axioms.
- The Rado graph does not: it is infinite.

### Examples

- `K₂` embeds in the Rado graph on `{0, 1}` (bit `0` of `1` is `1`) and the edgeless two-vertex
  graph on `{0, 2}` (bit `0` of `2` is `0`).
- `K₁` is not the limit of the finite simple graphs, since `K₂` is outside its age.
- The pairs `(0, 1)`, `(0, 2)`, `(1, 3)` and `(1, 1)` are, in that order, an edge, a nonedge, an
  edge and a diagonal pair of the Rado graph, in both the ordered and the symmetric presentation.

### Dependencies

Layers 0–3; Tau Ceti's `SimpleGraph.HasExtensionProperty`, `TauCeti.radoGraph` and their API from
the InfinitaryLogic random-graph worked example. Layers 5–10 use the extension predicates, the
extension sentences and the Rado graph.

## Layer 5 — Finite rank, Rado theory and elimination

### 5.1 Shared finite-logic foundations

*Needs:* Layer 0; 4.1 for the extension strategy; Tau Ceti `EFStrategy`, `BFEquiv`,
`TauCeti.EFStrategy.bfEquiv`, `TauCeti.BFEquiv.realize_iff_of_qrank_le`,
`TauCeti.BFEquiv.elementarilyEquivalent`, `BoundedFormula.realize_toInf`,
`SimpleGraph.sameAtomicType_iff` and the infinitary quantifier rank with
`BoundedFormulaInf.qrank_toInf`.

Define natural-valued quantifier rank by structural recursion on Mathlib bounded formulas.
Prove constructor and renaming laws, the appropriate substitution laws, and compatibility
with the ordinal rank of the existing infinitary embedding. Identify rank zero with
Mathlib's native `BoundedFormula.IsQF` predicate.

Finite-round soundness is already in Tau Ceti, for an arbitrary relational language and without
a finite- or countable-signature hypothesis, and is cited rather than restated. A winning
`k`-round strategy gives back-and-forth equivalence at level `k` (`TauCeti.EFStrategy.bfEquiv`,
`ModelTheory/BackAndForth/Game/Finite.lean`). Back-and-forth equivalence at level `α` gives
agreement of the two tuples, repetitions allowed, on every infinitary formula of quantifier rank
at most `α`, with the tuples in bound positions (`TauCeti.BFEquiv.realize_iff_of_qrank_le`,
`ModelTheory/BackAndForth/Karp.lean`). `TauCeti.BFEquiv.elementarilyEquivalent` already applies
these to first-order sentences through `BoundedFormula.toInf`, whose realization is
`BoundedFormula.realize_toInf`.

What remains here is the rank bridge. Prove that the ordinal rank of the embedding is the natural
rank, `(BoundedFormula.toInf φ).qrank = foRank φ`, by induction on `φ`
(`BoundedFormulaInf.qrank_toInf` makes the left side independent of the branching carrier).
With the declarations above it gives the first-order form directly: tuples joined by a `k`-round
strategy agree on every native formula of `foRank` at most `k`. Formulas over `Fin m` are moved to
the bound-position presentation explicitly. The graph specialization then uses
`sameAtomicType_iff`. The finite graph signature enters the later enumeration of diagrams for
quantifier elimination.

**Checks** (`foRank`).

- An atom such as `Adj(x₀, x₁)` has rank `0`, as does `⊥`.
- `∀x∃y Adj(x, y)` has rank `2`, and its ordinal rank under `BoundedFormula.toInf` is `2`.
- An implication of formulas of ranks `1` and `2` has rank `2`, the maximum; an additive
  convention would give `3`.

API: the constructor equations, including those of the derived connectives and `∃`; invariance
under renaming of free variables and the substitution laws; `foRank_eq_zero_iff_isQF`; and the
bridge `(BoundedFormula.toInf φ).qrank = foRank φ`.

For graphs satisfying `EP_{≤d}`, construct the finite-round extension strategy starting at two
tuples with the same equality and adjacency pattern. If the root tuple has length `m` and there are
`q ≥ 1` additional rounds, the sufficient budget (`formula_iff_of_extension`) is `d = m + q - 1`.
When a played vertex repeats an earlier coordinate, reuse its mate; otherwise serve the
corresponding extension request. This is a tuple-budget bound, not a bound ignoring the named root.

Spencer (*The Strange Logic of Random Graphs*) calls `EP_{≤k}` the `k`-Alice's Restaurant
property (Definition 2.3, p. 31, which also asks for more than `k` vertices; that follows from
`EP_{≤k}` here) and proves that the graphs with it form one `(k + 1)`-round Ehrenfeucht class
(Theorem 2.2.3, p. 31). His Theorems 2.3.1–2.3.2 (p. 32) identify `k`-round Ehrenfeucht
equivalence with agreement on sentences of quantifier depth `k`, and with designated vertices on
formulas of the remaining depth. These give the `EP_{≤d}`/rank-`(d + 1)` indexing used here.

In particular (`satisfies_iff_of_extension`), if `G, H` satisfy `EP_{≤d}` and
`qr(φ) ≤ d + 1`, then

    G ⊨ φ  ⟺  H ⊨ φ.

Handle rank `0` directly, and verify the indexing at ranks `1, 2, 3`.

### 5.2 Complete theory and QE

*Needs:* 4.1–4.2, 5.1; Layer 3 rooted universality; Mathlib `Theory.IsComplete`,
`Cardinal.Categorical`, `CompleteType`, `typesWith`, `typeOf`, `ElementaryEmbedding`,
`BoundedFormula.listEncode` with `BoundedFormula.encoding`, `Primcodable` and `Computable`; Tau Ceti
`firstOrderAtomicDiagram` and `realize_firstOrderAtomicDiagram_iff_sameAtomicType`.

Let `T_R` be the native simple-graph theory together with all `E_{r,s}`.
Prove that its models are precisely the graph structures with full extension
(`model_radoAxioms_iff`); it has
no finite models; it is countably categorical (`radoAxioms_aleph0_categorical`); and it is
complete (`radoAxioms_isComplete`). Prove
`T_R ⊨ φ` if and only if `R ⊨ φ` (`radoAxioms_models_iff`), so the semantic consequence
closure of this axiom set is `Th(R)`.

Cameron proves countable categoricity (Proposition 11, p. 9) by the back-and-forth argument of
his Fact 2 (pp. 1–2), and the equivalence of `T_R ⊨ φ` with `R ⊨ φ` is
(b)⇔(c) of his Theorem 6 (p. 10). His axioms `σ_{m,n}` (p. 9) translate his property (∗),
whose witness Fact 2 uses as distinct from all listed vertices; the `E_{r,s}` here require
that distinctness explicitly. Completeness follows from categoricity and the absence of finite
models by the Łoś–Vaught test, the route of Fagin's Theorem 1 (p. 51), which he states for
Gaifman's extension axioms over an arbitrary finite relational vocabulary rather than for graphs.

Prove quantifier elimination for actual first-order formulas, including formulas with
free variables. The meaning of a tuple's diagram is Tau Ceti's atomic-diagram semantics:
`AtomicIdx.toFormula`, `firstOrderAtomicDiagram` and
`realize_firstOrderAtomicDiagram_iff_sameAtomicType`, applied to the graph language through the
instance `Finite (Σ l, Language.graph.Relations l)`, which is a target of this layer, through the
equivalence `graphRelationsEquiv` of the graph relation symbols with `Unit`. That
diagram is a classical finite
conjunction and is noncomputable, so it supplies the semantics but not the algorithm.

The two endpoints are computability theorems on codes of formulas.
**Computable quantifier elimination** (`exists_computable_quantifierElimination`): there is a
`Computable₂` map taking `m` and a code such that, for every formula over `Fin m`, the output is
the code of a quantifier-free formula over the same context with the same realizations in every
model of `T_R`. **Decidability** (`exists_computable_decide_rado`): there is a `Computable` map on
codes of sentences answering truth in the Rado graph. Prove that these computable maps exist on
the effective coding, with the stated semantic correctness. That each formula has some
quantifier-free equivalent modulo `T_R` proves neither theorem, since it gives no computable map
on codes. Finite equality-and-adjacency patterns provide a proof route, through these supporting
results:

- the **effective coding of first-order formulas**, the input and output format of the two
  maps, owned by this roadmap for a general language `L` (`FormulaAlphabet`, `boundedCode`,
  `boundedDecode`): Mathlib's structural list encoding `BoundedFormula.listEncode` followed by the
  numbering of its symbol alphabet. Decoding at a given number of bound positions accepts exactly
  the formula codes (Mathlib's list decoder ignores trailing symbols, so this needs a re-encoding
  check), with the round-trip laws `boundedDecode_boundedCode` and `boundedDecode_eq_some_iff`. The
  effective claims assume an **effective presentation** of `L`: `Primcodable` symbol families,
  so that symbols are computably decoded, with the arity of a symbol computable from its code. An
  `Encodable` instance alone, such as `Encodable.ofCountable`, has no effective content and is not
  enough. The contexts `Fin m ⊕ Fin n` are coded by value, so the codes are uniform in `m` and `n`.
  Under these hypotheses, prove that the term constructors (variables, function applications
  from a symbol code and the list of argument codes) and case analysis on terms are computable on
  codes (`computable_termCode`), and likewise the formula constructors (`⊥`, equality, relation
  application, implication, universal quantification) and case analysis on the outermost
  constructor, returning the codes of the immediate subformulas, of the relation symbol and of
  the terms of an atom (`computable_boundedCode`). The graph language is effectively presented,
  with no function symbols and one relation symbol of arity `2`; this is the case the two maps
  use, in which terms are variables and an atom is coded by the codes of two variables. A
  language with a unary function symbol is an instance too, with terms that are not variables;
- a computable representation of finite equality-and-adjacency patterns on `Fin m`, with
  its consistency test;
- a correctness bridge proving that the formula of each consistent pattern and
  `firstOrderAtomicDiagram` of any tuple realizing it have equivalent realizations, with the
  conversion between free-variable and bound-variable presentations made explicit;
- pattern elimination: every formula is equivalent modulo `T_R` to a finite Boolean
  combination of pattern formulas, computably from its code, with semantic correctness. A
  quantifier over such a combination reduces to the one-point extensions of each pattern that are
  consistent. The resulting map on codes is computable, its outputs are quantifier-free in the
  sense of the native `IsQF`, and on sentences it decides truth in the Rado graph, which proves
  both theorems.

Export also the theory-level property in the vocabulary of the quantifier-elimination proposal,
`Language.Theory.HasQuantifierElimination radoAxioms` (`radoAxioms_hasQuantifierElimination`):
every formula is `Language.Theory.IsQFEquivalent` modulo `T_R`,
using that proposal's reduction to finite variable types. The theory-level property is a
consequence of the computable QE map and does not replace it.

Show that the complete finite diagrams isolate the realized graph types and define
automorphism orbits, using equality/disequality as well as adjacency/nonadjacency.
State isolation in Mathlib's native complete-type space: in `T_R.CompleteType (Fin m)`,
the basic open `typesWith` associated to a tuple's diagram is the singleton containing
its `typeOf`. For a diagram `δa`, the native set equation
(`typesWith_firstOrderAtomicDiagram_eq_singleton`) is
`T_R.typesWith (Formula.equivSentence δa) = {T_R.typeOf a}`.
Agreement only among tuples already living in `R` does not suffice for
this target. Prove that every finite tuple's complete type is isolated, establishing
graph-specific atomicity.

Prove primeness as the existence of an actual elementary embedding of `R` into every model of `T_R`
(`nonempty_elementaryEmbedding_radoGraph`). Rooted universality supplies the embedding and QE makes
it elementary; the target model need not be countable. Give the atomicity and primeness statements
after naming a finite tuple, with the elementary embedding retaining the prescribed parameter values
(`exists_elementaryEmbedding_radoGraph_comp_eq`).

**Checks** (`radoAxioms`).

- The Rado graph is a model.
- The countable edgeless graph is not: it fails `E_{1,0}`.
- `K₁` is not, as `T_R` has no finite models: it fails `E_{1,0}`.

**Checks** (`Language.Theory.IsQFEquivalent`).

- Modulo `T_R`, `∃y Adj(x₀, y)` is equivalent to `⊤` (it holds in every model, by `E_{1,0}`) and
  `∃x Adj(x, x)` to `⊥`.
- Modulo `Language.Theory.simpleGraph`, `∃y Adj(x₀, y)` has no quantifier-free equivalent: every
  quantifier-free formula in `x₀` takes the same value at the vertex of `K₁` and at a vertex of
  `K₂`, where `∃y Adj(x₀, y)` is false and true.
- Every quantifier-free formula is quantifier-free equivalent to itself modulo every theory.

**Checks** (`Language.Theory.HasQuantifierElimination`).

- `T_R` has it.
- `Language.Theory.simpleGraph` does not, by the previous Check.
- An unsatisfiable theory has it: every formula is equivalent to `⊥` modulo it.

**Checks** (`boundedCode` and `boundedDecode`).

- Decoding the code of `⊥`, and of an implication, returns the formula.
- The code of a formula's list encoding with one more symbol appended decodes to `none`:
  Mathlib's list decoder returns the formula, but re-encoding it does not reproduce the number.
- `x₀ = x₀` has the same code over `Fin 1` and over `Fin 2`, since a variable is coded by its
  value in every context.
- In a language with one unary function symbol `s`, the code of `s(x₀) = x₀` over `Fin 1`
  decodes to that formula.

**Checks** (atomic isolation).

- In the Rado graph the pairs `(0, 0)`, `(0, 1)` and `(0, 2)` have three different diagrams:
  `x₀ = x₁`; `x₀ ≠ x₁` and adjacent; `x₀ ≠ x₁` and nonadjacent.
- They isolate three different types in `T_R.CompleteType (Fin 2)`.
- The first pair shows that equality atoms are needed, the last two that adjacency atoms are.

### 5.3 Finite consequences

*Needs:* 5.1–5.2.

Prove that each sentence is decided by a finite set of extension axioms (`radoAxiomsUpTo`,
`radoAxiomsUpTo_models_iff`), using the
explicit rank theorem. Give the finite-consequence/compactness formulation and its
agreement with this bound. This is the deterministic finite-consequence API used in
the probabilistic limit theorem.

The first-order isolation assertions here use the finite graph language. No theorem
asserts that arbitrary-language ultrahomogeneity alone implies first-order isolation.

**Checks** (`radoAxiomsUpTo`).

- `radoAxiomsUpTo 0` adds `E_{0,0}` to the simple-graph axioms; `radoAxiomsUpTo 1` adds
  `E_{0,0}`, `E_{1,0}` and `E_{0,1}`.
- `K₁` is a model of `radoAxiomsUpTo 0` but not of `radoAxiomsUpTo 1`.
- `∀x∃y Adj(x, y)`, of rank `2`, follows from `radoAxiomsUpTo 1` by `E_{1,0}` and holds in `R`;
  it does not follow from `radoAxiomsUpTo 0`, of which `K₁` is a model, which the rank bound
  `d + 1 = 1` allows.

### Examples

- `K₁` and `K₂` both satisfy `EP_{≤0}` and differ on `∃x∃y Adj(x, y)`, of rank `2`: the bound
  `d + 1` in the rank agreement is sharp at `d = 0`.
- For the root of length `m = 2` and `q = 1` further round, the budget is `m + q - 1 = 2`: the
  common-neighbour query at two vertices is a request of size `2`.
- The decision map answers true on the triangle sentence and false on `∃x Adj(x, x)`.

### Dependencies

Layers 0, 3 and 4; Tau Ceti's finite EF games, back-and-forth relations, Karp's theorem, quantifier
rank and atomic diagrams; Mathlib's complete types, list encoding and computability. Layers 7 and 8
use the rank agreement, and Layer 7 the decision map.

## Layer 6 — Witness counts and extension-failure estimates

*Needs:* 0.2; 4.1 for the witness predicate, bounded extension and the extension sentences;
StandardDistributions binomial law.

Fix disjoint `U, V` with `|U| = r`, `|V| = s` and put
`q_{r,s} = p^r (1 - p)^s`.
For a finite candidate set `C` disjoint from `U ∪ V`, prove that the witness indicators
are independent Bernoulli variables and the number of witnesses has the native
binomial law with parameters `|C|` and `q_{r,s}` (`witnessProbability`, `witnessCount`,
`witnessCount_mass`).
The statement includes exact mass and expectation formulas and the zero-witness
specialization (`no_witness_mass`)

    Pr(no witness in C) = (1 - q_{r,s})^|C|.

The proof must identify the tested edge sets and prove their disjointness between
candidates. It does not use independence of arbitrary overlapping extension requests.

For `n ≥ r + s`, export both the ordered-tuple bound

    Pr(G(n, p) ⊭ E_{r,s}) ≤ (n)_{r+s} (1 - q_{r,s})^(n-r-s)

and the sharper finite-set counting bound with coefficient
`C(n, r + s) C(r + s, r)`, where `C(n, k)` is the binomial coefficient `Nat.choose n k`.
Here `(n)_k` is `Nat.descFactorial`, not a binomial coefficient.

For `n ≥ d`, define and prove the rank-budget failure bound (`extensionError`,
`extension_failure_le`)

    B_d(n, p) = Σ_{t=0}^{d} Σ_{r=0}^{t} C(n, t) C(t, r) (1 - p^r (1 - p)^(t-r))^(n-t),
    Pr(¬EP_{≤d}(G(n, p))) ≤ B_d(n, p).

The definition is a finite real sum, with the usual convention `0^0 = 1`; state the
`n ≥ d` domain on the estimate rather than silently using truncated subtraction as
a count of available candidates for impossible requests.

Writing `δ = min(p, 1 - p)`, prove for `n ≥ max(1, d)` (`extensionError_le_exp`)

    B_d(n, p) ≤ (d + 1) 2^d n^d exp(-(n - d) δ^d).

Supply nonnegativity, complement symmetry, finite-union bounds and limits. For fixed `0 < p < 1`,
prove summability in `n` of the failure probabilities (`summable_extensionError`) and an explicit
`C_{d,p} n^d e^(-c_{d,p} n)` bound for sufficiently large `n`, with `c_{d,p} > 0`. The empty request
and the absence of candidates are required boundary checks.

**Checks** (`witnessProbability`).

- At `p = 1/2` and `r = s = 1` it is `1/4`.
- For `r = s = 0` it is `1` for every `p`: every candidate witnesses the empty request.
- At `p = 0` and `r = 1` it is `0`.

**Checks** (`witnessCount`).

- With two candidates the count takes the values `0`, `1` and `2`.
- With no candidates it is `0`.
- In `K₂` with `U = {0}`, `Z = ∅` and `C = {1}` it is `1`.

**Checks** (`extensionError`, written `B_d(n, p)`).

- `B_0(0, p) = 1`: the only term is `0^0 = 1`.
- `B_0(1, p) = 0`.
- On `Fin 3` budget `1` always fails, since every vertex would need exactly one neighbour, and
  indeed `1 ≤ B_1(3, 1/2) = 3/2`; also `B_2(4, 1/2) = 29/2`.

API: `witnessCount` is monotone in `C` and additive over disjoint candidate sets; `extensionError`
is nonnegative, symmetric under `p ↦ 1 - p` and monotone in `d`.

### Examples

- At `p = 1/2`, `r = s = 1` and two candidates the masses of `0, 1, 2, 3` witnesses are
  `9/16, 6/16, 1/16, 0`, and the no-witness mass is `(1 - 1/4)^2 = 9/16`.
- At `p = 1/2`, `d = 1` and `n = 4`, `B_1(4, 1/2) = 1 ≤ 16 e^(-3/2) ≈ 3.57`.
- At `p = 1/2` and `d = 1`, `B_1(n, 1/2) = 2n · 2^(1-n)` for `n ≥ 1`, a summable sequence.

### Dependencies

0.2; 4.1 for the witness predicate, bounded extension and the extension sentences;
StandardDistributions for the binomial law. Layers 7–9 use the failure bounds.

## Layer 7 — FO asymptotics and almost-sure stabilization

### 7.1 Finite laws

*Needs:* 5.1–5.3; Layer 6.

For `qr(φ) ≤ d + 1` and `n ≥ d`, prove the explicit estimate (`sentenceProbability_error`, with
`radoTruth` the Rado truth value)

    |Pr(G(n, p) ⊨ φ) - 𝟙[R ⊨ φ]| ≤ B_d(n, p).

It is uniform over all sentences of the indicated rank. Derive the fixed-`p` zero–one law
(`firstOrder_zero_one`), the equality of the almost-sure theory with `Th(R)` (the semantic
consequence closure of `T_R`), and independence of this theory from `p ∈ (0, 1)`. The decision map
of Layer 5 computes the limiting truth value; the rank supplies the error profile. Classical
compactness alone is not claimed to compute either of them.

Derive that every finite subset of `T_R` has a finite model, and every sentence true
in `R` has finite models of every sufficiently large cardinality. These are
consequences of the positive finite-law probabilities, not inputs to the construction
of `R` or to completeness.

Spencer's Theorem 0.1.2 (p. 4) is the zero–one law for `G(n, 1/2)`. Cameron's Theorem 6 (p. 10)
states, for uniform finite graphs, the equivalence of almost-sure truth, truth in `R` and
consequence of the extension axioms, and its proof uses the ordered-tuple bound of Layer 6 at
`p = 1/2`, with `n^(r+s)` in place of `(n)_{r+s}`. Fagin proves the limit law (Theorem 2 and
Corollary 3, p. 52) and the finite models of every sufficiently large cardinality (Corollary 5, p.
53) for all structures over a finite relational vocabulary under the uniform measure. The fixed
interior `p`, the restriction to loopless undirected graphs and the explicit rank-uniform bound are
this roadmap's statements, proved by the same route.

Export a transfer theorem for any concrete graph property implied by a fixed extension
budget, with the corresponding failure bound. Layer 8 supplies actual graph
properties and proves these deterministic implications.

### 7.2 Varying parameters

*Needs:* 7.1; Layer 6.

Let `p_n ∈ [0, 1]` and `δ_n = min(p_n, 1 - p_n)`. For each fixed `d ≥ 1`, prove
bounded-rank convergence (`firstOrder_limit_varying_bounded_rank`) whenever

    (n - d) δ_n^d - d log(n + 2) → +∞.

The conclusion is Rado-truth convergence for sentences of rank at most `d + 1`.
Rank at most `1` is treated directly.

For the all-rank theorem (`firstOrder_limit_varying`), the concrete sufficient condition is

    ∀ a > 0,  n^a δ_n → +∞.

Prove that it gives the stated condition for every `d` and summability of every
fixed-budget failure probability. It allows nonconvergent `p_n`.
Required examples include parameters bounded away from `0` and `1`, alternating two
interior probabilities, and `p_n = 1/log(n + 2)` for all sufficiently large `n`, with a
valid `unitInterval` value assigned at the finitely many remaining indices.

The weaker fixed-`d` divergence condition by itself gives convergence of probabilities.
Do not infer summability or joint almost-sure stabilization from it without an
additional summability estimate.

Spencer's Theorems 9.1.3–9.1.4 (p. 122) are the dense varying-parameter laws. Theorem 9.1.3 assumes
`p_n ≫ n^(-1/d) (ln n)^(1/d)` and `1 - p_n ≫ n^(-1/d) (ln n)^(1/d)` for sentences of quantifier
depth `d + 1`; the fixed-rank condition here is weaker. The all-rank condition here is equivalent
to the hypothesis of Theorem 9.1.4, that `p_n ≥ n^(-ε)` and `1 - p_n ≥ n^(-ε)` for every `ε > 0`.

### 7.3 Joint almost-sure statements

*Needs:* 7.1–7.2; Mathlib `measure_limsup_atTop_eq_zero` (Borel–Cantelli); Tau Ceti
`SimpleGraph.restrictFin` for the nested windows.

Fix `0 < p < 1`. Let `(Ω, μ)` be a probability space and let measurable
`X_n : Ω → SimpleGraph (Fin n)` have the native `G(n, p)` law.
Without any independence assumption between sample sizes, prove

    ∀^μ ω,  ∀ d,  ∀^∞ n,  EP_{≤d}(X_n(ω)),

and therefore

    ∀^μ ω,  ∀ d,  ∀^∞ n,  ∀ φ with qr(φ) ≤ d + 1,  (X_n(ω) ⊨ φ ⟺ R ⊨ φ).

Here `∀^∞ n` means all sufficiently large natural numbers. The threshold
depends on the sample and the rank bound. There is no one threshold working for all
first-order sentences.

Prove the varying-parameter version under the all-rank condition of 7.2
(`ae_eventually_all_bounded_rank_varying`), and the
abstract version under summability of the extension-failure probabilities.
Instantiate it on the nested initial windows of the native infinite binomial graph.

These are derivations, not cited theorems: the inputs are the summable bounds of Layer 6
and 7.2, the first Borel–Cantelli lemma `measure_limsup_atTop_eq_zero`, which needs no
independence, and the rank agreement of 5.1.

**Checks** (`radoTruth`).

- The triangle sentence has value `1`.
- `∃x Adj(x, x)` has value `0`.
- `∀x∃y Adj(x, y)` has value `1`, by `E_{1,0}`.

### Examples

- For `∃x∃y Adj(x, y)` the probability is `1 - (1 - p)^C(n, 2)`, which tends to `1`, its Rado
  truth value; at the excluded endpoint `p = 0` it is `0` for every `n`.
- The alternating parameters `1/3, 2/3, 1/3, …` satisfy the all-rank condition, with
  `δ_n = 1/3`.
- `p_n = 1/log(n + 2)` for large `n` satisfies the all-rank condition, since `n^a / log(n + 2)`
  tends to infinity for every `a > 0`.

### Dependencies

Layers 5–6; Mathlib's `measure_limsup_atTop_eq_zero`; Tau Ceti's `SimpleGraph.restrictFin`.
Layers 8–9 use the finite laws and the joint statements.

## Layer 8 — Rooted laws and asymptotic graph examples

### 8.1 Finite named roots

*Needs:* 0.2; 4.2 rooted universality; the tuple form of 5.1; Layer 6; 7.1.

For a fixed graph `H` on `Fin m`, condition `G(n, p)` on inducing `H` on the first `m` vertices, for
`n ≥ m` and `0 < p < 1`. Prove positivity (`rootEvent`, `rootEvent_pos`) and the exact probability
of this event, and identify the conditional law of the remaining independent edges.

Choose an induced copy of `H` in `R` using rooted universality. For every formula
`ψ(x₀, …, x_{m-1})`, prove that its conditional limiting truth (`rootedProbability`,
`rooted_firstOrder_limit`) is the truth (`rootedTruth`) in this rooted `R`, independent of the
chosen copy. Supply a quantitative bound using the tuple version of finite-rank agreement; division
by the explicitly positive root-event probability gives a valid bound from Layer 6.

Also prove the unconditioned fixed-tuple limit (`firstVertices`, `firstOrder_limit_firstVertices`)

    lim_n Pr(G(n, p) ⊨ ψ(0, …, m-1))
      = Σ_{H on Fin m} p^e(H) (1 - p)^(C(m, 2) - e(H)) 𝟙[(R, ā_H) ⊨ ψ].

This is a finite, effectively determined polynomial expression. Include the example
`ψ(x₀, x₁) = Adj(x₀, x₁)`, whose limit is `p`. This does not contradict
the sentence zero–one law: it is a formula evaluated at random named vertices.

**Checks** (`firstVertices`).

- For `m = 2` and `n = 1` its image in `Fin 3` is `{0, 1}`.
- For `m = 0` its image is empty.
- It sends `i` to `i`.

**Checks** (`rootEvent`).

- For `m = 2` and `H = K₂` its probability under `G(2 + n, p)` is `p`; for the edgeless `H` it
  is `1 - p`.
- For `m = 0` it is the whole space, of probability `1`.
- At `p = 0` the event for `H = K₂` has probability `0`, so positivity needs `0 < p`.

**Checks** (`rootedProbability`).

- At `p = 1/2`, `H = K₂` and `φ = Adj(x₀, x₁)` it is `1` for every `n`.
- For the edgeless `H` and the same `φ` it is `0`.
- At `p = 0` and `H = K₂` the denominator is `0` and the real quotient is `0`; the limit
  theorems assume `0 < p < 1`, where the denominator is positive.

**Checks** (`rootedTruth`).

- `Adj(x₀, x₁)` has value `1` at `(0, 1)` in the Rado graph and `0` at `(0, 2)`.
- `x₀ = x₁` has value `1` at `(3, 3)`.
- `∃y (Adj(x₀, y) ∧ Adj(x₁, y))` has value `1` at `(0, 1)`, by `E_{2,0}`.

### 8.2 Graph properties

*Needs:* 7.1–7.3; Mathlib `CliqueFree`, `degree` and `diam`; Tau Ceti
`SimpleGraph.IsVertexConnected`.

Prove each deterministic implication from a fixed extension budget and then its
asymptotically-almost-sure and joint-eventual forms.

- Every fixed finite graph occurs as an induced subgraph
  (`tendsto_binomialRandom_nonempty_embedding`); give a rooted extension
  version over a prescribed finite induced pattern.
- There are arbitrarily large fixed cliques and independent sets as `n` grows
  (`tendsto_binomialRandom_not_cliqueFree`).
  State this as one theorem for each fixed size and as an almost-sure joint statement.
- Every vertex has at least any prescribed fixed number of neighbors and nonneighbors
  (`tendsto_binomialRandom_le_degree`).
- The graph and its complement are connected; for fixed interior `p` their diameter
  (`tendsto_binomialRandom_diam_eq_two`)
  is exactly `2` eventually almost surely.
- For each fixed natural `k`, vertex connectivity is at least `k`
  (`tendsto_binomialRandom_isVertexConnected`) asymptotically almost
  surely. Use Tau Ceti's `SimpleGraph.IsVertexConnected` and its size convention (more than
  `k` vertices). Derive the result by deletion of fewer than `k` vertices and the
  common-neighbor witness property, including the required carrier-size bound.

Use native clique, degree, distance, deletion and connectivity definitions. For diameter
`2`, provide both the common-neighbor upper bound and the existence of a nonedge;
do not confuse diameter at most `2` with equality.
Each item is derived from its deterministic implication and 7.1–7.3; no external theorem is
cited for these graph properties.

Give explicit FO translations for the fixed finite patterns, fixed degree lower bounds,
common-neighbor property and diameter bound. Connectivity itself need not be defined
by one FO sentence; its probabilistic application follows from a stronger fixed FO
condition. Include a worked calculation at `p = 1/2` and the low extension budgets
`d = 0, 1, 2`.

### Examples

- For `ψ = Adj(x₀, x₁)` the conditioned limits are `1` on `H = K₂` and `0` on the edgeless `H`,
  and their mixture with weights `p` and `1 - p` is the unconditioned limit `p`.
- `EP_{≤2}` gives diameter at most `2`; a finite complete graph has diameter `1` and fails
  `EP_{≤1}`, so the nonedge half of "diameter exactly `2`" is needed.
- For `k = 0` the clique event always holds, and for `k = 2` it asks for an edge and a nonedge.

### Dependencies

Layers 3–7; Mathlib's `CliqueFree`, `degree` and `diam`; Tau Ceti's `SimpleGraph.IsVertexConnected`
from GraphConnectivityAndFlows.

## Layer 9 — Infinite laws and graphon connections

### 9.1 Infinite binomial graphs

*Needs:* 0.3; 4.1–4.2; Layer 6; 7.3.

For each finite extension request in the native `G(ℕ, p)` law, prove that the
event of having no witness has probability `0`. Take the countable intersection over
requests and derive (`ae_isomorphic_rado`)

    Pr(G(ℕ, p) ≅ R) = 1,  0 < p < 1.

Cameron's Fact 1 (p. 1), with its proof and the remark following it (p. 2), is this statement at
`p = 1/2` and its extension to every fixed `0 < p < 1`. His property (∗) leaves implicit that the
witness differs from the negative vertices; the requests here make it explicit.

Prove measurability of this particular isomorphism class by its extension-axiom
description. Export avoidance of every finite set and infinitely many witnesses,
the finite-window law, and the joint eventual statements from Layer 7.

### 9.2 Graphon sampling

*Needs:* 9.1; 7.1–7.3; DenseGraphLimits `sampleGraph_const`, `infiniteSampleLaw_map_restrictFin`
and infinite-law extensionality.

Use `sampleGraph_const` and the actual infinite finite-window identities to identify
the constant-graphon finite and infinite laws with the native binomial laws
(`infiniteSampleLaw_const`).
Derive the infinite-law equality by the existing cylinder/finite-window measure
extensionality theorem when necessary.

For a graphon `W` on a probability space with `0 < W < 1` almost everywhere with respect to the
product measure, prove that its infinite sample is almost surely Rado (`infiniteSampleLaw_ae_rado`).
For almost every fixed root tuple the conditional extension probability is positive; infinitely many
independent outside candidates then supply a witness. Handle the exceptional root sets by
product-measure/Fubini arguments, not a pointwise assertion about an arbitrary representative.

For the stronger hypothesis
`ε ≤ W ≤ 1 - ε` almost everywhere, with
`0 < ε ≤ 1/2`, prove (`graphon_extension_failure_le`)

    Pr(¬EP_{≤d}(G(n, W))) ≤ Σ_{t=0}^{d} C(n, t) 2^t (1 - ε^t)^(n-t)  (n ≥ d).

Derive the finite FO Rado-truth law (`graphon_firstOrder_limit`), uniform rank estimates and
arbitrary-coupling almost-sure stabilization for these graphon sample laws. The last is
`graphon_ae_eventually_all_bounded_rank`: for a probability space `(Ξ, ν)` and measurable
`X n : Ξ → SimpleGraph (Fin n)` with `ν.map (X n) = sampleGraph K n`, and no assumption on the joint
law, almost surely, for every `d`, eventually every sentence of rank at most `d + 1` has its Rado
truth value in `X n`. The displayed bound is summable in `n` for each `d`, so the first
Borel–Cantelli lemma applies as in 7.3. The binomial theorems of 7.3 do not cover this case, because
the edges of a graphon sample are dependent: for `W(x, y) = 1/4 + xy/2` (so `ε = 1/4` applies) each
edge has probability `3/8`, while two edges at a common vertex are both present with probability
`∫(1/4 + x/4)² dx = 7/48`, not `9/64`. This is an application of the existing sampler to the newly
proved conditional witness bounds. The conditional witness probabilities and the displayed bound are
computed from the sampler's definition, as in Layer 6; no external theorem is cited for them.

Mere almost-everywhere positivity and strict inequality from `1` supply the infinite
Rado theorem, not the uniform finite estimate. Layer 11 gives a concrete graphon
where finite FO zero–one fails despite almost-sure infinite Rado support.

### 9.3 Invariant-event laws and mixtures

*Needs:* 0.3; Tau Ceti `Equiv.Perm.finitary`,
`ergodicSMul_map_toRelationalConfiguration_infiniteSampleLaw`, `graphonMixtureLawEquiv_law` and
`InfiniteExchangeableGraphLaw.existsUnique_bind_infiniteSampleLawOnSpace`.

Transport the existing dissociation/ergodicity theorem,
`ergodicSMul_map_toRelationalConfiguration_infiniteSampleLaw`, to measurable events of actual
graphs. For a fixed graphon, every measurable event invariant under finitely supported
permutations has probability `0` or `1` (`infiniteSampleLaw_zero_one_of_invariant`). Specialize
to the native realization event of
each FO sentence (`infiniteSampleLaw_sentence_zero_one`).

For a graphon-mixture law `∫ P_W dΠ([W])`, prove the measurability of the
graphon-space satisfaction-probability function and evaluate the existing measure
`bind` identity `graphonMixtureLawEquiv_law` by `Measure.bind_apply` to obtain

    Pr(G ⊨ φ) = ∫ P_W(G ⊨ φ) dΠ([W]).

The integrand is zero or one; the mixture need not be. The half-empty/half-complete
infinite graph mixture and the sentence “there exists an edge” must give exactly `1/2`.
The endpoint graphons are legitimate examples even though the interior binomial Rado
theorem does not apply to them.

### 9.4 One isomorphism class, distinct labeled laws

*Needs:* 9.1–9.2; `tendsto_homDensityFin_infiniteSampleLaw_ae`.

Use the existing graphon sampling strong law, together with the `K₂` homomorphism-density
normalization, to prove (`windowEdgeDensity`, `ae_windowEdgeDensity`)

    2 |E(G ↾ n)| / (n (n - 1)) → p  almost surely under G(ℕ, p).

Set the displayed density to `0` at `n = 0, 1`. The limit holds for every `p ∈ [0, 1]`,
the endpoints included (`G(ℕ, 0)` and `G(ℕ, 1)` are the empty and complete graphs).
For distinct `p, q ∈ [0, 1]` derive mutual singularity of the labeled infinite laws, stated
with Mathlib's `MeasureTheory.Measure.MutuallySingular` as
`SimpleGraph.binomialRandom ℕ p ⟂ₘ SimpleGraph.binomialRandom ℕ q`
(`binomialRandom_mutuallySingular`). For `p, q ∈ (0, 1)` this holds although each gives
probability one to the Rado isomorphism class. The witness is the edge-density separator
`{G | windowEdgeDensity G → p}`: it is measurable,
has probability one under `G(ℕ, p)` and, since the densities converge to `q ≠ p` almost surely
under `G(ℕ, q)`, probability zero there. At `p = 0`, `q = 1` its masses are `1` and `0`. The
separating initial-window density events are invariant under finitely supported permutations;
do not claim invariance under all relabelings.

**Checks** (`windowEdgeDensity`).

- For the empty graph it is `0` at every `n`.
- For the complete graph it is `0` at `n = 0, 1` and `1` for every `n ≥ 2`.
- For the Rado graph it is `2/3` at `n = 3`: of the pairs in `{0, 1, 2}`, `{0, 1}` and `{1, 2}`
  are edges and `{0, 2}` is not.

### Examples

- The half-empty/half-complete mixture gives the sentence "there exists an edge" probability
  exactly `1/2`, although each graphon gives it `0` or `1`.
- The constant graphon with value `1/2` has the law `G(ℕ, 1/2)`, and the product graphon `xy`
  satisfies the hypothesis of the infinite Rado theorem: for a root label `x > 0` the positive
  request succeeds with probability `x/2 > 0`.
- At `p = 0` and `q = 1` the edge-density separator has masses `1` and `0`.

### Dependencies

Layers 0 and 4–7; DenseGraphLimits for the samplers, their consistency, sampling convergence and
mixtures; Exchangeability for the ergodic array theory. Layers 10–11 use the infinite laws.

## Layer 10 — Infinitary distinctions with actual sentences

*Needs:* 4.1; 7.1; 9.1; Tau Ceti infinitary syntax and semantics and
`SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`.

Use the existing `L_{ω₁,ω}` syntax, native FO embedding and realization API:
`Language.graph.Sentenceω` with `BoundedFormulaInf.iInf` and `iSup`, `BoundedFormula.toInf`,
`SentenceInf.Realize` and `Sentence.realize_toInf` (Tau Ceti
`ModelTheory/Infinitary/{Syntax,Semantics}.lean` at `2fd255d99`), evaluated under
`SimpleGraph.structure`. Construct both of the following sentences and prove their stated semantics.

1. `Θ_R = ⋀_{r,s ∈ ℕ} E_{r,s}` (`radoSentenceInf`, holding exactly in the graphs with full
   extension by `satisfiesInf_radoSentenceInf_iff`) has probability `1`
   (`binomialRandom_radoSentenceInf`) under
   `G(ℕ, p)` for `0 < p < 1`, and probability `0` on every finite carrier
   (`binomialRandom_radoSentenceInf_of_finite`).
   This refutes extending the Rado-truth identification to arbitrary infinitary
   sentences. Its finite probabilities do converge to a zero–one value, namely `0`.
   Tau Ceti's Scott sentence of `R` already characterizes the extension property in every
   cardinality (`SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`). `Θ_R` is a
   different sentence, the explicit conjunction of the first-order extension axioms, from which
   the two probabilities are read off; prove that `Θ_R` and the Scott sentence of `R`
   hold in the same graphs.
2. Construct first-order `CardEq(m)`, including `m = 0`, and
   `Θ_even = ⋁_{m ∈ ℕ} CardEq(2m)`.
   On the finite carrier `Fin n`, its probability is exactly `1` for even `n` and
   `0` for odd `n`, for every `p` (`binomialRandom_evenSentenceInf`). This sequence has no limit
   (`not_tendsto_binomialRandom_evenSentenceInf`).

These are separate assertions: mismatch with infinite truth and genuine failure of
finite-probability convergence. Neither is a failure of the FO theorem.

**Checks** (`SatisfiesInf`).

- The embedded triangle sentence holds in `K₃` and fails in `K₂`, as the first-order sentence
  does.
- `Θ_R` holds in the Rado graph and fails in `K₁`.
- A countable disjunction holds when one disjunct does: `Θ_even` holds on `Fin 2` through
  `CardEq(2)`.

**Checks** (`radoSentenceInf`).

- It holds in the Rado graph.
- It fails in `K₁` and in every finite graph, which has no witness outside a listing of its
  whole carrier.
- It fails in the countable edgeless graph, at `E_{1,0}`.

**Checks** (`cardEq`).

- `CardEq(0)` holds on `Fin 0` and fails on `Fin 1`.
- `CardEq(1)` holds on `Fin 1` and fails on `Fin 2`.
- `CardEq(m)` fails on `ℕ` for every `m`.

**Checks** (`evenSentenceInf`).

- It holds on `Fin 0` and on `Fin 2`.
- It fails on `Fin 1`.
- It fails on `ℕ`.

### Examples

- Under `G(ℕ, 1/2)`, `Θ_R` has probability `1`; on `Fin 0` and `Fin 1` it has probability `0`
  at `p = 0` and at `p = 1`.
- The probabilities of `Θ_even` at `n = 0, 1, 2, 3` are `1, 0, 1, 0`, with subsequence limits
  `1` and `0`.
- `Θ_R` and the Scott sentence of `R` agree on graphs of every cardinality.

### Dependencies

Layers 4, 7 and 9; Tau Ceti's Lω₁ω syntax and semantics and
`SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`.

## Layer 11 — Poisson limits and sharp scope comparisons

### 11.1 Discrete factorial-moment criterion

*Needs:* Mathlib `Nat.descFactorial`, `ProbabilityTheory.poissonMeasure` and integration on ℕ.

Build a reusable Poisson-convergence theorem for probability laws `ν_n` on `ℕ`.
Assume every descending-factorial moment is finite and

    ∫ (x)_k dν_n(x) → λ^k  for every k ∈ ℕ,  λ ≥ 0.

Prove convergence of each point mass to the native Poisson mass
(`poisson_pointMass_limit_of_factorial_moments`)
`e^(-λ) λ^j / j!`, convergence in distribution and total variation convergence
(`poisson_totalVariation_limit_of_factorial_moments`).
The proof can use finite Bonferroni bounds for `Pr(X = j)` followed by the exponential
series; provide those finite bounds and their hypotheses as reusable lemmas.
For total variation use the countable discrete formula
`½ Σ_j |ν_n{j} - Poisson(λ){j}|`.
Handle `λ = 0`.

Bollobás (*Random Graphs*, Theorems 1.21–1.22, pp. 25–26) proves the criterion: convergence of
every factorial moment to that of a limit whose factorial moments satisfy a growth condition gives
convergence in distribution, and for Poisson laws of bounded mean the total-variation distance tends
to zero.

This convergence criterion is a target here. Defining the Poisson law in
StandardDistributions does not discharge it. Use native `Nat.descFactorial`,
`ProbabilityTheory.poissonMeasure`, integration and convergence notions.
State it in a general probability module for laws on `ℕ`, not in a random-graph
namespace; 11.2 and 11.3 are its consumers here. A point-process factorial-moment-measure
criterion with a uniform local exponential-moment bound, or a Grigelionis theorem with
independence within each array row, does not discharge it: the hypothesis here is only
convergence of each fixed factorial moment. The sparse
triangle counts of 11.2 need the weaker hypothesis: the complete-graph event gives
`E[a^(T_n)] ≥ a^C(n,3) p_n^C(n,2) → ∞` for every `a > 1` when
`n p_n → c > 0`.

### 11.2 Sparse triangles

*Needs:* 0.2; 11.1; Mathlib `cliqueFinset`.

Count triangles using the native finite clique API: one unordered three-element clique
is one triangle, so there is no factor-of-six ambiguity.
For any `p_n ∈ [0, 1]` with `n p_n → c ≥ 0`, prove, for the clique count `triangleCount`,

    T_n → Poisson(c³/6)  in law.

Prove the factorial-moment limits `(c³/6)^k` (`triangle_factorialMoment_limit`) and the
Poisson point-mass limits (`triangle_poisson_mass_limit`). Expand each factorial moment as an
ordered list of distinct triangle copies.
The disjoint contribution is
`(n)_{3k} p_n^{3k} / 6^k`.
Bound the remaining intersection types: every connected component of a union of
triangles has at least as many edges as vertices, and a component containing two
distinct triangles has strictly more. Thus any overlapping list has total `e - v ≥ 1`,
and the overlap contribution tends to zero. Make this finite classification/counting bound an
explicit lemma, not a probabilistic independence assumption for overlapping copies. This
calculation is a derivation from the clique count and the edge/vertex bound above, not a cited
theorem. Bollobás's Theorem 4.1 (p. 79) is the Poisson limit for copies of a fixed strictly
balanced graph at its threshold, and his Corollary 4.9 (p. 83) the cycle case at `p ~ c/n`. Erdős
and Rényi (*On the evolution of random graphs*, §3, Theorem 3a, p. 34) prove the cycle case in the
model with a fixed number `N(n) ~ cn` of edges: the number of cycles of order `k` has the Poisson
limit of mean `(2c)^k/(2k)`. With `n p_n → c` the expected number of edges is about `c n/2`, so
for triangles this mean is `c³/6`, as here.

Construct the actual rank-`3` triangle sentence (`triangleSentence`) and identify its
satisfaction with `T_n > 0` (`satisfies_triangleSentence`). Derive
(`sparse_triangle_sentence_limit`)

    Pr(G(n, p_n) contains a triangle) → 1 - e^(-c³/6).

For `c > 0` this lies strictly between `0` and `1`. Instantiate an everywhere-valid
parameter sequence, for example `p_n = min(1, c/(n + 1))`, and state its asymptotic
equivalence to the usual `c/n` regime.

### 11.3 A graphon whose infinite sample is Rado but finite FO zero–one fails

*Needs:* 9.2; 11.1.

Use the explicit graphon `W(x, y) = xy` (`productGraphon`) on the uniform unit interval. Its
infinite sample is almost surely Rado by 9.2 (`productGraphon_ae_isomorphic_rado`). Let `Z_n` count
isolated vertices of its finite sample. Prove

    Z_n → Poisson(2)  in law.

Ground this in the exact factorial-moment formula, for `n ≥ k`,

    E[(Z_n)_k] = (n)_k ∫_{[0,1]^k} (∏_{i<j} (1 - x_i x_j))
                             (∫₀¹ ∏_{i=1}^{k} (1 - x_i y) dy)^(n-k) dx̄.

For `k ≥ 1`, substitute `u_i = n x_i` and work on the fixed nonnegative orthant
`[0, ∞)^k`, extending the integrand by zero there outside `[0, n]^k`.
Retain the prefactor `(n)_k / n^k → 1`, which lies in `[0, 1]`, and prove pointwise
convergence of the rescaled integrand to `exp(-Σ_i u_i / 2)`.
For `n ≥ 2k`, the bound

    ∫₀¹ ∏_i (1 - x_i y) dy ≤ 1 - (Σ_i x_i) / (2k)

gives the integrable dominator `exp(-Σ_i u_i / (4k))` after scaling. Thus the moment limit is `2^k`
(`productGraphon_isolated_factorialMoment_limit`), and 11.1 applies
(`productGraphon_isolated_poisson_mass_limit`). Prove the `k = 0` case separately. As an elementary
check, `E Z_n = 2(1 - 2^(-n))` for every `n`, with values `0, 1, 3/2, 7/4` at `n = 0, 1, 2, 3`. At
`n = 0` the sum over vertices is empty and both sides are `0`. For `n ≥ 1` a vertex with label `x`
is isolated with conditional probability `(1 - x/2)^(n-1)`, so
`E Z_n = n ∫₀¹ (1 - x/2)^(n-1) dx = 2(1 - 2^(-n))`.

Construct the FO sentence `∀x ∃y Adj(x, y)` (`noIsolatedSentence`, satisfied exactly when the
isolated-vertex count `isolatedCount` is `0`, by `satisfies_noIsolatedSentence`) and derive
(`productGraphon_noIsolated_limit`)

    Pr(G(n, W) ⊨ ∀x ∃y Adj(x, y)) → e^(-2),

while its probability on the infinite sample is `1`.
This gives a concrete failure of finite FO zero–one for a fixed graphon with an
ergodic infinite law concentrated on the Rado isomorphism class. It also explains why
the uniform lower/upper bounds in the finite graphon theorem do mathematical work.

**Checks** (`triangleSentence` and `triangleCount`).

- The sentence fails in `K₂` and holds in `K₃`; its rank is `3`.
- The counts on `K₂`, `K₃` and `K₄` are `0`, `1` and `4`; ordered embeddings would give `0`, `6`
  and `24`.
- The sentence holds exactly when the count is positive, on each of these graphs.

**Checks** (`noIsolatedSentence` and `isolatedCount`).

- The sentence holds on `Fin 0`, fails in `K₁` and holds in `K₂`; its rank is `2`.
- The counts on `Fin 0`, `K₁`, `K₂` and the edgeless graph on `Fin 2` are `0`, `1`, `0` and `2`.
- The sentence holds exactly when the count is `0`, on each of these graphs.

**Checks** (`productGraphon`).

- Its values at `(0, 1)`, `(1, 1)` and `(1/2, 1/2)` are `0`, `1` and `1/4`.
- It is symmetric.
- It takes values in `[0, 1]`, and `0 < xy < 1` off a null set.

### Examples

- With `λ = 0` the Poisson law is the point mass at `0`; the Bernoulli laws with parameter `1/n`
  satisfy the factorial-moment hypotheses and are at total-variation distance `1/n` from it.
- For `c = 0` and `c = 1` the triangle limits are `0` and `1 - e^(-1/6) ≈ 0.1535`.
- For the graphon `xy`, the factorial-moment limits at `k = 0, 1, 2` are `1, 2, 4`, and the
  no-isolated-vertex limit is `e^(-2) ≈ 0.1353`, while the infinite sample satisfies the
  sentence with probability `1`.

### Dependencies

Layers 0, 6 and 9; Mathlib's `Nat.descFactorial`, `ProbabilityTheory.poissonMeasure`,
`cliqueFinset` and integration on `ℕ` and on `[0, 1]^k`.

## Out of scope

The general theories of atomic models, definitional expansions, effective Fraïssé
constructions, and invariant-measure existence for arbitrary isomorphism classes are outside
this roadmap. So are the AFP characterization, Shelah–Spencer laws, general sparse FO
convergence laws, Hamiltonicity thresholds and the uniform distribution on unlabeled graphs.
The finite probability model here is the native labeled binomial model. The full extension
predicate and the Rado graph belong to the InfinitaryLogic worked example in Tau Ceti; the
decoding identity of the graph coding, and the measurability of Lω₁ω sentence events on
`SimpleGraph ℕ`, belong to CountableStructureSpaces; the primitive-recursive syntax of the group
language belongs to FreeGroupsAndLimitGroups.

## Completion criteria

Each introduced definition comes with its basic rewriting, transport and boundary-case
API and the stated examples. The headline theorems are assembled using these APIs,
without additional hypotheses asserting completeness, extension adequacy, independence,
measurability or Poisson convergence that the roadmap is meant to prove.

The following chains must be visible in the exported results:

- Representative HP/JEP/AP → served extension requests → direct-limit extension →
  native Fraïssé limit → rooted comparison.
- Native binomial law → finite edge independence → witness-count law → explicit
  extension bound → bounded-rank truth agreement → FO limit and joint eventual truth.
- Native first-order syntax → measurable realization → graph relabeling invariance →
  existing ergodicity/mixture law → graph-specific zero–one and mixture evaluations.
- Native clique/isolated-vertex counts → factorial-moment formulas → proved Poisson
  criterion → the two explicitly stated nontrivial FO limits.

Examples must instantiate the final interfaces. A theorem proved for a privately
redefined measure, graph language, graph embedding, or Fraïssé predicate does not
discharge its corresponding target.

## Coordination and provenance

Use Mathlib's existing and emerging API shape. Follow the design of the general existence
construction in
[Gabin Kolly's Fraïssé-existence proposal for Mathlib](https://github.com/leanprover-community/mathlib4/pull/18876)
and [its prerequisite](https://github.com/leanprover-community/mathlib4/pull/18749), and of the
graph characterization of Layer 4 in his
[graph-characterization proposal](https://github.com/leanprover-community/mathlib4/pull/20649).
Coordinate the theory-level quantifier-elimination endpoint with the
[quantifier-elimination proposal](https://github.com/leanprover-community/mathlib4/pull/41113) and
its [extension-pair companion](https://github.com/leanprover-community/mathlib4/pull/41115). These
are design and provenance references, not assumptions that their code is in Mathlib.

**Ownership of the formula coding.** This roadmap owns the general effective coding of first-order
formulas in 5.2; no other roadmap states one for a general language.
[FreeGroupsAndLimitGroups §3.1](../FreeGroupsAndLimitGroups/README.md#31-the-language-of-groups-and-its-coefficient-extensions)
specifies a coding on the same Mathlib list encoding for the group language with coefficient
constants, with codes that carry the number of bound variables, and claims primitive recursiveness
of its validity test and of substitution, renaming, connectives, quantifiers and prenex forms. That
development stays there and is cited, not restated. The interface here is stated for every
effectively presented language, so it applies to that language as well (which has function
symbols, so its terms are not variables), and the graph coding of 5.2 is its instance at the graph
language. Mathlib's `ModelTheory/Encoding.lean` lists `Primcodable` instances for terms and formulas
and computability facts about their operations as future work; when they land, Mathlib's
declarations replace the corresponding ones here.

The graph-specific pattern representation, quantifier-elimination map and decision procedure of
5.2 stay in this roadmap.

On the Tau Ceti side, the extension predicate and Rado graph come from the InfinitaryLogic
random-graph worked example (`Combinatorics/SimpleGraph/ExtensionProperty.lean` and
`ModelTheory/Scott/RandomGraph.lean`);
this roadmap's targets consume those declarations rather than restating them.
The required mathematics is built in Tau Ceti against its dependencies. Equivalent
Mathlib declarations replace duplicate Tau Ceti declarations when they become available.
Opening an upstream PR is not a target of this roadmap.

The following existing formalizations are secondary source material. Their module
boundaries and private scheduling representations are not the specification.

| Source | Relevant mathematics |
| --- | --- |
| [CMT classical umbrella](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/Classical.lean) | Classical material independent of the effective layer |
| [RepresentativeAge](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/RepresentativeAge.lean) | Isomorphism closures and representative factorization |
| [ExtensionRichDirectLimit](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/ExtensionRichDirectLimit.lean) | Extension squares, stage factorization and direct-limit criteria |
| [FraisseExistence](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/FraisseExistence.lean) | Scheduled construction and the native general existence theorem |
| [RootedExtension](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/RootedExtension.lean) | Literal rooted embedding/isomorphism equations |
| [ExtensionRichFamily](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/ExtensionRichFamily.lean) | Extension-rich families of substructures and their equivalence with ultrahomogeneity |
| [OrbitIsolation](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/OrbitIsolation.lean) | Isolation from actual first-order orbit formulas |
| [CountablePrime](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/CountablePrime.lean) | Elementary embeddings of a countable atomic model into models of its complete theory |
| [NamedParameters](https://github.com/cameronfreer/computable-model-theory/blob/main/ComputableModelTheory/ModelTheory/NamedParameters.lean) | Expansions by named finite tuples, for the parameter-retaining primeness forms |
| [VC RootedIso](https://github.com/cameronfreer/vaught-conjecture-counterexample/blob/main/VaughtConjecture/Comparison/RootedIso.lean) | Selected-family rooted back-and-forth, for the separate InfinitaryLogic API extension |

Coordinate with source authors before integrating their code, following the repository's
porting policy and applicable licenses. Independent proofs still cite relevant design
work. No unmerged mathlib branch or external formalization is a runtime dependency.

## Downstream consumers

No roadmap on main, and none of the sibling roadmaps InfinitaryModelExistence,
CountableStructureSpaces, BorelEquivalenceRelations, CountableModelCounting and HanfNumbers,
consumes a target of this roadmap. CountableStructureSpaces mentions the Rado graph only through
Tau Ceti's InfinitaryLogic declarations.

## Mathematical references

- R. Fagin,
  [Probabilities on finite models](https://homepages.math.uic.edu/~lreyzin/s15_mcs590/fagin76.pdf),
  *Journal of Symbolic Logic* 41 (1976), 50–58: finite-model zero–one laws, finite consequences and
  rates, for all structures over a finite set of predicate symbols under the uniform measure.
  Theorem 1 (p. 51) is Gaifman's completeness of the extension axioms, by the Łoś–Vaught test and
  back-and-forth; Theorem 2 and Corollary 3 (p. 52) give the limit law for each axiom and for its
  consequences; Corollary 5 (p. 53) gives finite models of every sufficiently large cardinality for
  each finite set of axioms. The theorems here are the corresponding statements for undirected
  loopless graphs, proved by the same route, and cover every fixed interior binomial parameter.
- J. Spencer, *The Strange Logic of Random Graphs*, Algorithms and Combinatorics 22,
  Springer, 2001. Theorem 0.1.2 (p. 4) is the Fagin–GKLT law at `p = 1/2` and Theorem 0.1.5
  (p. 6) the uniqueness of the countable graph with the extension ("Alice's Restaurant")
  property; §1.3 (p. 17) introduces extension statements over rooted graphs. Definition 2.3 and
  Theorem 2.2.3 (p. 31) show that graphs with the `k`-extension property form one `(k + 1)`-round
  Ehrenfeucht class, the source of the `EP_{≤d}`/rank-`(d + 1)` indexing of
  Layer 5; Theorems 2.3.1–2.3.2 (p. 32) relate Ehrenfeucht values to quantifier depth, with
  designated vertices for the rooted form. Theorems 9.1.3–9.1.4 (p. 122) are the dense
  varying-parameter laws: the fixed-rank condition of 7.2 is weaker than the hypothesis of
  Theorem 9.1.3, and the all-rank condition is equivalent to that of Theorem 9.1.4.
- B. Bollobás, *Random Graphs*, 2nd ed., Cambridge Studies in Advanced Mathematics 73,
  Cambridge University Press, 2001.
  Theorems 1.21–1.22 (pp. 25–26) give Poisson convergence from convergence of factorial moments,
  the criterion of 11.1. Theorem 4.1 (p. 79) gives the Poisson limit for copies of a fixed
  strictly balanced graph at its threshold, and Corollary 4.9 (p. 83) the cycle case at
  `p ~ c/n`; for triangles this is the `Poisson(c³/6)` limit of 11.2.
- W. Hodges, *Model Theory*, Encyclopedia of Mathematics and its Applications 42, Cambridge
  University Press, 1993, §7.1. Theorem 7.1.2 (p. 326) is Fraïssé's theorem: for a countable
  signature, a nonempty finite or countable set of finitely generated structures with HP, JEP
  and AP has a limit of cardinality at most `ℵ₀` with that age, ultrahomogeneous and
  unique up to isomorphism; Theorem 7.1.7 (p. 329) is its converse. Lemma 7.1.6 and the chain
  construction (1.8) (pp. 328–329) correspond to Layer 2. Lemmas 7.1.3–7.1.4
  (pp. 326–327) extend a prescribed embedding of a finitely generated substructure to an
  embedding or isomorphism, the rooted statements of Layer 3, for structures that are at
  most countable. Layers 2 and 3 assume less: existence uses countability of the function
  symbols only and proceeds through representative families, and the rooted embedding allows a
  target of any cardinality; the constructions specified there supply these variants.
- P. J. Cameron, [The random graph](https://arxiv.org/abs/1301.7544), arXiv:1301.7544v1
  (2013). Property (∗) and Facts 1–2 (pp. 1–2: almost-sure extension for each fixed edge
  probability in `(0,1)`, and countable uniqueness); Rado's binary presentation (p. 3);
  universality, Proposition 6 (p. 6); homogeneity, Proposition 9 (p. 7); the finite graphs as a
  Fraïssé class with limit `R`, Theorem 3 and the following paragraph (p. 8); countable
  categoricity, Proposition 11 (p. 9); truth in `R`, consequence of the extension axioms and
  the uniform finite limit law, Theorem 6 (p. 10).
- P. Erdős and A. Rényi,
  [On the evolution of random graphs](https://www.renyi.hu/~p_erdos/1960-10.pdf),
  *Publ. Math. Inst. Hung. Acad. Sci.* 5 (1960), 17–61: classical sparse small-subgraph
  asymptotics. §3, Theorem 3a (p. 34) is the Poisson limit, of mean `(2c)^k/(2k)`, for the number
  of cycles of order `k` in the model with `N(n) ~ cn` edges chosen uniformly. The native model
  and normalization in this roadmap are specified in 11.2, which derives the binomial case
  independently.
- The linked Mathlib Fraïssé, order, semantics and probability files fix the formal
  conventions. The displayed estimates and factorial-moment calculations give the
  precise proof obligations for the quantitative and graphon comparison targets.
