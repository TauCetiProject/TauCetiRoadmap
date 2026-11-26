# Roadmap: graphical models and conditional independence

**Summary.** This roadmap builds the conditional-independence theory of graphical models for
finitely many random variables with finite state spaces. A law is a nonnegative function on the
configurations; a graph on the variables, undirected or directed and acyclic, is read as a list of
conditional independences, and the roadmap proves that the different ways of reading it agree
under stated hypotheses (positivity for undirected graphs, acyclicity and total mass one for
directed ones), and shows by counterexamples that these hypotheses cannot be dropped. The finite setting is chosen so that every conditional independence
is an identity between finite sums, valid at zero-probability configurations too; the first layer
proves that this notion is Mathlib's measure-theoretic conditional independence for the law of the
configuration.

The headline theorems are these.

- *The calculus of conditional independence.* For every law, `A ⊥ (B ∪ D) | S` holds if and only
  if `A ⊥ B | S` and `A ⊥ D | S ∪ B` (decomposition, weak union and contraction at once). If the
  law is positive and `B`, `D` are disjoint, then `A ⊥ B | S ∪ D` and `A ⊥ D | S ∪ B` give
  `A ⊥ (B ∪ D) | S` (intersection); without positivity this fails.
- *The Hammersley–Clifford theorem.* A positive law whose variables at any two non-adjacent
  vertices of an undirected graph are conditionally independent given all the others is a product
  of nonnegative functions of the complete sets of the graph. For positive laws, factorization and
  the global, local and pairwise Markov properties are therefore equivalent; for every law,
  factorization implies the global property, which implies the local one, which implies the
  pairwise one.
- *Moussouris' counterexample.* On the four-cycle with binary variables there is a law that is
  globally Markov but does not factorize.
- *Directed acyclic graphs.* For a directed acyclic graph and a probability law, recursive
  factorization into kernels of each variable given its parents, the directed local Markov
  property and the global Markov property defined by d-separation are equivalent, without any
  positivity; for an acyclic directed graph, d-separation of two sets given a set disjoint from
  both is separation in the moral graph of the subgraph induced on the ancestors of the three.

The roadmap uses Mathlib's simple graphs, walks and cliques, Mathlib's digraphs, Mathlib's
notion of a function that depends only on a set of coordinates, and Mathlib's conditional independence of random
variables, which the agreement theorem of the first layer connects to the finite notion used here.
HiddenMarkovModels (an open roadmap) treats one particular directed model, the hidden Markov chain,
with its own conditional-independence statements; MathematicalStatisticsHighDimensional estimates
the graph of a Gaussian graphical model; neither statement is made here.

Layer 1 below defines conditional independence by margins, proves its agreement with Mathlib, the
chain rule and the intersection property. Layer 2 defines separation, the undirected Markov
properties and factorization, and proves factorization ⇒ global ⇒ local ⇒ pairwise, with the
converse for positive laws through intersection. Layer 3 proves the Hammersley–Clifford theorem and
gives Moussouris' law. Layer 4 treats directed acyclic graphs, d-separation and moralization.
Layer 2 uses Layer 1, Layer 3 uses Layers 1 and 2, and Layer 4 uses Layers 1 and 2 but not
Layer 3.

## Conventions

- **Variables and configurations.** The vertices form a finite type `V` with decidable equality;
  the variable at `v` takes values in a finite type `X v` with decidable equality. A configuration
  is `x : ∀ v, X v`. Sets of vertices are `Finset V`. A variable with a single value is allowed,
  and so is an empty `X v`: then there are no configurations and every statement about all
  configurations holds vacuously.
- **Laws.** A law is `p : (∀ v, X v) → ℝ≥0`. No normalization is imposed except in 4.4, which
  assumes `∑ x, p x = 1`: conditional independence, factorization and the Markov properties of
  undirected graphs are unchanged when `p` is multiplied by a positive constant. A law is
  *positive* when `0 < p x` for every configuration `x`.
- **Margins.** `margin p A x` is the sum of `p y` over the configurations `y` agreeing with `x` on
  `A`, written `p(x_A)`; `p(x_∅)` is the total mass.
- **Conditional independence.** `A ⊥ B | S` means `CondIndep p A B S`:
  `p(x_S) · p(x_{A ∪ B ∪ S}) = p(x_{A ∪ S}) · p(x_{B ∪ S})` for every configuration `x` (Evans,
  Theorem 2.4 (iv), p. 8, where the identity is shown equivalent to the definition by conditional
  densities, Definition 2.2, p. 8). The sets need not be disjoint, and `S = ∅` is allowed: it gives
  marginal independence, scaled by the total mass.
- **Undirected graphs.** A Mathlib `SimpleGraph V`. A complete set is a `Finset` on which
  `SimpleGraph.IsClique` holds; the empty set and every singleton are complete. Separation is by
  walks (2.1).
- **Directed graphs.** A Mathlib `Digraph V`, whose adjacency relation `G.Adj u v` is the arrow
  `u → v`; loops are not excluded by the type but are excluded by acyclicity (4.1). Ancestors and
  descendants of a vertex include the vertex.
- **Labels in examples.** In the Checks, vertices are numbered `1, 2, …` unless a statement names
  `Fin 4`, whose vertices are `0, 1, 2, 3`; a fair bit takes the values `0` and `1` with mass `1/2`
  each, and values not listed have mass `0`.

## Layer 1: conditional independence

### 1.1 Margins and conditional independence

Define `margin p A x` and `CondIndep p A B S` as in the conventions.

- Symmetry: `A ⊥ B | S` if and only if `B ⊥ A | S` (the identity is symmetric in `A` and `B`;
  Evans, Theorem 2.6, property 1, p. 9).
- If `A ⊆ S` then `A ⊥ B | S` for every `B`, since `A ∪ S = S` and `A ∪ B ∪ S = B ∪ S`. In
  particular `∅ ⊥ B | S`.
- If every vertex of `A` has a single value, then `A ⊥ B | S` for every `B` and `S`.
- Multiplying `p` by a constant `c > 0` multiplies both sides of the identity by `c²`.

**Checks.**
- Three independent fair bits: at every `x`, `p(x_3) p(x_{1,2,3}) = 1/2 · 1/8 = 1/16` and
  `p(x_{1,3}) p(x_{2,3}) = 1/4 · 1/4 = 1/16`, so `{1} ⊥ {2} | {3}`. The variant that drops the
  factor `p(x_S)` would compare `1/8` with `1/16` and fail.
- Two copies of one fair bit (`p(0,0) = p(1,1) = 1/2`): at `x = (0, 0)`, `p(x_∅) p(x_{1,2}) = 1/2`
  but `p(x_1) p(x_2) = 1/4`, so `{1} ⊥ {2} | ∅` fails, while `{1} ⊥ {2} | {1}` holds.
- Overlapping sets: `{v} ⊥ {v} | ∅` reads `p(x_∅) p(x_v) = p(x_v)²` for every `x`, so every value
  of `X v` has mass `0` or the total mass: the variable is almost surely constant, which is what
  independence of a variable from itself means.

*Needs:* Mathlib `Finset.sum`, `Finset.filter`. (Proved here.)

### 1.2 Agreement with Mathlib

Let each `X v` carry a measurable space with `DiscreteMeasurableSpace`, and let `μ` be a
probability measure on the configurations. Prove `condIndep_iff_condIndepFun`: for all `A`, `B`,
`S`, the finite relation `CondIndep` for the point masses `x ↦ μ {x}` holds if and only if the
restrictions `A.restrict` and `B.restrict` are conditionally independent given `S.restrict` in the
sense of Mathlib's `ProbabilityTheory.CondIndepFun`, written
`A.restrict ⟂ᵢ[S.restrict, _; μ] B.restrict`. The sets may overlap. The standard Borel structure
on the configurations that Mathlib's definition requires is found by instance search.

Route: `ProbabilityTheory.condIndepFun_iff_map_prod_eq_prod_condDistrib_prod_condDistrib` turns
Mathlib's notion into the factorization of the joint law of the three restrictions through the
conditional laws given `S.restrict`, and `ProbabilityTheory.condDistrib_apply_of_ne_zero` computes
these on every value of `S.restrict` of positive mass as a ratio of point masses; on values of
mass `0` both sides vanish. The resulting identity between point masses of the three restricted
vectors is equivalent to the identity of 1.1 at consistent configurations: when `p(x_{A ∪ S}) > 0`,
the identity of 1.1 summed over the configurations agreeing with `x` on `A ∪ S` shows that the
coordinates in `(A ∩ B) \ S` are almost surely determined by `S`, so inconsistent values of the
two restrictions have joint mass `0`.

**Checks.**
- For two copies of one fair bit, Mathlib's notion fails for the two coordinates given the
  constant restriction to `∅`, as `CondIndep` does in the second Check of 1.1.
- The two notions agree for `A = B = {v}` and `S = ∅`: both hold exactly when `X v` is almost
  surely constant.

*Needs:* 1.1; Mathlib `ProbabilityTheory.CondIndepFun`, `Finset.restrict`,
`Finset.measurable_restrict`,
`ProbabilityTheory.condIndepFun_iff_map_prod_eq_prod_condDistrib_prod_condDistrib`,
`ProbabilityTheory.condDistrib_apply_of_ne_zero`. (Proved here.)

### 1.3 The chain rule

Prove `condIndep_union_iff`: for every law and all `A`, `B`, `D`, `S`, `A ⊥ (B ∪ D) | S` holds if
and only if `A ⊥ B | S` and `A ⊥ D | S ∪ B` (Evans, Remark 2.7, p. 10, which combines properties 2
to 4 of Theorem 2.6, p. 9). The forward direction contains decomposition (`A ⊥ (B ∪ D) | S` gives
`A ⊥ B | S`) and weak union (it gives `A ⊥ D | S ∪ B`); the converse is contraction. No
disjointness is assumed.

Route: decomposition sums the identity of 1.1 over the values of the coordinates in
`D \ (A ∪ B ∪ S)`; this replaces `p(x_{B ∪ D ∪ S})` by the margin on `B ∪ S` together with the
coordinates of `A ∩ D` outside `B ∪ S`, and these coordinates can then be dropped because, under
`A ⊥ (B ∪ D) | S`, they are almost surely functions of `x_S` (the summation argument of 1.2). For
weak union and contraction compare, where the denominators are positive,
the three ratios `r₁ = p(x_{A ∪ B ∪ D ∪ S}) / p(x_{B ∪ D ∪ S})`,
`r₂ = p(x_{A ∪ B ∪ S}) / p(x_{B ∪ S})` and `r₃ = p(x_{A ∪ S}) / p(x_S)`. The statement
`A ⊥ (B ∪ D) | S` is `r₁ = r₃`, `A ⊥ B | S` is
`r₂ = r₃` and `A ⊥ D | S ∪ B` is `r₁ = r₂`; decomposition gives the second from the first, and
the rest is transitivity. Where a denominator vanishes, the margins of all larger sets vanish and
both sides of each identity are `0`.

**Checks.**
- Let `2` and `3` be independent fair bits and `X 1 = X 2 + X 3 mod 2`. Then `{1} ⊥ {2} | ∅` holds
  (at `x = (0,0,0)`, `1 · 1/4 = 1/2 · 1/2`) and `{1} ⊥ {3} | ∅` holds, but `{1} ⊥ {2, 3} | ∅`
  fails (`1 · 1/4` against `1/2 · 1/4`). This is consistent with the chain rule because
  `{1} ⊥ {3} | {2}` fails; it shows that the conditioning on `B` in the second clause cannot be
  dropped.

*Needs:* 1.1. (Proved here.)

### 1.4 The intersection property

Prove `condIndep_union_of_pos`: if `p` is positive and `B`, `D` are disjoint, then
`A ⊥ B | S ∪ D` and `A ⊥ D | S ∪ B` give `A ⊥ (B ∪ D) | S` (Evans, Theorem 2.6, property 5, p. 9,
with proof on p. 10, for distinct variables).

Route: for a positive law a coordinate of `A ∩ B` or of `A ∩ D` outside `S` is almost surely a
function of the conditioning coordinates, hence takes a single value, and coordinates of `S` may be
removed from `A`, `B`, `D`; so the sets may be taken pairwise disjoint. By 1.1 each hypothesis then
writes the margin of `p` on `A ∪ B ∪ D ∪ S` as a product `f(x_{A ∪ S ∪ D}) g(x_{B ∪ S ∪ D})` and
as `f'(x_{A ∪ S ∪ B}) g'(x_{D ∪ S ∪ B})`; positivity allows dividing, and fixing the coordinates of
`D` at one value shows that `f'` is a function of `x_{A ∪ S}` times a function of `x_{B ∪ S}`,
which gives the conclusion (Evans, proof of Theorem 2.6, property 5, p. 10).

**Checks.**
- Positivity is needed: for three copies of one fair bit, `{1} ⊥ {2} | {3}` and `{1} ⊥ {3} | {2}`
  hold, since each variable is determined by the others, but `{1} ⊥ {2, 3} | ∅` fails (at
  `x = (0,0,0)`: `1 · 1/2` against `1/2 · 1/2`).
- Disjointness of `B` and `D` is needed: for the positive law on two bits with
  `p(0,0) = p(1,1) = 2` and `p(0,1) = p(1,0) = 1`, take `A = {1}`, `B = D = {2}`, `S = ∅`. Both
  hypotheses read `{1} ⊥ {2} | {2}`, which holds, but `{1} ⊥ {2} | ∅` fails: at `x = (0, 0)`,
  `6 · 2 = 12` against `3 · 3 = 9`.

*Needs:* 1.1. (Proved here, following the cited proof.)

### Examples

Independent fair bits; copies of one fair bit; the parity of two fair bits; the positive law on
two bits of 1.4.

### Dependencies

Mathlib `ProbabilityTheory.CondIndepFun`, `Finset.restrict`, `Finset.measurable_restrict`,
`ProbabilityTheory.condIndepFun_iff_map_prod_eq_prod_condDistrib_prod_condDistrib`,
`ProbabilityTheory.condDistrib_apply_of_ne_zero`. No other layer.

## Layer 2: Markov properties of undirected graphs

### 2.1 Separation

Define `Separates G S A B`: every walk of `G` from a vertex of `A` to a vertex of `B` visits a
vertex of `S` (Evans, Definition 4.3, p. 19, by paths; a walk avoiding `S` contains a path
avoiding `S`, so the two definitions agree).

- If `A`, `B`, `S` are pairwise disjoint, `Separates G S A B` holds if and only if no vertex of
  `A` is joined to a vertex of `B` in the subgraph induced on the complement of `S` (Evans, p. 19).
- A vertex in `A ∩ B` is joined to itself by the walk of length `0`, so `Separates G S A B`
  requires `A ∩ B ⊆ S`.

This is the convention for separators of two vertex sets of GraphConnectivityAndFlows (on main),
stated in its conventions on paths and separators and developed in its 1.2: a separator of `A`
and `B` may meet `A ∪ B`, and every vertex of `A ∩ B` belongs to every separator. `Separates` is
that notion for simple graphs.

**Checks.**
- In a graph with no edges, `∅` separates any two disjoint sets; in a disconnected graph, `∅`
  separates two sets lying in different components.
- In the graph with edges `1–2`, `1–3`, `2–3`, `3–4`, the set `{3}` separates `{1, 2}` from `{4}`;
  the graph is connected, so `∅` separates no two nonempty sets.

*Needs:* Mathlib `SimpleGraph.Walk`, `SimpleGraph.Walk.support`. (Proved here.)

### 2.2 The three Markov properties

Define, for a graph `G` and a law `p`:

- `IsPairwiseMarkov G p`: for distinct non-adjacent `u`, `v`, `{u} ⊥ {v} | V \ {u, v}` (Evans,
  Definition 4.4, p. 20);
- `IsLocalMarkov G p`: for every `v`, with `N(v)` its set of neighbours,
  `{v} ⊥ (V \ ({v} ∪ N(v))) | N(v)`;
- `IsGlobalMarkov G p`: for pairwise disjoint `A`, `B`, `S` with `Separates G S A B`,
  `A ⊥ B | S` (Evans, Definition 4.6, p. 20).

The local property is the one of Lauritzen's book; Evans's notes use the pairwise and global ones.

**Checks.**
- Pairwise but not local: in the graph with edges `1–2`, `1–3`, `2–3`, `3–4`, let `3` and `4` be
  independent fair bits and `X 1 = X 2 = X 4` (Evans, Example 4.12, p. 22). The two missing edges
  give `{1} ⊥ {4} | {2, 3}` and `{2} ⊥ {4} | {1, 3}`, which hold; the local property at `4` asks
  `{4} ⊥ {1, 2} | {3}`, which fails, and so does `{1} ⊥ {4} | {3}`, required by the global
  property since `{3}` separates `1` from `4`.
- Local but not global: in the graph with edges `1–2` and `3–4`, let all four variables be copies
  of one fair bit. Each variable is determined by its only neighbour, so the local property holds;
  `∅` separates `{1}` from `{3}`, but `X 1 = X 3` is not independent of itself.
- In a complete graph two nonempty disjoint sets are never separated, so every law is globally
  Markov; in a graph with no edges the global property is the mutual independence of all the
  variables.

*Needs:* 1.1, 2.1; Mathlib `SimpleGraph.neighborFinset`. (Proved here.)

### 2.3 Factorization implies the global Markov property

Define `Factorizes G p`: there are functions `ψ C : (∀ v, X v) → ℝ≥0`, one for each set `C`, with
`ψ C` depending only on the coordinates in `C` (Mathlib `DependsOn`), such that `p x` is the
product of `ψ C x` over the complete sets `C` of `G`, for every `x`. Prove
`Factorizes.isGlobalMarkov`: a law that factorizes according to `G` is globally Markov for `G`
(Evans, Theorem 4.10, p. 21).

- Products over the complete sets and over the maximal complete sets (Evans, Definitions 4.8 and
  4.9, p. 21) give the same class of laws: every complete set lies in a maximal one, whose factor
  absorbs it, and the factors of non-maximal sets can be taken equal to `1`.

Route: let `S` separate `A` from `B`, let `A'` be the set of vertices joined to `A` in the graph
induced on the complement of `S` and `B'` the rest of the complement. Every complete set lies in
`A' ∪ S` or in `B' ∪ S`, so `p` is a function of `x_{A' ∪ S}` times a function of `x_{B' ∪ S}`,
which gives `A' ⊥ B' | S`; 1.3 (decomposition, used twice) gives `A ⊥ B | S`.

**Checks.**
- The empty set is complete, and its factor is a constant: a law that factorizes still does after
  scaling.
- In a graph with no edges a law factorizes if and only if it is a product of functions of single
  coordinates.
- The law of the first Check of 2.2 does not factorize, since it is not globally Markov.

*Needs:* 1.1, 1.3, 2.1, 2.2; Mathlib `SimpleGraph.IsClique`, `DependsOn`. (Proved here, following
the cited proof.)

### 2.4 Global, local and pairwise

Prove, for every law:

- `IsGlobalMarkov.isLocalMarkov`: the global property implies the local one, since `N(v)`
  separates `v` from the vertices outside `{v} ∪ N(v)`;
- `IsLocalMarkov.isPairwiseMarkov`: the local property implies the pairwise one, by weak union and
  decomposition (1.3).

For positive laws, prove that the pairwise property implies the global one (Pearl and Paz; the
global ⇒ pairwise direction is Evans, Proposition 4.7, p. 21). Route: induction on the number of
vertices outside `S`, applying the intersection property 1.4 to split a separation into two
separations with larger separating sets.

**Checks.**
- The two counterexamples of 2.2 show that neither implication reverses without positivity.
- An isolated vertex `v` has `N(v) = ∅`, and the local property says that `X v` is independent of
  all the other variables.

*Needs:* 1.3, 1.4, 2.1, 2.2. (Proved here.)

### Examples

The graph with edges `1–2`, `1–3`, `2–3`, `3–4` with the law of Evans's Example 4.12; two disjoint
edges carrying four copies of one bit; graphs with no edges and complete graphs.

### Dependencies

Layer 1 (1.1, 1.3, 1.4); Mathlib `SimpleGraph.Walk`, `SimpleGraph.Walk.support`,
`SimpleGraph.neighborFinset`, `SimpleGraph.IsClique`, `DependsOn`.

## Layer 3: the Hammersley–Clifford theorem

### 3.1 Positive pairwise Markov laws factorize

Prove `factorizes_of_isPairwiseMarkov`: a positive law that is pairwise Markov for `G` factorizes
according to `G` (Evans, Theorem 4.11, p. 22, stated there without proof; the theorem is due to
Hammersley and Clifford).

Route: fix a reference configuration `x*`. For each set `C` let `φ C x` be the alternating sum,
over `D ⊆ C`, of `(−1)^|C \ D| · log p(x_D, x*_{V \ D})`, where `(x_D, x*_{V \ D})` agrees with
`x` on `D` and with `x*` elsewhere. By Möbius inversion `log p x` is the sum of `φ C x` over all
`C`, and `φ C` depends only on `x_C`. If `C` contains two non-adjacent vertices `u`, `v`, the
pairwise property, in the form
`p(x_u, x_v, y) · p(x*_u, x*_v, y) = p(x_u, x*_v, y) · p(x*_u, x_v, y)` for the values `y` of the
other coordinates, which 1.1 gives, makes the alternating sum vanish. Hence
`p = ∏ exp(φ C)` over complete sets.

**Checks.**
- Positivity is needed: the law of 3.3 is globally, hence locally and pairwise, Markov for the
  four-cycle and does not factorize; the law of the first Check of 2.2 is pairwise Markov and does
  not factorize.
- On the path `1 − 2 − 3` with positive laws, the theorem says that `{1} ⊥ {3} | {2}` holds
  exactly for the laws `p = f(x_1, x_2) g(x_2, x_3)`.

*Needs:* 1.1, 2.2, 2.3 (definition of factorization); Mathlib `Real.log`, `Real.exp`,
`Finset.sum_powerset_neg_one_pow_card`. (Proved here.)

### 3.2 Equivalence for positive laws

Prove `markovProperties_tfae_of_pos`: for a positive law, factorization and the global, local and
pairwise Markov properties are equivalent (Evans, p. 22, the summary after Theorem 4.11, for
factorization, global and pairwise).

Route: 2.3, 2.4 and 3.1.

**Checks.**
- On the four-cycle `1 − 2 − 3 − 4 − 1` with binary variables, the positive law with mass `2` on
  the two constant configurations and `1` on the other fourteen is not pairwise Markov: given
  `x 2 = x 4 = 0`, the masses of `(x 1, x 3) = (0,0), (0,1), (1,0), (1,1)` are `2, 1, 1, 1`, which
  is not a product, so `{1} ⊥ {3} | {2, 4}` fails; by the theorem it is neither locally nor
  globally Markov and does not factorize.
- The positive law with mass `2^k` on a configuration with `k` edges of the four-cycle whose ends
  agree factorizes (one factor per edge) and is therefore globally Markov.

*Needs:* 2.3, 2.4, 3.1. (Proved here.)

### 3.3 Moussouris' law

Define `moussourisLaw` on `Fin 4 → Bool`, for the four-cycle `0 − 1 − 2 − 3 − 0` (Mathlib
`SimpleGraph.cycleGraph 4`): mass `1` on each of the eight configurations with
`x 0 ≤ x 1 ≤ x 2 ≤ x 3` or `x 0 ≥ x 1 ≥ x 2 ≥ x 3`, and mass `0` on the other eight. Prove
`isGlobalMarkov_moussourisLaw`, that it is globally Markov for the four-cycle, and
`not_factorizes_moussourisLaw`, that it does not factorize according to the four-cycle (Moussouris,
1974).

Route: the only separations of nonempty disjoint sets in the four-cycle are by sets containing
`{0, 2}` or `{1, 3}`; given `x 0` and `x 2`, one of `x 1`, `x 3` is determined and the other is
free, so `{1} ⊥ {3} | {0, 2}`, and symmetrically. If `p = ∏ ψ C`, take a configuration of mass
`0` such as `x = (0, 0, 1, 0)`: one factor vanishes at `x`, but the values of `x` on each edge
`{0, 1}`, `{1, 2}`, `{2, 3}`, `{3, 0}` are `(0, 0)`, `(0, 1)`, `(1, 0)`, `(0, 0)`, which also occur
in the configurations `0000`, `0011`, `1110`, `0000` of positive mass, and the values on vertices
and on `∅` occur trivially, so that factor vanishes at a configuration of positive mass.

**Checks.**
- The eight configurations of positive mass are `0000`, `1000`, `1100`, `1110`, `1111`, `0111`,
  `0011`, `0001` (written `x 0 x 1 x 2 x 3`).
- Given `x 0 = 0` and `x 2 = 1` the configurations are `0011` and `0111`: `x 3 = 1` and `x 1` is
  free, so `{1} ⊥ {3} | {0, 2}` holds at these values.
- Every one of the eight configurations of mass `0` has all four of its edge values among those
  of the positive configurations, so the argument of the route applies to each.

*Needs:* 2.1, 2.2, 2.3; Mathlib `SimpleGraph.cycleGraph`. (Proved here.)

### Examples

Positive laws on paths and cycles; Moussouris' law on the four-cycle.

### Dependencies

Layers 1 and 2 (1.1, 2.1–2.4); Mathlib `Real.log`, `Real.exp`,
`Finset.sum_powerset_neg_one_pow_card`, `SimpleGraph.cycleGraph`.

## Layer 4: directed acyclic graphs

### 4.1 Acyclic digraphs, parents, ancestors and descendants

For `G : Digraph V` define `IsAcyclic G`: no vertex reaches itself by a nonempty directed walk
(`Relation.TransGen G.Adj v v` fails for every `v`); this excludes loops. Define `parents G v`
(the `u` with `u → v`), `descendants G v` (the `w` with `Relation.ReflTransGen G.Adj v w`,
including `v`) and `ancestors G A` (the `u` reaching some vertex of `A`, including `A`) (Evans,
Definitions 6.1 and 6.2, p. 32, and p. 33).

- An acyclic digraph has a linear order of its vertices in which every parent precedes its child.
- A set `A` is ancestral when `ancestors G A = A`; if `G` is acyclic, then for every `v` the set of
  `v` and its non-descendants is ancestral. Acyclicity is needed: for the arrows `1 → 2` and
  `2 → 1`, the vertex `1` has no non-descendants and `ancestors G {1} = {1, 2}`.

**Checks.**
- On `1 → 2 → 3`: `descendants G 1 = {1, 2, 3}`, `ancestors G {3} = {1, 2, 3}`, `parents G 3 = {2}`.
- The digraph with one loop at `1` is not acyclic, and with `1 → 2 → 1` neither is.

*Needs:* Mathlib `Digraph`, `Relation.TransGen`, `Relation.ReflTransGen`. (Proved here.)

### 4.2 Recursive factorization and the directed local Markov property

Define `DagFactorizes G p`: there are kernels `k v : (∀ w, X w) → ℝ≥0`, with `k v` depending only
on the coordinates of `v` and its parents and `∑ a, k v (update x v a) = 1` for every `x`, such
that `p x = ∏ v, k v x` (Evans, Definition 6.3, p. 33, with conditional densities in place of
kernels; kernels avoid dividing by margins that vanish). Define `IsDirectedLocalMarkov G p`: for
every `v`, `{v} ⊥ ((V \ descendants G v) \ parents G v) | parents G v` (Evans, equation (5), p. 33).

**Checks.**
- In a digraph with no arrows a probability law factorizes if and only if the variables are
  mutually independent, the kernels being the one-variable margins.
- On `1 → 2 → 3` the local property at `3` is `{3} ⊥ {1} | {2}`, at `2` it is `{2} ⊥ ∅ | {1}`,
  which always holds, and at `1` it is `{1} ⊥ ∅ | ∅`.

*Needs:* 1.1, 4.1; Mathlib `DependsOn`, `Function.update`. (Proved here.)

### 4.3 d-separation and moralization

A path is a list of distinct vertices in which consecutive vertices are joined by an arrow in one
direction or the other. An internal vertex `t` of a path is a collider when both arrows of the
path at `t` point into `t`. Define `IsOpenPath G C l`: `l` is a path, every collider of `l` lies
in `ancestors G C`, and every other internal vertex lies outside `C`; define `DSeparated G A B C`:
no path from a vertex of `A` to a vertex of `B` is open given `C` (Evans, §8.3, p. 54, and
Definition 8.6, p. 55). This is the definition by paths with colliders in the ancestors of `C`.
Evans's definition takes `A`, `B`, `C` disjoint; the comparison below needs only `C` disjoint
from `A` and from `B`, and the global Markov property of 4.4 uses pairwise disjoint sets.

Define `moralGraphOn G W`, the moral graph of the subgraph induced on `W`: two distinct vertices of
`W` are adjacent when an arrow joins them or they have a common child in `W`; vertices outside `W`
are isolated (Evans, Definition 6.5 and the definition of the moral graph, p. 34).

Prove `dSeparated_iff_separates_moralGraphOn`: if `G` is acyclic and `C` is disjoint from `A`
and from `B`, then `A` and `B` are d-separated given `C` if and only if `C` separates `A` from
`B` in `moralGraphOn G (ancestors G (A ∪ B ∪ C))` (Evans, Theorem 8.7, p. 55, for disjoint `A`,
`B`, `C`; a vertex of `A ∩ B` outside `C` is a path of one vertex, open given `C`, and is joined
to itself by the walk of length `0`, so both sides fail together).

Route: an open path lies in the ancestors of `A ∪ B ∪ C`, and replacing each collider by the moral
edge between its neighbours gives a walk avoiding `C`. Conversely, a walk in the moral graph
avoiding `C` is shortened to a path; each moral edge over a collider that is not an ancestor of
`C` is replaced by a directed path from the collider to `A` or `B`, which reduces the number of
such edges (Evans, proof of Theorem 8.7, p. 55).

**Checks.**
- On `1 → 2 → 3`, `{1}` and `{3}` are not d-separated given `∅` and are d-separated given `{2}`.
- On `1 → 3 ← 2` with `3 → 4`, `{1}` and `{2}` are d-separated given `∅` (the collider `3` is not
  an ancestor of `∅`) but not given `{4}` (it is an ancestor of `{4}`). The variant that asks the
  collider itself to lie in `C` would declare them d-separated given `{4}`; for the law of the
  Check of 4.4 this would be false.
- The ancestral restriction is needed: the moral graph of the whole of `1 → 3 ← 2` joins `1` and
  `2`, but `moralGraphOn G (ancestors G {1, 2})` has vertex set `{1, 2}` and no edge, so `∅`
  separates them, in agreement with d-separation.
- `C` must be disjoint from `A`: for `1 → 2` with `A = C = {1}` and `B = {2}`, the path `1, 2`
  has no internal vertex and is open, so `{1}` and `{2}` are not d-separated given `{1}`; but
  every walk from `1` starts in `C`, so `C` separates them in the moral graph.
- Acyclicity is needed: with the arrows `1 → 2`, `2 → 3` and `3 → 2`, the only path from `1` to
  `3` is `1, 2, 3`, whose vertex `2` is a collider and not an ancestor of `∅`, so `{1}` and `{3}`
  are d-separated given `∅`; but `2` is an ancestor of `3`, so the ancestors of `{1, 3}` are all
  three vertices, `1` and `3` have the common child `2`, and the moral graph joins them.

*Needs:* 2.1, 4.1; Mathlib `List.Nodup`, `List.IsChain`. (Proved here, following the cited
proof.)

### 4.4 The directed Markov properties are equivalent

Define `IsDirectedGlobalMarkov G p`: for pairwise disjoint `A`, `B`, `C` with
`DSeparated G A B C`, `A ⊥ B | C`. Prove `dagFactorizes_tfae`: if `G` is acyclic and
`∑ x, p x = 1`, then `DagFactorizes G p`, `IsDirectedLocalMarkov G p` and
`IsDirectedGlobalMarkov G p` are equivalent (Evans, Theorem 6.9, p. 35, with the global property
by moralization, Definition 6.7, p. 35, and Theorem 8.7, p. 55, for d-separation). No positivity
is assumed.

Route: factorization ⇒ global: the margin of `p` on an ancestral set factorizes according to the
induced subgraph (Evans, Proposition 6.4, p. 34), hence according to its moral graph, whose
complete sets include each vertex with its parents (Evans, Proposition 6.6, p. 34); 2.3 gives
separation ⇒ conditional independence, and 4.3 turns d-separation into separation. Global ⇒
local: `{v}` and its non-descendants other than its parents are d-separated by its parents. Local
⇒ factorization: in a linear order with parents first, the local property gives
`{v} ⊥ (predecessors \ parents) | parents`, and the kernels `p(x_v | x_{pa v})`, defined as the
ratio of margins where the margin of the parents is positive and as any probability vector
elsewhere, multiply to `p`.

**Checks.**
- Let `1`, `2` be independent fair bits, `X 3 = X 1 + X 2 mod 2` and `X 4 = X 3`, on
  `1 → 3 ← 2`, `3 → 4`. The law factorizes with kernels `1/2`, `1/2` and two indicator kernels. It
  satisfies `{1} ⊥ {2} | ∅`; given `X 4 = 0`, `X 1 = X 2`, so `{1} ⊥ {2} | {4}` fails, as the
  open path through the collider `3` predicts.
- Acyclicity is needed: on two vertices each carrying a loop and no other arrow, each vertex is
  its own parent and descendant, so every law is locally Markov, but only product laws factorize
  (the two copies of one fair bit do not).
- Total mass `1` is needed: twice a probability law is locally Markov when the law is, but no
  product of kernels has total mass `2`.
- Degenerate laws are allowed: for `1 → 2` with `X 2 = X 1` a fair bit, the kernel of `2` is the
  indicator of `x 2 = x 1` and all three properties hold.

*Needs:* 1.1, 1.3, 2.1, 2.2, 2.3, 4.1, 4.2, 4.3. (Proved here, following the cited proof.)

### Examples

Chains, forks and colliders on three vertices; the collider with a descendant of 4.3 and 4.4; the
two looped vertices showing the role of acyclicity.

### Dependencies

Layer 1 (1.1, 1.3); Layer 2 (2.1, 2.2, 2.3); Mathlib `Digraph`, `Relation.TransGen`,
`Relation.ReflTransGen`, `DependsOn`, `Function.update`, `List.Nodup`, `List.IsChain`. Layer 3 is
not used.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: conditional independence of sets of
coordinates by margins and its agreement with Mathlib's notion, the chain rule and the intersection
property; separation, the pairwise, local and global Markov properties of undirected graphs,
factorization over complete sets and the implications between them, with the converse for
positive laws; the Hammersley–Clifford theorem and Moussouris' law; acyclic digraphs with their
parents, ancestors and descendants, recursive factorization, the directed local Markov property,
d-separation, moral graphs of ancestral sets, the equivalence of d-separation with moral
separation, and the equivalence of the three directed Markov properties.

Already in the libraries and therefore not targets: Mathlib's conditional independence of
σ-algebras and of random variables (`Mathlib/Probability/Independence/Conditional.lean`) with its
symmetry `ProbabilityTheory.CondIndep.symm` and its monotonicity in each side
(`ProbabilityTheory.condIndep_of_condIndep_of_le_left` and `_right`, the measure-theoretic form of
decomposition); Tau Ceti's weak union for σ-algebras,
`TauCeti.Probability.condIndep_of_condIndep_of_le_of_le`, and for coordinate restrictions,
`TauCeti.Probability.condIndepFun_domRestrict_of_subset`
(`TauCeti/Probability/Independence/Conditional.lean`). 1.3 is the finite form of these together
with contraction, which neither library states; through 1.2 the finite and measure-theoretic forms
transfer to each other. On the directed side, Tau Ceti's
`Digraph.nonempty_arrowWalk_iff_reflTransGen` (`TauCeti/Combinatorics/Digraph/ArrowWalk.lean`)
identifies `Relation.ReflTransGen G.Adj` with reachability by directed walks; the ancestors and
descendants of 4.1 are defined through `Relation.ReflTransGen`, and no layer restates that lemma.

Boundaries with other roadmaps:

- HiddenMarkovModels (an open roadmap, not on main), Layer 1, proves the conditional-independence
  structure of the hidden Markov chain's path law, for countable state spaces and general
  observation spaces. That is one model, stated with kernels on path space; this roadmap's 4.4 is
  the general equivalence for finite variables on an arbitrary acyclic digraph, and neither
  statement is a case of the other as written. This roadmap does not depend on that one.
- MathematicalStatisticsHighDimensional, 7.3 and 7.4, estimates the graph of a Gaussian graphical
  model by neighbourhood selection and the graphical lasso; Gaussian laws and estimation are not
  treated here.
- StatisticalLearningTheory (an open roadmap, not on main), in its section "Beyond this roadmap",
  names belief propagation, the Bethe free energy, exact inference on trees and junction trees,
  and the variational representation of the cumulant function as topics for a roadmap on
  graphical models; they are not treated here either (below). This roadmap does not depend on
  that one.

Outside the scope: continuous and Gaussian graphical models; decomposable graphs, junction trees
and message passing, and every inference or estimation procedure; chain graphs and mixed graphs;
the completeness of the global Markov properties (faithful laws); Markov equivalence of directed
acyclic graphs; causal interventions and adjustment; log-linear models and their maximum likelihood
estimates.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Independence/Conditional.lean`: `ProbabilityTheory.CondIndepFun` (with the
  scoped notation `f ⟂ᵢ[k, hk; μ] g`: conditional independence of `f` and `g` given the σ-algebra
  generated by `k`, for a finite measure on a standard Borel space);
  `ProbabilityTheory.condIndepFun_iff_map_prod_eq_prod_condDistrib_prod_condDistrib` (for
  measurable `f`, `g`, `k` with standard Borel nonempty codomains of `f` and `g`, conditional
  independence holds if and only if the joint law of `(k, f, g)` is the law of `k` composed with
  the product of the conditional laws of `f` and of `g` given `k`).
- `Mathlib/Probability/Kernel/CondDistrib.lean`: `ProbabilityTheory.condDistrib_apply_of_ne_zero`
  (for a value `x` of `X` with positive mass in a space with measurable singletons, the conditional
  law of `Y` given `X = x` is the joint mass divided by the mass of `x`).
- `Mathlib/Data/Finset/Pi.lean`: `Finset.restrict` (restriction of a configuration to a finite
  set of coordinates). `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean`:
  `Finset.measurable_restrict`.
- `Mathlib/Logic/Function/DependsOn.lean`: `DependsOn` (`f` depends only on the coordinates in
  `s` when configurations agreeing on `s` have equal values).
- `Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`: `SimpleGraph.Walk` and
  `SimpleGraph.Walk.support` (the list of vertices of a walk).
  `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.neighborFinset`.
  `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.IsClique` (every two distinct
  vertices of the set are adjacent). `Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean`:
  `SimpleGraph.cycleGraph` (on `Fin n`, `i` adjacent to `i ± 1`).
- `Mathlib/Combinatorics/Digraph/Basic.lean`: `Digraph` (a relation `Adj`, loops allowed).
  `Relation.TransGen` and `Relation.ReflTransGen` (transitive and reflexive-transitive closures).
- `List.Nodup`, `List.IsChain` (consecutive elements related), `List.TFAE`
  (`Mathlib/Data/List/TFAE.lean`), `Function.update`, `Real.log`, `Real.exp`.
- `Mathlib/Data/Nat/Choose/Sum.lean`: `Finset.sum_powerset_neg_one_pow_card` (the sum of
  `(-1)^|t|` over the subsets `t` of a finite set is `1` for the empty set and `0` otherwise), the
  identity behind the Möbius inversion of 3.1.

## References

- Robin Evans, *Graphical Models*, lecture notes, University of Oxford, Michaelmas 2018, version
  of January 17, 2019 (61 pages), at `stats.ox.ac.uk/~evans/gms/lecturenotes_18.pdf`; the
  theorem, definition, example and page numbers above are those of that version.
- Attributions made in prose without a locator: J. M. Hammersley and P. Clifford (the
  factorization theorem, 1971, unpublished; published proofs by J. Besag, 1974, and others);
  J. Moussouris (the counterexample on the four-cycle, 1974); J. Pearl and A. Paz (pairwise and
  global Markov properties under the intersection property, 1987); A. P. Dawid (the axioms of
  conditional independence, 1979); S. L. Lauritzen, *Graphical Models* (Oxford, 1996), for the
  local Markov property of undirected graphs and the unifying treatment; S. L. Lauritzen,
  A. P. Dawid, B. N. Larsen and H.-G. Leimer (directed Markov fields, 1990); J. Pearl and
  T. Verma, and D. Geiger, T. Verma and J. Pearl (d-separation, 1988–1990).
