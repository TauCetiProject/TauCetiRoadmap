# Roadmap: random graphs, Fraïssé limits, and first-order asymptotic laws

Develop the classical Fraïssé construction and the probability/model-theory interfaces that
identify the first-order asymptotic theory of binomial random graphs with the theory of the
Rado graph. The development includes quantitative bounds, rooted formulas, almost-sure
stabilization on joint samples, and precise comparisons with graphon sampling and sparse graphs.

The principal theorem is the graph case of the Glebskii–Kogan–Liogon'kii–Talanov/Fagin
zero–one law. For every fixed $`p\in(0,1)`$ and every sentence $`\varphi`$ in the first-order
language of simple graphs,

```math
\lim_{n\to\infty}\Pr(G(n,p)\models\varphi)
=\mathbf 1_{\{R\models\varphi\}},

```

where $`R`$ is a constructed Rado graph. A finite extension property gives a uniform error
bound for all sentences of each fixed quantifier rank. Its summability yields eventual
agreement with $`R`$ almost surely under any joint realization of the prescribed finite laws.

The reusable material is part of the specification: representative families and their ages;
extension-rich chains and direct-limit factorization; rooted embeddings and isomorphisms;
finite edge patterns and witness counts; actual first-order extension sentences; finite-rank
truth preservation; and measurable satisfaction events.

## Scope and dependency order

Every milestone below is required. The scope includes general classical Fraïssé existence
with function symbols, graph-specific quantifier elimination and primeness, the fixed and
varying-parameter binomial models specified below, uniformly nondegenerate graphons, and the
two explicit Poisson examples in Milestone 11.

| Milestone | Construction and endpoint | Inputs |
| --- | --- | --- |
| 0 | Native graph, language, finite-pattern and satisfaction interfaces | Mathlib graph/model-theory/measure APIs |
| 1 | Representative families, ages and separate ordinary/strong amalgamation | Mathlib Fraïssé predicates; 0 for graph examples |
| 2 | Extension-rich chains and general Fraïssé existence | 1; Mathlib direct limits |
| 3 | Rooted universality and uniqueness; finite, empty and rational-order examples | 1–2; Mathlib partial equivalences and order theory |
| 4 | Extension axioms, a concrete Rado graph and its Fraïssé identification | 0–3 |
| 5 | Finite rank, EF truth preservation, complete Rado theory, QE and graph-specific primeness | 4; InfinitaryLogic finite games/back-and-forth |
| 6 | Exact witness laws and quantitative extension-failure bounds | 0, 4; native Bernoulli/binomial probability |
| 7 | Finite FO limits, uniform rank bounds and joint almost-sure stabilization | 5–6; Borel–Cantelli |
| 8 | Rooted logical limits and worked asymptotic graph properties | 3–7; native connectivity/clique APIs |
| 9 | Infinite random graphs, graphon compatibility and invariant-event laws | 0, 4–7; DenseGraphLimits and Exchangeability |
| 10 | Actual infinitary comparison and nonconvergence examples | 4, 7, 9; InfinitaryLogic syntax |
| 11 | A reusable Poisson criterion; sparse triangles and a graphon FO counterexample | 0, 6, 9; finite counting, integration, native Poisson law |

The general theories of atomic models, definitional expansions, effective Fraïssé
constructions, and invariant-measure existence for arbitrary isomorphism classes are outside
this roadmap. So are the AFP characterization, Shelah–Spencer laws, general sparse FO
convergence laws, Hamiltonicity thresholds and the uniform distribution on unlabeled graphs.
The finite probability model here is the native labeled binomial model.

## Conventions

1. **Graphs and maps.** Use `SimpleGraph V`, `G.comap f`, induced graph embeddings and graph
   isomorphisms. An embedding preserves and reflects adjacency. Ordinary graph homomorphisms
   do not serve as embeddings in ages or amalgamation squares.
2. **Probability.** Use `SimpleGraph.binomialRandom V p` with `p : unitInterval`.
   Probability-law identities on a general carrier assume it is countable. The finite
   carrier is `Fin n`, including `n = 0`; the infinite carrier is `ℕ`.
   Keep the full parameter interval for the law and elementary identities. Assume $`0\lt p\lt 1`$
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
5. **Extension budgets.** For disjoint finite vertex sets $`U,V`$, an extension witness is
   outside $`U\cup V`$, adjacent to all of $`U`$ and to none of $`V`$.
   Write $`\mathrm{EP}_{\le d}(G)`$ for the assertion that every such request with
   $`|U|+|V|\le d`$ has a witness. The empty request is included, so
   $`\mathrm{EP}_{\le0}`$ means that the vertex carrier is nonempty.
   Write $`\mathrm{EP}(G)`$ for the property with no bound on the finite request.
6. **Rank.** First-order quantifier rank is natural-valued: atoms and falsum have rank $`0`$,
   implication takes the maximum, and a quantifier increases rank by $`1`$. Derived Boolean
   connectives have the corresponding maximum rule.
   $`\mathrm{EP}_{\le d}`$ suffices for agreement on sentences of rank at most $`d+1`$.
7. **Two probability notions.** “Asymptotically almost surely” means a sequence of finite-law
   probabilities tends to $`1`$. An almost-sure assertion involving all sample sizes explicitly
   names a common probability space and random graphs on that space.
8. **Invariant events.** State invariance under finitely supported permutations when using
   the ergodic array API. First-order sentence satisfaction is invariant under all
   permutations. Natural-initial-window density events need only have the former invariance.

## Existing library and ownership

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
| [Tau Ceti `ModelTheory/RelationalConfiguration/ModelsOf.lean`](https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/ModelTheory/RelationalConfiguration/ModelsOf.lean) and [`Combinatorics/SimpleGraph/RelationalConfiguration.lean`](https://github.com/TauCetiProject/TauCeti/blob/2fd255d997f47c0b5d834ee416c7015d55444ce5/TauCeti/Combinatorics/SimpleGraph/RelationalConfiguration.lean) at `2fd255d99` | `TauCeti.RelationalConfiguration.measurableSet_setOf_realize`: on a countable carrier, the configurations realizing an infinitary formula with countable branching, at fixed free- and bound-variable assignments, form a measurable set; `RelationalConfiguration.toStructure_ofStructure`; the graph coding `SimpleGraph.toRelationalConfiguration` with `SimpleGraph.measurable_toRelationalConfiguration` and, on a countable carrier, `SimpleGraph.measurableEmbedding_toRelationalConfiguration`. Their pullback is the fixed-assignment graph event of 0.3 |
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
`SimpleGraph.sameAtomicType_iff` and `SimpleGraph.Iso.toLanguageEquiv`.
Milestone 5 adds the natural-valued first-order rank and its finite-rank realization bridge to
these shared APIs; it does not introduce another game or back-and-forth relation.

The full extension predicate and the Rado graph belong to the InfinitaryLogic worked example;
this roadmap consumes them and does not maintain a second extension predicate or Rado graph.
Its additions on that side are bounded extension $`\mathrm{EP}_{\le d}`$, witness-count
interfaces, actual first-order extension sentences, the general Fraïssé construction with its
rooted consequences, computable quantifier elimination, and the probabilistic theory.

The following Mathlib proposals fix the shape of corresponding targets here. They are built in
Tau Ceti now, named and stated as these proposals do, and replaced by Mathlib's declarations
when equivalents land.

- The [graph-characterization proposal](https://github.com/leanprover-community/mathlib4/pull/20649):
  the graph-language extension property `FirstOrder.Language.graph.ExtensionProperty`,
  `ExtensionProperty.embedding_from_countable`, and
  `ExtensionProperty.isFraisseLimit_finite_graphs`, identifying a countable structure with the
  property as the Fraïssé limit of finite simple graphs (Milestone 4).
- The [quantifier-elimination proposal](https://github.com/leanprover-community/mathlib4/pull/41113):
  `FirstOrder.Language.Theory.IsQFEquivalent` and `Theory.HasQuantifierElimination`, with the
  reduction to finite variable types; its
  [extension-pair companion](https://github.com/leanprover-community/mathlib4/pull/41115)
  derives quantifier elimination from extension pairs (Milestone 5).

Graph-specific adapters and probabilistic consequences belong here. Generic samplers,
representation theorems and general EF machinery retain their existing owners.
Each implementation consumes the narrow supplier it needs, not an entire supplier roadmap.

## Milestone 0 — Native graph and logical probability interfaces

*Needs:* Mathlib `SimpleGraph.binomialRandom` with its Bernoulli-product presentation, the graph
language and structure adapters, bounded formulas and realization; Tau Ceti
`SimpleGraph.Iso.toLanguageEquiv`, the measurable structure of
`TauCeti.Combinatorics.SimpleGraph.Measurable`, `TauCeti.RelationalConfiguration.measurableSet_setOf_realize`,
`SimpleGraph.measurableEmbedding_toRelationalConfiguration` and `BoundedFormula.realize_toInf`.

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

For disjoint finite sets $`A,B`$ of unordered, non-diagonal vertex pairs, prove

```math
\Pr(A\subseteq E(G),\ B\cap E(G)=\varnothing)
=p^{|A|}(1-p)^{|B|}.

```

Give its edge-coordinate independence formulation, including groups of coordinates on
disjoint sets of pairs. Prove that restriction along an injective map has the smaller native
binomial law. Include relabeling, complement ($`p\mapsto1-p`$), disjoint induced restrictions,
and exact probabilities of any prescribed finite induced graph. Empty patterns, zero or one
vertex, and $`p=0,1`$ are required examples.

Use the native Bernoulli-product and finite-graph point-mass results to prove these laws.
Do not introduce a second random-graph measure.

### 0.3 Satisfaction as an event

Give the countable vertex carrier its discrete measurable structure and the finite
assignment spaces their product measurable structures.

At fixed assignments the graph event belongs to Tau Ceti and is not restated here. For a
countable carrier `V`, a graph formula `φ` and fixed free- and bound-variable assignments, the
set of graphs `G` whose structure `G.structure` realizes `φ` there is the preimage, under the
measurable map `SimpleGraph.toRelationalConfiguration` (`SimpleGraph.measurable_toRelationalConfiguration`;
a measurable embedding by `SimpleGraph.measurableEmbedding_toRelationalConfiguration`), of the
configuration event of `BoundedFormula.toInf φ`. That event is measurable by
`TauCeti.RelationalConfiguration.measurableSet_setOf_realize`, which covers every infinitary
formula with countable branching, and `BoundedFormula.realize_toInf` with
`RelationalConfiguration.toStructure_ofStructure` identifies the two realizations. The sentence
events used by the satisfaction probabilities below are the case of empty assignments. On `ℕ`,
the event of `∃x∃y Adj(x,y)` is the countable union over pairs `u ≠ v` of the cylinders
`{G | G.Adj u v}`.

The target here is joint measurability. For a fixed graph formula with finitely many free
variables, prove that realization is measurable on the product of the graph space with the
free- and bound-variable assignment spaces (`measurableSet_realize_jointly`). From the
fixed-assignment events this is a countable union over the assignments, each term a measurable
rectangle with a singleton; it needs measurable singletons in the product structure on the
assignment spaces, and countability of the carrier alone is not a substitute for that
structure. Prove invariance of the events under graph isomorphism and relabeling.

Define the finite satisfaction probability directly by evaluating
`binomialRandom (Fin n) p` on the native realization event. Expose real and `ℝ≥0∞`
forms, bounds in $`[0,1]`$, negation/complement, finite Boolean combinations, and restriction
transport of the law. Distinguish these event identities from any unsupported claim that
satisfaction itself commutes with restriction.

**Connections.** These interfaces supply both the extension-axiom probabilities and the
graphon mixture evaluations. The graph-language adapters also identify the age of the Rado graph.

## Milestone 1 — Representative families and amalgamation

*Needs:* Mathlib `age`, `Hereditary`, `JointEmbedding`, `Amalgamation`, `IsFraisse` and the
quotient-by-isomorphism convention; Milestone 0 for the finite-graph free amalgam.

For a family $`F_i`$ of actual finitely generated structures, define its isomorphism closure
$`\{A:\exists i,\ A\cong F_i\}`$. Prove membership, reindexing, duplicate-representative
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

**Examples.** Finite sets of size at most $`m`$ have ordinary AP.
For $`m\ge1`$ they need not have strong AP: two $`m`$-element extensions of a common
$`(m-1)`$-element root cannot have disjoint new images in an $`m`$-element amalgam.
This example pins the distinction; the class at $`m=0`$ consists of empty structures.

## Milestone 2 — Extension-rich chains and Fraïssé existence

*Needs:* Milestone 1; Mathlib direct limits, `DirectLimit.exists_fg_substructure_in_Sigma`,
`age_directLimit` and `IsFraisseLimit` with its uniqueness.

### 2.1 Chains, factorization and extension requests

Use sequences of embeddings and Mathlib's direct limits. Supply transition, canonical-map,
composition and range lemmas. That every finitely generated substructure of the direct limit
lies in a stage image is Mathlib's `FirstOrder.Language.DirectLimit.exists_fg_substructure_in_Sigma`;
use it rather than restating it. Prove that an embedding from a finitely generated
structure factors through a stage with the literal equation

```math
\iota_i\circ g=e.

```

Identify the age of the direct limit with the union of the stage ages, reusing
`age_directLimit`. Derive countability from countable stages.

An extension request consists of a stage $`D_i`$, a finitely generated target $`B`$ in the
representative class, and an embedding $`f:D_i\hookrightarrow B`$. A sequence serves the
request when some $`j\ge i`$ admits $`g:B\hookrightarrow D_j`$ with

```math
g\circ f=d_{i,j}.

```

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
native `IsFraisse`:

```lean
theorem exists_isFraisseLimit_of_isFraisse
    [Countable (Σ n, L.Functions n)]
    (K : Set (Bundled.{w} L.Structure))
    [IsFraisse K] :
    ∃ (M : Bundled.{w} L.Structure) (_ : Countable M),
      IsFraisseLimit K M
```

Combine this with existing necessity and uniqueness. Supply infinitude when the class
contains arbitrarily large finite subsets of its members, and the resulting transport
of an infinite countable limit to `ℕ`. The existence theorem itself adds neither
`Infinite M` nor `Nonempty M`.

**Generality examples.** In the language of successor and predecessor, the structure on
$`\mathbb Z`$ is generated by $`\{0\}`$ and has an infinite carrier. Verify this and use it as a
root/factorization example. The finite-set examples from Milestone 1 verify finite and empty
limits without encoding them into an infinite carrier.

## Milestone 3 — Rooted extension, universality and comparison

*Needs:* Milestones 1–2; Mathlib `IsExtensionPair`, `embedding_from_cg`, `equiv_between_cg`, and
for the examples `isFraisse_finite_linear_order` and `isFraisseLimit_of_countable_nonempty_dlo`.

Given a finitely generated root $`A`$ and actual embeddings
$`a_M:A\hookrightarrow M`$, $`a_N:A\hookrightarrow N`$, prove the rooted forms of
Mathlib's countably-generated back-and-forth construction.

- If $`M`$ is countably generated and $`M,N`$ form an `IsExtensionPair`, produce
  $`e:M\hookrightarrow N`$ with $`e\circ a_M=a_N`$.
- With countable generation of $`N`$ and the reverse extension property, produce an
  isomorphism with the same equation.

The supplied root is the initial partial isomorphism. Keep it in the conclusion; do not
replace it by the unrooted assertion that some isomorphism exists. Do not assume an empty
partial isomorphism exists in languages with incompatible constants or nullary facts.

Derive extension-pair criteria from age inclusion and extension of representative
embeddings. Export rooted universality for every countably generated source whose age
is contained in the class. Its target need not be countable. Derive rooted uniqueness of
two Fraïssé limits, and finite-tuple versions with exact evaluation equations.

**Worked examples.**

1. Recover the `Fin m` limits and extend prescribed injections/bijections over finite roots.
2. Instantiate the new representative and rooted APIs for finite linear orders and
   $`(\mathbb Q,\lt )`$. Compare with Mathlib's existing
   `isFraisse_finite_linear_order` and `isFraisseLimit_of_countable_nonempty_dlo`.
3. Use an arbitrary finite induced graph as a prescribed root in the Rado applications
   of Milestones 4, 5 and 8.

The selected-family rooted strengthening of `PotentialIso` is a separate extension of
the InfinitaryLogic API. These Fraïssé targets use the stated `IsExtensionPair`
theorems and do not assume that strengthening as an unstated supplier.

## Milestone 4 — Graph extension axioms and the Rado graph

### 4.1 Combinatorial and syntactic extension

*Needs:* Milestone 0; Tau Ceti `SimpleGraph.HasExtensionProperty`,
`SimpleGraph.HasExtensionProperty.exists_adj_iff` and `SimpleGraph.Iso.toLanguageEquiv`.

Define the witness predicate and $`\mathrm{EP}_{\le d}`$ by their actual finite-set
conditions. Full extension $`\mathrm{EP}`$ is the canonical `SimpleGraph.HasExtensionProperty`.
That predicate omits the condition that the witness lies outside $`U`$, which adjacency to every
vertex of $`U`$ already forces in a loopless graph; prove
$`\mathrm{EP}\iff\forall d,\ \mathrm{EP}_{\le d}`$ against it. Give monotonicity in the bound,
isomorphism and complement transport, restriction of requests, and avoidance of an additional
prescribed finite set. The supplier's `SimpleGraph.HasExtensionProperty.exists_adj_iff`
(`Combinatorics/SimpleGraph/ExtensionProperty.lean`) gives one witness outside a listed tuple.
Prove that full extension supplies arbitrarily many distinct witnesses for every request, and conclude `HasExtensionProperty.infinite`: the carrier is infinite.

Prove the adapter between the graph-facing and graph-language forms: under
`SimpleGraph.structure`, `G.HasExtensionProperty` holds exactly when the graph-language
extension property holds, stated as `FirstOrder.Language.graph.ExtensionProperty` in the
graph-characterization proposal (a witness outside $`A\cup B`$ related by the adjacency symbol to all of $`A`$
and none of $`B`$). Give `FirstOrder.Language.Equiv.toSimpleGraphIso`, the converse of Tau Ceti's
`SimpleGraph.Iso.toLanguageEquiv`, and transport both across it.

Construct an actual first-order sentence $`E_{r,s}`$ asserting extension for every
injectively listed $`(r+s)`$-tuple, with the first $`r`$ entries positive and the last $`s`$
negative. Prove its realization equivalence with the finite-set condition, in both
directions. All coordinates are pairwise distinct in its antecedent; the witness is
distinct from all of them. Include $`r=0`$, $`s=0`$, and $`r=s=0`$.

Construct the finite conjunction expressing $`\mathrm{EP}_{\le d}`$ and prove the
correspondence. Expose reordering and permutation of the positive and negative tuples.
No probabilistic theorem may take this semantic correspondence as an unproved parameter.

**Checks.** On `Fin 0` budget `0` fails: the empty request has no witness. On `K₁` budget `0`
holds and budget `1` fails, since the request with one positive vertex has no neighbour to use.
On the 4-cycle budget `1` holds and budget `2` fails: two adjacent vertices have no common
neighbour. On `K₁`, `E_{0,0}` holds while `E_{1,0}` and `E_{0,1}` fail; `E_{0,1}` fails only
because the witness must differ from the listed vertex.

### 4.2 Existence and identification

*Needs:* 4.1; Milestones 1–3; Tau Ceti `TauCeti.radoGraph`,
`TauCeti.hasExtensionProperty_radoGraph`, `SimpleGraph.HasExtensionProperty.isExtensionPair`,
`SimpleGraph.HasExtensionProperty.nonempty_iso` and `TauCeti.nonempty_iso_radoGraph_iff`.

Prove that the class of all finite simple graph structures is Fraïssé using Milestone 1.
Construct its limit using Milestone 2 and prove that it satisfies $`\mathrm{EP}`$. Conversely,
a countable graph with $`\mathrm{EP}`$ has this age and is ultrahomogeneous, hence is the same
Fraïssé limit. State this converse as `ExtensionProperty.isFraisseLimit_finite_graphs` of the
graph-characterization proposal, together with `ExtensionProperty.embedding_from_countable`, and
transfer both to `SimpleGraph` through the adapter of 4.1.

Cameron (*The random graph*, Theorem 3 and the paragraph after it, p. 8) states that the finite
graphs form a Fraïssé class with limit $`R`$. His Theorem 3 is for relational languages, with
joint embedding as amalgamation over the empty structure; Mathlib's `IsFraisse` also asks for a
nonempty class, which the empty graph supplies.

The named graph $`R`$ is the supplier's `TauCeti.radoGraph`, defined by
`SimpleGraph.fromRel fun i j => j.testBit i`, with its extension property
`TauCeti.hasExtensionProperty_radoGraph`. Prove that it agrees with the explicit binary presentation
on $`\mathbb N`$ (bit $`i`$ of $`j`$ can be $`1`$ only when $`i\lt j`$):

```math
i\sim j
\quad\Longleftrightarrow\quad
(i\lt j\ \text{and bit } i \text{ of } j \text{ is } 1)
\ \lor\;
(j\lt i\ \text{and bit } j \text{ of } i \text{ is } 1).
```

Identify $`R`$ with the constructed Fraïssé limit.

The supplier provides countable uniqueness (`SimpleGraph.HasExtensionProperty.nonempty_iso`), the
characterization `TauCeti.nonempty_iso_radoGraph_iff` of the countable graphs isomorphic to $`R`$
(`ModelTheory/Scott/RandomGraph.lean`) and the extension-pair bridge. Export, in addition, the characterization of $`R`$ as the Fraïssé limit,
the complement isomorphism, universality for countable graphs, rooted universality into any
extension-property graph (from Milestone 3), and extension of finite induced isomorphisms to
automorphisms. Give explicit finite graph embeddings, including complete, empty, path and
cycle graphs.

**Checks.** The empty graph and `K₂` belong to the class of finite simple graphs; a one-point
structure whose adjacency relation is reflexive fails the simple-graph axioms, and the Rado graph
fails finiteness. `K₂` embeds in the Rado graph on `{0, 1}` (bit `0` of `1` is `1`) and the
edgeless two-vertex graph on `{0, 2}` (bit `0` of `2` is `0`); `K₁` is not the limit, since `K₂`
is outside its age.

## Milestone 5 — Finite rank, Rado theory and elimination

### 5.1 Shared finite-logic foundations

*Needs:* Milestone 0; 4.1 for the extension strategy; Tau Ceti `EFStrategy`, `BFEquiv`,
`SimpleGraph.sameAtomicType_iff` and the infinitary quantifier rank.

Define natural-valued quantifier rank by structural recursion on Mathlib bounded formulas.
Prove constructor and renaming laws, the appropriate substitution laws, and compatibility
with the ordinal rank of the existing infinitary embedding. Identify rank zero with
Mathlib's native `BoundedFormula.IsQF` predicate.

Extend the existing `EFStrategy`/`BFEquiv` API with truth preservation for native
first-order formulas of bounded rank. The theorem must retain the actual assignments and
handle tuple repetitions. Prove finite-round soundness for an arbitrary relational
language, without a finite- or countable-signature hypothesis; the graph specialization
then uses `sameAtomicType_iff`. The finite graph signature enters the later enumeration
of diagrams for quantifier elimination.

For graphs satisfying $`\mathrm{EP}_{\le d}`$, construct the finite-round extension
strategy starting at two tuples with the same equality and adjacency pattern. If the
root tuple has length $`m`$ and there are $`q\ge1`$ additional rounds, the sufficient budget
is $`d=m+q-1`$. When a played vertex repeats an earlier coordinate, reuse its mate; otherwise
serve the corresponding extension request. This is a tuple-budget bound, not a
bound ignoring the named root.

In particular, if $`G,H`$ satisfy $`\mathrm{EP}_{\le d}`$ and
$`\mathrm{qr}(\varphi)\le d+1`$, then

```math
G\models\varphi\quad\Longleftrightarrow\quad H\models\varphi.

```

Handle rank $`0`$ directly, and verify the indexing at ranks $`1,2,3`$.

### 5.2 Complete theory and QE

*Needs:* 4.1–4.2, 5.1; Milestone 3 rooted universality; Mathlib `Theory.IsComplete`,
`Cardinal.Categorical`, `CompleteType`, `typesWith`, `typeOf`, `ElementaryEmbedding`,
`BoundedFormula.encoding` and `Computable`; Tau Ceti `firstOrderAtomicDiagram` and
`realize_firstOrderAtomicDiagram_iff_sameAtomicType`.

Let $`T_R`$ be the native simple-graph theory together with all $`E_{r,s}`$.
Prove that its models are precisely the graph structures with full extension; it has
no finite models; it is countably categorical; and it is complete. Prove
$`T_R\models\varphi`$ if and only if $`R\models\varphi`$, so the semantic consequence
closure of this axiom set is $`\mathrm{Th}(R)`$.

Cameron proves countable categoricity (Proposition 11, p. 9) by the back-and-forth argument of
his Fact 2 (pp. 1–2), and the equivalence of $`T_R\models\varphi`$ with $`R\models\varphi`$ is
(b)⇔(c) of his Theorem 6 (p. 10). His axioms $`\sigma_{m,n}`$ (p. 9) translate his property (∗),
whose witness Fact 2 uses as distinct from all listed vertices; the $`E_{r,s}`$ here require
that distinctness explicitly. Completeness follows from categoricity and the absence of finite
models by the Łoś–Vaught test, the route of Fagin's Theorem 1 (p. 51), which he states for
Gaifman's extension axioms over an arbitrary finite relational vocabulary rather than for graphs.

Prove quantifier elimination for actual first-order formulas, including formulas with
free variables. The meaning of a tuple's diagram is Tau Ceti's atomic-diagram semantics:
`AtomicIdx.toFormula`, `firstOrderAtomicDiagram` and
`realize_firstOrderAtomicDiagram_iff_sameAtomicType`, applied to the graph language through the
instance `Finite (Σ l, Language.graph.Relations l)`, which is a target of this milestone. That
diagram is a classical finite
conjunction and is noncomputable, so it supplies the semantics but not the algorithm.

The two endpoints are computability theorems on codes of formulas. **Computable quantifier
elimination** is a `Computable₂` map taking `m` and a code, such that for every formula over
`Fin m` the output is the code of a quantifier-free formula over the same context with the same
realizations in every model of $`T_R`$. **Decidability** is a `Computable` map on codes of
sentences answering truth in the Rado graph. A computability proof needs an explicit witness:
define both maps in Lean and prove these theorems for them. That each formula has some
quantifier-free equivalent modulo $`T_R`$ does not discharge either theorem. The proof goes
through finite patterns; build:

- an **effective coding of graph formulas** as the input and output format of the two maps:
  Mathlib's structural list encoding `BoundedFormula.encoding` followed by an explicit numbering
  of its symbol alphabet, uniform in the free-variable context `Fin m` (not
  `Encodable.ofCountable`, whose classical enumeration has no effective content), with decoding
  that accepts exactly the formula codes (Mathlib's list decoder ignores trailing symbols, so
  this needs a re-encoding check) and its round-trip law, and computability on codes of the syntax operations the maps
  use: the constructors (`⊥`, equality and adjacency atoms between variables, implication,
  universal quantification) and case analysis on the outermost constructor. These are supporting
  targets for the two theorems, not a general computability library;
- a computable representation of finite equality-and-adjacency patterns on `Fin m`, with
  its consistency test;
- a correctness bridge proving that the formula of each consistent pattern and
  `firstOrderAtomicDiagram` of any tuple realizing it have equivalent realizations, with the
  conversion between free-variable and bound-variable presentations made explicit;
- pattern elimination: every formula is equivalent modulo $`T_R`$ to a finite Boolean
  combination of pattern formulas, computably from its code, with semantic correctness. A
  quantifier over such a combination is eliminated by testing which one-point extensions of each
  pattern are consistent. This gives the QE map, with the native `IsQF` proofs of its outputs,
  and on sentences the decision map.

Export also the theory-level property in the vocabulary of the quantifier-elimination proposal,
`T_R.HasQuantifierElimination`: every formula is `IsQFEquivalent` modulo $`T_R`$,
using that proposal's reduction to finite variable types. The theory-level property is a
consequence of the computable QE map and does not replace it.

Show that the complete finite diagrams isolate the realized graph types and define
automorphism orbits, using equality/disequality as well as adjacency/nonadjacency.
State isolation in Mathlib's native complete-type space: in `T_R.CompleteType (Fin m)`,
the basic open `typesWith` associated to a tuple's diagram is the singleton containing
its `typeOf`. For a diagram `δa`, the native set equation is
`T_R.typesWith (Formula.equivSentence δa) = {T_R.typeOf a}`.
Agreement only among tuples already living in $`R`$ does not suffice for
this target. Prove that every finite tuple's complete type is isolated, establishing
graph-specific atomicity.

Prove primeness as the existence of an actual elementary embedding of $`R`$ into every
model of $`T_R`$. Rooted universality supplies the embedding and QE makes it elementary;
the target model need not be countable. Give the atomicity and primeness statements
after naming a finite tuple, with the elementary embedding retaining the prescribed
parameter values.

**Checks.** Modulo `T_R`, `∃y Adj(x₀, y)` eliminates to `⊤` (it holds in every model, by
`E_{1,0}`) and `∃x Adj(x, x)` to `⊥`. In the Rado graph the pairs `(0, 0)`, `(0, 1)` and `(0, 2)`
have three different diagrams (`x₀ = x₁`; `x₀ ≠ x₁` and adjacent; `x₀ ≠ x₁` and nonadjacent), so
they isolate three different types in `T_R.CompleteType (Fin 2)`; the first pair shows that
equality atoms are needed, the last two that adjacency atoms are.

### 5.3 Finite consequences

*Needs:* 5.1–5.2.

Prove that each sentence is decided by a finite set of extension axioms, using the
explicit rank theorem. Give the finite-consequence/compactness formulation and its
agreement with this bound. This is the deterministic finite-consequence API used in
the probabilistic limit theorem.

The first-order isolation assertions here use the finite graph language. No theorem
asserts that arbitrary-language ultrahomogeneity alone implies first-order isolation.

## Milestone 6 — Witness counts and extension-failure estimates

*Needs:* 0.2; 4.1 for the witness predicate, bounded extension and the extension sentences;
StandardDistributions binomial law.

Fix disjoint $`U,V`$ with $`|U|=r`$, $`|V|=s`$ and put
$`q_{r,s}=p^r(1-p)^s`$.
For a finite candidate set $`C`$ disjoint from $`U\cup V`$, prove that the witness indicators
are independent Bernoulli variables and the number of witnesses has the native
binomial law with parameters $`|C|`$ and $`q_{r,s}`$.
The statement includes exact mass and expectation formulas and the zero-witness
specialization

```math
\Pr(\text{no witness in }C)=(1-q_{r,s})^{|C|}.

```

The proof must identify the tested edge sets and prove their disjointness between
candidates. It does not use independence of arbitrary overlapping extension requests.

For $`n\ge r+s`$, export both the ordered-tuple bound

```math
\Pr(G(n,p)\not\models E_{r,s})
\le (n)_{r+s}(1-q_{r,s})^{n-r-s}

```

and the sharper finite-set counting bound with coefficient
$`\binom n{r+s}\binom{r+s}r`$.
Here $`(n)_k`$ is `Nat.descFactorial`, not a binomial coefficient.

For $`n\ge d`$, define and prove the rank-budget failure bound

```math
B_d(n,p)=
\sum_{t=0}^{d}\ \sum_{r=0}^{t}
\binom nt\binom tr
\bigl(1-p^r(1-p)^{t-r}\bigr)^{n-t},
\qquad
\Pr(\neg\mathrm{EP}_{\le d}(G(n,p)))\le B_d(n,p).

```

The definition is a finite real sum, with the usual convention $`0^0=1`$; state the
$`n\ge d`$ domain on the estimate rather than silently using truncated subtraction as
a count of available candidates for impossible requests.

Writing $`\delta=\min(p,1-p)`$, prove for $`n\ge\max(1,d)`$

```math
B_d(n,p)\le
(d+1)2^d n^d\exp\!\bigl(-(n-d)\delta^d\bigr).

```

Supply nonnegativity, complement symmetry, finite-union bounds and limits. For fixed
$`0\lt p\lt 1`$, prove summability in $`n`$ of the failure probabilities and an explicit
$`C_{d,p} n^d e^{-c_{d,p}n}`$ bound for sufficiently large $`n`$, with $`c_{d,p}\gt 0`$.
The empty request and the absence of candidates are required boundary checks.

## Milestone 7 — FO asymptotics and almost-sure stabilization

### 7.1 Finite laws

*Needs:* 5.1–5.3; Milestone 6.

For $`\mathrm{qr}(\varphi)\le d+1`$ and $`n\ge d`$, prove the explicit estimate

```math
\left|\Pr(G(n,p)\models\varphi)-\mathbf1_{\{R\models\varphi\}}\right|
\le B_d(n,p).

```

It is uniform over all sentences of the indicated rank. Derive the fixed-$`p`$ zero–one
law, the equality of the almost-sure theory with $`\mathrm{Th}(R)`$ (the semantic
consequence closure of $`T_R`$), and independence of this theory from $`p\in(0,1)`$. The decision map of Milestone 5 computes the limiting truth
value; the rank supplies the error profile. Classical compactness alone is not claimed
to compute either of them.

Derive that every finite subset of $`T_R`$ has a finite model, and every sentence true
in $`R`$ has finite models of every sufficiently large cardinality. These are
consequences of the positive finite-law probabilities, not inputs to the construction
of $`R`$ or to completeness.

Export a transfer theorem for any concrete graph property implied by a fixed extension
budget, with the corresponding failure bound. Milestone 8 supplies actual graph
properties and proves these deterministic implications.

### 7.2 Varying parameters

*Needs:* 7.1; Milestone 6.

Let $`p_n\in[0,1]`$ and $`\delta_n=\min(p_n,1-p_n)`$. For each fixed $`d\ge1`$, prove
bounded-rank convergence whenever

```math
(n-d)\delta_n^d-d\log(n+2)\longrightarrow+\infty.

```

The conclusion is Rado-truth convergence for sentences of rank at most $`d+1`$.
Rank at most $`1`$ is treated directly.

For the all-rank theorem, the concrete sufficient condition is

```math
\forall a\gt 0,\qquad n^a\delta_n\longrightarrow+\infty.

```

Prove that it gives the stated condition for every $`d`$ and summability of every
fixed-budget failure probability. It allows nonconvergent $`p_n`$.
Required examples include parameters bounded away from $`0`$ and $`1`$, alternating two
interior probabilities, and $`p_n=1/\log(n+2)`$ for all sufficiently large $`n`$, with a
valid `unitInterval` value assigned at the finitely many remaining indices.

The weaker fixed-$`d`$ divergence condition by itself gives convergence of probabilities.
Do not infer summability or joint almost-sure stabilization from it without an
additional summability estimate.

### 7.3 Joint almost-sure statements

*Needs:* 7.1–7.2; Mathlib `measure_limsup_atTop_eq_zero` (Borel–Cantelli); Tau Ceti
`SimpleGraph.restrictFin` for the nested windows.

Fix $`0\lt p\lt 1`$. Let $`(\Omega,\mu)`$ be a probability space and let measurable
$`X_n:\Omega\to\mathrm{SimpleGraph}(\mathrm{Fin}\ n)`$ have the native $`G(n,p)`$ law.
Without any independence assumption between sample sizes, prove

```math
\forall^\mu\omega,\quad
\forall d,\quad
\forall^\infty n,\quad
\mathrm{EP}_{\le d}(X_n(\omega)),

```

and therefore

```math
\forall^\mu\omega,\quad
\forall d,\quad
\forall^\infty n,\quad
\forall\varphi\;
(\mathrm{qr}(\varphi)\le d+1),\quad
\bigl(X_n(\omega)\models\varphi\iff R\models\varphi\bigr).

```

Here $`\forall^\infty n`$ means all sufficiently large natural numbers. The threshold
depends on the sample and the rank bound. There is no one threshold working for all
first-order sentences.

Prove the varying-parameter version under the all-rank condition of 7.2, and the
abstract version under summability of the extension-failure probabilities.
Instantiate it on the nested initial windows of the native infinite binomial graph.

These are derivations, not cited theorems: the inputs are the summable bounds of Milestone 6
and 7.2, the first Borel–Cantelli lemma `measure_limsup_atTop_eq_zero`, which needs no
independence, and the rank agreement of 5.1.

## Milestone 8 — Rooted laws and asymptotic graph examples

### 8.1 Finite named roots

*Needs:* 0.2; 4.2 rooted universality; the tuple form of 5.1; Milestone 6; 7.1.

For a fixed graph $`H`$ on `Fin m`, condition $`G(n,p)`$ on inducing $`H`$ on the first
$`m`$ vertices, for $`n\ge m`$ and $`0\lt p\lt 1`$. Prove positivity and the exact probability of
this event, and identify the conditional law of the remaining independent edges.

Choose an induced copy of $`H`$ in $`R`$ using rooted universality. For every formula
$`\psi(x_0,\ldots,x_{m-1})`$, prove that its conditional limiting truth is the truth in
this rooted $`R`$, independent of the chosen copy. Supply a quantitative bound using the
tuple version of finite-rank agreement; division by the explicitly positive root-event
probability gives a valid bound from Milestone 6.

Also prove the unconditioned fixed-tuple limit

```math
\lim_n\Pr(G(n,p)\models\psi(0,\ldots,m-1))
=\sum_{H\text{ on }\mathrm{Fin}\ m}
p^{e(H)}(1-p)^{\binom m2-e(H)}
\mathbf1_{\{(R,\bar a_H)\models\psi\}}.

```

This is a finite, effectively determined polynomial expression. Include the example
$`\psi(x_0,x_1)=\mathrm{Adj}(x_0,x_1)`$, whose limit is $`p`$. This does not contradict
the sentence zero–one law: it is a formula evaluated at random named vertices.

**Checks.** For `ψ = Adj(x₀, x₁)` the conditioned limits are `1` on `H = K₂` and `0` on the
edgeless `H`, and their mixture with weights `p` and `1 - p` is the unconditioned limit `p`.

### 8.2 Graph properties

*Needs:* 7.1–7.3; Mathlib `CliqueFree`, `degree` and `diam`; Tau Ceti
`SimpleGraph.IsVertexConnected`.

Prove each deterministic implication from a fixed extension budget and then its
asymptotically-almost-sure and joint-eventual forms.

- Every fixed finite graph occurs as an induced subgraph; give a rooted extension
  version over a prescribed finite induced pattern.
- There are arbitrarily large fixed cliques and independent sets as $`n`$ grows.
  State this as one theorem for each fixed size and as an almost-sure joint statement.
- Every vertex has at least any prescribed fixed number of neighbors and nonneighbors.
- The graph and its complement are connected; for fixed interior $`p`$ their diameter
  is exactly $`2`$ eventually almost surely.
- For each fixed natural $`k`$, vertex connectivity is at least $`k`$ asymptotically almost
  surely. Use Tau Ceti's `SimpleGraph.IsVertexConnected` and its size convention (more than
  `k` vertices). Derive the result by deletion of fewer than $`k`$ vertices and the
  common-neighbor witness property, including the required carrier-size bound.

Use native clique, degree, distance, deletion and connectivity definitions. For diameter
$`2`$, provide both the common-neighbor upper bound and the existence of a nonedge;
do not confuse diameter at most $`2`$ with equality.
Each item is derived from its deterministic implication and 7.1–7.3; no external theorem is
cited for these graph properties.

Give explicit FO translations for the fixed finite patterns, fixed degree lower bounds,
common-neighbor property and diameter bound. Connectivity itself need not be defined
by one FO sentence; its probabilistic application follows from a stronger fixed FO
condition. Include a worked calculation at $`p=1/2`$ and the low extension budgets
$`d=0,1,2`$.

## Milestone 9 — Infinite laws and graphon connections

### 9.1 Infinite binomial graphs

*Needs:* 0.3; 4.1–4.2; Milestone 6; 7.3.

For each finite extension request in the native $`G(\mathbb N,p)`$ law, prove that the
event of having no witness has probability $`0`$. Take the countable intersection over
requests and derive

```math
\Pr(G(\mathbb N,p)\cong R)=1,\qquad 0\lt p\lt 1.

```

Prove measurability of this particular isomorphism class by its extension-axiom
description. Export avoidance of every finite set and infinitely many witnesses,
the finite-window law, and the joint eventual statements from Milestone 7.

### 9.2 Graphon sampling

*Needs:* 9.1; 7.1–7.3; DenseGraphLimits `sampleGraph_const`, `infiniteSampleLaw_map_restrictFin`
and infinite-law extensionality.

Use `sampleGraph_const` and the actual infinite finite-window identities to identify
the constant-graphon finite and infinite laws with the native binomial laws.
Derive the infinite-law equality by the existing cylinder/finite-window measure
extensionality theorem when necessary.

For a graphon $`W`$ on a probability space with
$`0\lt W\lt 1`$ almost everywhere with respect to the product measure, prove that its infinite
sample is almost surely Rado. For almost every fixed root tuple the conditional
extension probability is positive; infinitely many independent outside candidates
then supply a witness. Handle the exceptional root sets by product-measure/Fubini
arguments, not a pointwise assertion about an arbitrary representative.

For the stronger hypothesis
$`\varepsilon\le W\le1-\varepsilon`$ almost everywhere, with
$`0\lt \varepsilon\le1/2`$, prove

```math
\Pr(\neg\mathrm{EP}_{\le d}(G(n,W)))
\le
\sum_{t=0}^d\binom nt\,2^t(1-\varepsilon^t)^{n-t}
\quad(n\ge d).

```

Derive the finite FO Rado-truth law, uniform rank estimates and arbitrary-coupling
almost-sure stabilization for these graphon sample laws. This is an application of the
existing sampler to the newly proved conditional witness bounds. The conditional witness
probabilities and the displayed bound are computed from the sampler's definition, as in
Milestone 6; no external theorem is cited for them.

Mere almost-everywhere positivity and strict inequality from $`1`$ supply the infinite
Rado theorem, not the uniform finite estimate. Milestone 11 gives a concrete graphon
where finite FO zero–one fails despite almost-sure infinite Rado support.

### 9.3 Invariant-event laws and mixtures

*Needs:* 0.3; Tau Ceti `Equiv.Perm.finitary`,
`ergodicSMul_map_toRelationalConfiguration_infiniteSampleLaw`, `graphonMixtureLawEquiv_law` and
`InfiniteExchangeableGraphLaw.existsUnique_bind_infiniteSampleLawOnSpace`.

Transport the existing dissociation/ergodicity theorem,
`ergodicSMul_map_toRelationalConfiguration_infiniteSampleLaw`, to measurable events of actual
graphs. For a fixed graphon, every measurable event invariant under finitely supported
permutations has probability $`0`$ or $`1`$. Specialize to the native realization event of
each FO sentence.

For a graphon-mixture law $`\int P_W\,d\Pi([W])`$, prove the measurability of the
graphon-space satisfaction-probability function and evaluate the existing measure
`bind` identity `graphonMixtureLawEquiv_law` by `Measure.bind_apply` to obtain

```math
\Pr(G\models\varphi)=\int P_W(G\models\varphi)\,d\Pi([W]).

```

The integrand is zero or one; the mixture need not be. The half-empty/half-complete
infinite graph mixture and the sentence “there exists an edge” must give exactly $`1/2`$.
The endpoint graphons are legitimate examples even though the interior binomial Rado
theorem does not apply to them.

### 9.4 One isomorphism class, distinct labeled laws

*Needs:* 9.1–9.2; `tendsto_homDensityFin_infiniteSampleLaw_ae`.

Use the existing graphon sampling strong law, together with the $`K_2`$ homomorphism-density
normalization, to prove

```math
\frac{2|E(G\upharpoonright n)|}{n(n-1)}\longrightarrow p
\quad\text{almost surely under }G(\mathbb N,p).

```

Set the displayed density to $`0`$ at $`n=0,1`$. The limit holds for every $`p\in[0,1]`$,
the endpoints included ($`G(\mathbb N,0)`$ and $`G(\mathbb N,1)`$ are the empty and complete graphs).
For distinct $`p,q\in[0,1]`$ derive mutual singularity of the labeled infinite laws.
For $`p,q\in(0,1)`$ this holds although each gives probability one to the Rado isomorphism class.
The separating initial-window density events are measurable and invariant under
finitely supported permutations; do not claim invariance under all relabelings.

## Milestone 10 — Infinitary distinctions with actual sentences

*Needs:* 4.1; 7.1; 9.1; Tau Ceti infinitary syntax and semantics and
`SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`.

Use the existing $`L_{\omega_1,\omega}`$ syntax, native FO embedding and realization API:
`Language.graph.Sentenceω` with `BoundedFormulaInf.iInf` and `iSup`, `BoundedFormula.toInf`,
`SentenceInf.Realize` and `Sentence.realize_toInf` (Tau Ceti
`ModelTheory/Infinitary/{Syntax,Semantics}.lean` at `2fd255d99`), evaluated under
`SimpleGraph.structure`. Construct both of the following sentences and prove their stated semantics.

1. $`\Theta_R=\bigwedge_{r,s\in\mathbb N}E_{r,s}`$ has probability $`1`$ under
   $`G(\mathbb N,p)`$ for $`0\lt p\lt 1`$, and probability $`0`$ on every finite carrier.
   This refutes extending the Rado-truth identification to arbitrary infinitary
   sentences. Its finite probabilities do converge to a zero–one value, namely $`0`$.
   Tau Ceti's Scott sentence of $`R`$ already characterizes the extension property in every
   cardinality (`SimpleGraph.HasExtensionProperty.realize_scottSentence_iff`). $`\Theta_R`$ is a
   different sentence, the explicit conjunction of the first-order extension axioms, from which
   the two probabilities are read off; prove that $`\Theta_R`$ and the Scott sentence of $`R`$
   hold in the same graphs.
2. Construct first-order $`\mathrm{CardEq}(m)`$, including $`m=0`$, and
   $`\Theta_{\mathrm{even}}=\bigvee_{m\in\mathbb N}\mathrm{CardEq}(2m)`$.
   On the finite carrier `Fin n`, its probability is exactly $`1`$ for even $`n`$ and
   $`0`$ for odd $`n`$, for every $`p`$. This sequence has no limit.

These are separate assertions: mismatch with infinite truth and genuine failure of
finite-probability convergence. Neither is a failure of the FO theorem.

## Milestone 11 — Poisson limits and sharp scope comparisons

### 11.1 Discrete factorial-moment criterion

*Needs:* Mathlib `Nat.descFactorial`, `ProbabilityTheory.poissonMeasure` and integration on ℕ.

Build a reusable Poisson-convergence theorem for probability laws $`\nu_n`$ on $`\mathbb N`$.
Assume every descending-factorial moment is finite and

```math
\int (x)_k\,d\nu_n(x)\longrightarrow\lambda^k
\quad\text{for every }k\in\mathbb N,\qquad \lambda\ge0.

```

Prove convergence of each point mass to the native Poisson mass
$`e^{-\lambda}\lambda^j/j!`$, convergence in distribution and total variation convergence.
The proof can use finite Bonferroni bounds for $`\Pr(X=j)`$ followed by the exponential
series; provide those finite bounds and their hypotheses as reusable lemmas.
For total variation use the countable discrete formula
$`\frac12\sum_j|\nu_n\{j\}-\mathrm{Poisson}(\lambda)\{j\}|`$.
Handle $`\lambda=0`$.

This convergence criterion is a target here. Defining the Poisson law in
StandardDistributions does not discharge it. Use native `Nat.descFactorial`,
`ProbabilityTheory.poissonMeasure`, integration and convergence notions.
State it in a general probability module for laws on $`\mathbb N`$, not in a random-graph
namespace; 11.2 and 11.3 are its consumers here. A point-process factorial-moment-measure
criterion with a uniform local exponential-moment bound, or a Grigelionis theorem with
independence within each array row, does not discharge it: the hypothesis here is only
convergence of each fixed factorial moment. The sparse
triangle counts of 11.2 need the weaker hypothesis: the complete-graph event gives
$`\mathbb E[a^{T_n}]\ge a^{\binom n3}p_n^{\binom n2}\to\infty`$ for every $`a\gt 1`$ when
$`np_n\to c\gt 0`$.

### 11.2 Sparse triangles

*Needs:* 0.2; 11.1; Mathlib `cliqueFinset`.

Count triangles using the native finite clique API: one unordered three-element clique
is one triangle, so there is no factor-of-six ambiguity.
For any $`p_n\in[0,1]`$ with $`np_n\to c\ge0`$, prove

```math
T_n\ \xrightarrow{\mathrm{law}}\ \mathrm{Poisson}(c^3/6).

```

Expand each factorial moment as an ordered list of distinct triangle copies.
The disjoint contribution is
$`(n)_{3k}p_n^{3k}/6^k`$.
Bound the remaining intersection types: every connected component of a union of
triangles has at least as many edges as vertices, and a component containing two
distinct triangles has strictly more. Thus any overlapping list has total $`e-v\ge1`$,
and the overlap contribution tends to zero. Make this finite classification/counting bound an
explicit lemma, not a probabilistic independence assumption for overlapping copies. This
calculation is a derivation from the clique count and the edge/vertex bound above, not a cited
theorem.

Construct the actual rank-$`3`$ triangle sentence and identify its satisfaction with
$`T_n\gt 0`$. Derive

```math
\Pr(G(n,p_n)\text{ contains a triangle})
\longrightarrow 1-e^{-c^3/6}.

```

For $`c\gt 0`$ this lies strictly between $`0`$ and $`1`$. Instantiate an everywhere-valid
parameter sequence, for example $`p_n=\min(1,c/(n+1))`$, and state its asymptotic
equivalence to the usual $`c/n`$ regime.

### 11.3 A graphon whose infinite sample is Rado but finite FO zero–one fails

*Needs:* 9.2; 11.1.

Use the explicit graphon $`W(x,y)=xy`$ on the uniform unit interval.
Its infinite sample is almost surely Rado by 9.2. Let $`Z_n`$ count isolated vertices
of its finite sample. Prove

```math
Z_n\ \xrightarrow{\mathrm{law}}\ \mathrm{Poisson}(2).

```

Ground this in the exact factorial-moment formula, for $`n\ge k`$,

```math
\mathbb E[(Z_n)_k]
=(n)_k
\int_{[0,1]^k}
\left(\prod_{i\lt j}(1-x_ix_j)\right)
\left(\int_0^1\prod_{i=1}^k(1-x_i y)\,dy\right)^{n-k}
\,d\bar x.

```

For $`k\ge1`$, substitute $`u_i=nx_i`$ and work on the fixed nonnegative orthant
$`[0,\infty)^k`$, extending the integrand by zero there outside $`[0,n]^k`$.
Retain the prefactor $`(n)_k/n^k\to1`$, which lies in $`[0,1]`$, and prove pointwise
convergence of the rescaled integrand to $`\exp(-\sum_i u_i/2)`$.
For $`n\ge2k`$, the bound

```math
\int_0^1\prod_i(1-x_i y)\,dy
\le1-\frac{\sum_i x_i}{2k}

```

gives the integrable dominator $`\exp(-\sum_i u_i/(4k))`$ after scaling.
Thus the moment limit is $`2^k`$, and 11.1 applies. Prove the $`k=0`$ case separately.
As an elementary check, $`\mathbb E Z_n=2(1-2^{-n})`$ for every $`n`$. At $`n=0`$ the sum over
vertices is empty and both sides are $`0`$. For $`n\ge1`$ a vertex with label $`x`$ is isolated
with conditional probability $`(1-x/2)^{n-1}`$, so
$`\mathbb E Z_n=n\int_0^1(1-x/2)^{n-1}\,dx=2(1-2^{-n})`$.

Construct the FO sentence $`\forall x\,\exists y\,\mathrm{Adj}(x,y)`$ and derive

```math
\Pr(G(n,W)\models\forall x\,\exists y\,\mathrm{Adj}(x,y))
\longrightarrow e^{-2},

```

while its probability on the infinite sample is $`1`$.
This gives a concrete failure of finite FO zero–one for a fixed graphon with an
ergodic infinite law concentrated on the Rado isomorphism class. It also explains why
the uniform lower/upper bounds in the finite graphon theorem do mathematical work.

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
construction in [Gabin Kolly's Fraïssé-existence proposal for Mathlib](https://github.com/leanprover-community/mathlib4/pull/18876)
and [its prerequisite](https://github.com/leanprover-community/mathlib4/pull/18749), and of the
graph characterization of Milestone 4 in his
[graph-characterization proposal](https://github.com/leanprover-community/mathlib4/pull/20649).
Coordinate the theory-level quantifier-elimination endpoint with the
[quantifier-elimination proposal](https://github.com/leanprover-community/mathlib4/pull/41113) and
its [extension-pair companion](https://github.com/leanprover-community/mathlib4/pull/41115).
These are design and provenance references, not assumptions that their code is in Mathlib.
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

## Mathematical references

- R. Fagin, [Probabilities on finite models](https://homepages.math.uic.edu/~lreyzin/s15_mcs590/fagin76.pdf),
  *Journal of Symbolic Logic* 41 (1976), 50–58: finite-model zero–one laws,
  finite consequences and rates, for all structures over a finite set of predicate symbols under
  the uniform measure. Theorem 1 (p. 51) is Gaifman's completeness of the extension axioms, by
  the Łoś–Vaught test and back-and-forth; Theorem 2 and Corollary 3 (p. 52) give the limit law
  for each axiom and for its consequences; Corollary 5 (p. 53) gives finite models of every
  sufficiently large cardinality for each finite set of axioms. The theorems here are the
  corresponding statements for undirected loopless graphs, proved by the same route, and cover
  every fixed interior binomial parameter.
- J. Spencer, *The Strange Logic of Random Graphs*, Algorithms and Combinatorics 22,
  Springer, 2001. Theorem 0.1.2 is the Fagin–GKLT law at $`p=1/2`$ and Theorem 0.1.5 the
  uniqueness of the countable graph with the extension ("Alice's Restaurant") property;
  §1.3 introduces extension statements over rooted graphs. Definition 2.3 and
  Theorem 2.2.3 show that graphs with the $`k`$-extension property form one $`(k+1)`$-round
  Ehrenfeucht class, the source of the $`\mathrm{EP}_{\le d}`$/rank-$`(d+1)`$ indexing of
  Milestone 5; Theorems 2.3.1–2.3.2 relate Ehrenfeucht values to quantifier depth, with
  designated vertices for the rooted form. Theorems 9.1.3–9.1.4 are the dense
  varying-parameter laws: the fixed-rank condition of 7.2 sharpens the hypothesis of
  Theorem 9.1.3, and the all-rank condition is that of Theorem 9.1.4.
- B. Bollobás, *Random Graphs*, 2nd ed., Cambridge Studies in Advanced Mathematics 73,
  Cambridge University Press, 2001.
  Theorems 1.21–1.22 give Poisson convergence from convergence of factorial moments, the
  criterion of 11.1. Theorem 4.1 gives the Poisson limit for copies of a fixed strictly
  balanced graph at its threshold, and Corollary 4.9 the cycle case at $`p\sim c/n`$; for
  triangles this is the $`\mathrm{Poisson}(c^3/6)`$ limit of 11.2.
- W. Hodges, *Model Theory*, Encyclopedia of Mathematics and its Applications 42, Cambridge
  University Press, 1993, §7.1. Theorem 7.1.2 (p. 326) is Fraïssé's theorem: for a countable
  signature, a nonempty finite or countable set of finitely generated structures with HP, JEP
  and AP has a limit of cardinality at most $`\aleph_0`$ with that age, ultrahomogeneous and
  unique up to isomorphism; Theorem 7.1.7 (p. 329) is its converse. Lemma 7.1.6 and the chain
  construction (1.8) (pp. 328–329) correspond to Milestone 2. Lemmas 7.1.3–7.1.4
  (pp. 326–327) extend a prescribed embedding of a finitely generated substructure to an
  embedding or isomorphism, the rooted statements of Milestone 3, for structures that are at
  most countable. Milestones 2 and 3 assume less: existence uses countability of the function
  symbols only and proceeds through representative families, and the rooted embedding allows a
  target of any cardinality; the constructions specified there supply these variants.
- P. J. Cameron, [The random graph](https://arxiv.org/abs/1301.7544), arXiv:1301.7544v1
  (2013). Property (∗) and Facts 1–2 (pp. 1–2: almost-sure extension for each fixed edge
  probability in `(0,1)`, and countable uniqueness); Rado's binary presentation (p. 3);
  universality, Proposition 6 (p. 6); homogeneity, Proposition 9 (p. 7); the finite graphs as a
  Fraïssé class with limit $`R`$, Theorem 3 and the following paragraph (p. 8); countable
  categoricity, Proposition 11 (p. 9); truth in $`R`$, consequence of the extension axioms and
  the uniform finite limit law, Theorem 6 (p. 10).
- P. Erdős and A. Rényi,
  [On the evolution of random graphs](https://www.renyi.hu/~p_erdos/1960-10.pdf):
  classical sparse small-subgraph asymptotics. The native model and normalization in
  this roadmap are specified in 11.2.
- The linked Mathlib Fraïssé, order, semantics and probability files fix the formal
  conventions. The displayed estimates and factorial-moment calculations give the
  precise proof obligations for the quantitative and graphon comparison targets.
